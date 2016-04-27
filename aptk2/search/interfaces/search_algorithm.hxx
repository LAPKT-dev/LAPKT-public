/*
Lightweight Automated Planning Toolkit (LAPKT)
Copyright (C) 2015

<contributors>
Miquel Ramirez <miquel.ramirez@gmail.com>
</contributors>

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

Additional note:

Concepts borrowed from Ethan Burn's heuristic search framework.
*/

#ifndef __SEARCH_ALGORITHM__
#define __SEARCH_ALGORITHM__

#include <vector>
#include <iostream>

#include <aptk2/tools/logging.hxx>


namespace aptk {

	template <typename StateModel>
	class SearchAlgorithm {
	public:
		typedef std::vector< typename StateModel::ActionType::IdType > Plan;

		//! Constructs a new search algorithm that performs searches in the given state model.
		SearchAlgorithm( const StateModel& _model ) :
			model( _model ), expanded( 0 ), generated( 0 ) {
		}
		
		virtual ~SearchAlgorithm() {}	

		//! This method encapsulates the actual search for a plan achieving the
		//! goal from the provided state s. Argument solution will be empty if there
		//! is no valid plan.
		virtual bool search( const typename StateModel::StateType& s, Plan& solution ) = 0;

		//! Convenience method for when we are interested in starting from the initial state
		virtual bool solve_model( Plan& solution ) {
			LPT_INFO("cout", "Solving model");
			return search( model.init(), solution );
		}

		//! A constant reference to the state model. This is public because it
		//! makes no sense to have an accessor
		const			StateModel&	model;
		//! Number of expanded states, that is, states for which all successors have
		//! been generated
		unsigned long				expanded;
		//! Number of generated states, that is, states that have been created and
		//! and kept for potential use during the search
		unsigned long				generated;
	};
}

#endif
