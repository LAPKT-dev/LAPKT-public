/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __BEST_SUPPORT_GRAPH__
#define __BEST_SUPPORT_GRAPH__

#include <strips_state.hxx>
#include <conj_comp_prob.hxx>
#include <vector>
#include <list>

#include <map>
#include <deque>
#include <fstream>
#include <stack>

namespace aptk {

namespace agnostic {

	template <typename Best_Support_Function>
	class Best_Supports_Graph {
	public:

		class Node {
		public:
			const CC_Problem::CC_Action* action;
			std::vector<unsigned> eff_idx;
			unsigned rank;
			Node( const CC_Problem::CC_Action* a, unsigned index ) 
			: action(a), rank(0) {
				eff_idx.push_back( index );
			}
		};

		class Edge {
		public:
			unsigned p;
			unsigned consumer; 
			Edge( unsigned label, unsigned dst_node ) 
			: p(label), consumer( dst_node ) {}
			bool operator==( const Edge& o ) const {
				return p == o.p && consumer == o.consumer;
			}
		};

		typedef std::pair< const CC_Problem::CC_Action*, unsigned >			  Effect_Handle;
		typedef std::map< Effect_Handle, unsigned > 					  Effect_Table;
		typedef std::pair< unsigned, unsigned >						  Open_Condition;
		typedef std::vector< Node* >							  Node_Set;
		typedef std::list< Edge* >							  Adj_List;
		typedef std::vector< Adj_List >							  Adj_Table;


		Best_Supports_Graph( const CC_Problem& prob ) 
		: m_model(prob) {
		}

		~Best_Supports_Graph() {
			clear();
		}

		void build( const Best_Support_Function& bs ) {
			clear();
			add_goal_action_node();
			while ( !m_open_conditions.empty() ) {
				Open_Condition oc = m_open_conditions.front();
				m_open_conditions.pop_front();
				add_action_node( bs.best_effect( oc.first ), oc );
			}
			remove_redundant_action_nodes();
			topological_sort();
			update_pref_ops();
		}

		unsigned	num_actions() const { 
			unsigned count = 0;
			for ( unsigned k = 1; k < m_nodes.size(); k++ )
				if ( m_valid[k] ) count++;
			return count;
		}
		
		float		cost() const {
			float sum = 0.0f;
			for ( unsigned k = 1; k < m_nodes.size(); k++ ) {
				if ( !m_valid[k] ) continue;
				sum += m_nodes[k]->action->cost();
			}
			return sum;
		}

		void	extract_plan( std::vector<unsigned>& actions ) {
			std::deque<unsigned> open;
			for ( unsigned k = m_nodes.size()-1; k > 0; k-- ) {
				if ( m_valid[k] ) {
					actions.push_back( m_nodes[k]->action->original().index() );
				}
			}
		}

		void	print( std::ofstream& os ) {
			os << "digraph bs_graph {" << std::endl;
			os << "// vertex set" << std::endl;
			os << "0 [label=\"(GOAL), r=" << m_nodes[0]->rank <<"\"]; " << std::endl;
			for ( unsigned k = 1; k < m_nodes.size(); k++ ) {
				if (!m_valid[k]) continue;
				os << k << " [label=\"" << m_nodes[k]->action->signature() << ", r=" << m_nodes[k]->rank << "\"];" << std::endl;
			}
			os << "// edges" << std::endl;
			for ( unsigned k = 1; k < m_adj_lists_in.size(); k++ ) {
				if ( !m_valid[k] ) continue;
				for ( auto it = m_adj_lists_out[k].begin(); it != m_adj_lists_out[k].end(); it++ ) {
					os << k << " -> " << (*it)->consumer << "[label=\"";
					m_model.print_fluent( (*it)->p, os );
					os << ", eff={";
					for ( unsigned l = 0; l < m_nodes[k]->eff_idx.size(); l++ ) {
					 	os << m_nodes[k]->eff_idx[l];
						if ( l < m_nodes[k]->eff_idx.size() -1 )
							os << ", ";
					}
					os << "}\"];" << std::endl; 
				}
			}
			os << "}" << std::endl;
		}

		const std::vector<unsigned>& pref_ops() const {
			return m_pref_ops;
		}

		bool check_interference( const Fluent_Vec& del, const std::vector<bool>& mask, const Fluent_Vec& prec, unsigned& deleted ) const {
			for ( unsigned k = 0; k < del.size(); k++ ) {
				if ( !mask[k] ) continue;
				for ( auto it2 = prec.begin(); it2 != prec.end(); it2++ ) {
					const Fluent_Conjunction& conj = *(m_model.fluents()[*it2]);
					if ( conj.in_set( del[k] ) ) {
						deleted = del[k];
						return true;
					} 
				}
			}
			return false;
		}

		bool check_interference( const Fluent_Vec& del,  const Fluent_Vec& prec, Fluent_Vec& deleted  ) const {
			for ( unsigned k = 0; k < del.size(); k++ ) {
				for ( auto it2 = prec.begin(); it2 != prec.end(); it2++ ) {
					const Fluent_Conjunction& conj = *(m_model.fluents()[*it2]);
					if ( conj.in_set( del[k] ) ) {
						deleted.push_back(*it2);
					} 
				}
			}
			return !deleted.empty();
		}

		class Node_Comparer {
		public:
			Node_Comparer( const Node_Set& V ) 
			: m_V( V ) {}
			
			bool operator()( unsigned a, unsigned b ) const {
				return m_V[a]->rank < m_V[b]->rank;
			}
			
			const Node_Set& m_V;
		};

		void find_conflicts( std::vector<Fluent_Vec>& vec ) {
			std::vector<unsigned> valid_nodes;
			for ( unsigned k = 0; k < m_nodes.size(); k++ ) {
				if (m_valid[k]) { 
					valid_nodes.push_back( k );
				}
			}
			std::sort( valid_nodes.begin(), valid_nodes.end(), Node_Comparer( m_nodes ) );
				
			for ( unsigned k = 0; k < valid_nodes.size()-1; k++ ) {
				unsigned nd = valid_nodes[k];
				const CC_Problem::CC_Action& ak = *(m_nodes[nd]->action);
				
				for ( unsigned l = 0; l < valid_nodes.size(); l++ ) {
					unsigned nf = valid_nodes[l];
					if ( nd == nf || m_nodes[nf]->rank < m_nodes[nd]->rank ) continue;
					Fluent_Vec cond;
					if ( nf == 0 )
						cond = m_model.goal();
					else {
						Fluent_Vec tmp_cond = m_nodes[nf]->action->pre();
						for ( unsigned i = 0; i < m_nodes[nf]->eff_idx.size(); i++ ) {
							if ( m_nodes[nf]->eff_idx[i] == 0 ) continue;
							const CC_Problem::CC_Cond_Eff& ce = m_nodes[nf]->action->cond_effs()[  m_nodes[nf]->eff_idx[i]-1 ];
							for ( auto it = ce.first.begin(); it != ce.first.end(); it++ )
								tmp_cond.push_back( *it );	
						}
						std::vector<bool> mask( tmp_cond.size(), false );

						for ( unsigned i = 0; i < tmp_cond.size(); i++ ) {
							const Fluent_Conjunction& C_i = *(m_model.fluents()[tmp_cond[i]]);
							bool dominated = false;
							for ( unsigned j = 0; j < tmp_cond.size(); j++ ) {
								if ( i == j || mask[j] ) continue;
								const Fluent_Conjunction& C_j = *(m_model.fluents()[tmp_cond[j]]);
								if ( C_i.in_set(C_j.fluents())) {
									dominated = true;
									mask[i] = true;
									break;
								}
							}
							if (!dominated) cond.push_back( tmp_cond[i] );
						}

					}
					std::cout << "Checking whether action " << ak.signature() << " deletes precondition of ";
					std::cout << ( nf == 0 ? "(GOAL)" : m_nodes[nf]->action->signature() ) << " which is " << std::endl;
					for ( unsigned i = 0; i < cond.size(); i++ ) {
						m_model.print_fluent( cond[i], std::cout );
						if ( i < cond.size() -1 ) std::cout << ", ";
					}
					std::cout << std::endl;
					Fluent_Vec deleted;
					if ( !check_interference( ak.original().del_vec(), cond, deleted ) ) continue;
					Fluent_Vec kl_path;
					if ( !exists_path_between( nd, nf, kl_path ) ) {
						std::cout << "Type 2 Conflict: " << std::endl;
						std::cout << ak.signature() << " is deleting prec. ";
						for ( unsigned i = 0; i < deleted.size(); i++ ) {
							m_model.print_fluent( deleted[i], std::cout );
							if ( i < deleted.size() - 1 ) std::cout << ", ";
						}
						std::cout <<" of " << ( nf == 0 ? "GOAL" : m_nodes[nf]->action->signature() ) << std::endl;
						unsigned min_rank = ( m_nodes[nd]->rank > m_nodes[nf]->rank ? m_nodes[nd]->rank : m_nodes[nf]->rank  );
						for ( unsigned i = 0; i < valid_nodes.size(); i++ ) {
							unsigned nj = valid_nodes[i];
							if ( nj == nd || nj == nf || m_nodes[nj]->rank <= min_rank ) continue;
							Fluent_Vec kpath, lpath;
							if ( !exists_path_between( nd, nj, kpath ) ) continue;
							if ( !exists_path_between( nf, nj, lpath ) ) continue;
							/*
							for ( auto it = kpath.begin(); it != kpath.end(); it++ ) {
								for ( auto it2 = lpath.begin(); it2 != lpath.end(); it2++ ) {
									if ( *it == *it2 ) continue;
									Fluent_Vec C;
									C.push_back( *it );
									C.push_back( *it2 );
									std::cout << "Suggested flaw: ";
									m_model.print_fluent( *it, std::cout );
									std::cout << " & ";
									m_model.print_fluent( *it2, std::cout );
									std::cout << std::endl;
									vec.push_back( C );
								}
							}
							*/
							if ( kpath.back() == lpath.back() ) continue;
							std::cout << "Suggested flaw: ";
							m_model.print_fluent( kpath.back(), std::cout );
							std::cout << " & ";
							m_model.print_fluent( lpath.back(), std::cout );
							std::cout << std::endl;

							Fluent_Vec C;
							C.push_back( kpath.back() );
							C.push_back( lpath.back() );
							vec.push_back( C );
							return;
						}
					}
					else {
						std::cout << "Type 1 Conflict: " << std::endl;
						std::cout << ak.signature() << " is deleting prec. ";
						for ( unsigned i = 0; i < deleted.size(); i++ ) {
							m_model.print_fluent( deleted[i], std::cout );
							if ( i < deleted.size() - 1 ) std::cout << ", ";
						}
						std::cout <<" of " << ( nf == 0 ? "GOAL" : m_nodes[nf]->action->signature() ) << std::endl;
						/*
						for ( auto it = kl_path.begin(); it != kl_path.end(); it++ ) 
							for (auto it2 = deleted.begin(); it2!= deleted.end(); it2++ ) {
								if ( *it == *it2 ) continue;
								Fluent_Vec C;
								C.push_back( *it );
								C.push_back( *it2 );
								std::cout << "Suggested flaw: ";
								m_model.print_fluent( *it, std::cout );
								std::cout << " & ";
								m_model.print_fluent( *it2, std::cout );
								std::cout << std::endl;
								vec.push_back( C );
							}
						*/
						if ( kl_path.back() == deleted[0] ) continue;
						Fluent_Vec C;
						C.push_back( kl_path.back() );
						C.push_back( deleted[0] );
						std::cout << "Suggested flaw: ";
						m_model.print_fluent( kl_path.back(), std::cout );
						std::cout << " & ";
						m_model.print_fluent( deleted[0], std::cout );
						std::cout << std::endl;
						vec.push_back( C );
						
						return;
					}
				}
			}
		}

		/*
		void find_type_1_conflicts( std::vector<Fluent_Vec>& vec ) {
			typedef typename std::pair<unsigned, typename Adj_List::iterator> dfs_node;
			for ( unsigned k = m_nodes.size() - 1; k > 0; k-- ) {
				if ( !m_valid[k] )  continue;
				dfs_node n0 = std::make_pair( k, m_adj_lists_out[k].begin() );
				if (n0.first == 0 ) break;
				std::cout << "Conflict search start: " << m_nodes[n0.first]->action->signature() << std::endl;
				std::stack< dfs_node > open;
				for ( auto it =  m_adj_lists_out[n0.first].begin(); it != m_adj_lists_out[n0.first].end(); it++ ) {
					const Fluent_Vec& curr_del_vec = m_nodes[n0.first]->action->original().del_vec();
					std::vector<bool> del_mask( curr_del_vec.size() );
					for ( unsigned k = 0; k < curr_del_vec.size(); k++ )
						del_mask[k] = true;
					open.push( std::make_pair( (*it)->consumer, m_adj_lists_out[(*it)->consumer].begin() ) );
					while( !open.empty() ) {
						dfs_node& n = open.top();
						if ( n.second == m_adj_lists_out[n.first].end() ) {
							open.pop();
							if ( n.first != 0 ) {
								const Fluent_Vec& add_vec = m_nodes[n.first]->action->original().add_vec();
								for ( unsigned k = 0; k < add_vec.size(); k++ )
									for ( unsigned l = 0; l < curr_del_vec.size(); l++ )
										if ( curr_del_vec[l] == add_vec[k] ) {
											del_mask[l] = true;
											break;
										}
								const Fluent_Vec& del_vec = m_nodes[n.first]->action->original().del_vec();
								for ( unsigned k = 0; k < del_vec.size(); k++ ) 
									for ( unsigned l = 0; l < curr_del_vec.size(); l++ )
										if ( curr_del_vec[l] == del_vec[k] ) {
											del_mask[l] = false;
											break;
										}
							}
							continue;
						}
						if ( n.second == m_adj_lists_out[n.first].begin() ) {
							std::cout << "Action " << ( n.first == 0 ? "GOAL" : m_nodes[n.first]->action->signature() );
							std::cout << " first found, performing conflict check" << std::endl;
							bool 	 conflict = false;
							unsigned del_prec;
							if ( n.first == 0 ) 
								conflict = check_interference( curr_del_vec, del_mask,
												m_model.goal(), del_prec );
							else
								conflict = check_interference( curr_del_vec, del_mask,
											m_nodes[n.first]->action->pre(), del_prec );
							if ( conflict ) {
								std::cout << "Action " << m_nodes[n0.first]->action->signature() << " deletes ";
								m_model.print_fluent( del_prec, std::cout );
								std::cout << " required by ";
								if ( n.first == 0 ) std::cout << "GOAL";
								else std::cout << m_nodes[n.first]->action->signature();
								std::cout << std::endl;
								open.pop();
								while ( !open.empty() ) {
									Fluent_Vec C;
									C.push_back( del_prec );
									C.push_back( (*open.top().second)->p );
									vec.push_back( C );
									open.pop();
								}
								Fluent_Vec C;
								C.push_back( del_prec );
								C.push_back( (*it)->p );
								vec.push_back( C );
								return;
							}
							if ( n.first != 0 ) {
								const Fluent_Vec& add_vec = m_nodes[n.first]->action->original().add_vec();
								for ( unsigned k = 0; k < add_vec.size(); k++ )
									for ( unsigned l = 0; l < curr_del_vec.size(); l++ )
										if ( curr_del_vec[l] == add_vec[k] ) {
											del_mask[l] = false;
											break;
										}
								const Fluent_Vec& del_vec = m_nodes[n.first]->action->original().del_vec();

								for ( unsigned k = 0; k < del_vec.size(); k++ ) 
									for ( unsigned l = 0; l < curr_del_vec.size(); l++ )
										if ( curr_del_vec[l] == del_vec[k] ) {
											del_mask[l] = true;
											break;
										}
							}
						}
						if (n.first == 0) {
							open.pop();
							continue;
						}
						open.push( std::make_pair( (*(n.second))->consumer, m_adj_lists_out[(*(n.second))->consumer].begin() ) );
						std::cout << (*(n.second))->consumer << std::endl;
						std::cout << "Follow-up action ";
						std::cout << ( (*(n.second))->consumer == 0 ? "GOAL" : m_nodes[  (*(n.second))->consumer ]->action->signature() );
						std::cout << " added to open" << std::endl;
						n.second++;
					}
				}
			}
		}
		*/
	protected:

		void	topological_sort() {
			typedef std::pair<unsigned, unsigned> bfs_node;
			std::deque<bfs_node>	open;
			for ( unsigned k = 0; k < m_nodes.size(); k++ ) {
				if (!m_valid[k]) continue;
				if ( m_adj_lists_in[k].empty() ) {
					m_nodes[k]->rank = 0;
					for ( auto it = m_adj_lists_out[k].begin(); it != m_adj_lists_out[k].end(); it++ )
						open.push_back( std::make_pair((*it)->consumer, 1) );
				}
			}
			
			while ( !open.empty() ) {
				bfs_node n = open.front();
				open.pop_front();
				if ( !m_valid[n.first] ) continue;
				m_nodes[n.first]->rank = ( m_nodes[n.first]->rank < n.second ? n.second :  m_nodes[n.first]->rank  );
				for ( auto it = m_adj_lists_out[n.first].begin(); it != m_adj_lists_out[n.first].end(); it++ )
						open.push_back( std::make_pair((*it)->consumer, m_nodes[n.first]->rank + 1 ) );
			}
		}


		void	update_pref_ops() {
			m_pref_ops.clear();
			for ( unsigned k = 0; k < m_nodes.size(); k++ )
				if ( m_valid[k] && m_adj_lists_in[k].empty() ) m_pref_ops.push_back( m_nodes[k]->action->original().index() );
		}

		void	clean_adj_list( Adj_List& alist ) {
			std::deque<Edge*> nodes;
			for ( auto it = alist.begin(); it != alist.end(); it++ )
				if ( m_valid[(*it)->consumer] ) 
					nodes.push_back( *it );
				else
					delete *it;
			alist.clear();
			if ( !nodes.empty() ) {
				alist.push_back( nodes.front() );
				nodes.pop_front();
			}
			while ( !nodes.empty() ) {
				Edge* e = nodes.front();
				nodes.pop_front();
				bool duplicate = false;
				for ( auto it = alist.begin();
					it != alist.end(); it++ )
					if ( **it == *e ) {
						duplicate = true;
						break;
					}
				if ( !duplicate )
					alist.push_back( e );
				else
					delete e;
			}	
		}

		void	remove_redundant_action_nodes() {

			for ( unsigned k = m_nodes.size()-1; k > 0; k-- ) {
				if ( !m_valid[k] ) continue;
				std::vector<unsigned> siblings;
				//std::cout << "Collecting siblings" << std::endl;
				collect_siblings( k, siblings );
				//std::cout << "Merging " << siblings.size() << " nodes together" << std::endl;
				for ( unsigned l = 0; l < siblings.size(); l++ ) {
					merge( siblings[l], k );
					m_valid[ siblings[l] ] = false;
				}
				//std::cout << "Merged!" << std::endl;	
			}
			for ( unsigned k = m_nodes.size()-1; k > 0; k-- ) {
				if ( !m_valid[k] ) continue;
				clean_adj_list( m_adj_lists_in[k] );
				clean_adj_list( m_adj_lists_out[k] );
	
			}
		}

		void	merge( unsigned from, unsigned into ) {
			for ( unsigned k = 0; k < m_nodes[from]->eff_idx.size(); k++ )
				m_nodes[into]->eff_idx.push_back( m_nodes[from]->eff_idx[k] );
			for ( auto it = m_adj_lists_out[from].begin();
				it != m_adj_lists_out[from].end(); it++ ) {
				if ( !m_valid[(*it)->consumer] ) continue;
				m_adj_lists_out[into].push_back( *it );
				for ( auto it2 = m_adj_lists_in[(*it)->consumer].begin();
					it2 != m_adj_lists_in[(*it)->consumer].end(); it2++ ) {
					if ( (*it2)->p == (*it)->p ) (*it2)->consumer = into;
				}
			}
			for ( auto it = m_adj_lists_in[from].begin();
				it != m_adj_lists_in[from].end(); it++ ) {
				if ( !m_valid[(*it)->consumer] ) continue;
				m_adj_lists_in[into].push_back( *it );
				for ( auto it2 = m_adj_lists_out[(*it)->consumer].begin();
					it2 != m_adj_lists_out[(*it)->consumer].end(); it2++ ) {
					if ( (*it2)->p == (*it)->p ) (*it2)->consumer = into;
				}				
			}
			m_adj_lists_out[from].clear();
			m_adj_lists_in[from].clear();
		}

		void	collect_siblings( unsigned first_index, std::vector<unsigned>& sibling_nodes ) {
			if ( first_index - 1 == 0 ) return;
			for ( unsigned k = first_index - 1; k > 0; k-- ) {
				if ( !m_valid[k] ) continue;
				if ( m_nodes[k]->action != m_nodes[first_index]->action ) continue;
				//std::cout << "Checking path existence..." << std::endl;
				if ( exists_path_between( first_index, k ) ) continue;
				sibling_nodes.push_back( k );
			}
		}

		bool	exists_path_between( unsigned src, unsigned dst ) {
			std::deque<unsigned> 	open;
			for ( auto it = m_adj_lists_out[src].begin(); it != m_adj_lists_out[src].end(); it++ )
				open.push_back( (*it)->consumer );
			while ( !open.empty() ) {
				unsigned next = open.front();
				open.pop_front();
				if ( !m_valid[next] ) continue;
				if ( next == dst ) return true;
				for ( auto it = m_adj_lists_out[next].begin(); it != m_adj_lists_out[next].end(); it++ )
					open.push_back( (*it)->consumer );
			}	
			return false;

		}

		bool	exists_path_between( unsigned src, unsigned dst, Fluent_Vec& precs ) {
			typedef std::pair<unsigned, Fluent_Vec> bfs_node;
			std::deque<bfs_node> 	open;
			for ( auto it = m_adj_lists_out[src].begin(); it != m_adj_lists_out[src].end(); it++ ) {
				Fluent_Vec context;
				context.push_back( (*it)->p );
				open.push_back( std::make_pair( (*it)->consumer, context ) );
			}
			while ( !open.empty() ) {
				bfs_node next = open.front();
				open.pop_front();
				if ( !m_valid[next.first] ) continue;
				if ( next.first == dst ) {
					precs = next.second;
					return true;
				}
				for ( auto it = m_adj_lists_out[next.first].begin(); it != m_adj_lists_out[next.first].end(); it++ ) {
					Fluent_Vec context = next.second;
					context.push_back( (*it)->p );
					open.push_back( std::make_pair((*it)->consumer, context)  );
				}
			}	
			return false;
			
		}

		void	add_goal_action_node() {
			Node* n = new Node(nullptr, 0);
			Effect_Handle goal_handle = std::make_pair(nullptr,0);
			m_eff_node.insert( std::make_pair(goal_handle,0));
			m_nodes.push_back( n );
			m_valid.push_back( true );
			m_adj_lists_out.push_back( Adj_List() );
			m_adj_lists_in.push_back( Adj_List() );
			Fluent_Vec dom_precs;
			compute_dominating_preconditions( goal_handle, dom_precs );
			generate_open_conditions( dom_precs, 0 );	
		}

		void	generate_open_conditions( const Fluent_Vec& atom_set, unsigned node_idx ) {
			for (auto it = atom_set.begin(); it != atom_set.end(); it++ )
				m_open_conditions.push_back( std::make_pair( *it, node_idx ) );
		}

		void	add_action_node( const Effect_Handle& eff, const Open_Condition& oc ) {
			if ( eff.first == nullptr ) return;
			// 1. Check if effect has already been accounted for
			auto eff_it = m_eff_node.find( eff ) ;
			if ( eff_it != m_eff_node.end() ) {
				unsigned producer_idx = eff_it->second;
				m_adj_lists_out[producer_idx].push_back( new Edge( oc.first, oc.second ) );
				m_adj_lists_in[oc.second].push_back( new Edge( oc.first, producer_idx ) );
				return;
			}
			Node* n = new Node( eff.first, eff.second );
			m_eff_node[eff] = m_nodes.size();
			m_nodes.push_back( n );
			m_valid.push_back( true );
			m_adj_lists_out.push_back( Adj_List() );
			m_adj_lists_in.push_back( Adj_List() );
			m_adj_lists_out.back().push_back( new Edge( oc.first, oc.second ) );
			m_adj_lists_in[oc.second].push_back( new Edge( oc.first, m_nodes.size()-1 ) );
			Fluent_Vec dom_precs;
			compute_dominating_preconditions( eff, dom_precs );
			generate_open_conditions( dom_precs, m_nodes.size()-1 );	
		}

		void	compute_dominating_preconditions( const Effect_Handle& eff, Fluent_Vec& dom_precs ) {
			if ( eff.first == nullptr ) {
				const Fluent_Vec& G = m_model.goal();
				for ( unsigned k = 0; k < G.size(); k++ ) {
					
					const Fluent_Conjunction& C_k = *(m_model.fluents()[G[k]]);
					bool dominated = false;
					for ( unsigned l = k + 1; l < G.size(); l++ ) {
						const Fluent_Conjunction& C_l = *(m_model.fluents()[G[l]]);
						if ( C_k.in_set(C_l.fluents())) {
							m_model.print_fluent( G[k], std::cout );
							std::cout << " dominated by ";
							m_model.print_fluent( G[l], std::cout );
							std::cout << std::endl;
							dominated = true;
							break;
						}
					}
					if (!dominated) dom_precs.push_back( G[k] );
				}
					
				return;
			}
			Fluent_Vec precs = eff.first->pre();
			if ( eff.second > 0 ) {
				auto ce = eff.first->cond_effs()[eff.second-1].first;
				for ( auto it = ce.begin(); it != ce.end(); it++ )
					precs.push_back( *it );
			}
			std::vector<bool> mask( precs.size(), false );
			for ( unsigned k = 0; k < precs.size(); k++ ) {
				const Fluent_Conjunction& C_k = *(m_model.fluents()[precs[k]]);
				bool dominated = false;
				for ( unsigned l = 0; l < precs.size(); l++ ) {
					if ( k == l || mask[l] ) continue;
					const Fluent_Conjunction& C_l = *(m_model.fluents()[precs[l]]);
					if ( C_k.in_set(C_l.fluents())) {
						dominated = true;
						mask[k] = true;
						break;
					}
				}
				if (!dominated) dom_precs.push_back( precs[k] );
			}
			
		}

		void	clear() {
			for ( auto it = m_nodes.begin(); it != m_nodes.end(); it++ )
				delete (*it);
			m_nodes.clear();
			for ( auto ne_it = m_adj_lists_out.begin(); ne_it != m_adj_lists_out.end(); ne_it++ )
				for ( auto e_it = ne_it->begin(); e_it != ne_it->end(); e_it++ )
					delete (*e_it);
			m_adj_lists_out.clear();
			m_eff_node.clear();
		}

	protected:
		const CC_Problem& 		m_model;
		Effect_Table			m_eff_node;
		Node_Set			m_nodes;
		Adj_Table			m_adj_lists_out;
		Adj_Table			m_adj_lists_in;
		std::deque<Open_Condition>	m_open_conditions;
		std::vector<bool>		m_valid;
		std::vector<unsigned>		m_pref_ops;
	};

}

}

#endif // bs_graph.hxx
