/*
Lightweight Automated Planning Toolkit
Copyright (C) 2015
Miquel Ramirez <miquel.ramirez@gmail.com>
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

#pragma once

#include <iostream>
#include <cassert>
#include <limits>
#include <vector>

namespace aptk
{

/*!
 *	Generic interface to specify deterministic state models
 */

template <typename State, typename Action> 
class DetStateModel {
public:

	typedef  		State			StateType;
	typedef 		Action			ActionType;

	const	typename Action::IdType	invalid_action = Action::invalid_action_id;

	DetStateModel() {}
	virtual ~DetStateModel() {}

	//! Returns initial state of the problem
	virtual	State	init() const = 0;

	//! Returns true if s is a goal state
	virtual bool	goal( const State& s ) const = 0;

	//! Returns applicable action set object
	virtual	typename Action::ApplicableSet applicable_actions( const State& s ) const = 0;

	//! Returns the state resulting from applying action a on state s
	virtual State	next( const State& s, const typename Action::IdType& id ) const = 0;

	// MRJ: Outputs a description of the problem
	virtual void 	print(std::ostream &os) const = 0;
	
protected:

};

}
