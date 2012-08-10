#ifndef __SEARCH_PROBLEM__
#define __SEARCH_PROBLEM__

#include <iostream>
#include <cassert>
#include <limits>

namespace aptk
{

typedef		int 	 Action_Idx;
// MRJ: This should correspond to the biggest 32-bit unsigned
// but it's a quite dodgy way of initializing this.
const		Action_Idx no_op = -1; 

template <typename State> class Search_Problem {
public:

	Search_Problem() {}
	virtual ~Search_Problem() {}

	// MRJ: Returns the number of actions in the problem
	virtual	int	num_actions() const = 0;
	// MRJ: Returns initial state of the problem
	virtual	State*	init() const = 0;
	// MRJ: Return true if s is a goal state
	virtual bool	goal( const State& s ) const = 0;
	// MRJ: Returns true if a is applicable on state s
	virtual bool	is_applicable( const State& s, Action_Idx a ) const = 0;	
	// MRJ: Returns cost of executing action a on state s
	virtual float	cost( const State& s, Action_Idx a ) const = 0;
	// MRJ: Returns the state resulting from applying action a on state s
	virtual State*	next( const State& s, Action_Idx a ) const = 0;
	// MRJ: Outputs a description of the problem
	virtual void 	print(std::ostream &os) const = 0;


	// MRJ: Applicable action iterator
	class Action_Iterator {
	protected:
		Action_Iterator( const Search_Problem<State>& p, const State& s, int start_idx, int max ) 
		: m_problem(p), m_state( s ), m_current_idx(start_idx), m_last_action(max) { 
			prepare(); 
		}

		// MRJ: makes sure that the iterator starts referring to an applicable action
		void prepare() {
			int i = m_current_idx;
			for ( ; i < m_last_action; i++ ) {
				if ( m_problem.is_applicable( m_state, i ) ) break;
			}
			m_current_idx = i;
		}	
	
	public:
		Action_Iterator( const Action_Iterator& o ) 
			: m_state( o.m_state ), m_current_idx( o.m_current_idx )
		{
		}

		~Action_Iterator( ) { }

		bool	operator==( const Action_Iterator& o ) const { 
			return m_current_idx == o.m_current_idx;
		}

		bool	operator!=( const Action_Iterator& o ) const {
			return  m_current_idx == o.m_current_idx;
		}

		int	index() const {
			return m_current_idx;	
		}

		Action_Iterator operator++( int ) {
			int i = m_current_idx;
			for ( ; i < m_last_action; i++ ) {
				if ( m_problem.is_applicable( m_state, i ) ) break;
			}

			return Action_Iterator( m_problem, m_state, i, m_last_action );
		}

	protected:
		const Search_Problem<State>&	m_problem;
		const State&			m_state;
		int				m_current_idx;
		int				m_last_action;
	};

	
protected:

};

}

#endif	// search_prob.hxx
