/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

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

#ifndef __ALT_CLOSED_LIST__
#define __ALT_CLOSED_LIST__

#include <unordered_map>
#include <utility>

namespace aptk {

template <typename Node>
class Closed_List : public std::unordered_multimap< size_t, Node* > {
public:
	typedef typename Node::State_Type						State;
	typedef typename std::unordered_multimap< size_t, Node* >::iterator 		iterator;
	typedef typename std::unordered_multimap< size_t, Node* >::const_iterator	const_iterator;

	Node*	retrieve( Node* n ) {

		std::pair< iterator, iterator > range = this->equal_range( n->hash );
		if ( range.first == range.second ) return nullptr;
		bool in_closed = false;
		iterator it;
		for ( it = range.first; it != range.second; it++ )
			if ( (*it->second) == *n ) {
				in_closed = true;
				return it->second;
			}	
		if ( !in_closed && range.second != this->end() ) {
			const Node& lhs = *(range.second->second);
			if ( lhs == *n ) return range.second->second;
		}
		return nullptr;	
	}

	iterator retrieve_iterator( Node* n ) {
	  std::pair< iterator, iterator > range = this->equal_range( n->hash );
		
		if ( range.first == this->end() ) this->end();
		bool in_closed = false;
		iterator it;
		for ( it = range.first; it != range.second; it++ )
			if ( (*it->second) == *n ) {
				in_closed = true;
				return it;
			}	
		if ( !in_closed && range.second != this->end() ) {
			const Node& lhs = *(range.second->second);
			if ( lhs == *n ) return range.second;
		}
		return this->end();			
	}

	const_iterator retrieve_iterator( Node* n ) const {
		std::pair< iterator, iterator > range = this->equal_range( n->hash );

		if ( range.first == this->end() ) return this->end();
		bool in_closed = false;
		const_iterator it;
		for ( it = range.first; it != range.second; it++ )
			if ( (*it->second) == *n ) {
				in_closed = true;
				return it;
			}	
		if ( !in_closed && range.second != this->end() ) {
				const Node& lhs = *(range.second->second);
				if ( lhs == *n ) return range.second;
		}
		return this->end();			
	}

	void	put( Node* n ) {
		this->insert( std::make_pair( n->hash, n ) );
	}
};

}

#endif // alt_closed_list.hxx
