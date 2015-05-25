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

#ifndef __STL_UNORDERED_MAP_CLOSED_LIST__
#define __STL_UNORDERED_MAP_CLOSED_LIST__

#include <unordered_map>
#include <utility>
#include <aptk2/search/interfaces/closed_list.hxx>

namespace aptk {
	
	template < typename NodeType >
	class StlUnorderedMapClosedList : public ClosedList< 
							NodeType,
							std::unordered_multimap< 
								std::size_t, 
								std::shared_ptr<NodeType> > > {
	public:

		typedef		std::shared_ptr< NodeType >	NodePtrType;

		virtual ~StlUnorderedMapClosedList() {}

		virtual void put( NodePtrType n ) {
			this->insert( std::make_pair( n->hash(), n ) );
		}

		virtual bool check( const NodeType& n ) {
			auto range = this->equal_range( n.hash() );
			if  (range.first == range.second) return false; // Empty range
			for ( auto entry_it = range.first; entry_it != range.second; entry_it++ ) {
				const NodeType& other = *(entry_it->second);
				if ( other == n ) return true;
			}
			if ( range.second == this->end() ) return false;
			if ( *(range.second->second) == n ) return true;
			return false;
		}
		
		/*
		virtual NodeType* 
		retrieve( const NodeType& n ) { 
			auto range = this->equal_range( n.hash );
			if  (range.first == range.second) return nullptr; // Empty range
			for ( auto entry_it = range.first; entry_it != range.second; entry_it++ ) {
				const NodeType& other = entry_it->second;
				if ( other == n ) return &other;
			}
			if ( range.second == this->end() ) return nullptr;
			if ( range.second->second == n ) return &(range.second->second);
			return nullptr;
		}
		*/
	};
	

}

#endif // stl_unordered_map_closed_list.hxx
