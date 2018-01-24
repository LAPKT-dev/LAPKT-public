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

#include <py_strips_prob.hxx>
#include <aptk/at_rwbfs_dq_mh.hxx>
#include <landmark_graph_manager.hxx>
#include <aptk/closed_list.hxx>
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
#ifdef DEBUG
            if(hash() == 3068159468){
                std::cout << "create 3068159468 " << this << " " << this->state() << std::endl;
            }
#endif
		}

		virtual ~Node() {
                   if ( m_state != NULL )
                       delete m_state;
                   else{
                       assert(false);
                   }
                   m_state = nullptr;
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
        Node<State>*                parent()  const                    { return m_parent; }
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
            if ( h1n() > o.h1n() )
                return true;
			if ( dequal( h1n(), o.h1n() ) ) {
				if ( fn()  > o.fn() ) return true;
				if ( dequal( fn(), o.fn() ) ) {
					if ( h2n() > o.h2n() ) return true;
					if ( dequal( h2n(), o.h2n() ) ) {
						if ( metric() > o.metric() ) return true;
						if ( gn() > o.gn() ) return true;
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

        static bool less(const Node & lhs, const Node & rhs) {
            assert(lhs.has_state());
            assert(rhs.has_state());
            return State::less(lhs.state(), rhs.state());
        }
        bool has_state() const {
            return this->m_state != nullptr;
        }
        float           metric() const { return m_metric; }
        void          set_metric(float value) { m_metric = value; }

	public:
        float       m_metric;
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
    class IPC2014_RWA : public Solver,	public AT_RWBFS_DQ_MH< Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type, ClosedSet<typename Open_List_Type::Node_Type > > { //
	public:
		typedef		typename Search_Model::State_Type			State;
        typedef		typename AT_RWBFS_DQ_MH< Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type, ClosedSet<typename Open_List_Type::Node_Type > >::Search_Node Search_Node;
        typedef 	ClosedSet< Search_Node >				Closed_List_Type;
		typedef         aptk::agnostic::Landmarks_Graph_Manager<Search_Model>   Landmarks_Graph_Manager;

		typedef		aptk::agnostic::H1_Heuristic< Search_Model, aptk::agnostic::H_Max_Evaluation_Function >	Admissible_Heuristic;

        IPC2014_RWA(const Search_Model& search_problem, float W = 5.0f, float decay = 0.75f )
            : AT_RWBFS_DQ_MH< Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type, ClosedSet <typename Open_List_Type::Node_Type > > (search_problem, W, decay), //
            m_metric_bound(0), do_best_support_search(true), m_lgm( nullptr ), m_adm_h( search_problem )
        {}

		virtual ~IPC2014_RWA() {}

        void set_metric_bound(float val){
            m_metric_bound = val;
        }

        float metric_bound() const {
            return m_metric_bound;
        }

		virtual void	start( float B = infty) {
			this->set_bound( B );
            this->set_metric_bound(B);
			this->set_root( new Search_Node( this->problem().init(), 0.0f, no_op, NULL, this->problem().num_actions() ) );
			assert ( m_lgm != nullptr );
			this->eval(this->root());
			this->open().insert( this->root() );
            this->m_open_set.put( this->root() );
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

        // additional heuristic
        // 1) plan_lenght - num_actions from initial relevant actions,
        // 2) try to find plan with only best supporters

        /*
         *  Search_node * do_search(int){
         *     // extract best supporters
         *     // search forward using only best supporters
         *
         *  }
         */
		bool	find_solution( float & metric, float& cost, std::vector<Action_Idx>& plan ) {
			this->m_t0 = time_used();
            Search_Node *end = nullptr;
            if (this->do_best_support_search){
                end = this->best_support_search();
                this->do_best_support_search = false;
            }
            if (end != nullptr){
                return handle_search_results(end, cost, metric, plan);
            } else {
                this->restart_search();
                end = do_search();
                return handle_search_results(end, cost, metric, plan);
            }
		}

        Search_Node * best_support_search(){
            Search_Node* head = this->get_node();
            this->h1().eval(*(head->state()), head->h1n());
            std::set<Action_Idx> best_set = this->h1().get_best_supporters();
            this->restart_search();
            Search_Node* end = do_search(&best_set);
            return end;
        }

        bool handle_search_results(Search_Node* end, float& cost, float & metric, std::vector<Action_Idx>& plan ){
            if ( end == NULL ) return false;
            this->extract_plan( this->m_root, end, plan, cost );
            float t2 = time_used();
            this->m_time_budget -= ( t2 - this->m_t0);
            metric = end->metric();
            return true;
        }

        virtual Search_Node*	 	do_search(std::set< aptk::Action_Idx > * actions=nullptr) {
			std::cout << "RWA* search!" << std::endl;
            if (this->prev_weight() == this->weight()){
                std::cout << " W is same, stopping search: " << this->weight() << std::endl;
                return nullptr;
            }
			Search_Node *head = this->get_node();
			while(head) {
#ifdef DEBUG
				std::cout << "processing: ";

				head->state()->print(std::cout);
#endif
                assert(head->has_state());
                if (head->gn() > this->bound() || ( head->gn() == this->bound() &&
                        head->metric() >= this->metric_bound() ) )  {
					this->inc_pruned_bound();
					this->close(head);
					head = this->get_node();
					continue;
				}
				if(this->problem().goal(*(head->state()))) {
					this->close(head);
					this->set_bound( head->gn() );
                    this->set_metric_bound(head->metric());
                    std::cout << "Goal metric: " << this->metric_bound() << std::endl;
					this->update_weight();
					this->restart_search();
					m_lgm->graph()->print( std::cout );
					return head;
				}
                if (this->open_set().size() % 100 == 0 || this->open_set().size() < 10)
                    std::cout << "Open left: " << this->open_set().size() << std::endl;


				float t = time_used();
				if ( ( t - this->t0() ) > this->time_budget() ) {
					return nullptr;
				}

				//this->eval( head );
#ifdef	DEBUG
				std::cout << "fn " << head->fn() << std::endl;
				std::cout << "h1 " << head->h1n() << std::endl;
#endif
                if ( head->h1n() != infty && head->h2n() != infty ){
                    this->process(head, actions);
                }
                if (!this->in_closed(head))
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
            return this->closed().has_element(n);
		}

		bool in_open( Search_Node* n )  {
            return this->m_open_set.has_element(n);
		}

		bool in_seen( Search_Node* n )  {
            return this->seen().has_element(n);
		}

		void	handle_fresh( Search_Node* head, Search_Node* n, int a ) {
			this->eval(n);
#ifdef DEBUG
            std::cout << "fresh:" << n->hash() << "  h1: " << n->h1n() << std::endl;
#endif
			if(n->h1n() == infty ) {
    #ifdef DEBUG
        std::cout << "closing, cost inf" << std::endl;
        this->eval(n);
    #endif
            }
			//n->h1n() = head->h1n();
			//n->h2n() = head->h2n();
			n->fn() = this->weight() * n->h1n() + n->gn();
			this->inc_gen();
			if ( this->generated() % 10000 == 0 ) {
				std::cout << "Generated: " << this->generated() << " B = " << this->bound();
                std::cout << " Expanded: " << this->expanded() << " Pruned: " << this->pruned_by_bound() << " f(n) = " << head->fn() << std::endl;
                std::cout << "Open left: " << this->open_set().size() << std::endl;
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

        /*
         * finds all states from head
         *
         * head - search state
         * actions - if provided use only these actions when searching
         * for new state
         */
        virtual void 			process(  Search_Node *head, std::set< aptk::Action_Idx > * actions=nullptr) {
			if(m_lgm)
				head->update_land_graph( m_lgm );

            std::vector< aptk::Action_Idx >	app_set;
            app_set.reserve(200);
            this->problem().applicable_set_v2( *(head->state()), app_set );
			for ( unsigned i = 0; i < app_set.size(); i++ ) {

				int a = app_set[i];
                if (actions != nullptr ){
                    bool is_in = actions->find(a) != actions->end();
                    if (! is_in)
                        continue;
                }
				State *succ = this->problem().next( *(head->state()), a );

                if(head->hash() == succ->hash()){
                    std::cout << "Same hash as in parent node" << head->hash() << std::endl;
                    std::cout << "Action that does it " << a << " " << std::endl;
                    if(!(State::less(*(head->state()), *succ) || State::less(*succ, *(head->state())))){
                        // same, not just a collistion
                        delete succ;
                        continue;
                    }
                }



                Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), a ), a, head, this->problem().num_actions() );
                n->set_metric( this->problem().metric(*n, a));

#ifdef DEBUG

                if(this->m_open_set.has_element(n) && !in_open(n)){
                    std::cout << "Error" << std::endl;
                }
                assert(n->has_state());
#endif
                if (this->bound() <= n->gn()){
                    this->inc_pruned_bound();
                    #ifdef DEBUG
                        std::cout << "Delete by bound" << std::endl;
                    #endif
                    delete n;
                    continue;
                }

                bool is_in_closed = in_closed(n);
				bool is_in_open = in_open(n);
				bool is_in_seen = in_seen(n);

				if ( !is_in_closed && !is_in_open && !is_in_seen ) {
                    handle_fresh( head, n, a );
				}
                else if ( is_in_open ) {
                    Search_Node* n2 = this->open_set().retrieve(n);
#ifdef DEBUG
    std::cout << "already in open, reweight" << std::endl;
#endif
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
                }
                else if ( is_in_seen ) {
#ifdef DEBUG
    std::cout << "already in seen, reweight" << std::endl;
#endif
					Search_Node* n2 = this->seen().retrieve(n);
					if ( n->gn() < n2->gn() ) {
						n2->gn() = n->gn();
						n2->gn_unit() = n->gn_unit();
						n2->m_parent = n->m_parent;
						n2->m_action = n->action();
					}
                    if (is_in_closed){
#ifdef DEBUG
                        std::cout << "both in seen and in closed, erasing from closed" << n->hash() << " " << n << " " << n->state() << std::endl;
#endif
                        this->closed().erase(n);
                    }

					handle_seen( head, n2, a );
					this->seen().erase( this->seen().retrieve_iterator(n2) );
					delete n;
				}
                else if ( is_in_closed ) {
					Search_Node* n2 = this->closed().retrieve(n);
#ifdef DEBUG
					std::cout << "closed!" << std::endl;
#endif
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
				}
                else {
                    std::cout << "Unhandled " << std::endl;
                    exit(2);
                    assert(false);
                }
			}
			this->inc_eval();
            return ;
		}


        virtual void solve(){}


	protected:
        float                          m_metric_bound;
        bool                    do_best_support_search;

        Landmarks_Graph_Manager*          m_lgm;
		Admissible_Heuristic			m_adm_h;
	};

    class IPC2014_RWA_Factory: public SolverFactory {
    public:
        virtual Solver * build( aptk::STRIPS_Problem *) const;
    };

} // bfs_dq_mh

} // search

} // aptk

#endif // at_bfs_sq_sh.hxx
