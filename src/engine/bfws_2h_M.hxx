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

#ifndef __SINGLE_QUEUE_DOUBLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH_EXP_M__
#define __SINGLE_QUEUE_DOUBLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH_EXP_M__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
#include <landmark_graph_manager.hxx>
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
			class BFWS_2H_M : public BFWS_2H<Search_Model, First_Heuristic, Second_Heuristic, Relevant_Fluents_Heuristic, Open_List_Type>
			{

			public:
				typedef typename Search_Model::State_Type State;
				typedef typename Open_List_Type::Node_Type Search_Node;
				typedef Closed_List<Search_Node> Closed_List_Type;
				typedef aptk::agnostic::Landmarks_Graph_Manager<Search_Model> Landmarks_Graph_Manager;

				BFWS_2H_M(const Search_Model &search_problem, bool verbose)
						: BFWS_2H<Search_Model, First_Heuristic, Second_Heuristic, Relevant_Fluents_Heuristic, Open_List_Type>(search_problem, verbose), m_M(0)
				{
				}

				virtual ~BFWS_2H_M()
				{
				}

				void set_M(unsigned m) { m_M = m; }

				virtual void process(Search_Node *head)
				{

#ifdef DEBUG
					if (m_verbose)
					{
						std::cout << "Expanding:" << std::endl;
						head->print(std::cout);
						std::cout << std::endl;
						head->state()->print(std::cout);
						std::cout << std::endl;
					}
#endif

					if (this->m_lgm)
						head->update_land_graph(this->m_lgm);

					std::vector<aptk::Action_Idx> app_set;
					this->problem().applicable_set_v2(*(head->state()), app_set);

					// Eval RP if needed for the expanded node
					this->eval_rp(head);

					for (unsigned i = 0; i < app_set.size(); ++i)
					{
						int a = app_set[i];

						float a_cost = this->problem().cost(*(head->state()), a);

						if (head->gn() + a_cost > this->m_max_depth)
							continue;

						State *succ = nullptr;

						Search_Node *n = new Search_Node(succ, this->problem().cost(*(head->state()), a), a, head, this->problem().num_actions());

#ifdef DEBUG
						if (m_verbose)
						{
							std::cout << "Successor:" << std::endl;
							n->print(std::cout);
							std::cout << std::endl;
							if (n->has_state())
								n->state()->print(std::cout);
							std::cout << std::endl;
						}
#endif

						this->eval(n);
						if (n->relaxed_deadend())
						{ // rel_plan infty
#ifdef DEBUG
							if (m_verbose)
							{
								std::cout << "h_add is infinite" << std::endl;
							}
#endif
							this->inc_dead_end();
							delete n;
							continue;
						}
						if (this->m_use_rp)
							this->eval_relevant_fluents(n);

						if (this->m_use_novelty)
						{
							this->eval_novel(n);
							if (this->m_use_novelty_pruning)
							{
								if (n->h1n() > this->m_max_novelty)
								{

									n->M()++;

									Search_Node *np = n;
									while (np->action() != no_op)
									{
										np->M()++;
										if (np->h1n() > this->m_max_novelty)
											np = np->parent();
										else
											break;
									}

									/**
									 * Allow M pruned nodes below a node with novelty < m_max_novelty
									 */
									if (np->M() > m_M)
									{

#ifdef DEBUG
										if (m_verbose)
										{
											std::cout << "h_add is infinite" << std::endl;
										}
#endif
										this->inc_dead_end();
										delete n;
										continue;
									}
								}
							}
						}

#ifdef DEBUG
						if (m_verbose)
							std::cout << "Inserted into OPEN" << std::endl;
#endif
						this->open_node(n);
					}
					this->inc_eval();
					this->m_expanded_count_by_novelty[head->h1n() - 1]++;
				}

				unsigned m_M;
			};

		}

	}

}

#endif // bfws_2h_M.hxx
