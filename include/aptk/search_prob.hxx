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

	typedef  State		State_Type;

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
	virtual void	applicable_set( const State& s, std::vector<Action_Idx>& app_set ) const = 0;	
	// MRJ: Returns cost of executing action a on state s
	virtual float	cost( const State& s, Action_Idx a ) const = 0;
	// MRJ: Returns the state resulting from applying action a on state s
	virtual State*	next( const State& s, Action_Idx a ) const = 0;
	// MRJ: Outputs a description of the problem
	virtual void 	print(std::ostream &os) const = 0;
	
protected:

};

}

#endif	// search_prob.hxx
