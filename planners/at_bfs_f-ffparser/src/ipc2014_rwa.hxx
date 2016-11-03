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

#ifndef __IPC2014_RWA__
#define __IPC2014_RWA__

#include <aptk/at_rwbfs_dq_mh.hxx>
#include <landmark_graph_manager.hxx>
#include <h_1.hxx>

namespace aptk {
namespace search {

namespace ipc2014 {
	
	template <typename State>
	class Node {
	public:
		typedef Fibonacci_Open_List< Node >	Open_List;
		typedef	State				State_Type;	

		typedef Node<State>*        						Node_Ptr;
		typedef typename std::list< Node<State>* >                     	Node_Ptr_List;
		typedef typename std::list< Node<State>* >::reverse_iterator    	Node_Ptr_List_Rit;
		typedef typename std::list< Node<State>* >::iterator            	Node_Ptr_List_It;

	
		Node( State* s, float cost, Action_Idx action, Node<State>* parent, int num_actions ) 
		: m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ),  m_g_unit(0), m_po_1( num_actions ), m_po_2( num_actions), m_seen(false),
		current( nullptr ),  m_land_consumed( nullptr ), m_land_unconsumed( nullptr ) {
		       	m_g = ( parent ? parent->m_g + cost : 0.0f);
			m_g_unit = ( parent ? parent->m_g_unit + 1.0f : 0.0f);
		}
		
		virtual ~Node() {
	               if ( m_state != NULL ) delete m_state;
		}

		float&                        h1n()                                { return m_h1; }
		float                        h1n() const                         { return m_h1; }
		float&                        h2n()                                { return m_h2; }
		float                        h2n() const                         { return m_h2; }
		float&                        gn()                                { return m_g; }                        
		float                        gn() const                         { return m_g; }
	
		float&				gn_unit()				{ return m_g_unit; }			
		float				gn_unit() const 			{ return m_g_unit; }
		float&                        fn()                                { return m_f; }
		float                        fn() const                        { return m_f; }
		Node<State>*                parent()                           { return m_parent; }
		Action_Idx                action() const                         { return m_action; }
		State*                        state()                                { return m_state; }
		const State&                state() const                         { return *m_state; }
		void                        add_po_1( Action_Idx index )        { m_po_1.set( index ); }
		void                        remove_po_1( Action_Idx index ) { m_po_1.unset( index ); }
		void                        add_po_2( Action_Idx index )        { m_po_2.set( index ); }
		void                        remove_po_2( Action_Idx index ) { m_po_2.unset( index ); }
		bool                        is_po_1(Action_Idx index) const        { return m_po_1.isset( index ); }
		bool                        is_po_2(Action_Idx index) const        { return m_po_2.isset( index ); }
		void                        set_seen( )                        { m_seen = true; }
		bool                        seen() const                        { return m_seen; }

		Bool_Vec_Ptr*&           	land_consumed()                 	{ return m_land_consumed; }
		Bool_Vec_Ptr*&           	land_unconsumed()                 	{ return m_land_unconsumed; }

		void                        print( std::ostream& os ) const {
			os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = ";
			os << m_g << ", h1(n) = " << m_h1 << ", h2(n) = " << m_h2 << ", f(n) = " << m_f << "}";
		}


		template <typename Landmarks_Graph_Manager>
		void    update_land_graph(Landmarks_Graph_Manager* lgm){

                        Node_Ptr_List path;
			Node_Ptr n = this;
			do{
				path.push_front(n);
				n = n->parent();
			}while( n );

			//std::cout << "Updating Land Graph up to: " << path.size() << std::flush;
			  
			lgm->reset_graph();
			for( Node_Ptr_List_It it = path.begin(); it != path.end(); it++){
				if(*it == NULL) break;
				
				//if( (*it)->action() != -1)
				// std::cout << lgm->problem().actions()[ (*it)->action() ]->signature() << std::flush;
	
				lgm->update_graph( (*it)->land_consumed(), (*it)->land_unconsumed() );
			}
			//std::cout << std::endl;
		}
		
		template <typename Landmarks_Graph_Manager >
		void   undo_land_graph( Landmarks_Graph_Manager* lgm ){
			lgm->undo_graph( land_consumed(), land_unconsumed() );				
		}
		
		bool           operator==( const Node<State>& o ) const {
			
			if( &(o.state()) != NULL && &(state()) != NULL)
				return (const State&)(o.state()) == (const State&)(state());
			/**
			* Lazy
			*/
			if  ( m_parent == NULL ) {
				if ( o.m_parent == NULL ) return true;
				return false;
			}
		
			if ( o.m_parent == NULL ) return false;
			
			return (m_action == o.m_action) && ( *(m_parent->m_state) == *(o.m_parent->m_state) );
		}
	
		// MRJ: NOTE: return value is the answer to question "is this node worse than o?"
		bool    operator<( const Node<State>& o ) const {
			if ( fn() > o.fn() ) return true;
	
			if ( dequal( fn(), o.fn() ) ) {
				if ( h1n() > o.h1n() ) return true;
				if ( dequal( h1n(), o.h1n() ) ) {
					if ( h2n() > o.h2n() ) return true;
					if ( dequal( h2n(), o.h2n() ) ) {
						if ( gn() < o.gn() ) return true;
					}
				}
			}
			return false;
		}

		size_t                  hash() const { return m_state->hash(); }
	
		void notify_update( ) {
			assert( current != nullptr );
			if ( current )
				current->update( this ); 
		}
	
		void detach() {
			assert( current != nullptr );
			if ( current )
				current->erase( this );
		}
	
	public:
		State*                		m_state;
		Node<State>*        		m_parent;
		float                		m_h1;
		float                		m_h2;
		Action_Idx        		m_action;
		float                		m_g;
		float				m_g_unit;
		float                		m_f;
		Bit_Set                		m_po_1;
		Bit_Set                		m_po_2;
		bool     	           	m_seen;
		typename Open_List::Handle	heap_handle;
		Open_List*			current;

		Bool_Vec_Ptr*   		m_land_consumed;
		Bool_Vec_Ptr*   		m_land_unconsumed;

	};
} //ipc2014

namespace bfs_dq_mh {


	template <typename Search_Model, typename Primary_Heuristic, typename Secondary_Heuristic, typename Open_List_Type >
	class IPC2014_RWA :	public AT_RWBFS_DQ_MH< Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type > {
	public:
		typedef		typename Search_Model::State_Type			State;
		typedef		typename AT_RWBFS_DQ_MH< Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type >::Search_Node Search_Node;
		typedef 	Closed_List< Search_Node >				Closed_List_Type;
		typedef         aptk::agnostic::Landmarks_Graph_Manager<Search_Model>   Landmarks_Graph_Manager;

		typedef		aptk::agnostic::H1_Heuristic< Search_Model, aptk::agnostic::H_Max_Evaluation_Function >	Admissible_Heuristic;

		IPC2014_RWA( 	const Search_Model& search_problem, float W = 5.0f, float decay = 0.75f )
		: AT_RWBFS_DQ_MH< Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type >(search_problem, W, decay ),
		m_lgm( nullptr ), m_adm_h( search_problem ) {
		}

		virtual ~IPC2014_RWA() {
		}
		
		virtual void	start( float B = infty) {
			this->set_bound( B );
			this->set_root( new Search_Node( this->problem().init(), 0.0f, no_op, NULL, this->problem().num_actions() ) );
			assert ( m_lgm != nullptr );			
			this->eval(this->root());
			this->open().insert( this->root() );
			this->open_hash().put( this->root() );
			this->inc_gen();
		}

		virtual void	eval( Search_Node* candidate ) {
			std::vector<Action_Idx>	po;
			if ( !candidate->seen() ) {
				//std::cout << "Eval:" << std::endl;	
	
				this->h1().eval( *(candidate->state()), candidate->h1n(), po );
				for ( unsigned k = 0; k < po.size(); k++ )
					candidate->add_po_1( po[k] );	
				/*
				std::cout << "Primary Helpful:" << std::endl;
				for ( auto index : po ) {
					std::cout << "\t" << this->problem().task().actions()[ index ]->signature() << std::endl;
				}
				*/
				po.clear();
			}

			if(candidate->parent())
				candidate->parent()->update_land_graph( m_lgm );

			if (candidate->action() != no_op)
				m_lgm->apply_action( candidate->state(), candidate->action(), candidate->land_consumed(), candidate->land_unconsumed() );
			else
				m_lgm->apply_state( this->root()->state()->fluent_vec(), this->root()->land_consumed(), this->root()->land_unconsumed() );

			this->h2().eval( *(candidate->state()), candidate->h2n(), po );
			
			for ( unsigned k = 0; k < po.size(); k++ ) 
				candidate->add_po_2( po[k] );	
			/*	
			std::cout << "Secondary Helpful: " << std::endl;
			for ( auto index : po ) {
				std::cout << "\t" << this->problem().task().actions()[ index ]->signature() << std::endl;
			}
			*/
			//candidate->undo_land_graph( m_lgm );
		}

		virtual Search_Node*	 	do_search() {
			std::cout << "RWA* search!" << std::endl;
			Search_Node *head = this->get_node();
			while(head) {
				if ( head->gn() >= this->bound() )  {
					this->inc_pruned_bound();
					this->close(head);
					/*
					if ( this->expanded() > 1000 && this->pruned_by_bound() > this->expanded() ) {
						this->update_weight();
						this->restart_search();
					}
					*/
					head = this->get_node();
					continue;
				}
				/*
				if ( this->bound() < infty ) {
					float h;
					m_adm_h.eval( *(head->state()), h );
					if ( h == infty ) {
						this->close(head);
						head = this->get_node();
						continue;
					}
					if ( head->gn() + h >= this->bound() ) {
						this->inc_pruned_bound();
						this->close(head);
						if ( this->expanded() > 1000 && this->pruned_by_bound() > this->expanded() ) {
							this->update_weight();
							this->restart_search();
						}
						head = this->get_node();
						continue;
					}
				}
				*/
				if(this->problem().goal(*(head->state()))) {
					this->close(head);
					this->set_bound( head->gn() );
					this->update_weight();
					this->restart_search();	
					m_lgm->graph()->print( std::cout );
					return head;
				}
				float t = time_used();
				if ( ( t - this->t0() ) > this->time_budget() ) {
					return nullptr;
				}	
				
				this->eval( head );
				if ( head->h1n() != infty && head->h2n() != infty )
					this->process(head);
				this->close(head);
				head = this->get_node();
			}
			return nullptr;
		}
	

		void    use_land_graph_manager( Landmarks_Graph_Manager* lgm ) { 
			m_lgm = lgm; 
			this->h2().set_graph( m_lgm->graph() );
		}

		bool in_closed( Search_Node* n )  {
			return this->closed().retrieve(n) != nullptr;
		}
	
		bool in_open( Search_Node* n )  {
			return this->open_hash().retrieve(n) != nullptr;
		}
	
		bool in_seen( Search_Node* n )  {
			return this->seen().retrieve(n) != nullptr;
		}

		void	handle_fresh( Search_Node* head, Search_Node* n, int a ) {
			n->h1n() = head->h1n();
			n->h2n() = head->h2n();
			n->fn() = this->weight() * n->h1n() + n->gn();
			this->inc_gen();
			if ( this->generated() % 10000 == 0 ) {
				std::cout << "Generated: " << this->generated() << " B = " << this->bound();
				std::cout << " Expanded: " << this->expanded() << " Pruned: " << this->pruned_by_bound() << " f(n) = ";
				std::cout << head->fn() << " g(n) = " << head->gn();
				std::cout << " h1(n) = " << n->h1n() << " h2(n) = " << n->h2n() << std::endl;
			}

			this->open_node(n, head->is_po_1(a), head->is_po_2(a));
			
		}

		void	handle_seen( Search_Node* head, Search_Node* n, int a ) {
			n->h2n() = head->h2n();
			n->fn() = this->weight() * n->h1n() + n->gn();
			this->open_node(n, head->is_po_1(a), head->is_po_2(a));
			
		}
		virtual void 			process(  Search_Node *head ) {
			if(m_lgm)
				head->update_land_graph( m_lgm );

			std::vector< aptk::Action_Idx >	app_set;
			this->problem().applicable_set_v2( *(head->state()), app_set );
			for ( unsigned i = 0; i < app_set.size(); i++ ) {
				int a = app_set[i];
	
				State *succ = this->problem().next( *(head->state()), a );
				Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), a ), a, head, this->problem().num_actions() );
				bool is_in_closed = in_closed(n);
				bool is_in_open = in_open(n);
				bool is_in_seen = in_seen(n);

				if ( !is_in_closed && !is_in_open && !is_in_seen ) {
					handle_fresh( head, n, a );
					continue;
				}
				
				if ( is_in_seen ) {
					Search_Node* n2 = this->seen().retrieve(n);
					if ( n->gn() < n2->gn() ) {
						n2->gn() = n->gn();
						n2->gn_unit() = n->gn_unit();
						n2->m_parent = n->m_parent;
						n2->m_action = n->action();
					}
					handle_seen( head, n2, a );
					this->seen().erase( this->seen().retrieve_iterator(n2) );
					delete n;
					continue;
				}
				if ( is_in_closed ) {
					Search_Node* n2 = this->closed().retrieve(n);
					if ( n->gn() < n2->gn() ) {
						n2->gn() = n->gn();
						n2->gn_unit() = n->gn_unit();
						n2->m_parent = n->m_parent;
						n2->m_action = n->action();
						n2->set_seen();
						this->closed().erase( this->closed().retrieve_iterator( n2 ) );
						handle_seen( head, n2, a );	
					}
					delete n;
					continue;
				}
				if ( is_in_open ) {
					Search_Node* n2 = this->open_hash().retrieve(n);
					if ( n->gn() < n2->gn() ) {
						n2->gn() = n->gn();
						n2->gn_unit() = n->gn_unit();
						n2->m_parent = n->m_parent;
						n2->m_action = n->action();
						n2->h1n() = head->h1n();
						n2->h2n() = head->h2n();
						n2->fn() = this->weight() * n2->h1n() + n2->gn();
						n2->notify_update();
						this->inc_replaced_open();
					}
					delete n;
					continue;
				}
				assert(false);

			}
			this->inc_eval();
		}

	protected:

		Landmarks_Graph_Manager*                m_lgm;
		Admissible_Heuristic			m_adm_h;
	};

} // bfs_dq_mh

} // search

} // aptk

#endif // at_bfs_sq_sh.hxx
