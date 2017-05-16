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

#ifndef __CLOSED_LIST__
#define __CLOSED_LIST__

#include <set>
#include <unordered_map>
#include <utility>

namespace aptk {

namespace search {
enum class Node_Generation { Eager, Lazy};


template <typename Node, Node_Generation gen_opt = Node_Generation::Eager>
class Closed_List : public std::unordered_multimap< size_t, Node* > {
public:
typedef typename Node::State_Type						State;
typedef typename std::unordered_multimap< size_t, Node* >::iterator 		iterator;
typedef typename std::unordered_multimap< size_t, Node* >::const_iterator	const_iterator;

Node*	retrieve( Node* n ) {

    std::pair< iterator, iterator > range = ( !n->state() ? this->equal_range( n->hash() ) : this->equal_range( n->state()->hash() ));
    if ( range.first != range.second ) {
        bool in_closed = false;
        iterator it;
        for ( it = range.first; it != range.second; it++ )
            // if( n->state() ){
            // 	if ( (*it->second->state()) == (*n->state()) ) {
            // 		in_closed = true;
            // 		return it->second;
            // 	}
            // }
            // else
              {
                if ( (*it->second) == *n ) {
                    in_closed = true;
                    return it->second;
                }
            }
        if ( !in_closed && range.second != this->end() ) {

            // if( n->state() ){
            // 	const State& lhs = *(range.second->second->state());
            // 	if ( lhs == *(n->state()) ) return range.second->second;

            // }
            // else
                {
                const Node& lhs = *(range.second->second);
                if ( lhs == *n ) return range.second->second;
            }
        }
    }
    return NULL;
}

iterator retrieve_iterator( Node* n ) {
  std::pair< iterator, iterator > range = ( !n->state() ? this->equal_range( n->hash() ) : this->equal_range( n->state()->hash() ));

    if ( range.first != this->end() ) {
        bool in_closed = false;
        iterator it;
        for ( it = range.first; it != range.second; it++ )
            // if( n->state() ){
            // 	if ( (*it->second->state()) == (*n->state()) ) {
            // 		in_closed = true;
            // 		return it;
            // 	}
            // }
                //else
                {
                if ( (*it->second) == *n ) {
                    in_closed = true;
                    return it;
                }
            }
        if ( !in_closed && range.second != this->end() ) {
            // if( n->state() ){
            // 	const State& lhs = *(range.second->second->state());
            // 	if ( lhs == *(n->state()) ) return range.second;
            // }
            //else
            {
                const Node& lhs = *(range.second->second);
                if ( lhs == *n ) return range.second;
            }
        }
    }
    return this->end();
}

const_iterator retrieve_iterator( Node* n ) const {
    std::pair< iterator, iterator > range = ( ! n->state() ? this->equal_range( n->hash() ) : this->equal_range( n->state()->hash() ));

    if ( range.first != this->end() ) {
        bool in_closed = false;
        const_iterator it;
        for ( it = range.first; it != range.second; it++ )
            // if( n->state() ){
            // 	if ( (*it->second->state()) == (*n->state()) ) {
            // 		in_closed = true;
            // 		return it;
            // 	}
            // }
                //else
                {
                if ( (*it->second) == *n ) {
                    in_closed = true;
                    return it;
                }
            }
        if ( !in_closed && range.second != this->end() ) {
            // if( n->state() ){
            // 	const State& lhs = *(range.second->second->state());
            // 	if ( lhs == *(n->state()) ) return range.second;
            // }
            //else
               {
                const Node& lhs = *(range.second->second);
                if ( lhs == *n ) return range.second;
            }
        }
    }
    return this->end();
}

void	put( Node* n ) {
    if( ! n->state() )
        this->insert( std::make_pair( n->hash(), n ) );
    else
        this->insert( std::make_pair( n->state()->hash(), n ) );

}

void	put( iterator n ) {
    return this->put(n->second);

}

bool has_element(Node  * const n) {
    return nullptr != this->retrieve(n);
}

bool has_element(iterator it){
    return this->has_element(it->second);
}

static void delete_element(iterator it){
    delete it->second;
}

static void set_seen(iterator it){
    it->second->set_seen();
}

using std::unordered_multimap< size_t, Node* >::erase;

void erase(Node* n){
    this->erase(n->hash());
}

};


template <typename Node, Node_Generation gen_opt = Node_Generation::Eager>
class ClosedSet {

    struct Less{
        bool operator()( Node * const lhs,  Node * const rhs) const {
            return Node::less(*lhs, *rhs);
        }
    };

public:
    typedef typename Node::State_Type						State;
    typedef typename std::set< Node*, Less >::iterator 		iterator;
    typedef typename std::set< Node*, Less >::const_iterator	const_iterator;

    Node*	retrieve( Node* n ) {
        iterator it = closed.find(n);
        const bool is_in = it != closed.end();
        if (is_in)
            return *it;
        return nullptr;
    }

    iterator retrieve_iterator( Node* n ) {
        return closed.equal_range(n).first;
    }

    const_iterator retrieve_iterator( Node* n ) const {
        return closed.equal_range(n).first;
    }

    void	put( Node* n ) {
#ifdef DEBUG
        const bool is_in = has_element(n);
        if(is_in){
            std::cout << "already closed state " << n->state()->hash() << std::endl;
            //assert(! has_element(n));
        }
        assert(n->has_state());
#endif
        closed.insert(n);
    }

    void put (iterator it) {
        return this->put(*it);
    }

    iterator begin(){
        return closed.begin();
    }

    iterator end(){
        return closed.end();
    }

    const iterator end() const {
        return closed.end();
    }

    void clear(){
        return closed.clear();
    }

    void erase(iterator it){
        closed.erase(it);
    }

    void erase(Node* n){
        closed.erase(n);
    }

    bool empty() const {
        return closed.empty();
    }

    bool has_element(Node  * const n) const {
        const iterator it = closed.find(n);
        const iterator end = closed.end();
        return it != end;
    }

    bool has_element(iterator it){
        return this->has_element(*it);
    }

    typename std::set<State>::size_type size(){
        return closed.size();
    }

    static void delete_element(iterator it){
        delete *it;
    }

    static void set_seen(iterator it){
        (*it)->set_seen();
    }

private:
    std::set<Node*, Less> closed;

    size_t count(Node * n){
        return closed.count(n);
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
		this->insert( std::make_pair( n->hash(), n ) );
	}
};


}

}

#endif // closed_list.hxx
