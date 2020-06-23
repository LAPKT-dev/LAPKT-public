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

#ifndef __ANYTIME_SINGLE_QUEUE_SINGLE_HEURISTIC_BEST_FIRST_SEARCH__
#define __ANYTIME_SINGLE_QUEUE_SINGLE_HEURISTIC_BEST_FIRST_SEARCH__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
#include <ext_math.hxx> // no_such_index, infty
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace bfs {

template <typename State>
class Node {
public:

	typedef State State_Type;

	Node( State* s, float cost, Action_Idx action, Node<State>* parent )
	: m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ) {
		m_g = ( parent ? parent->m_g + cost : 0.0f);
	}

	virtual ~Node() {
		if ( m_state != NULL ) delete m_state;
	}

	float&			hn()		{ return m_h; }
	float			hn() const 	{ return m_h; }
	float&			gn()		{ return m_g; }
	float			gn() const 	{ return m_g; }
	float&			fn()		{ return m_f; }
	float			fn() const	{ return m_f; }
	Node<State>*		parent()   	{ return m_parent; }
	Action_Idx		action() const 	{ return m_action; }
	State*			state()		{ return m_state; }
	const State&		state() const 	{ return *m_state; }
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
};


// Anytime best-first search, with one single open list and one single
// heuristic estimator, with delayed evaluation of states generated
template <typename Search_Model, typename Abstract_Heuristic, typename Open_List_Type >
class AT_BFS_SQ_SH {

public:

	typedef	typename Search_Model::State_Type		State;
	typedef  	typename Open_List_Type::Node_Type		Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_BFS_SQ_SH( 	const Search_Model& search_problem )
	: m_problem( search_problem ), m_heuristic_func(NULL),
	m_exp_count(0), m_gen_count(0), m_pruned_B_count(0), m_dead_end_count(0), m_open_repl_count(0),
	  m_B( infty ), m_time_budget(infty), m_greedy(false), m_delay_eval(true) {
		m_heuristic_func = new Abstract_Heuristic( search_problem );
	}

	virtual ~AT_BFS_SQ_SH() {
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
		delete m_heuristic_func;
	}

	void	start() {
		m_B = infty;
		m_root = new Search_Node( m_problem.init(), 0.0f, no_op, NULL );
		#ifdef DEBUG
		std::cout << "Initial search node: ";
		m_root->print(std::cout);
		std::cout << std::endl;
		m_root->state()->print( std::cout );
		std::cout << std::endl;
		#endif
		m_open.insert( m_root );
		m_open_hash.put( m_root );
		if (!m_delay_eval)
			eval(m_root);
		inc_gen();
	}

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		m_t0 = time_used();
		Search_Node* end = do_search();
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );

		return true;
	}

	float			bound() const			{ return m_B; }
	void			set_bound( float v ) 		{ m_B = v; }
	void                    set_greedy( bool b )            { m_greedy = b; }
	void                    set_delay_eval( bool b )            { m_delay_eval = b; }

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
	Closed_List_Type&	open_hash() 			{ return m_open_hash; }

	const	Search_Model&	problem() const			{ return m_problem; }

	void			eval( Search_Node* candidate ) {
		m_heuristic_func->eval( candidate, candidate->hn() );
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

			// MRJ: This solves the memory leak and updates children nodes
			// incrementally
			n2->m_parent = n->m_parent;
			n2->gn() = n->gn();
			n2->m_action = n->action();

			if(!m_greedy)
				n2->fn() = n2->hn() + n2->gn();
			else
				n2->fn() = n2->hn();
			open_node(n2);
			return true;
		}
		return false;
	}

	Search_Node* 		get_node() {
		Search_Node *next = NULL;
		if(! m_open.empty() ) {
			next = m_open.pop();
			m_open_hash.erase( m_open_hash.retrieve_iterator( next) );
		}
		return next;
	}

	void	 	open_node( Search_Node *n ) {
		if(n->hn() == infty ) {
			close(n);
			inc_dead_end();
		}
		else {
			m_open.insert(n);
			m_open_hash.put(n);
		}
		inc_gen();
	}

	/**
	 * Succ Generator Process
	 */
	virtual void 			process(  Search_Node *head ) {


#ifdef DEBUG
		std::cout << "Expanding:" << std::endl;
		head->print(std::cout);
		std::cout << std::endl;
		head->state()->print( std::cout );
		std::cout << std::endl;
#endif
		std::vector< aptk::Action_Idx > app_set;
		this->problem().applicable_set_v2( *(head->state()), app_set );

		for (unsigned i = 0; i < app_set.size(); ++i ) {
			int a = app_set[i];

			State *succ = m_problem.next( *(head->state()), a );

			Search_Node* n = new Search_Node( succ, m_problem.cost( *(head->state()), a ), a, head );

			#ifdef DEBUG
			std::cout << "Successor:" << std::endl;
			n->print(std::cout);
			std::cout << std::endl;
			n->state()->print( std::cout );
			std::cout << std::endl;
			#endif

			if ( is_closed( n ) ) {
				#ifdef DEBUG
				std::cout << "Already in CLOSED" << std::endl;
				#endif
				delete n;
				continue;
			}
			if(m_delay_eval)
				n->hn() = head->hn();
			else
				eval(n);

			if(m_greedy)
				n->fn() = n->hn();
			else
				n->fn() = n->hn() + n->gn();

			if( previously_hashed(n) ) {
				#ifdef DEBUG
				std::cout << "Already in OPEN" << std::endl;
				#endif
				delete n;
			}

			else
			{
				#ifdef DEBUG
				std::cout << "Inserted into OPEN" << std::endl;
				#endif
				open_node(n);
			}
		}
		inc_eval();
	}

	virtual Search_Node*	 	do_search() {
		std::cout << "Search starts: " << std::endl;
		std::cout << "\t Bound: " << bound() << std::endl;
		float	min_h = infty;

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

			if ( m_delay_eval )
				eval( head );

			if ( head->hn() < min_h ) {
				min_h = head->hn();
				std::cout << "\t Best h(n) = " << min_h << ", expanded: " << expanded() << ", generated: " << generated() << std::endl;
			}

			process(head);
			close(head);
			counter++;
			head = get_node();
		}
		return NULL;
	}

	virtual bool 			previously_hashed( Search_Node *n ) {
		Search_Node *previous_copy = NULL;

		if( (previous_copy = m_open_hash.retrieve(n)) ) {
			if(n->gn() < previous_copy->gn())
			{
				// MRJ: Updates are only possible if we're using a dynamic heap
				// like boost::fibonacci_heap, otherwise, if we generate a better
				// node we need to suck it up and put it into OPEN

				/*
				previous_copy->m_parent = n->m_parent;
				previous_copy->m_action = n->m_action;
				previous_copy->m_g = n->m_g;
				if(!m_greedy)
					previous_copy->m_f = previous_copy->m_h + previous_copy->m_g;
				inc_replaced_open();
				*/
				return false;
			}
			return true;
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
	std::vector<Action_Idx> 		m_app_set;
	bool                                    m_greedy;
	bool                                    m_delay_eval;
};

}

}

}

#endif // at_bfs_sq_sh.hxx
