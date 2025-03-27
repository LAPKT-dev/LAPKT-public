/**
 * @file approx_novelty_serialized_search.hxx
 * @author Anubhav Singh (anubhav.singh.er@pm.me)
 * @author Miquel Ramirez (miquel.ramirez@unimelb.edu.au)
 * @author Nir Lipovetzky (nirlipo@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
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

#ifndef __APPROXIMATE_NOVELTY_SERIALIZED_SEARCH__
#define __APPROXIMATE_NOVELTY_SERIALIZED_SEARCH__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
// #include <iw.hxx>
#include <reachability.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk
{

	namespace search
	{

		template <typename Search_Model, typename Search_Strategy, typename Search_Node>
		class Approximate_Serialized_Search : public Search_Strategy
		{

		public:
			typedef typename Search_Model::State_Type State;
			typedef Closed_List<Search_Node> Closed_List_Type;

			Approximate_Serialized_Search(const Search_Model &search_problem, float sample_factor, std::string sampling_strategy, unsigned rand_seed, unsigned min_k4sample)
					: Search_Strategy(search_problem, sample_factor, sampling_strategy, rand_seed,
														min_k4sample),
						m_consistency_test(true), m_closed_goal_states(NULL)
			{
				m_reachability = new aptk::agnostic::Reachability_Test(this->problem().task());
			}

			virtual ~Approximate_Serialized_Search()
			{
				delete m_reachability;
				m_closed_goal_states = NULL;
			}

			void set_consistency_test(bool b) { m_consistency_test = b; }
			void set_closed_goal_states(Closed_List_Type *c) { m_closed_goal_states = c; }
			void close_goal_state(Search_Node *n)
			{
				if (closed_goal_states())
				{
					// m_closed_goal_states->put( n );
					State *new_state = new State(this->problem().task());
					new_state->set(n->state()->fluent_vec());
					new_state->update_hash();
					Search_Node *new_node = new Search_Node(new_state, n->action());
					new_node->gn() = n->gn();
					m_closed_goal_states->put(new_node);
				}
			}
			Closed_List_Type *closed_goal_states() { return m_closed_goal_states; }

			void reset_closed_goal_states()
			{
				if (closed_goal_states())
				{
					// for ( typename Closed_List_Type::iterator i = m_closed_goal_states->begin();
					//       i != m_closed_goal_states->end(); i++ ) {
					// 	i->second = NULL;
					// }
					m_closed_goal_states->clear();
				}
			}

			bool is_goal_state_closed(Search_Node *n)
			{
				if (!closed_goal_states())
					return false;

				n->compare_only_state(true);
				Search_Node *n2 = this->closed_goal_states()->retrieve(n);
				n->compare_only_state(false);

				if (n2 != NULL)
					return true;

				return false;
			}

			void debug_info(State *s, Fluent_Vec &unachieved)
			{

				std::cout << std::endl;
				std::cout << "Goals Achieved: ";

				for (Fluent_Vec::iterator it = m_goals_achieved.begin(); it != m_goals_achieved.end(); it++)
				{
					std::cout << " " << this->problem().task().fluents()[*it]->signature();
				}

				std::cout << std::endl;
				std::cout << "Unachieved Goals: ";
				for (Fluent_Vec::iterator it = unachieved.begin(); it != unachieved.end(); it++)
				{
					std::cout << " " << this->problem().task().fluents()[*it]->signature();
				}
				std::cout << std::endl;
				std::cout << "Current State: ";
				s->print(std::cout);
			}

			void exclude_actions(Bit_Set &excluded)
			{
				std::vector<const Action *>::const_iterator it_a = this->problem().task().actions().begin();
				unsigned asize = this->problem().num_actions();
				unsigned fsize = m_goals_achieved.size();
				const bool has_ceff = this->problem().task().has_conditional_effects();

				for (unsigned i = 0; i < asize; i++, it_a++)
				{

					/**
					 * If actions edel or adds fluent that has to persist, exclude action.
					 */
					unsigned p = 0;
					for (; p < fsize; p++)
					{
						unsigned fl = m_goals_achieved.at(p);

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

			virtual bool is_goal(Search_Node *n)
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

				for (Fluent_Vec::iterator it = m_goals_achieved.begin(); it != m_goals_achieved.end(); it++)
				{
					if (!s->entails(*it))
					{
						if (!has_state)
							n->parent()->state()->regress_lazy_state(this->problem().task().actions()[n->action()], &added_fluents, &deleted_fluents);

						return false;
					}
				}

				if (is_goal_state_closed(n))
					return false;

				bool new_goal_achieved = false;
				Fluent_Vec unachieved;
				for (Fluent_Vec::iterator it = m_goal_candidates.begin(); it != m_goal_candidates.end(); it++)
				{
					if (s->entails(*it))
					{
						m_goals_achieved.push_back(*it);

						if (!m_consistency_test)
						{
							new_goal_achieved = true;
							continue;
						}

						static Bit_Set excluded(this->problem().num_actions());
						exclude_actions(excluded);

#ifdef DEBUG
						if (this->verbose())
							debug_info(s, unachieved);
#endif

						if (m_reachability->is_reachable(s->fluent_vec(), this->problem().task().goal(), excluded))
							new_goal_achieved = true;
						else
						{
							unachieved.push_back(*it);
							m_goals_achieved.pop_back();
						}
					}
					else
						unachieved.push_back(*it);
				}

				if (!has_state)
					n->parent()->state()->regress_lazy_state(this->problem().task().actions()[n->action()], &added_fluents, &deleted_fluents);

				if (new_goal_achieved)
				{
					m_goal_candidates = unachieved;

					if (!has_state)
						n->set_state(n->parent()->state()->progress_through(*(this->problem().task().actions()[n->action()])));

					close_goal_state(n);
					return true;
				}
				else
					return false;
			}

			virtual bool find_solution(float &cost, std::vector<Action_Idx> &plan)
			{

				Search_Node *end = NULL;
				State *new_init_state = NULL;
				m_goals_achieved.clear();
				m_goal_candidates.clear();
				m_goal_candidates.insert(m_goal_candidates.begin(),
																 this->problem().task().goal().begin(), this->problem().task().goal().end());

				do
				{
					end = this->do_search();

					if (end == NULL)
						return false;

					std::vector<Action_Idx> partial_plan;
					this->extract_plan(this->m_root, end, partial_plan, cost);
					plan.insert(plan.end(), partial_plan.begin(), partial_plan.end());

					new_init_state = new State(this->problem().task());
					new_init_state->set(end->state()->fluent_vec());
					new_init_state->update_hash();
					this->start(new_init_state);

				} while (!this->problem().goal(*new_init_state));

				return true;
			}

			Fluent_Vec &goal_candidates() { return m_goal_candidates; }
			Fluent_Vec &goals_achieved() { return m_goals_achieved; }

		protected:
			aptk::agnostic::Reachability_Test *m_reachability;

			Fluent_Vec m_goals_achieved;
			Fluent_Vec m_goal_candidates;
			bool m_consistency_test;
			Closed_List_Type *m_closed_goal_states;
		};

	}

}

#endif // serialized_search.hxx
