/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files
(the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject
 to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#ifndef __SINGLE_QUEUE_DOUBLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH_FAST_EXP_CONSISTENCY__
#define __SINGLE_QUEUE_DOUBLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH_FAST_EXP_CONSISTENCY__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
#include <landmark_graph_manager.hxx>
#include <reachability.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <hash_table.hxx>

#include "bfws_2h.hxx"

namespace aptk
{

	namespace search
	{

		namespace bfws_2h
		{

			template <typename Search_Model, typename First_Heuristic, typename Second_Heuristic, typename Relevant_Fluents_Heuristic, typename Open_List_Type>
			class BFWS_2H_Consistency : public BFWS_2H<Search_Model, First_Heuristic, Second_Heuristic, Relevant_Fluents_Heuristic, Open_List_Type>
			{

			public:
				typedef typename Search_Model::State_Type State;
				typedef typename Open_List_Type::Node_Type Search_Node;
				typedef Closed_List<Search_Node> Closed_List_Type;
				typedef aptk::agnostic::Landmarks_Graph_Manager<Search_Model> Landmarks_Graph_Manager;

				BFWS_2H_Consistency(const Search_Model &search_problem, bool verbose)
						: BFWS_2H<Search_Model, First_Heuristic, Second_Heuristic, Relevant_Fluents_Heuristic, Open_List_Type>(search_problem, verbose)
				{
					m_reachability = new aptk::agnostic::Reachability_Test(this->problem().task());
				}

				virtual ~BFWS_2H_Consistency()
				{

					delete m_reachability;
				}

				virtual void start(float B = infty)
				{
					this->m_max_depth = B;
					this->m_root = new Search_Node(this->problem().init(), 0.0f, no_op, NULL, this->problem().num_actions());
					// Init Novelty
					this->h1().init();

					if (this->m_use_rp)
						this->set_relplan(this->m_root, this->m_root->state());

					this->m_root->m_goal_candidates.insert(this->m_root->m_goal_candidates.begin(),
																								 this->problem().task().goal().begin(), this->problem().task().goal().end());

					this->eval(this->m_root);

					if (this->m_use_rp)
					{
						this->eval_rp(this->m_root);
						this->eval_relevant_fluents(this->m_root);
					}

					if (this->m_use_novelty)
						this->eval_novel(this->m_root);

					if (this->m_root->relaxed_deadend())
					{ // rel_plan infty
#ifdef DEBUG
						if (this->m_verbose)
						{
							std::cout << "h_add is infinite" << std::endl;
						}
#endif
						this->inc_dead_end();
						return;
						;
					}

#ifdef DEBUG
					if (this->m_verbose)
					{
						std::cout << "Initial search node: ";
						this->m_root->print(std::cout);
						std::cout << std::endl;
						this->m_root->state()->print(std::cout);
						std::cout << std::endl;
					}
#endif
					this->m_open.insert(this->m_root);

					this->inc_gen();
					this->m_generated_count_by_novelty[this->m_root->h1n() - 1]++;
				}

				virtual void eval(Search_Node *candidate)
				{

					if (candidate->parent())
						candidate->m_goal_candidates = candidate->parent()->m_goal_candidates;

					candidate->h2n() = consistent_goal_counting(candidate);

					if (candidate->h2n() < this->m_max_h2n)
					{
						this->m_max_h2n = candidate->h2n();
						this->m_max_r = 0;
						if (this->m_verbose)
						{
							std::cout << "--[" << this->m_max_h2n << " / " << this->m_max_r << "]--" << std::endl;
						}
					}
				}

				// Exclude action that add or edel any newly achieved goal
				void exclude_actions(Search_Node *n, Bit_Set &excluded)
				{
					std::vector<const Action *>::const_iterator it_a = this->problem().task().actions().begin();
					unsigned asize = this->problem().num_actions();
					unsigned fsize = n->m_goals_achieved.size();
					const bool has_ceff = this->problem().task().has_conditional_effects();

					for (unsigned i = 0; i < asize; i++, it_a++)
					{

						/**
						 * If actions edel or adds fluent that has to persist, exclude action.
						 */
						unsigned p = 0;
						for (; p < fsize; p++)
						{
							unsigned fl = n->m_goals_achieved.at(p);

							if (has_ceff)
							{
								if ((*it_a)->consumes(fl))
								{
									excluded.set(i);
									break;
								}
							}
							else if ((*it_a)->edeletes(fl))
							{
								excluded.set(i);
								break;
							}
						}
						if (p == fsize)
							excluded.unset(i);
					}
				}

				virtual unsigned consistent_goal_counting(Search_Node *n)
				{

					const bool has_state = n->has_state();
					static Fluent_Vec added_fluents;
					static Fluent_Vec deleted_fluents;

					State *s = has_state ? n->state() : n->parent()->state();

					if (!has_state)
					{
						added_fluents.clear();
						deleted_fluents.clear();
						n->parent()->state()->progress_lazy_state(this->problem().task().actions()[n->action()], &added_fluents, &deleted_fluents);
					}

					Fluent_Vec unachieved;

					// Mark goals that were true at the parent and still are in current node
					if (n->parent())
						for (Fluent_Vec::iterator it = n->parent()->m_goals_achieved.begin(); it != n->parent()->m_goals_achieved.end(); it++)
						{
							if (!s->entails(*it))
							{
								unachieved.push_back(*it);
							}
							else
							{
								n->m_goals_achieved.push_back(*it);
							}
						}

					// Among goal candidates false in parent, check if they have been achieved
					// and do not make other goals unreachable if mantained true
					for (Fluent_Vec::iterator it = n->m_goal_candidates.begin(); it != n->m_goal_candidates.end(); it++)
					{
						if (s->entails(*it))
						{
							n->m_goals_achieved.push_back(*it);

							static Bit_Set excluded(this->problem().num_actions());
							exclude_actions(n, excluded);

#ifdef DEBUG
							if (this->verbose())
								debug_info(s, unachieved);
#endif

							if (!m_reachability->is_reachable(s->fluent_vec(), this->problem().task().goal(), excluded))
							{
								unachieved.push_back(*it);
								n->m_goals_achieved.pop_back();
							}
						}
						else
							unachieved.push_back(*it);
					}

					if (!has_state)
						n->parent()->state()->regress_lazy_state(this->problem().task().actions()[n->action()], &added_fluents, &deleted_fluents);

					n->m_goal_candidates = unachieved;

					return n->m_goal_candidates.size();
				}

			protected:
				aptk::agnostic::Reachability_Test *m_reachability;
			};

		}

	}

}

#endif // bfws_2h_consistency.hxx
