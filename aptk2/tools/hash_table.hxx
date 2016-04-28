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

#pragma once

#include <vector>
#include <list>
#include <algorithm>
#include <jenkins_12bit.hxx>
#include <cassert>

namespace aptk
{

class Hash_Key
{
public:

	Hash_Key()
		: m_code(0)
	{
	}

	Hash_Key( const Hash_Key& other )
	{
		m_code = other.m_code;
	}

	const Hash_Key& operator=( const Hash_Key& other )
	{
		m_code = other.m_code;
		return *this;
	}

	~Hash_Key()
	{
	}

	template <typename ElementType>
	void	add ( const ElementType* key, size_t sz ) {
		assert( sizeof(ElementType) >= sizeof(unsigned) );
		const unsigned* ptr = (const unsigned*) key;
		size_t new_sz = sz * ( sizeof(ElementType)/sizeof(unsigned) );
		for ( unsigned i = 0; i < new_sz; i++ )
			add( ptr[i] );

	}
	
	void 	add( unsigned k );
	void 	add( std::vector<unsigned>& k );
	void 	add( const Bit_Array& bits );

	operator size_t() const
	{
		return m_code;
	}

protected:

	unsigned	m_code;

};

inline void Hash_Key::add( unsigned k )
{
	m_code = jenkins_hash( (ub1*)&k, sizeof(unsigned), m_code );
}

inline void Hash_Key::add( std::vector<unsigned>& k )
{
	if ( k.empty() )
	{
		unsigned k2 = 0;
		m_code = jenkins_hash( (ub1*)&k2, sizeof(unsigned), m_code );
		return;
	}

	std::sort( k.begin(), k.end() );
	m_code = jenkins_hash( (ub1*)(&k[0]), sizeof(unsigned), m_code );
	for ( unsigned i = 1; i < k.size(); i++ )
	{
		m_code = jenkins_hash( (ub1*)(&k[i]), sizeof(unsigned), m_code );
	}	
	
}

inline void Hash_Key::add( const Bit_Array& k )
{
	m_code = jenkins_hash( (ub1*)(&k.packs()[0]), sizeof(unsigned), m_code );
	for ( unsigned i = 1; i < k.npacks(); i++ )
	{
		m_code = jenkins_hash( (ub1*)(&k.packs()[i]), sizeof(unsigned), m_code );
	}	
	
}

template <typename T>
class Hash_Table
{
public:
	typedef T								Object;
	typedef std::list< std::pair< unsigned, Object* > > 			Node_List;
	typedef std::vector< Node_List > 					Table;

	Hash_Table( unsigned hash_sz );
	~Hash_Table();

        void setOwner(bool o) { m_owner = o; } 	
	void clear();

	/*	
	size_t compute_hash( std::vector<unsigned>& atoms) const
	{
		if ( atoms.empty() )
		{
			unsigned k = 0;
			unsigned h = jenkins_hash( (ub1*)&k, sizeof(unsigned), 0 );
			return h;
		}

		std::sort( atoms.begin(), atoms.end() );
		unsigned h = jenkins_hash( (ub1*)(&atoms[0]), sizeof(unsigned), 0 );
		for ( unsigned i = 1; i < atoms.size(); i++ )
		{
			h = jenkins_hash( (ub1*)(&atoms[i]), sizeof(unsigned), h );
		}	
		return h;
	}
	*/
	Object* get_element( Hash_Key& h, Object* other ){ return get_element( (size_t)h, other ); }
	Object* get_element( unsigned h, Object* other )
	{
		assert( m_buckets.size() > 0 );
		unsigned address = h & ( m_buckets.size()-1 );
	
		for ( typename Node_List::iterator i = m_buckets[address].begin();
			i != m_buckets[address].end(); i++ )
			if ( i->first == h )
			{
			       	if( *other == *(i->second) )  
				{
				       	return i->second;
				}
			}
		return NULL;
	}	

        void add_element( Hash_Key& h, Object* obj ){ add_element( (size_t)h, obj );  }
	void add_element( unsigned h, Object* obj )
	{
		unsigned address = h & ( m_buckets.size() - 1);
		m_buckets[address].push_back( std::make_pair( h, obj ) );
	}

        void remove_element( Hash_Key& h, Object* obj ){ remove_element( (size_t)h, obj );  }
	void remove_element( unsigned h, Object* obj )
	{
		unsigned address = h & ( m_buckets.size() - 1);
		
		typename  Node_List::iterator p = m_buckets[address].end();
		for ( typename Node_List::iterator i = m_buckets[address].begin();
			i != m_buckets[address].end(); i++ )
		{
			if ( i->first == h && ( *obj == *(i->second)) ) // element found
			{
                                if (m_owner)
                                        delete i->second;
				p = i;
				break;
			}
		}	
		if ( p != m_buckets[address].end() )
			m_buckets[address].erase( p );
	}
	
protected:
	Table 		m_buckets;

        // delete on clear/remove/etc ?
        bool           m_owner;

};

// Inlined methods
template <typename T>
Hash_Table<T>::Hash_Table( unsigned hash_sz )
{
        m_owner = true;
	m_buckets.resize(hash_sz);
}

template <typename T>
Hash_Table<T>::~Hash_Table()
{
	for ( unsigned i = 0; i < m_buckets.size(); i++ )
	{
                if(m_owner)
                        for ( typename Node_List::iterator it = m_buckets[i].begin();
                              it != m_buckets[i].end(); it++ )
                                delete it->second;
		m_buckets[i].clear();	
	}
	m_buckets.clear();
}

template <typename T>
void Hash_Table<T>::clear()
{
	for ( unsigned i = 0; i < m_buckets.size(); i++ )
	{
                if(m_owner)
                        for ( typename Node_List::iterator it = m_buckets[i].begin();
                              it != m_buckets[i].end(); it++ )
                                delete it->second;
		m_buckets[i].clear();	
	}
}

}
