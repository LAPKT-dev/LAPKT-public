#ifndef __BEST_SUPPORT_GRAPH__
#define __BEST_SUPPORT_GRAPH__

#include <strips_state.hxx>
#include <conj_comp_prob.hxx>
#include <vector>
#include <list>
#include <map>
#include <deque>
#include <fstream>

namespace aptk {

namespace agnostic {

	template <typename Best_Support_Function>
	class Best_Supports_Graph {
	public:

		class Node {
		public:
			const CC_Problem::CC_Action* action;
			unsigned eff_idx;
			Node( const CC_Problem::CC_Action* a, unsigned index ) 
			: action(a), eff_idx(index) {}
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

		void	print( std::ofstream& os ) {
			os << "digraph bs_graph {" << std::endl;
			os << "// vertex set" << std::endl;
			os << "0 [label=\"(GOAL)\"]; " << std::endl;
			for ( unsigned k = 1; k < m_nodes.size(); k++ ) {
				if (!m_valid[k]) continue;
				os << k << " [label=\"" << m_nodes[k]->action->signature() << "\"];" << std::endl;
			}
			os << "// edges" << std::endl;
			for ( unsigned k = 1; k < m_adj_lists_out.size(); k++ ) {
				if ( !m_valid[k] ) continue;
				for ( auto it = m_adj_lists_out[k].begin(); it != m_adj_lists_out[k].end(); it++ ) {
					os << k << " -> " << (*it)->consumer << "[label=\"";
					m_model.print_fluent( (*it)->p, os );
					os << ", eff=" << m_nodes[k]->eff_idx << "\"];" << std::endl; 
				}
			}
			os << "}" << std::endl;
		}

		const std::vector<unsigned>& pref_ops() const {
			return m_pref_ops;
		}

	protected:

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
			m_nodes[into]->eff_idx = 0;
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
			for ( unsigned k = 0; k < precs.size(); k++ ) {
				const Fluent_Conjunction& C_k = *(m_model.fluents()[precs[k]]);
				bool dominated = false;
				for ( unsigned l = k + 1; l < precs.size(); l++ ) {
					const Fluent_Conjunction& C_l = *(m_model.fluents()[precs[l]]);
					if ( C_k.in_set(C_l.fluents())) {
						dominated = true;
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
