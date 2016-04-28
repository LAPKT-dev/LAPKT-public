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
#include <aptk2/search/components/unsorted_open_list_impl.hxx>
#include <aptk2/search/components/closed_list_impl.hxx>

namespace aptk {

//! Partial specialization of the GenericSearch algorithm:
//! A breadth-first search is a generic search with a FIFO open list and 
//! a standard unsorted closed list. Type of node and state model are still generic.
template <typename NodeType, typename StateModel, typename OpenList = StlUnsortedFIFO<NodeType>>
class StlBreadthFirstSearch : public GenericSearch<NodeType, 
                                                   OpenList,
                                                   StlUnorderedMapClosedList<NodeType>, 
                                                   StateModel>
{
public:
	typedef StlUnorderedMapClosedList<NodeType> ClosedList;
	typedef GenericSearch<NodeType, OpenList, ClosedList, StateModel> BaseClass;

	//! The constructor requires the user of the algorithm to inject both
	//! (1) the state model to be used in the search
	//! (2) the particular open and closed list objects
	StlBreadthFirstSearch(const StateModel& model, OpenList* open) :
		BaseClass(model, open, new ClosedList())
	{}
	
	//! For convenience, a constructor where the open list is default-constructed
	StlBreadthFirstSearch(const StateModel& model) :
		StlBreadthFirstSearch(model, new OpenList())
	{}
	
	virtual ~StlBreadthFirstSearch() = default;
	
	// Disallow copy, but allow move
	StlBreadthFirstSearch(const StlBreadthFirstSearch& other) = delete;
	StlBreadthFirstSearch(StlBreadthFirstSearch&& other) = default;
	StlBreadthFirstSearch& operator=(const StlBreadthFirstSearch& rhs) = delete;
	StlBreadthFirstSearch& operator=(StlBreadthFirstSearch&& rhs) = default;	
}; 

}
