
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


#ifndef __STL_UNSORTED_FIFO_OPEN_LIST__
#define __STL_UNSORTED_FIFO_OPEN_LIST__

#include <aptk2/search/interfaces/open_list.hxx>
#include <deque>
#include <cassert>

namespace aptk {
	
	template < typename NodeType >
	class StlUnsortedFIFO : public OpenList< std::deque< NodeType > > {
	public:

		virtual ~StlUnsortedFIFO() { }

		virtual	void 	insert( NodeType&& n ) {
			this->emplace_back( n );
		}

		virtual NodeType get_next( ) {
			assert( !is_empty() );
			NodeType next = std::move(this->front());
			this->pop_front();
			return next;
		}

		virtual bool is_empty() { 
			return this->empty();
		}
	};

}

#endif // stl_unsorted_fifo_open_list.hxx
