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

#ifndef __REL_PLAN_ITERATIVE_WIDTH__
#define __REL_PLAN_ITERATIVE_WIDTH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <aptk/hash_table.hxx>
#include <aptk/node_novelty_spaces.hxx>

#include <queue>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace novelty_spaces {

template < typename Search_Model, typename Abstract_Novelty, typename RP_Heuristic >
class RP_IW  {

public:

	typedef		typename Search_Model::State_Type		State;
	typedef  	Node< State >					Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	RP_IW( 	const Search_Model& search_problem ) 
		: m_problem( search_problem ), m_exp_count(0), m_gen_count(0), m_cl_count(0), m_max_depth(0), m_pruned_B_count(0), m_B( infty ), m_use_relplan(true), m_goals(NULL), m_verbose(true), m_init_pruned(false) {
		m_novelty = new Abstract_Novelty( search_problem );
		m_novelty->set_full_state_computation( false );
		m_rp_h = new RP_Heuristic( search_problem );
		m_rp_h->ignore_rp_h_value(true);
		m_rp_fl_set.resize( this->problem().task().num_fluents() );

	}

	bool	init_pruned( ) { return m_init_pruned; }
	bool	verbose( ) const { return m_verbose; }
	void 	set_verbose( bool v ) { m_verbose = v; }
	
	virtual ~RP_IW() {
		for ( typename Closed_List_Type::iterator i = m_closed.begin();
			i != m_closed.end(); i++ ) {
			delete i->second;
		}
		
		while	(!m_open.empty() ) 
		{	
			Search_Node* n = m_open.front();
			m_open.pop();
			delete n;
		}
		
		m_closed.clear();
		m_open_hash.clear();

		delete m_novelty;
		delete m_rp_h;
	}
	
	void reset() {
		for ( typename Closed_List_Type::iterator i = m_closed.begin();
			i != m_closed.end(); i++ ) {
			delete i->second;
		}
		
		while	(!m_open.empty() ) 
		{	
			Search_Node* n = m_open.front();
			m_open.pop();
			delete n;
		}
		
		m_closed.clear();
		m_open_hash.clear();
		m_rp_fl_vec.clear();
		m_rp_fl_set.reset();
		
		m_exp_count = 0;
		m_gen_count = 0;
		m_cl_count = 0;
		m_pruned_B_count = 0;
		m_max_depth=0;       			
	}

	void    set_goals( Fluent_Vec* g ){ m_goals = g; }

        void    set_relplan( State* s ){
      		std::vector<Action_Idx>	po;
      		std::vector<Action_Idx>	rel_plan;
		float h_value;
		if(m_goals)
			m_rp_h->eval( *s, h_value, po, rel_plan, m_goals );
		else
			m_rp_h->eval( *s, h_value, po, rel_plan  );
 		
		/*for ( unsigned p = 0; p < this->problem().task().num_fluents(); p++ ) {
			if (!m_rp_h->is_relaxed_plan_relevant(p)) continue;
			m_rp_fl_vec.push_back( p );
			m_rp_fl_set.set( p );
		}
		*/
		std::cout << "rel_plan size: "<< rel_plan.size() << std::endl;
		
		for(std::vector<Action_Idx>::iterator it_a = rel_plan.begin(); 
		    it_a != rel_plan.end(); it_a++ ){
			const Action* a = this->problem().task().actions()[*it_a];

			//Add Conditional Effects
			if( !a->ceff_vec().empty() ){		
				for( unsigned i = 0; i < a->ceff_vec().size(); i++ ){
					Conditional_Effect* ce = a->ceff_vec()[i];
					for ( auto p : ce->add_vec() ) {
						if ( ! m_rp_fl_set.isset( p ) ){
							m_rp_fl_vec.push_back( p );
							m_rp_fl_set.set( p );
							//std::cout << this->problem().task().fluents()[add[i]]->signature() << std::endl;
						}
					}
				}
			}

			const Fluent_Vec& add = a->add_vec();

			//std::cout << this->problem().task().actions()[*it_a]->signature() << std::endl;
			for ( unsigned i = 0; i < add.size(); i++ )
			{
				if ( ! m_rp_fl_set.isset( add[i] ) )
				{
					m_rp_fl_vec.push_back( add[i] );
					m_rp_fl_set.set( add[i] );
					//std::cout << this->problem().task().fluents()[add[i]]->signature() << std::endl;
				}
			}		       
		}
		
		// if( m_rp_fl_vec.size() == this->problem().task().num_fluents() ){
		// 	m_rp_fl_vec.clear();
		// 	m_rp_fl_set.reset();
		// }
		
		// for(unsigned i = 0; i < this->problem().task().num_fluents(); i++){
		// 	if( !m_rp_fl_set.isset(i) )
		// 		std::cout << "not in RP: "<< this->problem().task().fluents()[i]->signature() << std::endl;
		// }
		
	}
	  
	void    set_use_relplan( bool b ) { m_use_relplan = b; }
	bool    use_relplan(  ) { return m_use_relplan; }
	  
	void	start(State*s = NULL) {


		if(!s)
			this->m_root = new Search_Node( this->problem().init(), no_op, NULL );	
		else
			this->m_root = new Search_Node( s, no_op, NULL );

		m_pruned_B_count = 0;
		reset();
		m_novelty->init();
		
		if( use_relplan() )
			set_relplan( this->m_root->state() );

		m_novelty->set_arity( m_B, m_rp_fl_vec.size() );
		std::cout << "#RP_fluents "<< m_rp_fl_vec.size() << std::flush;
		
		if ( prune( this->m_root ) )  {
			std::cout<<"Initial State pruned! No Solution found."<<std::endl;
			m_init_pruned = true;
			return;
		}
	
#ifdef DEBUG
		std::cout << "Initial search node: ";
		this->m_root->print(std::cout);
		std::cout << std::endl;
#endif 
		this->m_open.push( this->m_root );
		this->m_open_hash.put( this->m_root );
		this->inc_gen();
	}
	
	virtual bool    is_goal( Search_Node* n  ){ 
		if( n->has_state() )
			return m_problem.goal( *(n->state()) ); 
		else{			
			n->parent()->state()->progress_lazy_state(  m_problem.task().actions()[ n->action() ] );	
			const bool is_goal = m_problem.goal( *( n->state() ) ); 
			n->parent()->state()->regress_lazy_state( m_problem.task().actions()[ n->action() ] );
			return is_goal;
		}
			
	}


	virtual bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		Search_Node* end = do_search();
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );	
		
		return true;
	}

	float			arity() 	                { return m_novelty->arity( ); }	
	float			bound() const			{ return m_B; }
	void			set_bound( float v ) 		{ 
		m_B = v;
		m_novelty->set_arity( m_B,1 );
	}

	void			inc_pruned_bound() 		{ m_pruned_B_count++; }
	unsigned		pruned_by_bound() const		{ return m_pruned_B_count; }
	void			inc_gen()			{ m_gen_count++; }
	unsigned		generated() const		{ return m_gen_count; }
	void			inc_exp()			{ m_exp_count++; }
	unsigned		expanded() const		{ return m_exp_count; }

	void			inc_closed()			{ m_cl_count++; }
	unsigned		pruned_closed() const		{ return m_cl_count; }

	void 			close( Search_Node* n ) 	{  m_closed.put(n); }
	Closed_List_Type&	closed() 			{ return m_closed; }
	Closed_List_Type&	open_hash() 			{ return m_open_hash; }

	const	Search_Model&	problem() const			{ return m_problem; }

	bool 		is_closed( Search_Node* n ) 	{ 
		Search_Node* n2 = this->closed().retrieve(n);
		if ( n2 != NULL ) 
			return true;
		
		return false;
	}
	
	bool          search_exhausted(){ return m_open.empty(); }

	Search_Node* 		get_node() {
		Search_Node *next = NULL;
		if(! m_open.empty() ) {
			next = m_open.front();
			m_open.pop();
			m_open_hash.erase( m_open_hash.retrieve_iterator( next) );
		}
		return next;
	}

	void	 	open_node( Search_Node *n ) {		
		m_open.push(n);
		m_open_hash.put(n);
		inc_gen();
		if(n->gn() + 1 > m_max_depth){
			//if( m_max_depth == 0 ) std::cout << std::endl;  
			m_max_depth = n->gn() + 1 ;
			std::cout << "[" << m_max_depth  <<"]" << std::flush;			
		}

	}
	virtual Search_Node*	 	do_search() {
		Search_Node *head = get_node();
		if( is_goal( head ) )
			return head;

		int counter = 0;
		while(head) {	
			if( ! head->has_state() )
				head->set_state( m_problem.next(*(head->parent()->state()), head->action()) );

			Search_Node* goal = process(head);
			inc_exp();
			close(head);
			if( goal ) {
				if( ! goal->has_state() )
					goal->set_state( m_problem.next(*(goal->parent()->state()), goal->action()) );
				return goal;
			}
			counter++;
			head = get_node();
		}
		return NULL;
	}

	virtual bool 			previously_hashed( Search_Node *n ) {
		Search_Node *previous_copy = m_open_hash.retrieve(n);

		if( previous_copy != NULL ) 
			return true;
		
		return false;
	}

	Search_Node* root() { return m_root; }
	void	extract_plan( Search_Node* s, Search_Node* t, std::vector<Action_Idx>& plan, float& cost, bool reverse = true ) {
		Search_Node *tmp = t;
		cost = 0.0f;
		while( tmp != s) {
			cost += m_problem.cost( *(tmp->state()), tmp->action() );
			plan.push_back(tmp->action());
			tmp = tmp->parent();
		}
		
		if(reverse)
			std::reverse(plan.begin(), plan.end());		
	}

protected:
	void	extract_path( Search_Node* s, Search_Node* t, std::vector<Search_Node*>& plan ) {
		Search_Node* tmp = t;
		while( tmp != s) {
			plan.push_back(tmp);
			tmp = tmp->parent();
		}
		
		std::reverse(plan.begin(), plan.end());				
	}

       unsigned  rp_fl_achieved( Search_Node* n ){
	       unsigned count = 0;
	       static Fluent_Set counted( this->problem().task().num_fluents() );
	       while( n->action()!= no_op ){

		       const Action* a = this->problem().task().actions()[ n->action() ];

			//Add Conditional Effects
			if( !a->ceff_vec().empty() ){		
				for( unsigned i = 0; i < a->ceff_vec().size(); i++ ){
					Conditional_Effect* ce = a->ceff_vec()[i];
					for ( auto p : ce->add_vec() ) {
						if( m_rp_fl_set.isset( p ) && ! counted.isset(p) ){
							count++;
							counted.set( p );	
						}
					}
				}
			}

		       const Fluent_Vec& add = a->add_vec();
		       
		       //std::cout << this->problem().task().actions()[*it_a]->signature() << std::endl;
		       for ( unsigned i = 0; i < add.size(); i++ ){
			       const unsigned p = add[i];
			       if( m_rp_fl_set.isset( p ) && ! counted.isset(p) ){
				       count++;
				       counted.set( p );
			       }
		       }
		
		       n = n->parent();
	       }
	       counted.reset();
	       return count;
		       
       }

	bool   prune( Search_Node* n ){

		float node_novelty = infty;
		//unsigned count = rp_fl_achieved( n );
		//std::cout << this->problem().task().actions()[ n->action() ]->signature() << " achieved: " << count << std::endl;
		n->partition() = rp_fl_achieved( n );
		//n->update_hash();
		

		if ( this->is_closed( n ) ) {
		  return true;
		}
				
		if( this->previously_hashed(n) ) {
		return true;
		} 

		m_novelty->eval( n, node_novelty );
		//m_novelty->eval( n, node_novelty );
		if( node_novelty > bound() ) {
			inc_pruned_bound();
			//this->close(n);				
			return true;
		}	
		
		return false;
	}

	/**
	 * Process with successor generator
	 */

	virtual Search_Node*   	process(  Search_Node *head ) {
		std::vector< aptk::Action_Idx > app_set;
		this->problem().applicable_set_v2( *(head->state()), app_set );
		
		for (unsigned i = 0; i < app_set.size(); ++i ) {
			int a = app_set[i];

			/**
			 * Prune actions that do not add anything new compared to prev state.
			 * Big impact in del-free tasks, as states grow monotonically
			 */
			//need to check COND EFF TOO!!
			// if( head->state()->entails(this->problem().task().actions()[a]->add_vec()) )
			// 	continue;
			

			State *succ = this->problem().next( *(head->state()), a );	       			

			Search_Node* n = new Search_Node( succ , a, head, this->problem().task().actions()[ a ]->cost(), false );

			//Lazy expansion
			//Search_Node* n = new Search_Node( NULL , a, head, this->problem().task().actions()[ a ]->cost(), false );

			{
				if( prune( n ) ){
					#ifdef DEBUG
					std::cout << std::endl;
					std::cout << "PRUNED State: ";
					if( n->has_state() )
						std::cout << n->state();
					std::cout << " " << n->parent()->state() << " " << n->gn() << " ";
					if( n->has_state() )
						n->state()->print( std::cout );
					std::cout << this->problem().task().actions()[ n->action() ]->signature() << std::endl;
					#endif
					delete n;
					continue;
				}

				#ifdef DEBUG
				std::cout << std::endl;
				std::cout << "State: ";
				if( n->has_state() )
					std::cout << n->state();
				std::cout << " " << n->parent()->state() << " " << n->gn() << " ";
				if( n->has_state() )
					n->state()->print( std::cout );
				std::cout << this->problem().task().actions()[ n->action() ]->signature() << std::endl;
				#endif			

				this->open_node(n);				
				if( this->is_goal( n ) )
					return n;
			}

		} 



		return NULL;
	}


protected:

	  const Search_Model&			m_problem;
	  std::queue<Search_Node*>		m_open;
	  Closed_List_Type			m_closed, m_open_hash;
	  unsigned				m_exp_count;
	  unsigned				m_gen_count;
	  unsigned				m_cl_count;
	  unsigned                              m_max_depth;
	  Search_Node*				m_root;
	  
	  Abstract_Novelty*    			m_novelty;
	  RP_Heuristic*      			m_rp_h;
	  Fluent_Vec                            m_rp_fl_vec;
	  Fluent_Set                            m_rp_fl_set;
	  unsigned				m_pruned_B_count;
	  float					m_B;
	  bool                                  m_use_relplan;
  	  Fluent_Vec*                           m_goals;
	  bool					m_verbose;
	  bool					m_init_pruned;
};

}

}

}

#endif // rp_iw.hxx
