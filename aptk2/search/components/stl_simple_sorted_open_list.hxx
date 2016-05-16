
/*
Lightweight Automated Planning Toolkit
Copyright (C) 2016

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


#ifndef __STL_SIMPLE_SORTED_OPEN_LIST__
#define __STL_SIMPLE_SORTED_OPEN_LIST__

#include <aptk2/search/interfaces/open_list.hxx>
#include <queue>
#include <vector>
#include <cassert>
#include <functional>

namespace aptk {

	template < 	typename NodeType,
			typename Container = std::vector< std::shared_ptr< NodeType > >,
			typename Comparer = StlNodePointerAdapter< std::shared_ptr< NodeType > > >
	class StlSimpleSortedOpenList : public OpenList< 	NodeType,
							std::priority_queue< 	std::shared_ptr<NodeType>,
										Container,
										Comparer > > {
	public:
		typedef std::shared_ptr< NodeType >	NodePtrType;

		virtual ~StlSimpleSortedOpenList() { }

		virtual	void 	insert( NodePtrType n ) {
			this->push( n );
		}

		virtual NodePtrType get_next( ) {
			assert( !is_empty() );
			NodePtrType next = this->top();
			this->pop();
			return next;
		}

		virtual bool is_empty() {
			return this->empty();
		}
	};

}

#endif // stl_sorted_open_list.hxx