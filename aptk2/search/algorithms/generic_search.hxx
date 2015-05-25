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

#ifndef __BLIND_SEARCH__
#define __BLIND_SEARCH__

#include <aptk2/search/interfaces/search_algorithm.hxx>
#include <algorithm>

namespace aptk {

	//! This class implements the classic blind search algorithm, BlindSearch
	template < 	typename NodeType, 
			template < typename NodeType > class OpenList, 
			template < typename NodeType > class ClosedList, 
			typename StateModel >
	class BlindSearch : public SearchAlgorithm< StateModel > {
	public:
		typedef	SearchAlgorithm< StateModel >	BaseClass;
		typedef OpenList< NodeType >		OpenListType;
		typedef ClosedList< NodeType >		ClosedListType;
		typedef typename StateModel::StateType	State;

		BlindSearch( const StateModel& _model ) : 
			BaseClass( _model ) {
		}

		virtual ~BlindSearch() {}

		virtual bool search( const State& s, typename BaseClass::Plan& solution ) {
			NodeType n( s );
			open.insert( std::move(n) );
			BaseClass::generated++;

			while ( !open.is_empty() ) {
				NodeType current = open.get_next( );
				if ( closed.check( current ) )	
					continue;
				
				if ( BaseClass::model.goal( current.state ) ) {
					// Solution found, we're done
					retrieve_solution( current, solution );
					return true;
				}
					
				for ( auto a : BaseClass::model.applicable_actions( current.state ) ) {
					State s_a = BaseClass::model.next( current.state, a );
					NodeType succ( std::move(s_a), a, current );
					open.insert( std::move(succ) );
					BaseClass::generated++;
				}
				
	
				BaseClass::expanded++; // Count as an expansion
				closed.put( std::move(current) ); // This needs to go last, since we transfer ownership	
			}
			return false;
		}

		virtual	void retrieve_solution( const NodeType& n, typename BaseClass::Plan& solution ) {
			const NodeType* tmp = &n;
			while ( tmp->has_parent() ) {
				solution.push_back( tmp->action );
				tmp = tmp->parent;
			} 
			std::reverse( solution.begin(), solution.end() );
		}


		OpenListType	open;
		ClosedListType	closed;

	};

}

#endif // blind_search.hxx
