
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

#ifndef __NOVELTY_PARTITION_2__
#define __NOVELTY_PARTITION_2__

#include <search_prob.hxx>
#include <heuristic.hxx>
#include <ext_math.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <vector>
#include <deque>

namespace aptk
{

	namespace agnostic
	{

		template <typename Search_Model, typename Search_Node>
		class Novelty_Partition_2 : public Heuristic<State>
		{
		public:
			Novelty_Partition_2(const Search_Model &prob, unsigned max_arity = 1, const unsigned max_MB = 2048)
					: Heuristic<State>(prob), m_strips_model(prob.task()), m_max_memory_size_MB(max_MB), m_always_full_state(false), m_verbose(true), m_partition_size(0)
			{

				set_arity(max_arity, 1);
			}

			virtual ~Novelty_Partition_2()
			{
				typedef typename std::vector<std::vector<Fluent_Set *> *>::iterator Node_2Vec_Ptr_It;
				typedef typename std::vector<Fluent_Set *>::iterator Node_Vec_Ptr_It;

				for (Node_Vec_Ptr_It it_p = m_nodes_tuples1_by_partition.begin(); it_p != m_nodes_tuples1_by_partition.end(); it_p++)
					delete *it_p;

				for (Node_2Vec_Ptr_It it_2p = m_nodes_tuples2_by_partition.begin(); it_2p != m_nodes_tuples2_by_partition.end(); it_2p++)
				{
					if (!*it_2p)
						continue;
					for (Node_Vec_Ptr_It it_p = (*it_2p)->begin(); it_p != (*it_2p)->end(); it_p++)
					{
						delete *it_p;
					}
					delete *it_2p;
				}
			}

			void init()
			{
				typedef typename std::vector<std::vector<Fluent_Set *> *>::iterator Node_2Vec_Ptr_It;
				typedef typename std::vector<Fluent_Set *>::iterator Node_Vec_Ptr_It;

				for (Node_Vec_Ptr_It it_p = m_nodes_tuples1_by_partition.begin(); it_p != m_nodes_tuples1_by_partition.end(); it_p++)
					if ((*it_p) && (*it_p)->bits().packs() != NULL)
						(*it_p)->reset();

				for (Node_2Vec_Ptr_It it_2p = m_nodes_tuples2_by_partition.begin(); it_2p != m_nodes_tuples2_by_partition.end(); it_2p++)
				{
					if (!*it_2p)
						continue;
					for (Node_Vec_Ptr_It it_p = (*it_2p)->begin(); it_p != (*it_2p)->end(); it_p++)
						if ((*it_p) && (*it_p)->bits().packs() != NULL)
							(*it_p)->reset();
				}
			}

			unsigned arity() const { return m_arity; }
			void set_full_state_computation(bool b) { m_always_full_state = b; }

			void set_verbose(bool v) { m_verbose = v; }

			unsigned &partition_size() { return m_partition_size; }

			void set_arity(unsigned max_arity, unsigned partition_size)
			{

				if (max_arity > 2)
				{
					std::cerr << "Maximum novelty table allowed for tuples of size 2!" << std::endl;
					std::exit(9);
				}
				m_partition_size = partition_size;
				m_arity = max_arity;
				m_num_tuples = m_num_fluents = m_strips_model.num_fluents();

				float size_novelty = ((float)pow(m_num_fluents, m_arity) / 1024000.) * (float)partition_size;
				// std::cout << "Try allocate size: "<< size_novelty<<" MB"<<std::endl;
				if (size_novelty > m_max_memory_size_MB)
				{
					m_arity = 1;
					size_novelty = ((float)pow(m_num_fluents, m_arity) / 1024000.) * (float)partition_size;

					std::cout << "EXCEDED, m_arity downgraded to 1 --> size: " << size_novelty << " MB" << std::endl;
				}

				m_nodes_tuples1_by_partition.resize(m_partition_size + 1);
				if (m_arity == 2)
					m_nodes_tuples2_by_partition.resize(m_partition_size + 1);

				for (unsigned i = 0; i < m_partition_size + 1; i++)
				{

					if (m_nodes_tuples1_by_partition[i] &&
							m_nodes_tuples1_by_partition[i]->bits().packs() != NULL)
					{
						m_nodes_tuples1_by_partition[i]->reset();
					}
					if (m_arity == 2)
					{
						for (unsigned j = 0; j < m_num_tuples; j++)
						{

							if (m_nodes_tuples2_by_partition[i] &&
									m_nodes_tuples2_by_partition[i]->at(j) &&
									m_nodes_tuples2_by_partition[i]->at(j)->bits().packs() != NULL)
							{
								m_nodes_tuples2_by_partition[i]->at(j)->reset();
							}
						}
					}
				}
			}

			virtual void eval(Search_Node *n, unsigned &h_val)
			{

				compute(n, h_val);
			}

			virtual void eval(Search_Node *n, float &h_val)
			{
				unsigned h;
				compute(n, h);
				h_val = h;
			}

			virtual void eval(const State &s, unsigned &h_val)
			{

				assert(true);
			}

			virtual void eval(const State &s, unsigned &h_val, std::vector<Action_Idx> &pref_ops)
			{
				assert(true);
			}

		protected:
			void check_table_size(Search_Node *n)
			{

				if (m_partition_size < n->partition2())
				{
					m_nodes_tuples1_by_partition.resize(n->partition2() + 1);
					if (m_arity == 2)
					{
						m_nodes_tuples2_by_partition.resize(n->partition2() + 1);
						m_nodes_tuples2_by_partition[n->partition2()] = new std::vector<Fluent_Set *>(m_num_tuples + 1);
					}
					m_partition_size = n->partition2();
				}

				if (m_nodes_tuples1_by_partition[n->partition2()] == NULL)
				{
					m_nodes_tuples1_by_partition[n->partition2()] = new Fluent_Set(m_num_tuples);
					if (m_arity == 2)
					{
						if (m_nodes_tuples2_by_partition[n->partition2()] == NULL)
							m_nodes_tuples2_by_partition[n->partition2()] = new std::vector<Fluent_Set *>(m_num_tuples + 1);
					}
				}
			}

			/**
			 * If parent node is in the same space partition, check only new atoms,
			 * otherwise check all atoms in state
			 */
			void compute(Search_Node *n, unsigned &novelty)
			{

				novelty = (float)m_arity + 1;

				if (n->partition2() == std::numeric_limits<unsigned>::max())
					return;

				check_table_size(n);

				for (unsigned i = 1; i <= m_arity; i++)
				{
#ifdef DEBUG
					if (m_verbose)
						std::cout << "search state node: " << &(n) << std::endl;
#endif

					bool new_covers;
					if (n->parent() == nullptr || m_always_full_state)
						new_covers = cover_tuples(n, i);
					else
						new_covers = (n->partition2() == n->parent()->partition2()) ? cover_tuples_op(n, i) : cover_tuples(n, i);
#ifdef DEBUG
					if (m_verbose && !new_covers)
						std::cout << "\t \t PRUNE! search node: " << &(n) << std::endl;
#endif
					if (new_covers)
						if (i < novelty)
							novelty = i;
				}
			}

			inline void set_union(Bit_Set *table, Bit_Set &other, bool &new_covers)
			{
				assert(table->max_index() == other.max_index());
				assert(table->bits().npacks() == other.bits().npacks());
				unsigned np = other.bits().npacks();
				uint32_t *op = other.bits().packs();
				for (unsigned p_idx = 0; p_idx < np; p_idx++)
				{
					uint32_t pack = table->bits().packs()[p_idx];
					table->bits().packs()[p_idx] |= op[p_idx];
					if (pack != table->bits().packs()[p_idx])
						new_covers = true;
				}
			}

			bool cover_tuples(Search_Node *n, unsigned arity)
			{
				const bool has_state = n->has_state();

				static Fluent_Vec added;
				static Fluent_Vec deleted;
				if (!has_state)
				{
					added.clear();
					deleted.clear();
					n->parent()->state()->progress_lazy_state(m_strips_model.actions()[n->action()], &added, &deleted);
				}

				Fluent_Vec &fl = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();
				Fluent_Set &fl_set = has_state ? n->state()->fluent_set() : n->parent()->state()->fluent_set();
				bool new_covers = false;

				if (arity == 1)
				{
					Fluent_Set *table = m_nodes_tuples1_by_partition[n->partition2()];
					set_union(table, fl_set, new_covers);
				}
				else
				{
					std::vector<Fluent_Set *> &tables = *(m_nodes_tuples2_by_partition[n->partition2()]);
					for (auto fl_idx : fl)
					{
						if (tables[fl_idx] == NULL)
							tables[fl_idx] = new Fluent_Set(m_num_tuples);

						set_union(tables[fl_idx], fl_set, new_covers);
					}
				}

				if (!has_state)
					n->parent()->state()->regress_lazy_state(m_strips_model.actions()[n->action()], &added, &deleted);
				return new_covers;
			}

			/**
			 * Instead of checking the whole state, checks the new atoms permutations only!
			 */

			bool cover_tuples_op(Search_Node *n, unsigned arity)
			{

				const bool has_state = n->has_state();

				static Fluent_Vec new_atom_vec;
				const Action *a = m_strips_model.actions()[n->action()];
				if (a->has_ceff())
				{
					static Fluent_Set new_atom_set(m_strips_model.num_fluents() + 1);
					new_atom_set.reset();
					new_atom_vec.clear();
					for (Fluent_Vec::const_iterator it = a->add_vec().begin(); it != a->add_vec().end(); it++)
					{
						if (new_atom_set.isset(*it))
							continue;

						new_atom_vec.push_back(*it);
						new_atom_set.set(*it);
					}
					for (unsigned i = 0; i < a->ceff_vec().size(); i++)
					{
						Conditional_Effect *ce = a->ceff_vec()[i];
						if (ce->can_be_applied_on(*(n->parent()->state())))
							for (Fluent_Vec::iterator it = ce->add_vec().begin(); it != ce->add_vec().end(); it++)
							{
								{
									if (new_atom_set.isset(*it))
										continue;

									new_atom_vec.push_back(*it);
									new_atom_set.set(*it);
								}
							}
					}
				}

				const Fluent_Vec &add = a->has_ceff() ? new_atom_vec : a->add_vec();

				// n->parent()->state()->progress_lazy_state(  m_strips_model.actions()[ n->action() ]);
				Fluent_Vec &fl = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();

				std::vector<Fluent_Set *> *tables = NULL;
				if (arity == 2)
					tables = m_nodes_tuples2_by_partition[n->partition2()];

				bool new_covers = false;

				assert(arity > 0);

				for (Fluent_Vec::const_iterator it_add = add.begin();
						 it_add != add.end(); it_add++)
				{

					if (arity == 1)
					{
						if (!m_nodes_tuples1_by_partition[n->partition2()]->isset(*it_add))
						{

							m_nodes_tuples1_by_partition[n->partition2()]->set(*it_add);
							new_covers = true;

#ifdef DEBUG
							if (m_verbose)
							{
								std::cout << "\t NEW!! : ";
								for (unsigned i = 0; i < arity; i++)
								{
									std::cout << m_strips_model.fluents()[*it_add]->signature() << "  ";
								}
								std::cout << std::endl;
							}
#endif
						}
					}
					else
					{
						for (auto fl_idx : fl)
						{
							unsigned min = *it_add;
							unsigned max = fl_idx;
							if (fl_idx <= *it_add)
							{
								min = fl_idx;
								max = *it_add;
							}
							if (min == max)
								continue;

							if (tables->at(min) == NULL)
								tables->at(min) = new Fluent_Set(m_num_tuples);
							if (!tables->at(min)->isset(max))
							{
								tables->at(min)->set(max);
								new_covers = true;
							}
						}

						// set the reverse order to seen for future cases.
						/*	for(auto fl_idx : fl){
							if(tables->at(fl_idx) == NULL)
								tables->at(fl_idx) = new Fluent_Set( m_num_tuples );
							tables->at(fl_idx)->set(*it_add);
						}
						*/
						/*if(tables->at(*it_add) == NULL)
							tables->at(*it_add) = new Fluent_Set( m_num_tuples );

						set_union( tables->at(*it_add) , fl_set, new_covers);
						*/
					}
				}

				// if(!has_state)
				//	n->parent()->state()->regress_lazy_state( m_strips_model.actions()[ n->action() ] );

				return new_covers;
			}

			const STRIPS_Problem &m_strips_model;
			std::vector<Fluent_Set *> m_nodes_tuples1_by_partition;
			std::vector<std::vector<Fluent_Set *> *> m_nodes_tuples2_by_partition;
			unsigned m_arity;
			unsigned long m_num_tuples;
			unsigned m_num_fluents;
			unsigned m_max_memory_size_MB;
			bool m_always_full_state;
			bool m_verbose;
			unsigned m_partition_size;
		};

	}

}

#endif // novelty_partition_2.hxx
