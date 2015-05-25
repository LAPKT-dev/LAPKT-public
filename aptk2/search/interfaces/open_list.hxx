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

Concepts borrowed from Ethan Burns' heuristic search framework.
*/

#ifndef __OPEN_LIST__
#define __OPEN_LIST__

#include <memory>

namespace aptk {

	template < typename NodeType, typename ContainerType >
	class OpenList : public ContainerType {

	public :
		typedef std::shared_ptr<NodeType>		NodePtrType;

		virtual	~OpenList() { }

		//! Add a node to the open list. Note that this requires
		//! a rvalue, i.e. the caller is passing ownership of the
		//! node to the OpenList
		virtual void insert( NodePtrType n ) = 0;
			
		//! Gets the next node from the open list. Note that this
		//! returns a rvalue, so the caller gets ownership of the
		//! node
		virtual NodePtrType get_next( ) = 0;

		//! Returns true if there are no more nodes to be processed
		virtual bool	is_empty() = 0;

	};
	
}


#endif // open_list.hxx

