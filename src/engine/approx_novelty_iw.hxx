/**
 * @file approx_novelty_iw.hxx
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

#ifndef __APPROXIMATE_NOVELTY_IW__
#define __APPROXIMATE_NOVELTY_IW__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
#include <brfs.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <math.h>

namespace aptk
{

	namespace search
	{

		namespace brfs
		{

			template <typename Search_Model, typename Abstract_Novelty>
			class Approximate_IW_Search : public BRFS<Search_Model>
			{

			public:
				typedef typename Search_Model::State_Type State;
				typedef Node<State> Search_Node;
				typedef Closed_List<Search_Node> Closed_List_Type;

				Approximate_IW_Search(const Search_Model &search_problem, float sample_factor, std::string sampling_strategy, unsigned rand_seed, unsigned min_k4sample)
						: BRFS<Search_Model>(search_problem), m_pruned_B_count(0), m_B(infty), m_verbose(true),
							// m_fluent_freq( search_problem.task().num_fluents(), 0 ),
							m_sample_factor(sample_factor),
							m_sampling_strategy(sampling_strategy)
				{
					m_novelty = new Abstract_Novelty(search_problem, m_sampling_strategy, m_sample_factor,
																					 rand_seed, min_k4sample);
				}

				virtual ~Approximate_IW_Search()
				{
					delete m_novelty;
				}

				unsigned num_false_positives() { return m_novelty->num_false_positives(); }
				unsigned num_false_novelties() { return m_novelty->num_false_novelties(); }
				void set_check_false_positives(bool v) { m_novelty->set_check_false_positives(v); }

				void set_verbose(bool v) { m_verbose = v; }
				bool verbose() const { return m_verbose; }
				/*
			void update_fluent_freq( State* s ){
				for( unsigned p : s->fluent_vec() ){
					m_fluent_freq[p]++;
				}
			}
				*/
				/*
			void print_fluent_freq( std::ostream& out ){
				for( unsigned i = 0; i < this->problem().task().num_fluents(); i++ ){
					out<< i << " - " << this->problem().task().fluents()[i]->signature() << ": " << m_fluent_freq[i] << std::endl;
				}

			}
				*/

				void start(State *s = NULL)
				{

					if (!s)
						this->m_root = new Search_Node(this->problem().init(), no_op, NULL);
					else
						this->m_root = new Search_Node(s, no_op, NULL);

					// update_fluent_freq( this->m_root->state() );

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
				void set_bound(float v)
				{
					m_B = v;
					m_novelty->set_arity(m_B);
					std::cout << "BOUND : " << m_B << std::endl;
				}

				float arity() { return m_novelty->arity(); }

				void inc_pruned_bound() { m_pruned_B_count++; }
				unsigned pruned_by_bound() const { return m_pruned_B_count; }
				std::map<unsigned, unsigned>
				novelty_numbers() { return m_novelty_numbers; }
				float bloom_fillratio() { return m_novelty->bloom_fillratio(); }

			protected:
				bool prune(Search_Node *n)
				{

					float node_novelty = infty;
					m_novelty->eval(n, node_novelty, m_fluent_freq);

					std::map<unsigned, unsigned>::iterator it =
							m_novelty_numbers.find(node_novelty);
					if (it == m_novelty_numbers.end())
					{
						m_novelty_numbers[node_novelty] = 0;
					}
					else
					{
						m_novelty_numbers[node_novelty]++;
					}
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

						// update_fluent_freq( succ );

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
				std::vector<unsigned> m_fluent_freq;
				float m_sample_factor;
				std::string m_sampling_strategy;
				std::map<unsigned, unsigned> m_novelty_numbers;
			};

		}

	}

}

#endif // iw.hxx
