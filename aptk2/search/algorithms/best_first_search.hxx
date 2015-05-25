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
#ifndef __BEST_FIRST_SEARCH__
#define __BEST_FIRST_SEARCH__

#include <aptk2/search/algorithms/generic_search.hxx>
#include <aptk2/search/components/sorted_open_list_impl.hxx>
#include <aptk2/search/components/closed_list_impl.hxx>

namespace aptk {

	//! Partial specialization, type of node and state model are left to be defined
	template < typename NodeType, typename Heuristic, typename StateModel >
	class StlBestFirstSearch : public GenericSearch< NodeType, 
							StlSortedOpenList< NodeType, Heuristic > , 
							StlUnorderedMapClosedList< NodeType >, 
							StateModel > {

	public:
		typedef GenericSearch< 	NodeType, 
					StlSortedOpenList< NodeType, Heuristic >, 
					StlUnorderedMapClosedList<NodeType>, 
					StateModel >	BaseClass;
		
		StlBestFirstSearch( const StateModel& model ) :
			BaseClass(model), heuristic_function( model ) {
			BaseClass::open.set_heuristic( &heuristic_function );	
		}
		
		virtual ~StlBestFirstSearch() {}

		Heuristic 	heuristic_function;
	}; 

}

#endif // breadth_first_search.hxx
