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
*/

#pragma once

#include <aptk2/search/algorithms/generic_search.hxx>
#include <aptk2/search/components/sorted_open_list_impl.hxx>
#include <aptk2/search/components/closed_list_impl.hxx>

namespace aptk {

//! Partial specialization of the GenericSearch algorithm:
//! A best-first search is a generic search with an open list sorted by a certain (given) heuristic
//! and a standard unsorted closed list. Type of node and state model are still generic.
template < typename NodeType, typename Heuristic, typename StateModel >
class StlBestFirstSearch : public GenericSearch<NodeType, 
                                                StlSortedOpenList<NodeType, Heuristic>, 
                                                StlUnorderedMapClosedList<NodeType>,
                                                StateModel>
{
public:
	typedef StlSortedOpenList<NodeType, Heuristic> OpenList;
	typedef StlUnorderedMapClosedList<NodeType> ClosedList;
	typedef GenericSearch<NodeType, OpenList, ClosedList, StateModel> BaseClass;
	
	//! The only allowed constructor requires the user of the algorithm to inject both
	//! (1) the state model to be used in the search
	//! (2) the particular heuristic object to be used to evaluate states
	StlBestFirstSearch(const StateModel& model, Heuristic&& heuristic, bool delayed) :
		BaseClass(model, OpenList(std::move(heuristic), delayed), ClosedList())
	{}
	
	virtual ~StlBestFirstSearch() = default;
	
	// Disallow copy, but allow move
	StlBestFirstSearch(const StlBestFirstSearch& other) = delete;
	StlBestFirstSearch(StlBestFirstSearch&& other) = default;
	StlBestFirstSearch& operator=(const StlBestFirstSearch& rhs) = delete;
	StlBestFirstSearch& operator=(StlBestFirstSearch&& rhs) = default;
}; 

}
