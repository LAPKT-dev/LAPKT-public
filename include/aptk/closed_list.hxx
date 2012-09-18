#ifndef __CLOSED_LIST__
#define __CLOSED_LIST__

#include <unordered_map>
#include <utility>

namespace aptk {

namespace search {

template <typename Node>
class Closed_List : public std::unordered_multimap< size_t, Node* > {
public:
	typedef typename Node::State_Type						State;
	typedef typename std::unordered_multimap< size_t, Node* >::iterator 		iterator;
	typedef typename std::unordered_multimap< size_t, Node* >::const_iterator	const_iterator;

	Node*	retrieve( Node* n ) {
		std::pair< iterator, iterator > range = equal_range( n->state()->hash() );
		if ( range.first != range.second ) {
			bool in_closed = false;
			iterator it;
			for ( it = range.first; it != range.second; it++ )
				if ( (*it->second->state()) == (*n->state()) ) {
					in_closed = true;
					return it->second;
				}	
			if ( !in_closed && range.second != this->end() ) {
				const State& lhs = *(range.second->second->state());
				if ( lhs == *(n->state()) ) return range.second->second;
			}
		}	
		return NULL;	
	}

	iterator retrieve_iterator( Node* n ) {
		std::pair< iterator, iterator> range = this->equal_range( n->state()->hash() );
		if ( range.first != this->end() ) {
			bool in_closed = false;
			iterator it;
			for ( it = range.first; it != range.second; it++ )
				if ( (*it->second->state()) == (*n->state()) ) {
					in_closed = true;
					return it;
				}	
			if ( !in_closed && range.second != this->end() ) {
				const State& lhs = *(range.second->second->state());
				if ( lhs == *(n->state()) ) return range.second;
			}
		}	
		return this->end();			
	}

	const_iterator retrieve_iterator( Node* n ) const {
		std::pair< const_iterator, const_iterator> range = this->equal_range( n->state()->hash() );
		if ( range.first != this->end() ) {
			bool in_closed = false;
			const_iterator it;
			for ( it = range.first; it != range.second; it++ )
				if ( (*it->second->state()) == (*n->state()) ) {
					in_closed = true;
					return it;
				}	
			if ( !in_closed && range.second != this->end() ) {
				const State& lhs = *(range.second->second->state());
				if ( lhs == *(n->state()) ) return range.second;
			}
		}	
		return this->end();			
	}

	void	put( Node* n ) {
		insert( std::make_pair( n->state()->hash(), n ) );
	}
};

template <typename Node>
class Lazy_Closed_List : public std::unordered_multimap< size_t, Node* > {
public:
	typedef typename Node::State_Type						State;
	typedef typename std::unordered_multimap< size_t, Node* >::iterator 		iterator;
	typedef typename std::unordered_multimap< size_t, Node* >::const_iterator	const_iterator;

	Node*	retrieve( Node* n ) {
		std::pair< iterator, iterator > range = equal_range( n->hash() );
		if ( range.first != range.second ) {
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
		}	
		return NULL;	
	}

	iterator retrieve_iterator( Node* n ) {
		std::pair< iterator, iterator> range = this->equal_range( n->hash() );
		if ( range.first != this->end() ) {
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
		}	
		return this->end();			
	}

	const_iterator retrieve_iterator( Node* n ) const {
		std::pair< const_iterator, const_iterator> range = this->equal_range( n->hash() );
		if ( range.first != this->end() ) {
			bool in_closed = false;
			const_iterator it;
			for ( it = range.first; it != range.second; it++ )
				if ( (*it->second) == *n ) {
					in_closed = true;
					return it;
				}	
			if ( !in_closed && range.second != this->end() ) {
				const State& lhs = *(range.second->second);
				if ( lhs == *n ) return range.second;
			}
		}	
		return this->end();			
	}

	void	put( Node* n ) {
		insert( std::make_pair( n->hash(), n ) );
	}
};


}

}

#endif // closed_list.hxx
