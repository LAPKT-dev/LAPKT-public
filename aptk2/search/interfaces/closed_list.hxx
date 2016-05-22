/*
Lightweight Automated Planning Toolkit
Copyright (C) 2015

<contributors>
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>
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

#include <utility>
#include <memory>

namespace aptk {

	template <typename NodeType, typename ContainerType>
	class ClosedList : public ContainerType {
	public:
		typedef std::shared_ptr< NodeType >		NodePtrType;

		virtual	~ClosedList() {}

		//! Add a node to the open list. Note that this requires
		//! a rvalue, i.e. the caller is passing ownership of the
		//! node to the ClosedList
		virtual void	put( NodePtrType n ) = 0;

		//! Checks whether there's an entry for the given node
		virtual	bool		check( const NodeType& n ) = 0;

	};

}
