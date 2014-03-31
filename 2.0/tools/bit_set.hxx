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

#ifndef __AIG_TK_BIT_SET__
#define __AIG_TK_BIT_SET__

#include <bit_array.hxx>
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
	unsigned		next( unsigned f ) const;
	void			compute_first();
	unsigned		first() const;
	unsigned		end()	const;

	const Bit_Array&	bits() const;
	Bit_Array&		bits();	
	void			add( const Bit_Set& other );
	void			set_intersection( const Bit_Set& lhs, const Bit_Set& rhs );
	void			set_intersection( const Bit_Set& other );

	bool			contains( const Bit_Set& other ) const;
	void			remove( const Bit_Set& other );
	
	friend bool		do_intersect( const Bit_Set& lhs, const Bit_Set& rhs );

protected:

	Bit_Array		m_fset;
	unsigned		m_first;
};

inline void Bit_Set::set_all()
{
	m_first = 0;
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
}

inline void Bit_Set::unset( unsigned f )
{
	m_fset.unset(f);
}

inline unsigned Bit_Set::isset( unsigned f ) const
{
	return m_fset[f];
}

inline unsigned Bit_Set::first() const
{
	return m_first;
}

inline unsigned Bit_Set::next(unsigned f) const
{
	f++;
	for (; f < bits().max_index(); f++ )
		if ( bits()[f] ) return f;
	return end();
}

inline unsigned Bit_Set::end() const {
	return std::numeric_limits<unsigned>::max();
}

inline Bit_Array& Bit_Set::bits( )
{
	return m_fset;
}

inline const Bit_Array& Bit_Set::bits( ) const
{
	return m_fset;
}

inline void Bit_Set::add( const Bit_Set& other )
{
	assert( m_fset.max_index() >= other.m_fset.max_index() );
	for ( unsigned k = 0; k < other.bits().max_index(); k++ )
	{
		if (  other.isset(k) ) m_fset.set(k);
	}

}

inline void Bit_Set::set_intersection( const Bit_Set& lhs, const Bit_Set& rhs )
{
	assert( lhs.m_fset.max_index() == rhs.m_fset.max_index() && lhs.m_fset.max_index() == m_fset.max_index() );
	for ( unsigned k = 0; k < lhs.bits().max_index(); k++ )
	{
		if ( lhs.m_fset[k] && rhs.m_fset[k] ) m_fset.set(k);
	}

}

inline void Bit_Set::compute_first() {
	m_first = end();
	for ( unsigned i = 0; i < bits().max_index(); i++ )
	{
		m_first = ( m_fset[i] ? i : m_first );
		if ( m_first != end() ) break;
	}	
}

inline void Bit_Set::set_intersection( const Bit_Set& other )
{
	assert( m_fset.max_index() == other.m_fset.max_index()  );
	for ( unsigned k = 0; k < bits().max_index(); k++ )
	{
		if ( m_fset[k] && other.m_fset[k] ) m_fset.set(k);
		else if ( m_fset[k] && !other.m_fset[k] ) m_fset.unset(k);
	}
}


// Friend functions
inline bool do_intersect( const Bit_Set& lhs, const Bit_Set& rhs )
{
	assert( lhs.m_fset.max_index() == rhs.m_fset.max_index() );
	for ( unsigned k = 0; k < lhs.bits().max_index(); k++ )
		if ( lhs.m_fset[k] && rhs.m_fset[k] ) return true;
	return false;
}

inline bool Bit_Set::contains( const Bit_Set& other ) const
{
	assert( other.m_fset.max_index() <= m_fset.max_index() );
	unsigned k = other.first();
	while ( k != end() )
	{
		if ( !m_fset[k] ) return false;
		k = other.next(k);
	}	
	return true;
}

inline void Bit_Set::remove( const Bit_Set& other )
{
	assert( other.m_fset.max_index() == m_fset.max_index() );
	unsigned k = other.first();
	while ( k != end() )
	{
		m_fset.unset(k);
		k = other.next(k);
	}
}


}

#endif // bitset.hxx
