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
#include <ext_math.hxx>

namespace aptk
{

namespace search {

template <typename Node>
class Node_Comparer
{             
public:
	bool operator()( Node* a, Node* b ) const {
		if ( dless( b->fn(), a->fn() ) ) return true;
		if( dequal( b->fn(), a->fn() ) ){					
			if ( dequal( b->hn(), a->hn() ) ) {
				if (dless(b->gn(),a->gn())) return true;
				return false;
			}
		}
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
		if( dequal( b->fn(), a->fn() ) ){
			if ( dless( b->h1n(), a->h1n() ) ) return true;
			if( dequal( b->h1n(), a->h1n() ) ){

				if ( dless( b->h2n(), a->h2n() ) ) return true;
			}
		}
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
    size_t      size(){return m_queue.size();}
	Node*       top(){ return m_queue.top(); }

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

	// MRJ: Open List allowing for nodes to be incrementally sorted when keys are updated. Wraps
	// Boost.Heap.Fibonacci_Heap, that implements Fibonacci heaps.
	//
	// In order to use these heaps, one needs to change the Search Node interface and is required
	// to make appropiate calls as explained below:
	//
	// 1) Interface requirements on Node classes
	//
	// The following types, attributes and methods need to be added:
	//
	// * Types:
	//
	// typedef	Fibonacci_Open_List< Node >	Open_List;
	//
	// This type is defined mostly for convenience and clarity.
	// 
	// * Attributes:
	//
	// Open_List::Handle	heap_handle;
	// Open_List*		current;
	//
	// Both attributes need to be public, as the method Fibonacci_Open_List<Node>::insert() will set
	// them respectively to the address of the node inside the heap and a pointer to the Fibonacci_Open_List
	// object (to allow the node to callback Fibonacci_Open_List<Node>::update() when necessary).
	// 
	// * Methods:
	//
	// bool	operator<( const Node& b ) const
	//
	// Boost heap libraries require this operator to be overloaded on heap element classes. Note that in order
	// to get an ascending ordering according to f(n1) < f(n2) - i.e. best first - the operator needs to return true whenever
	// f(n1) is greater than f(n2).
	//
	// void notify_update() { 
	//	if (current) current->update(this);
	// }
	//
	// This method needs to be called right after any changes are done to the values that govern the ordering of elements in
	// the heap (i.e. right after any changes in the value of f(n)). After calling this method, the heap is guaranteed to
	// be sorted.
	//
	// void detach() {
	//	if (current) current->erase(this);
	// }
	//
	// This methods allow to remove an element from the heap. After calling this method, the heap is guaranteed to be sorted.
	//
	// 2) Example
	// 
	// Below a very simple Node class example can be found
	/*
	class Node {
	public:
		typedef Fibonacci_Open_List< Node > 		Open_List;
	
		State			state;
		float			fn;
		Open_List::Handle	heap_handle;
		Open_List*		current;
		
		// NOTE: It is very important to make sure the pointer to the current heap is initialized to a known value.
		Node() 
		: current(nullptr) {
		}
	
		bool	operator<( const Node& b ) const {
			return fn > b.fn;
		}
	
		void notify_update( ) {
			assert( current != nullptr );
			if ( current )
				current->update( this ); 
		}
	
		void detach() {
			assert( current != nullptr );
			if ( current )
				current->erase( this );
		}
	};
	*/
	//
	// 3) Declaring open lists
	//
	// The easiest and cleanest way of defining open lists as members of classes implementing search algorithms is as 
	// follows:
	// 
	// i) Instantiate the following type
	//
	// typedef Node::Open_List	My_BFS_Open_List;
	//
	// ii) Declaring the attribute as
	//
	// My_BFS_Open_List	m_primary_open;

	template < class Node >
	class Fibonacci_Open_List
	{
		struct	compare_node {
			bool operator()( Node* n1, Node* n2 ) const {
				return *n1 < *n2;
			}
		};

		typedef typename	boost::heap::fibonacci_heap< Node*, boost::heap::compare<compare_node> > Container;

	 	Container m_queue;
		public:
		typedef	typename 	Container::handle_type		     Handle;
	
		typedef	Node		Node_Type;
	
		Fibonacci_Open_List();
		~Fibonacci_Open_List();
	
		void 				insert( Node* );
		void				update( Node* );
		Node* 				pop();
		bool				empty() const;
		float				min() const;
		void				clear();
		Node*				first();
		typename Container::ordered_iterator	
						begin() const 	{ return m_queue.ordered_begin(); }
		typename Container::ordered_iterator
						end() const	{ return m_queue.ordered_end(); }
		void				erase( Node* );	

	};
	
	template < class Node >
	Fibonacci_Open_List<Node>::Fibonacci_Open_List()
	{
	}
	
	template < typename Node >
	Fibonacci_Open_List<Node>::~Fibonacci_Open_List()
	{
	}
	
	template < typename Node >
	void	Fibonacci_Open_List<Node>::insert( Node* n )
	{
		typename Container::handle_type handle = m_queue.push( n );
		n->heap_handle = handle;
		n->current = this;
	}
		
	template < typename Node >
	void	Fibonacci_Open_List<Node>::update( Node* n )
	{
		m_queue.update( n->heap_handle );
	}

	template < typename Node >
	void	Fibonacci_Open_List<Node>::erase( Node* n )
	{
		m_queue.erase( n->heap_handle );
	}

	template <typename Node >
	Node*	Fibonacci_Open_List<Node>::pop()
	{
		if( empty() ) return NULL;
		Node* elem = m_queue.top();
		m_queue.pop();
		elem->current = nullptr;
		return elem;
	}
	
	template <typename Node >
	bool	Fibonacci_Open_List<Node>::empty() const
	{
		return m_queue.empty();
	}

	template <typename Node >
	Node*     Fibonacci_Open_List<Node>::first()
	{
		if ( empty() ) return nullptr;
		return m_queue.top();
	}

	template <typename Node >
	float     Fibonacci_Open_List<Node>::min() const
	{
		if ( empty() ) return std::numeric_limits<float>::max();
		return m_queue.top()->fn;
	}
	
	template <typename Node >
	void	Fibonacci_Open_List<Node>::clear() 
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
