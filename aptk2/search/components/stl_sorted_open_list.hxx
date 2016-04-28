
/*
Lightweight Automated Planning Toolkit
Copyright (C) 2015

<contributors>
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
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

#include <aptk2/search/interfaces/open_list.hxx>
#include <aptk2/search/components/stl_unordered_map_closed_list.hxx>
#include <queue>
#include <vector>
#include <cassert>
#include <functional>

namespace aptk {

	template < typename ElementType >
	class StlNodePointerAdapter {
	public:
		bool operator()( const ElementType& p1, const ElementType& p2 ) const {
			return (*p1) > (*p2) ;
		}
	};

	template < 	typename NodeType,
			typename Heuristic,
			typename Container = std::vector< std::shared_ptr< NodeType > >,
			typename Comparer = StlNodePointerAdapter< std::shared_ptr< NodeType > > >
	class StlSortedOpenList : public OpenList< 	NodeType,
							std::priority_queue< 	std::shared_ptr<NodeType>,
										Container,
										Comparer > > {
	public:
		typedef std::shared_ptr< NodeType >	NodePtrType;


		//! This binary predicate is used to decide when we need to update
		//! an already existing entry on Open
		class ReplaceWhen {
		public:

			bool	operator()( const NodeType& node_to_be_inserted, const NodeType& node_already_inserted ) const {
				return node_to_be_inserted.g < node_already_inserted.g;
			}
		};

		class ReplaceOperation {
		public:
			void operator()(NodePtrType replacee, NodePtrType replaced) const {
				//@TODO: Very important: updating g is correct provided that
				// the order of the nodes in the open list is not changed by
				// updating it. This is an open problem with the design,
				// and a more definitive solution needs to be found (soon).
				replaced->g = replacee->g;
				replaced->parent = replacee->parent;
			}
		};

		virtual ~StlSortedOpenList() { }

		virtual void 	set_heuristic ( Heuristic* h ) {
			_heuristic = h;
		}

		virtual	void 	insert( NodePtrType n ) {
			// Check whether there is n' in the open list
			// such that state(n) == state(n').
			// If it is the case, we just need to replace the
			// entry on the hash table if g(n) < g(n')

			if ( _already_in_open.update(n, ReplaceWhen(), ReplaceOperation() ) )
				return;

			n->evaluate_with( *_heuristic );
			if ( n->dead_end() ) return;
			this->push( n );
			_already_in_open.put( n );

		}

		virtual NodePtrType get_next( ) {
			assert( !is_empty() );
			NodePtrType next = this->top();
			this->pop();
			_already_in_open.remove( *next );
			return next;
		}

		virtual bool is_empty() {
			return this->empty();
		}

		Heuristic*																		_heuristic;
		StlUnorderedMapClosedList< NodeType >					_already_in_open;
	};

}
