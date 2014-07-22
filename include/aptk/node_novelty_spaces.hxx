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

#ifndef __NODE_NOVELTY_SPACES__
#define __NODE_NOVELTY_SPACES__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <aptk/hash_table.hxx>

#include <queue>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace novelty_spaces {

template <typename State>
class Node {
public:

	typedef State State_Type;

  Node( State* s, Action_Idx action, Node<State>* parent = nullptr, float cost = 1.0f, bool compute_hash = true) 
	  : m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ), m_partition(0), m_compare_only_state( false ) {
		
		m_g = ( parent ? parent->m_g + cost : 0.0f);
		if( m_state == NULL )
			update_hash();
	}
	
	virtual ~Node() {
		if ( m_state != NULL ) delete m_state;
	}

	unsigned&      		gn()		  { return m_g; }			
	unsigned       		gn() const 	  { return m_g; }
	unsigned&      		partition()    	  { return m_partition; }			
	unsigned       		partition() const { return m_partition; }
	Node<State>*		parent()   	  { return m_parent; }
	Action_Idx		action() const 	  { return m_action; }
	State*			state()		  { return m_state; }
	void			set_state( State* s )	{ m_state = s; }
	bool			has_state() const	{ return m_state != NULL; }
	const State&		state() const 	{ return *m_state; }
	void                    compare_only_state( bool b ){ m_compare_only_state = b; }
	

	void			print( std::ostream& os ) const {
		os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = " << m_g  << "}";
	}

	virtual bool    is_better( Node* n ) const {
		return false;
		//return this->partition() > n->partition();
	}

	size_t      hash() const { return m_state ? m_state->hash() : m_hash; }

	void    update_hash() {
		Hash_Key hasher;
		if( m_state == NULL){
		  hasher.add( m_action );
		  if ( m_parent != NULL )
		    hasher.add( m_parent->state()->fluent_vec() );
		}
		else
		    hasher.add( state()->fluent_vec() );

		m_hash = (size_t)hasher;
	}

	
	
	bool   	operator==( const Node<State>& o ) const {
		
		if(m_compare_only_state || o.m_compare_only_state ){
			if( &(o.state()) != NULL && &(state()) != NULL)
				return ( (const State&)(o.state()) == (const State&)(state()));
		}
		else
			if( &(o.state()) != NULL && &(state()) != NULL)
				return ( (const State&)(o.state()) == (const State&)(state())) && ( o.partition() == partition() );
		/**
		 * Lazy
		 */
		if  ( m_parent == NULL ) {
			if ( o.m_parent == NULL ) return true;
			return false;
		}
	
		if ( o.m_parent == NULL ) return false;
		
		if(m_compare_only_state || o.m_compare_only_state )
			return (m_action == o.m_action) && ( *(m_parent->m_state) == *(o.m_parent->m_state) );
		else
			return (m_action == o.m_action) && ( *(m_parent->m_state) == *(o.m_parent->m_state) ) && ( o.partition() == partition() );
	}

public:

	State*		m_state;
	Node<State>*	m_parent;
	float		m_h;
	Action_Idx	m_action;
	unsigned       	m_g;
	unsigned        m_partition;
	size_t		m_hash;
	bool            m_compare_only_state;
};


}

}

}

#endif // node_novelty_spaces.hxx
