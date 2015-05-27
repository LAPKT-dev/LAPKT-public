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

		virtual void remove( const NodeType& n ) {
			auto range = this->equal_range( n.hash() );
			assert( range.first != range.second); // This checks that n was in closed list

			for ( auto entry_it = range.first; entry_it != range.second; entry_it++ ) {
				if ( *(entry_it->second) == n ) {
					this->erase( entry_it ); // This is safe to do here because of the return below!
					return;
				}

			}
			assert( range.second != this->end() );
			if ( *(range.second->second) == n )
				this->erase( range.second);
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

		//! This method checks if there's already a node referring
		//! to the same state in the hash table. When that is the case, and
		//! pred evaluates to true for n and n', where n' is the other node
		//! found to be referring to the same state, n' is replaced and
		//! we return true to signal that n can be discarded by the caller.
		template < typename ReplacementPredicate, typename ReplacementOp >
		bool update( NodePtrType n, ReplacementPredicate pred, ReplacementOp op ) {
			auto range = this->equal_range( n->hash() );
			if  (range.first == range.second) return false; // Empty range
			for ( auto entry_it = range.first; entry_it != range.second; entry_it++ ) {
				NodePtrType other = entry_it->second;
				if ( *(other) == *(n)  ) {
					if ( pred( *n, *other) ) op( n, other);
					return true;
				}
			}
			if ( range.second == this->end() ) return false;
			NodePtrType last_guy = range.second->second;
			if ( *(last_guy) == *n ) {
					if ( pred(*n, *last_guy) ) op( n, last_guy );
					return true;
			}
			return false;
		}

	};


}

#endif // stl_unordered_map_closed_list.hxx
