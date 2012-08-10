/*
    Miguel Ramirez, Nir Lipovetzky, Hector Geffner
    C^3: A planner for the sequential, satisficing track of the IPC-6
    Copyright (C) 2008  

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
#ifndef __AIG_TK_BIT_SET__
#define __AIG_TK_BIT_SET__

#include <aptk/bit_array.hxx>
#include <iostream>
#include <cassert>
#include <limits>

namespace aptk
{

class Bit_Set
{
public:

	Bit_Set();
	Bit_Set( unsigned sz );
	~Bit_Set();

	void			reset();
	void 			resize( unsigned sz );
	void 			set( unsigned f );
	void			set_all();
	void 			unset( unsigned f );
	unsigned		isset( unsigned f ) const;
	unsigned		next( unsigned f );
	unsigned		first();

	Bit_Array&		bits();
	void			add( Bit_Set& other );
	void			set_intersection( Bit_Set& lhs, Bit_Set& rhs );

	bool			contains( Bit_Set& other );
	void			remove( Bit_Set& other );
	
	friend bool		do_intersect( Bit_Set& lhs, Bit_Set& rhs );

protected:

	Bit_Array		m_fset;
	unsigned		m_first;
};

inline void Bit_Set::set_all()
{
	m_first = 1;
	bits().set_all();
}

inline void Bit_Set::reset()
{
	m_fset.reset();	
}

inline void Bit_Set::resize(unsigned sz)
{
	m_fset.resize( sz );
}

inline void Bit_Set::set( unsigned f )
{
	m_fset.set(f);
	m_first = ( (m_first == 0 || f < m_first) ? f : m_first );
}

inline void Bit_Set::unset( unsigned f )
{
	m_fset.unset(f);
	if ( m_first == f )
	{
		m_first = 0;
		for ( unsigned i = 1; i < bits().max_index(); i++ )
		{
			m_first = ( m_fset[i] ? i : m_first );
			if ( m_first ) break;
		}
	}
}

inline unsigned Bit_Set::isset( unsigned f ) const
{
	return m_fset[f];
}

inline unsigned Bit_Set::first()
{
	return m_first;
}

inline unsigned Bit_Set::next(unsigned f)
{
	f++;
	for (; f < bits().max_index(); f++ )
		if ( bits()[f] ) return f;
	return 0;
}

inline Bit_Array& Bit_Set::bits( )
{
	return m_fset;
}

inline void Bit_Set::add( Bit_Set& other )
{
	assert( m_fset.max_index() >= other.m_fset.max_index() );
	for ( unsigned k = 0; k < other.bits().max_index(); k++ )
	{
		if (  other.isset(k) ) m_fset.set(k);
	}
	m_first = 0;
	for ( unsigned i = 1; i < bits().max_index(); i++ )
	{
		m_first = ( m_fset[i] ? i : m_first );
		if ( m_first ) break;
	}

}

inline void Bit_Set::set_intersection( Bit_Set& lhs, Bit_Set& rhs )
{
	assert( lhs.m_fset.max_index() == rhs.m_fset.max_index() && lhs.m_fset.max_index() == m_fset.max_index() );
	for ( unsigned k = 0; k < lhs.bits().max_index(); k++ )
	{
		if ( lhs.m_fset[k] && rhs.m_fset[k] ) m_fset.set(k);
	}
	m_first = 0;
	for ( unsigned i = 1; i < bits().max_index(); i++ )
	{
		m_first = ( m_fset[i] ? i : m_first );
		if ( m_first ) break;
	}

}

// Friend functions
inline bool do_intersect( Bit_Set& lhs, Bit_Set& rhs )
{
	assert( lhs.m_fset.max_index() == rhs.m_fset.max_index() );
	for ( unsigned k = 0; k < lhs.bits().max_index(); k++ )
		if ( lhs.m_fset[k] && rhs.m_fset[k] ) return true;
	return false;
}

inline bool Bit_Set::contains( Bit_Set& other )
{
	assert( other.m_fset.max_index() <= m_fset.max_index() );
	unsigned k = other.first();
	while ( k != 0 )
	{
		if ( !m_fset[k] ) return false;
		k = other.next(k);
	}	
	return true;
}

inline void Bit_Set::remove( Bit_Set& other )
{
	assert( other.m_fset.max_index() == m_fset.max_index() );
	unsigned k = other.first();
	while ( k != 0 )
	{
		m_fset.unset(k);
		k = other.next(k);
	}
	if ( other.m_first > m_first ) return;
	if ( !other.m_fset[m_first] ) return;
	m_first = 0;
	for ( unsigned i = 1; i < bits().max_index(); i++ )
	{
		m_first = ( m_fset[i] ? i : m_first );
		if ( m_first ) break;
	}
}


}

#endif // bitset.hxx
