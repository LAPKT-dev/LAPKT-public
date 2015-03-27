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

#ifndef __ANYTIME_DUAL_QUEUE_SINGLE_HEURISTIC_BEST_FIRST_SEARCH__
#define __ANYTIME_DUAL_QUEUE_SINGLE_HEURISTIC_BEST_FIRST_SEARCH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace bfs_dq {

template <typename State>
class Node {
public:

	typedef State State_Type;

	Node( State* s, float cost, Action_Idx action, Node<State>* parent, int num_actions ) 
	: m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ), m_po( num_actions ),
	m_seen(false) {
		m_g = ( parent ? parent->m_g + cost : 0.0f);
	}
	
	virtual ~Node() {
		if ( m_state != NULL ) delete m_state;
	}

	float&			hn()				{ return m_h; }
	float			hn() const 			{ return m_h; }
	float&			gn()				{ return m_g; }			
	float			gn() const 			{ return m_g; }
	float&			fn()				{ return m_f; }
	float			fn() const			{ return m_f; }
	Node<State>*		parent()   			{ return m_parent; }
	Action_Idx		action() const 			{ return m_action; }
	State*			state()				{ return m_state; }
	const State&		state() const 			{ return *m_state; }
	void			add_po( Action_Idx index )	{ m_po.set( index ); }
	bool			is_po(Action_Idx index) const	{ return m_po.isset( index ); }
	void			set_seen( )			{ m_seen = true; }
	bool			seen() const			{ return m_seen; }

	void			print( std::ostream& os ) const {
		os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = " << m_g << ", h(n) = " << m_h << ", f(n) = " << m_f << "}";
	}

	bool   	operator==( const Node<State>& o ) const {
		
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

	size_t                  hash() const { return m_state->hash(); }

public:

	State*		m_state;
	Node<State>*	m_parent;
	float		m_h;
	Action_Idx	m_action;
	float		m_g;
	float		m_f;
	Bit_Set		m_po;
	bool		m_seen;
};


// Anytime best-first search, with one single open list and one single
// heuristic estimator, with delayed evaluation of states generated
template <typename Search_Model, typename Abstract_Heuristic, typename Open_List_Type >
class AT_BFS_DQ_SH {

public:

	typedef	typename Search_Model::State_Type		State;
	typedef  	typename Open_List_Type::Node_Type		Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_BFS_DQ_SH( 	const Search_Model& search_problem ) 
	: m_problem( search_problem ), m_heuristic_func(NULL), 
	m_exp_count(0), m_gen_count(0), m_pruned_B_count(0), m_dead_end_count(0), m_open_repl_count(0),
	m_B( infty ), m_time_budget(infty), m_po_exp_left( 100 ), m_non_po_exp_left(0), m_po_exp_max(100), m_non_po_exp_max(0) {
		m_heuristic_func = new Abstract_Heuristic( search_problem );
	}
	
	AT_BFS_DQ_SH( 	const Search_Model& search_problem, Abstract_Heuristic& h ) 
	: m_problem( search_problem ), m_heuristic_func(&h), 
	m_exp_count(0), m_gen_count(0), m_pruned_B_count(0), m_dead_end_count(0), m_open_repl_count(0),
	m_B( infty ), m_time_budget(infty), m_po_exp_left( 100 ), m_non_po_exp_left(0), m_po_exp_max(100), m_non_po_exp_max(0) {
	}

	virtual ~AT_BFS_DQ_SH() {
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
		m_open_hash.clear();
	}

	void	start() {
		m_B = infty;
		m_root = new Search_Node( m_problem.init(), 0.0f, no_op, NULL, m_problem.num_actions() );	
		eval(m_root);
		#ifdef DEBUG
		std::cout << "Initial search node: ";
		m_root->print(std::cout);
		std::cout << std::endl;
		#endif 
		m_open.insert( m_root );
		m_open_hash.put( m_root );
		inc_gen();
	}

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		cost = infty;
		m_t0 = time_used();
		Search_Node* end = do_search();
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );	
		float t2 = time_used();
		m_time_budget -= ( t2 - m_t0 );		
		return true;
	}

	void			set_schedule( int max_po_exp, int max_non_po_exp ) {
		m_po_exp_max = max_po_exp;
		m_non_po_exp_max = max_non_po_exp;
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

	const	Search_Model&	problem() const			{ return m_problem; }

	Search_Node*		root()				{ return m_root; }	

	Closed_List_Type&	closed() 			{ return m_closed; }
	Closed_List_Type&	open_hash() 			{ return m_open_hash; }
	Abstract_Heuristic&	heuristic()			{ return *m_heuristic_func; }

	virtual void	eval( Search_Node* candidate ) {
		std::vector<Action_Idx>	po;
		m_heuristic_func->eval( candidate, candidate->hn(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po( po[k] );	
	}
	
	Search_Node*		get_node( Open_List_Type& open ) {
		if ( open.empty() ) return NULL;

		Search_Node* next = open.pop();
		if ( !m_open_hash.empty() )
		m_open_hash.erase( m_open_hash.retrieve_iterator( next) );
		return next;				
	}

	Search_Node* 		get_node() {
		
		if ( m_open.empty() && m_open_po.empty() ) return NULL;
	
		Search_Node *next = NULL;
		
		if ( m_po_exp_left > 0 ) {	
			next = get_node( m_open_po );
			if (next == NULL )
				m_non_po_exp_left++;
			else
			{
				m_po_exp_left--;			
				if ( m_po_exp_left == 0 )
					m_non_po_exp_left = m_non_po_exp_max;
				return next;
			}
		}

		if ( m_non_po_exp_left > 0 ) {
			next = get_node( m_open );
			if ( next == NULL ) {
				next = get_node( m_open_po );		
			}
			else {
				m_non_po_exp_left--;
				if ( m_non_po_exp_left == 0 )
					m_po_exp_left = m_po_exp_max;
			}
		}

		return next;
	}

	void	 	open_node( Search_Node *n, bool preferred ) {
		if(n->hn() == infty ) {
			close(n);
			inc_dead_end();
		}
		else {
			if ( preferred )
				m_open_po.insert(n);
			else
				m_open.insert(n);
			m_open_hash.put(n);
			inc_gen();
		}
	}

	

	virtual void 	process(  Search_Node *head ) {
		typedef typename Search_Model::Action_Iterator Iterator;
		Iterator it( this->problem() );
		int a = it.start( *(head->state()) );
		while ( a != no_op ) {		
			State *succ = m_problem.next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, m_problem.cost( *(head->state()), a ), a, head, m_problem.num_actions() );
			if ( is_closed( n ) ) {
				delete n;
				a = it.next();
				continue;
			}
			if ( is_open( n ) ) {
				delete n;
				a = it.next();
				continue;
			}
			n->hn() = head->hn();
			n->fn() = n->hn() + n->gn();
			open_node(n, head->is_po(a));
			a = it.next();	
		} 
		inc_eval();
	}

	virtual Search_Node*	 do_search() {
		Search_Node *head = get_node();
		int counter =0;
		while(head) {
			if ( head->gn() >= bound() )  {
				inc_pruned_bound();
				close(head);
				head = get_node();
				continue;
			}

			if(m_problem.goal(*(head->state()))) {
				close(head);
				set_bound( head->gn() );	
				return head;
			}
			if ( (time_used() - m_t0 ) > m_time_budget )
				return NULL;
	
			eval( head );
			process(head);
			close(head);
			counter++;
			head = get_node();
		}
		return NULL;
	}

	virtual bool is_open( Search_Node *n ) {
		Search_Node *previous_copy = NULL;

		if( (previous_copy = m_open_hash.retrieve(n)) ) {
			
			if(n->gn() < previous_copy->gn())
			{
				previous_copy->m_parent = n->m_parent;
				previous_copy->m_action = n->m_action;
				previous_copy->m_g = n->m_g;
				previous_copy->m_f = previous_copy->m_h + previous_copy->m_g;
				inc_replaced_open();
			}
			return true;
		}

		return false;
	}

	bool	is_closed( Search_Node* n ) {
		Search_Node* n2 = closed().retrieve(n);

		if ( n2 != NULL ) {
			if ( n2->gn() <= n->gn() ) {
				// The node we generated is a worse path than
				// the one we already found
				return true;
			}
			// Otherwise, we put it into Open and remove
			// n2 from closed
			closed().erase( closed().retrieve_iterator( n2 ) );
		}
		return false;
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
	Abstract_Heuristic*			m_heuristic_func;
	Open_List_Type				m_open_po;
	Open_List_Type				m_open;
	Closed_List_Type			m_closed, m_open_hash;
	unsigned				m_exp_count;
	unsigned				m_gen_count;
	unsigned				m_pruned_B_count;
	unsigned				m_dead_end_count;
	unsigned				m_open_repl_count;
	float					m_B;
	float					m_time_budget;
	float					m_t0;
	Search_Node*				m_root;
	unsigned				m_po_exp_left;
	unsigned				m_non_po_exp_left;
	unsigned				m_po_exp_max;
	unsigned				m_non_po_exp_max;
	std::vector<Action_Idx>			m_app_set;
};

}

}

}

#endif // at_bfs_sq_sh.hxx
