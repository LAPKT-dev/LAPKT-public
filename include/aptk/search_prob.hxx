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

#ifndef __SEARCH_PROBLEM__
#define __SEARCH_PROBLEM__

#include <iostream>
#include <cassert>
#include <limits>
#include <vector>

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
	virtual void	applicable_set_v2( const State& s, std::vector<Action_Idx>& app_set ) const = 0;
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
