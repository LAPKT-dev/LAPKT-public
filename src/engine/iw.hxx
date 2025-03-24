
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

#ifndef __ITERATIVE_WIDTH__
#define __ITERATIVE_WIDTH__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
#include <brfs.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk
{

	namespace search
	{

		namespace brfs
		{

			template <typename Search_Model, typename Abstract_Novelty>
			class IW : public BRFS<Search_Model>
			{

			public:
				typedef typename Search_Model::State_Type State;
				typedef Node<State> Search_Node;
				typedef Closed_List<Search_Node> Closed_List_Type;

				IW(const Search_Model &search_problem)
						: BRFS<Search_Model>(search_problem), m_pruned_B_count(0), m_B(infty), m_verbose(true)
				{
					m_novelty = new Abstract_Novelty(search_problem);
				}

				virtual ~IW()
				{
					delete m_novelty;
				}

				void set_verbose(bool v) { m_verbose = v; }
				bool verbose() const { return m_verbose; }

				void start(State *s = NULL)
				{

					if (!s)
						this->m_root = new Search_Node(this->problem().init(), no_op, NULL);
					else
						this->m_root = new Search_Node(s, no_op, NULL);

					m_pruned_B_count = 0;
					this->reset();

					m_novelty->init();

					if (prune(this->m_root))
					{
						if (verbose())
							std::cout << "Initial State pruned! No Solution found." << std::endl;
						return;
					}

#ifdef DEBUG
					if (verbose())
					{
						std::cout << "Initial search node: ";
						this->m_root->print(std::cout);
						std::cout << std::endl;
					}
#endif
					this->m_open.push(this->m_root);
					this->m_open_hash.put(this->m_root);
					this->inc_gen();
				}

				float bound() const { return m_B; }
				bool set_bound(float v)
				{
					m_B = v;
					return (m_novelty->set_arity(m_B) == m_B);
				}

				float arity() { return m_novelty->arity(); }

				void inc_pruned_bound() { m_pruned_B_count++; }
				unsigned pruned_by_bound() const { return m_pruned_B_count; }

			protected:
				bool prune(Search_Node *n)
				{

					float node_novelty = infty;
					m_novelty->eval(n, node_novelty);
					if (node_novelty > bound())
					{
						inc_pruned_bound();
						// this->close(n);
						return true;
					}
					return false;
				}

				/**
				 * Process with successor generator
				 */

				virtual Search_Node *process(Search_Node *head)
				{
					std::vector<aptk::Action_Idx> app_set;
					this->problem().applicable_set_v2(*(head->state()), app_set);

					for (unsigned i = 0; i < app_set.size(); ++i)
					{
						int a = app_set[i];

						/**
						 * Prune actions that do not add anything new compared to prev state.
						 * Big impact in del-free tasks, as states grow monotonically
						 */
						// need to check COND EFF TOO!!
						//  if( head->state()->entails(this->problem().task().actions()[a]->add_vec()) )
						//  	continue;

						State *succ = this->problem().next(*(head->state()), a);

						Search_Node *n = new Search_Node(succ, a, head, this->problem().task().actions()[a]->cost());

						// Lazy expansion
						// Search_Node* n = new Search_Node( NULL , a, head, this->problem().task().actions()[ a ]->cost() );

						if (this->is_closed(n))
						{
							delete n;
							continue;
						}

						if (this->previously_hashed(n))
						{
							delete n;
						}
						else
						{
							if (prune(n))
							{
#ifdef DEBUG
								if (verbose())
								{
									std::cout << std::endl;
									std::cout << "PRUNED State: ";
									if (n->has_state())
										std::cout << n->state();
									std::cout << " " << n->parent()->state() << " " << n->gn() << " ";
									if (n->has_state())
										n->state()->print(std::cout);
									std::cout << this->problem().task().actions()[n->action()]->signature() << std::endl;
								}
#endif
								delete n;
								continue;
							}

#ifdef DEBUG
							if (verbose())
							{
								std::cout << std::endl;
								std::cout << "State: ";
								if (n->has_state())
									std::cout << n->state();
								std::cout << " " << n->parent()->state() << " " << n->gn() << " ";
								if (n->has_state())
									n->state()->print(std::cout);
								std::cout << this->problem().task().actions()[n->action()]->signature() << std::endl;
							}
#endif

							this->open_node(n);
							if (this->is_goal(n))
								return n;
						}
					}

					return NULL;
				}

			protected:
				Abstract_Novelty *m_novelty;
				unsigned m_pruned_B_count;
				float m_B;
				bool m_verbose;
			};

		}

	}

}

#endif // iw.hxx
