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

#ifndef __OPEN_LIST__
#define __OPEN_LIST__

#include <vector>
#include <queue>
#include <boost/heap/fibonacci_heap.hpp>
#include <aptk/ext_math.hxx>

namespace aptk
{

namespace search {

template <typename Node>
class Node_Comparer
{             
public:
	bool operator()( Node* a, Node* b ) const {
		if ( dless( b->fn(), a->fn() ) ) return true;
		if ( dless( b->hn(), a->hn() ) ) return true;
		return false;

		//return (dless(b->fn(), a->fn()) || (dequal(a->fn(), b->fn()) && dless(b->hn(), a->hn())));
	}
};          
 
template <typename Node>
class Node_Comparer_DH
{             
public:
	bool operator()( Node* a, Node* b ) const {
		if ( dless( b->fn(), a->fn() ) )  return true;
		if ( dless( b->h1n(), a->h1n() ) ) return true;
		if ( dless( b->h2n(), a->h2n() ) ) return true;
		return false;

		//return (dless(b->fn(), a->fn()) || (dequal(a->fn(), b->fn()) && dless(b->hn(), a->hn())));
	}
};   

template <typename Node>
class Node_Comparer_3H
{             
public:
	bool operator()( Node* a, Node* b ) const {
		if ( dless( b->h1n(), a->h1n() ) ) return true;
		if( dequal( b->h1n(), a->h1n() ) ){
			if ( dless( b->h2n(), a->h2n() ) ) return true;
			if( dequal( b->h2n(), a->h2n() ) ){
				if ( dless( b->h3n(), a->h3n() ) )  return true;
			}
		}
		//if ( dless( b->gn(), a->gn() ) )  return true;
		return false;

		//return (dless(b->fn(), a->fn()) || (dequal(a->fn(), b->fn()) && dless(b->hn(), a->hn())));
	}
};   
 
template < class Node_Comp, class Node >
class Open_List
{

        
	//std::priority< Node, std::vector< Node >, Node_Comp > m_queue;
public:

	typedef	Node		Node_Type;

	Open_List();
	~Open_List();

	void 		insert( Node* );
	Node* 		pop();
	bool		empty() const;
	float		min() const;
	void		clear();
	Node*           top(){ return m_queue.top(); }

private:

	std::priority_queue< Node*, std::vector< Node* >, Node_Comp > m_queue;
};

template < class Node_Comp, class Node >
Open_List<Node_Comp, Node>::Open_List()
{
}

template < typename Node_Comp, typename Node >
Open_List<Node_Comp, Node>::~Open_List()
{
}

template < typename Node_Comp, typename Node >
void	Open_List<Node_Comp, Node>::insert( Node* n )
{
	m_queue.push( n );
}

template <typename Node_Comp, typename Node >
Node*	Open_List<Node_Comp, Node>::pop()
{
        if( empty() ) return NULL;
	Node* elem = m_queue.top();
	m_queue.pop();
	return elem;
}

template < typename Node_Comp, typename Node >
bool	Open_List<Node_Comp, Node>::empty() const
{
	return m_queue.empty();
}

template < typename Node_Comp, typename Node >
float     Open_List<Node_Comp, Node>::min() const
{
	if ( empty() ) return 0.0f;
	return m_queue.top()->f;
}

template < typename Node_Comp, typename Node >
void	Open_List<Node_Comp, Node>::clear() 
{
	while ( !empty() )
	{
		Node* elem = pop();
		delete elem;
	}	
}

template < class Node_Comp, class Node >
class Fibonacci_Open_List
{
	boost::heap::fibonacci_heap<
					Node*,
					boost::heap::compare<Node_Comp> > m_queue;
public:

	typedef	Node		Node_Type;

	Fibonacci_Open_List();
	~Fibonacci_Open_List();

	void 		insert( Node* );
	Node* 		pop();
	bool		empty() const;
	float		min() const;
	void		clear();
};

template < class Node_Comp, class Node >
Fibonacci_Open_List<Node_Comp, Node>::Fibonacci_Open_List()
{
}

template < typename Node_Comp, typename Node >
Fibonacci_Open_List<Node_Comp, Node>::~Fibonacci_Open_List()
{
}

template < typename Node_Comp, typename Node >
void	Fibonacci_Open_List<Node_Comp, Node>::insert( Node* n )
{
	m_queue.push( n );
}

template <typename Node_Comp, typename Node >
Node*	Fibonacci_Open_List<Node_Comp, Node>::pop()
{
        if( empty() ) return NULL;
	Node* elem = m_queue.top();
	m_queue.pop();
	return elem;
}

template < typename Node_Comp, typename Node >
bool	Fibonacci_Open_List<Node_Comp, Node>::empty() const
{
	return m_queue.empty();
}

template < typename Node_Comp, typename Node >
float     Fibonacci_Open_List<Node_Comp, Node>::min() const
{
	if ( empty() ) return 0.0f;
	return m_queue.top()->f;
}

template < typename Node_Comp, typename Node >
void	Fibonacci_Open_List<Node_Comp, Node>::clear() 
{
	while ( !empty() )
	{
		Node* elem = pop();
		delete elem;
	}	
}


}

}

#endif // Open_List.hxx
