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

#ifndef __DEADLINE_AWARE_SEARCH__
#define __DEADLINE_AWARE_SEARCH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <aptk/sliding_window.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace das {

template <typename State>
class Node {
public:

	typedef State State_Type;

	Node( State* s, unsigned e_nr, float cost, Action_Idx action, Node<State>* parent ) 
	: m_state( s ), m_parent( parent ), m_action(action), 
	m_g( 0 ), m_depth( 0 ), m_d_est(0), m_avg_error(0), m_d_corr(0), m_exp_nr( e_nr ) {
		m_g = ( parent ? parent->m_g + cost : 0.0f);
		m_depth = ( parent ? parent->m_depth + 1 : 0.0f );
	}
	
	virtual ~Node() {
		if ( m_state != NULL ) delete m_state;
	}

	float&			hn()				{ return m_h; }
	float&			gn()				{ return m_g; }			
	float			gn() const 			{ return m_g; }
	float&			fn()				{ return m_f; }
	float			fn() const			{ return m_f; }
	Node<State>*		parent()   			{ return m_parent; }
	Action_Idx		action() const 			{ return m_action; }
	State*			state()				{ return m_state; }
	const State&		state() const 			{ return *m_state; }
	float			depth() const			{ return m_depth; }
	float&			dn()				{ return m_d_est; }	
	float			dn() const			{ return m_d_est; }
	float&			dn_corr()			{ return m_d_corr; }
	float			dn_corr() const			{ return m_d_corr; }		
	float			avg_error() const		{ return m_avg_error; }

	void			print( std::ostream& os ) const {
		os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = ";
		os << m_g << ", h(n) = " << m_h << ", f(n) = " << m_f << ", depth(n) = " << m_depth;
		os << ", d(n) = " << m_d_est << ", corr. d(n) = " << m_d_corr << ", avg. error=" << m_avg_error << " }";
	}

	void			correct_depth_estimate() {
		if ( m_parent == NULL ) {
			m_avg_error = 0.0f;
			m_d_corr = m_d_est;
			return;
		}

		float current_err = m_d_est - m_parent->m_d_est + 1;
		m_avg_error = m_parent->avg_error() + (1.0f/m_depth) * ( current_err - m_parent->avg_error() );
		if ( avg_error() < 1.0f ) {
			m_d_corr = m_d_est / (1.0f - avg_error());
			return;
		}
		m_d_corr = infty;
	}

	unsigned		exp_nr() const			{ return m_exp_nr; }
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
	float		m_depth;
	float		m_d_est;
	float		m_avg_error;
	float		m_d_corr;
	unsigned	m_exp_nr;
};


template < typename Search_Model, typename Abstract_Heuristic, typename Depth_Estimator, typename Open_List_Type >
class	Deadline_Aware_Search {

public:
	typedef		typename Search_Model::State_Type		State;
	typedef  	Node< State >					Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	Deadline_Aware_Search( const Search_Model& p ) 
	: m_problem( p ), m_h_func( NULL ), m_d_func(NULL), m_exp_count(0), m_gen_count(0),
	m_time_budget( std::numeric_limits<double>::max() ), m_root(NULL), m_open_repl_count(0),
	m_pruned_repl_count(0), m_dead_end_count(0), m_t0(0.0), m_ed_stats( 200, 50 ), m_nr_stats( 200, 50 ),
	m_B( infty ), m_pruned_B_count(0) {
		m_h_func = new Abstract_Heuristic( problem() );
		m_d_func = new Depth_Estimator( problem() );
	}

	virtual	~Deadline_Aware_Search() {
		delete m_h_func;
		delete m_d_func;
	}

	const Search_Model&	problem() const 		{ return m_problem; }

	float			bound() const			{ return m_B; }
	void			set_bound( float v ) 		{ m_B = v; }
	
	void			inc_gen()			{ m_gen_count++; }
	unsigned		generated() const		{ return m_gen_count; }
	void			inc_eval()			{ m_exp_count++; }
	unsigned		expanded() const		{ return m_exp_count; }
	void			inc_dead_end()			{ m_dead_end_count++; }
	unsigned		dead_ends() const		{ return m_dead_end_count; }
	void			inc_replaced_open()		{ m_open_repl_count++; }
	unsigned		open_repl() const		{ return m_open_repl_count; }
	void			inc_replaced_pruned()		{ m_pruned_repl_count++; }
	unsigned		pruned_repl() const		{ return m_pruned_repl_count; }
	void			inc_pruned_bound() 		{ m_pruned_B_count++; }
	unsigned		pruned_by_bound() const		{ return m_pruned_B_count; }


	void			set_budget( double v ) 		{ m_time_budget = v; }
	double			time_budget() const		{ return m_time_budget; }
	double			t0() const			{ return m_t0; }

	Search_Node*		root()				{ return m_root; }

	Open_List_Type&		open()				{ return m_open; }
	Open_List_Type&		pruned()			{ return m_pruned; }		
	Closed_List_Type&	closed()			{ return m_closed; }
	Closed_List_Type&	open_hash()			{ return m_open_hash; }
	Closed_List_Type&	pruned_hash()			{ return m_pruned_hash; }
	
	Abstract_Heuristic&	heuristic()			{ return *m_h_func; }
	Depth_Estimator&	depth_estimator()		{ return *m_d_func; }

	void			close( Search_Node* n )		{ m_closed.put(n); }

	void	start() {
		m_root = new Search_Node( m_problem.init(), m_exp_count, 0.0f, no_op, NULL);	
		eval(m_root);
		#ifdef DEBUG
		std::cout << "Initial search node: ";
		m_root->print(std::cout);
		std::cout << std::endl;
		#endif
		add_to_open( m_root );
	}

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		cost = infty;
		m_t0 = time_used();
		m_last_exp_t = time_used(); 
		Search_Node* end = do_search();
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );	
		double t2 = time_used();
		m_time_budget -= ( t2 - m_t0 );		
		return true;
	}


	virtual	void 		eval( Search_Node* n ) {
		heuristic().eval( n, n->hn() );
		depth_estimator().eval( *(n->state()), n->dn() );
		n->correct_depth_estimate();
	}

	Search_Node*		get_node() {
		if ( !open().empty() ) {
			Search_Node* next = open().pop();
			open_hash().erase( open_hash().retrieve_iterator( next ) );
			return next;
		}
		// MRJ: OPEN is empty, time to recover nodes from PRUNED
		//std::cout << "Recovering nodes from pruned..." << std::endl;
		recover_from_pruned();
		//std::cout << "Done!" << std::endl;
		if ( open().empty() ) return NULL;
		Search_Node* next = open().pop();
		open_hash().erase( open_hash().retrieve_iterator( next ) );
		return next;
	}

	void	recover_from_pruned() {
		double exp = estimate_remaining_expansions();
		while ( exp > 0 && !pruned().empty() ) {
			Search_Node* n = NULL;
			while ( !pruned().empty() ) {
				n = pruned().pop();
				if ( !is_closed( n )  )
					break;
				//std::cout << "Deleting from pruned: ";
				n->print(std::cout);
				std::cout << std::endl;
				delete n;
				n = NULL;
			}
			if ( n == NULL ) break;
			add_to_open( n );
			exp -= n->dn_corr();	
		}
	}
	
	void	add_to_open( Search_Node* n ) {
		if ( n->hn() == infty ) {
			close(n);
			inc_dead_end();
			return;
		}
		m_open_hash.put(n);
		open().insert(n);
	}

	void	generate_successors( Search_Node* head ) {
		typedef typename Search_Model::Action_Iterator Iterator;
		Iterator it( this->problem() );
		int a = it.start( *(head->state()) );
		while ( a != no_op ) {		
			State *succ = m_problem.next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, expanded(), m_problem.cost( *(head->state()), a ), a, head );
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
			eval(n);	
			n->fn() = n->hn() + n->gn();
			add_to_open(n);
			inc_gen();
			a = it.next();	
		} 
		
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

	virtual Search_Node*	 do_search() {
		Search_Node *head = get_node();
		while (head) {
#ifdef DEBUG
			std::cout << "Retrieved from OPEN: " << std::endl;
			head->print( std::cout );
			std::cout << std::endl;
#endif		
			if ( head->gn() >= bound() ) {
				inc_pruned_bound();
				close(head);
				head = get_node();
				continue;
			}

			if( m_problem.goal(*(head->state()))) {
#ifdef DEBUG
				std::cout << "Goal reached!" << std::endl;
#endif
				close(head);
				set_bound( head->gn() );
				return head;
			}

			if ( (time_used() - t0() ) > m_time_budget ) {
#ifdef DEBUG
				std::cout << "Time expired!" << std::endl;
#endif
				return NULL;
			}

#ifdef DEBUG
			std::cout << "Checking depth bound" << std::endl;
#endif
			if ( check_depth_bound(head) ) {
#ifdef DEBUG
				std::cout << "Expanding..." << std::endl;
#endif
				inc_eval();
				record_statistics(head);	
				generate_successors(head);
				close(head);
			}
			//std::cout << "Getting next node..." << std::endl;
			head = get_node();
			//std::cout << "Loop completed..." << std::endl;
		}
		return NULL;
	}

	void	record_statistics( Search_Node* n ) {
		double exp_delta = time_used() - m_last_exp_t;
		unsigned delay = expanded() - n->exp_nr();
		m_last_exp_t = time_used();
		m_ed_stats.push( delay );
		m_nr_stats.push( exp_delta );	
	}

	bool	check_depth_bound( Search_Node* n ) {
		double d_max = estimate_depth_bound();
#ifdef DEBUG
		std::cout << "d_max = " << d_max << ", corrected d(n) = " << n->dn_corr() << std::endl;
#endif
		if ( n->dn_corr() > d_max ) {
#ifdef DEBUG
			std::cout << "Goes to PRUNED" << std::endl;
#endif
			if ( is_open(n) ) {
				delete n;
				return false;
			}
			pruned().insert( n );
			open_hash().put( n );
			return false;
		}
		return true;
	}

	double	estimate_depth_bound( ) {
		if ( !m_ed_stats.settled() || !m_nr_stats.settled() ) 
			return infty;
		double avg_exp_delay = m_ed_stats.get_avg();
		double exp = estimate_remaining_expansions();
#ifdef DEBUG
		std::cout << "Avg. expansion delay = " << avg_exp_delay << " estimated expansions = " << exp << std::endl;
#endif
		return exp / avg_exp_delay;
	}

	double	estimate_remaining_expansions() {
		double remaining = m_time_budget - (time_used() - t0());
		double node_rate = 1.0 / m_nr_stats.get_avg();
#ifdef DEBUG
		std::cout << "Remaining time = " << remaining << " sec, rate = " << node_rate << " nodes/s" << std::endl;
#endif
		return remaining * node_rate;
	}

	void	replace_parent( Search_Node* n, Search_Node* n2 ) {
		n2->m_parent = n->m_parent;
		n2->m_action = n->m_action;
		n2->m_g = n->m_g;
		n2->m_f = n2->m_h + n2->m_g;		
	}

	virtual bool is_open( Search_Node *n ) {
		Search_Node *n2 = NULL;

		if( ( n2 = this->open_hash().retrieve(n)) ) {
			if(n->gn() < n2->gn())
			{
				replace_parent( n, n2 );
				n->correct_depth_estimate();
				inc_replaced_open();
			}
			return true;
		}
		return false;
	}

	virtual void	extract_plan( Search_Node* s, Search_Node* t, std::vector<Action_Idx>& plan, float& cost ) {
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

	Search_Model				m_problem;
	Abstract_Heuristic*			m_h_func;
	Depth_Estimator*			m_d_func;
	unsigned				m_exp_count;
	unsigned				m_gen_count;
	double					m_time_budget;
	Search_Node*				m_root;
	Closed_List_Type			m_closed, m_open_hash, m_pruned_hash;
	Open_List_Type				m_open, m_pruned;
	unsigned				m_open_repl_count;
	unsigned				m_pruned_repl_count;
	unsigned				m_dead_end_count;
	double					m_t0;
	double					m_last_exp_t;
	Sliding_Window<double>			m_ed_stats;
	Sliding_Window<double>			m_nr_stats;
	float					m_B;
	unsigned				m_pruned_B_count;	
};

}

}

}

#endif // das.hxx
