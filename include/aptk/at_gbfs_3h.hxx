/*
Lightweight Automated Planning Toolkit
Copyright (C) 2013
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

#ifndef __ANYTIME_SINGLE_QUEUE_TRIPLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH__
#define __ANYTIME_SINGLE_QUEUE_TRIPLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <landmark_graph_manager.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <aptk/hash_table.hxx>

namespace aptk {

namespace search {

namespace gbfs_3h{


template <typename Search_Model, typename State>
class Node {
public:
	
	typedef aptk::agnostic::Landmarks_Graph_Manager<Search_Model>   Landmarks_Graph_Manager;


	typedef State                            State_Type;
	typedef Node<Search_Model,State>*        Node_Ptr;
	typedef typename std::vector< Node<Search_Model,State>* >                      Node_Vec_Ptr;
	typedef typename std::vector< Node<Search_Model,State>* >::reverse_iterator    Node_Vec_Ptr_Rit;
	typedef typename std::vector< Node<Search_Model,State>* >::iterator            Node_Vec_Ptr_It;

	Node( State* s, float cost, Action_Idx action, Node<Search_Model,State>* parent, int num_actions ) 
	  : m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ), m_g_unit( 0 ), m_f(0), m_h1(0), m_h2(0), m_h3(0), m_partition(0), m_po( num_actions ), m_seen(false), m_helpful(false), m_land_consumed(NULL), m_land_unconsumed(NULL) {
		m_g = ( parent ? parent->m_g + cost : 0.0f);
		m_g_unit = ( parent ? parent->m_g_unit + 1.0f : 0.0f);
	}
	
	virtual ~Node() {
		if ( m_state != NULL ) delete m_state;
	}

	unsigned&		h1n()				{ return m_h1; }
	unsigned		h1n() const 			{ return m_h1; }
	unsigned&		h2n()				{ return m_h2; }
	unsigned		h2n() const 			{ return m_h2; }
	unsigned&		h3n()				{ return m_h3; }
	unsigned		h3n() const 			{ return m_h3; }
	unsigned&      		partition()    	  { return m_partition; }			
	unsigned       		partition() const { return m_partition; }
	unsigned                goals_unachieved() const        { return m_goals_unachieved; }                
	unsigned&               goals_unachieved()              { return m_goals_unachieved; }                
	float&			gn()				{ return m_g; }			
	float			gn() const 			{ return m_g; }
	float&			gn_unit()			{ return m_g_unit; }			
	float			gn_unit() const 		{ return m_g_unit; }
	float&			fn()				{ return m_f; }
	float			fn() const			{ return m_f; }
	Node_Ptr		parent()   			{ return m_parent; }
	const Node_Ptr		parent() const 			{ return m_parent; }
	Action_Idx		action() const 			{ return m_action; }
	State*			state()				{ return m_state; }
        void			set_state( State* s )  		{ m_state = s; }
	bool			has_state() const		{ return m_state != NULL; }
	const State&		state() const 			{ return *m_state; }
	void			add_po( Action_Idx index )	{ m_po.set( index ); }
	void			remove_po( Action_Idx index ) { m_po.unset( index ); }
	bool			is_po(Action_Idx index) const	{ return m_po.isset( index ); }
	void			set_seen( )			{ m_seen = true; }
	bool			seen() const			{ return m_seen; }
	void			set_helpful( )			{ m_helpful = true; }
	bool                    is_helpful()                    { return m_helpful; }
	Bool_Vec_Ptr*&           land_consumed()                 { return m_land_consumed; }
	Bool_Vec_Ptr*&           land_unconsumed()                 { return m_land_unconsumed; }


        bool                  is_better( Node* n ) const{
	        bool ret = false;
		
		float n1 = this->h3n() + this->gn();
		float n2 = n->h3n() + n->gn();
                ret =  n1 < n2;
                if(ret) return ret;

                if(n1 == n2){
                        ret =  this->h3n() < n->h3n();
                        if(ret) return ret;

                        if(this->h3n() == n->h3n()){
                                ret =  this->gn() < n->gn();
                        }

                }

                return ret;
		
	}
  
        void                    update_land_graph(Landmarks_Graph_Manager* lgm){
		Node_Vec_Ptr path( gn_unit()+1 );
		Node_Vec_Ptr_Rit rit = path.rbegin();
		Node_Ptr n = this;

		do{
			*rit = n;
			rit++;
			n = n->parent();
		}while( n );
		if(rit != path.rend())
			*rit = NULL;
		//std::cout << "Updating Land Graph up to: " << std::flush;
		
		lgm->reset_graph();
		for( Node_Vec_Ptr_It it = path.begin(); it != path.end(); it++){

			if(*it == NULL) break;
			lgm->update_graph( (*it)->land_consumed(), (*it)->land_unconsumed() );
			//	if( (*it)->action() != -1 && lgm->graph()->node(150)->is_consumed())
			//	std::cout << lgm->problem().actions()[ (*it)->action() ]->signature() << std::flush;

		}
		//std::cout << std::endl;
		//std::cout << std::endl;
	}
	
	void                    undo_land_graph( Landmarks_Graph_Manager* lgm ){
		lgm->undo_graph( land_consumed(), land_unconsumed() );				
	}
	
	void			print( std::ostream& os ) const {
		os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = ";
		os << m_g << ", h1(n) = " << m_h1 << ", h2(n) = " << m_h2 << ", h3(n) = " << m_h3 << ", f(n) = " << m_f << "}";
	}

	bool   	operator==( const Node<Search_Model,State>& o ) const {
		
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

	size_t      hash() const { return m_state ? m_state->hash() : m_hash; }

	void        update_hash() {
		Hash_Key hasher;
		hasher.add( m_action );
		if ( m_parent != NULL )
			hasher.add( m_parent->state()->fluent_vec() );
		m_hash = (size_t)hasher;
	}

public:

	State*		m_state;
	Node_Ptr	m_parent;
	Action_Idx	m_action;
	float		m_g;
	float		m_g_unit;
	float		m_f;
	unsigned	m_h1;
	unsigned	m_h2;
	unsigned	m_h3;
        unsigned        m_partition;
	unsigned        m_goals_unachieved;
	Bit_Set		m_po;
	bool		m_seen;
	bool		m_helpful;
	size_t		m_hash;
	Bool_Vec_Ptr*   m_land_consumed;
	Bool_Vec_Ptr*   m_land_unconsumed;
};



template <typename Search_Model, typename First_Heuristic, typename Second_Heuristic, typename Third_Heuristic, typename Open_List_Type >
class AT_GBFS_3H {

public:

	typedef	        typename Search_Model::State_Type		        State;
	typedef  	typename Open_List_Type::Node_Type		        Search_Node;
	typedef 	Closed_List< Search_Node >			        Closed_List_Type;
	typedef         aptk::agnostic::Landmarks_Graph_Manager<Search_Model>   Landmarks_Graph_Manager;

	AT_GBFS_3H( 	const Search_Model& search_problem ) 
	: m_problem( search_problem ), m_exp_count(0), m_gen_count(0), m_pruned_B_count(0),
	  m_dead_end_count(0), m_open_repl_count(0),m_B( infty ), m_time_budget(infty), m_lgm(NULL), m_max_h2n(no_such_index), m_max_h3n(no_such_index), m_verbose( true ) {	
		m_first_h = new First_Heuristic( search_problem );
		m_second_h = new Second_Heuristic( search_problem );
		m_third_h = new Third_Heuristic( search_problem );
		m_third_h->ignore_rp_h_value(true);
	}

	virtual ~AT_GBFS_3H() {
		for ( typename Closed_List_Type::iterator i = m_closed.begin();
			i != m_closed.end(); i++ ) {
			delete i->second;
		}
		while	(!m_open.empty() ) 
		{	
			Search_Node* n = m_open.pop();
			delete n;
		}
		m_closed.clear();

		delete m_first_h;
		delete m_second_h;
		delete m_third_h;
	}

	void	start( float B = infty) {
		m_B = B;
		m_root = new Search_Node( m_problem.init(), 0.0f, no_op, NULL, m_problem.num_actions() );	

		m_first_h->init();		
		
		if(m_lgm){				
			eval_po(m_root);		
			m_lgm->apply_state( m_root->state()->fluent_vec(), m_root->land_consumed(), m_root->land_unconsumed() );
			eval(m_root);
			m_root->undo_land_graph( m_lgm );
		}
		else{		
			eval_po(m_root);	
			eval(m_root);
		}
		
		

		#ifdef DEBUG
		if ( m_verbose ) {
			std::cout << "Initial search node: ";
			m_root->print(std::cout);
			std::cout << std::endl;
			m_root->state()->print( std::cout );
			std::cout << std::endl;
		}
		#endif 
		m_open.insert( m_root );

		inc_gen();
	}

	void	set_arity( float v, unsigned g ){ m_first_h->set_arity( v, g ); }

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		m_t0 = time_used();
		Search_Node* end = do_search();
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );	
		
		return true;
	}

	float			bound() const			{ return m_B; }
	void			set_bound( float v ) 		{ m_B = v; }

	void			inc_gen()			{ m_gen_count++; }
	unsigned		generated() const		{ return m_gen_count; }
	void			inc_eval()			{ m_exp_count++; }
	unsigned		expanded() const		{ return m_exp_count; }
	void			inc_pruned_bound() 		{ m_pruned_B_count++; }
	unsigned		pruned_by_bound() const		{ return m_pruned_B_count; }
	void			inc_dead_end()			{ m_dead_end_count++; }
	unsigned		dead_ends() const		{ return m_dead_end_count; }
	void			inc_replaced_open()		{ m_open_repl_count++; }
	unsigned		open_repl() const		{ return m_open_repl_count; }

	void			set_budget( float v ) 		{ m_time_budget = v; }
	float			time_budget() const		{ return m_time_budget; }

	float			t0() const			{ return m_t0; }

	void 			close( Search_Node* n ) 	{  m_closed.put(n); }
	Closed_List_Type&	closed() 			{ return m_closed; }

	const	Search_Model&	problem() const			{ return m_problem; }

	First_Heuristic&	h1()				{ return *m_first_h; }
	Second_Heuristic&	h2()				{ return *m_second_h; }
	Third_Heuristic&	h3()				{ return *m_third_h; }
	
	void			set_verbose( bool v ) 		{ m_verbose = v; }

	void                    use_land_graph_manager( Landmarks_Graph_Manager* lgm ) { 
		m_lgm = lgm; 
		m_second_h->set_graph( m_lgm->graph() );
	}
	
	void			eval( Search_Node* candidate ) {

		
		if(m_lgm){

			if(candidate->parent())
				candidate->parent()->update_land_graph( m_lgm );

			if (candidate->action() != no_op){
				const bool has_cond_eff = !(m_problem.task().actions()[ candidate->action() ]->ceff_vec().empty());
				if( !candidate->has_state() && has_cond_eff ){
					candidate->parent()->state()->progress_lazy_state(  m_problem.task().actions()[ candidate->action() ] );	

					m_lgm->apply_action( candidate->parent()->state(), candidate->action(), candidate->land_consumed(), candidate->land_unconsumed() );

					candidate->parent()->state()->regress_lazy_state( m_problem.task().actions()[ candidate->action() ] );
		
				}else{
					
					m_lgm->apply_action( candidate->state(), candidate->action(), candidate->land_consumed(), candidate->land_unconsumed() );
				}
			}
			else
				m_lgm->apply_state( m_root->state()->fluent_vec(), m_root->land_consumed(), m_root->land_unconsumed() );
		}

		m_second_h->eval( *(candidate->state()), candidate->h2n() );	


		// if(m_lgm)
		// 	candidate->undo_land_graph( m_lgm );


		candidate->goals_unachieved() =  candidate->h2n();
		candidate->partition() = candidate->goals_unachieved();
		if ( candidate->goals_unachieved() == 0){
			candidate->h1n()  = 1;
		}
		else{
			candidate->goals_unachieved()--;
			candidate->partition()--;
			m_first_h->eval( candidate, candidate->h1n() );
		}

		if(candidate->h2n() < m_max_h2n ){
			m_max_h2n = candidate->h2n();
			if ( m_verbose ) {
				std::cout << "--[" << m_max_h2n  <<" / " << m_max_h3n <<"]--" << std::endl;
				//std::cout << "[ n:" << candidate->h1n()  <<" - hl:" << candidate->h2n() <<" - #g:" << candidate->goals_unachieved() <<" - h_a:" << candidate->h3n() <<" - gn: " << candidate->gn()  <<"]" << std::endl;
			}
		}

	}

	void			eval_po( Search_Node* candidate ) {
		std::vector<Action_Idx>	po;
		m_third_h->eval( *(candidate->state()), candidate->h3n(), po  );
		if(candidate->h3n() < m_max_h3n ){
			m_max_h3n = candidate->h3n();
			if ( m_verbose ) 
				std::cout << "--[" << m_max_h2n  <<" / " << m_max_h3n <<"]--" << std::endl;			
			
		}

		if(po.size()){
			for ( unsigned k = 0; k < po.size(); k++ )
				candidate->add_po( po[k] );
		}

	}

	bool 		is_closed( Search_Node* n ) 	{ 
		Search_Node* n2 = this->closed().retrieve(n);

		if ( n2 != NULL ) {
			if ( n2->gn() <= n->gn() ) {
				// The node we generated is a worse path than
				// the one we already found
				return true;
			}
			// Otherwise, we put it into Open and remove
			// n2 from closed
			this->closed().erase( this->closed().retrieve_iterator( n2 ) );
		}
		return false;
	}

	Search_Node* 		get_node() {
		Search_Node *next = NULL;
		if(! m_open.empty() ) {
			next = m_open.pop();
		}
		return next;
	}

	void	 	open_node( Search_Node *n ) {
		m_open.insert(n);
		inc_gen();

		// if( generated() % 1000 == 0){
		// 	std::cout << "\nGenerated " << generated() << std::endl;
		// }
	}
	/**
	 * Succ Generator Process
	 */
	virtual void 			process(  Search_Node *head ) {

		
#ifdef DEBUG
		if ( m_verbose ) {
			std::cout << "Expanding:" << std::endl;
			head->print(std::cout);
			std::cout << std::endl;
			head->state()->print( std::cout );
			std::cout << std::endl;
		}
#endif
		//static unsigned ha=0;
		//static unsigned nonha=0;
		
		//		std::cout << "ha: "<< ha << "nonha: "<< nonha << std::endl; 

		if(m_lgm)
			head->update_land_graph( m_lgm );
		
		std::vector< aptk::Action_Idx > app_set;
		this->problem().applicable_set_v2( *(head->state()), app_set );

			
		for (unsigned i = 0; i < app_set.size(); ++i ) {
			int a = app_set[i];

			bool is_helpful = head->is_po(a); 

			State *succ = is_helpful ? m_problem.next( *(head->state()), a ) : nullptr; 
						
			Search_Node* n = new Search_Node( succ, m_problem.cost( *(head->state()), a ), a, head, m_problem.num_actions()  );			
			
			#ifdef DEBUG
			if ( m_verbose ) {
				std::cout << "Successor:" << std::endl;
				n->print(std::cout);
				std::cout << std::endl;
				if(n->has_state())
				n->state()->print( std::cout );
				std::cout << std::endl;
			}
			#endif
				
			if( is_helpful ){

				n->set_helpful();
				eval_po(n);				
				if( n->h3n() == no_such_index ){
#ifdef DEBUG
					if ( m_verbose ) {
						std::cout << "h_add is infinite" << std::endl;
					}
#endif
					inc_dead_end();					
					delete n;
					continue;
				}
					
				eval( n );
				n->h1n() = (2 * ( n->h1n() - 1 ) ) + 1;
				//ha++;
				//std::cout << "HA " << m_problem.task().actions()[ n->action() ]->signature() << ": " << "[ n:" << n->h1n()  <<" - hl:" << n->h2n() <<" - #g:" << n->goals_unachieved() <<" - h_a:" << n->h3n() <<" - gn: " << n->gn()  <<" - gn-unit: " << n->gn_unit()   <<"]" << std::endl;
			}
			else{
				n->h3n() = head->h3n();
				eval( n );
				n->h1n() = (2 * ( n->h1n() - 1 ) ) + 2;
				//nonha++;
				//std::cout << "Non-HA" << m_problem.task().actions()[ n->action() ]->signature() << ": " << "[ n:" << n->h1n()  <<" - hl:" << n->h2n() <<" - #g:" << n->goals_unachieved() <<" - h_a:" << n->h3n() <<" - gn: " << n->gn()  <<" - gn-unit: " << n->gn_unit()  <<"]" << std::endl;			
			}

						       
#ifdef DEBUG
			if ( m_verbose )
				std::cout << "Inserted into OPEN" << std::endl;
#endif
			open_node(n);	
				

		} 
		inc_eval();
	}

	virtual Search_Node*	 	do_search() {
		Search_Node *head = get_node();
		int counter =0;
		while(head) {
			if ( head->gn() >= bound() )  {
				inc_pruned_bound();
				close(head);
				head = get_node();
				continue;
			}
			if( ! head->has_state() )
			  head->set_state( m_problem.next(*(head->parent()->state()), head->action()) );

			if(m_problem.goal(*(head->state()))) {
				close(head);
				set_bound( head->gn() );	
				return head;
			}
			if ( (time_used() - m_t0 ) > m_time_budget )
				return NULL;
			// MRJ: What if we don't compute h_add and keep using the parent's h_add value for non-helpful 

			if ( is_closed( head ) ) {
				#ifdef DEBUG
				if ( m_verbose )
					std::cout << "Already in CLOSED" << std::endl;
				#endif
				delete head;
				head = get_node();
				continue;
			}
			// nodes?
			if( !head->is_helpful() ){
				eval_po( head );
				if( head->h3n() == no_such_index ){
					close(head);
					head = get_node();
					continue;
				}
			}
			process(head);
			close(head);
			counter++;
			head = get_node();
		}
		return NULL;
	}


protected:

	void	extract_plan( Search_Node* s, Search_Node* t, std::vector<Action_Idx>& plan, float& cost ) {
		Search_Node *tmp = t;
		cost = 0.0f;
		while( tmp != s) {
			cost += m_problem.cost( *(tmp->state()), tmp->action() );
			plan.push_back(tmp->action());
			tmp = tmp->parent();
		}
		
		std::reverse(plan.begin(), plan.end());		
	}

	void	extract_path( Search_Node* s, Search_Node* t, std::vector<Search_Node*>& plan ) {
		Search_Node* tmp = t;
		while( tmp != s) {
			plan.push_back(tmp);
			tmp = tmp->parent();
		}
		
		std::reverse(plan.begin(), plan.end());				
	}
	
protected:

	const Search_Model&			m_problem;
	First_Heuristic*			m_first_h;
	Second_Heuristic*			m_second_h;
	Third_Heuristic*			m_third_h;
	Open_List_Type				m_open;
	Closed_List_Type			m_closed;
	unsigned				m_exp_count;
	unsigned				m_gen_count;
	unsigned				m_pruned_B_count;
	unsigned				m_dead_end_count;
	unsigned				m_open_repl_count;
	float					m_B;
	float					m_time_budget;
	float					m_t0;
	Search_Node*				m_root;
	std::vector<Action_Idx> 		m_app_set;
	Landmarks_Graph_Manager*                m_lgm;
	unsigned                                m_max_h2n;
	unsigned                                m_max_h3n;
	bool					m_verbose;
};

}

}

}

#endif // at_gbfs_3h.hxx
