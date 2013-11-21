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

#ifndef __ITERATIVE_WIDTH__
#define __ITERATIVE_WIDTH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <aptk/brfs.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace brfs {


template < typename Search_Model, typename Abstract_Novelty >
class IW : public BRFS< Search_Model > {

public:

	typedef		typename Search_Model::State_Type		State;
	typedef  	Node< State >					Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	IW( 	const Search_Model& search_problem ) 
	: BRFS< Search_Model >(search_problem), m_pruned_B_count(0), m_B( infty ) {	   
		m_novelty = new Abstract_Novelty( search_problem );
	}

	virtual ~IW() {
		delete m_novelty;
	}

	void	start(State*s = NULL) {


		if(!s)
			this->m_root = new Search_Node( this->problem().init(), no_op, NULL );	
		else
			this->m_root = new Search_Node( s, no_op, NULL );


		m_pruned_B_count = 0;
		this->reset();

		m_novelty->init();
		
		if ( prune( this->m_root ) )  {
			std::cout<<"Initial State pruned! No Solution found."<<std::endl;
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

	float			bound() const			{ return m_B; }
	void			set_bound( float v ) 		{ 
		m_B = v;
		m_novelty->set_arity( m_B );
	}

	void			inc_pruned_bound() 		{ m_pruned_B_count++; }
	unsigned		pruned_by_bound() const		{ return m_pruned_B_count; }

protected:
	bool   prune( Search_Node* n ){

		float node_novelty = infty;
		m_novelty->eval( *n, node_novelty );
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
// 	virtual Search_Node*   	process(  Search_Node *head ) {
// 		typedef typename Search_Model::Action_Iterator Iterator;
// 		Iterator it( this->problem() );
// 		int a = it.start( *(head->state()) );
// 		while ( a != no_op ) {		
// 			State *succ = this->problem().next( *(head->state()), a );
// 			Search_Node* n = new Search_Node( succ, a, head );
// 			if ( this->is_closed( n ) ) {
// 				delete n;
// 				a = it.next();
// 				continue;
// 			}
			
// 			if( this->previously_hashed(n) ) {
// 				delete n;
// 			}
// 			else{
// 				if( prune( n ) ){
// 					a = it.next();
// #ifdef DEBUG
// 					std::cout << std::endl;
// 					std::cout << "PRUNED State: " << n->state()  << " " << n->parent()->state() << " " << n->gn() << " ";
// 					n->state()->print( std::cout );
// 					std::cout << this->problem().task().actions()[ n->action() ]->signature() << std::endl;
// #endif
// 					delete n;
// 					continue;
// 				}
// #ifdef DEBUG
// 				std::cout << std::endl;
// 				std::cout << "State: " << n->state() << " " << n->parent()->state() << " " << n->gn() << " ";
// 				n->state()->print( std::cout );
// 				std::cout << this->problem().task().actions()[ n->action() ]->signature() << std::endl;
// #endif			

// 				this->open_node(n);				
// 				if( this->is_goal( n->state() ) )
// 					return n;
// 			}

// 			a = it.next();		
// 		} 
// 		this->inc_exp();
// 		return NULL;
// 	}

	virtual Search_Node*   	process(  Search_Node *head ) {
		for (int a = 0; a < this->problem().num_actions(); a++ ) {		
			if( ! this->problem().task().actions()[ a ]->can_be_applied_on( *(head->state())) ) continue;
			State *succ = this->problem().next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, a, head );
			if ( this->is_closed( n ) ) {
				delete n;
				continue;
			}
			
			if( this->previously_hashed(n) ) {
				delete n;
			}
			else{
				if( prune( n ) ){
					#ifdef DEBUG
					std::cout << std::endl;
					std::cout << "PRUNED State: " << n->state()  << " " << n->parent()->state() << " " << n->gn() << " ";
					n->state()->print( std::cout );
					std::cout << this->problem().task().actions()[ n->action() ]->signature() << std::endl;
					#endif
					delete n;
					continue;
				}
				#ifdef DEBUG
				std::cout << std::endl;
				std::cout << "State: " << n->state() << " " << n->parent()->state() << " " << n->gn() << " ";
				n->state()->print( std::cout );
				std::cout << this->problem().task().actions()[ n->action() ]->signature() << std::endl;
				#endif			

				this->open_node(n);				
				if( this->is_goal( n->state() ) )
					return n;
			}

		} 
		this->inc_exp();
		return NULL;
	}
	
protected:

	Abstract_Novelty*      			m_novelty;
	unsigned				m_pruned_B_count;
	float					m_B;
};

}

}

}

#endif // iw.hxx
