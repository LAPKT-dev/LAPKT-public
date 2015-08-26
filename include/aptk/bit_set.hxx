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

	void			reset();
	void 			resize( unsigned sz );
	void 			set( unsigned f );
	void			set_all();
	void 			unset( unsigned f );
	unsigned		isset( unsigned f ) const;
	unsigned		next( unsigned f ) const;

	const Bit_Array&	bits() const;
	Bit_Array&		bits();	
	void			add( const Bit_Set& other );
	void			set_intersection( const Bit_Set& lhs, const Bit_Set& rhs );
	void			set_intersection( const Bit_Set& other );
	void			set_union( const Bit_Set& other );

	bool			contains( const Bit_Set& other ) const;
	bool			intersects( const Bit_Set& other ) const;
	void			remove( const Bit_Set& other );
	
	friend bool		do_intersect( const Bit_Set& lhs, const Bit_Set& rhs );

	bool			operator==( const Bit_Set& other ) const {
		return m_fset == other.m_fset;
	}

	unsigned min_elem(int lb=0) const;
	unsigned min_missing(const Bit_Set& other) const;
	unsigned max_index() const;
	unsigned intersection_size(const Bit_Set& other) const;
	unsigned size() const;

	struct iterator {
		const Bit_Set& s;
		unsigned min;
		iterator(const Bit_Set& s_, unsigned lb=0): s(s_), min(s.min_elem(lb)){}
		unsigned operator*() const{ return min; }
		iterator& operator++() { min = s.min_elem(min+1); return *this; }
		bool operator==(const iterator& other) const { return &s == &other.s && min == other.min; } 
		bool operator!=(const iterator& other) const { return ! (*this == other); }
	};

	iterator begin() const { return iterator(*this, 0); }
	iterator end() const { return iterator(*this, m_fset.max_index()); }

	static int bits_in_word(unsigned w);

protected:

	Bit_Array		m_fset;

	static const int Mod37BitPosition[37];
	static const unsigned bit_count[256];
};

inline void Bit_Set::set_all()
{
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

inline unsigned Bit_Set::next(unsigned f) const
{
	return min_elem(f+1);
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

inline void Bit_Set::set_intersection( const Bit_Set& other )
{
	assert( m_fset.max_index() == other.m_fset.max_index()  );
	for ( unsigned k = 0; k < bits().max_index(); k++ )
	{
		if ( m_fset[k] && other.m_fset[k] ) m_fset.set(k);
		else if ( m_fset[k] && !other.m_fset[k] ) m_fset.unset(k);
	}
}

inline void Bit_Set::set_union( const Bit_Set& other ) {
	assert( m_fset.max_index() == other.m_fset.max_index()  );
	auto np = other.bits().npacks();
	auto op = other.bits().packs();
	for(unsigned p_idx = 0; p_idx < np; p_idx++) {
		m_fset.packs()[p_idx] |= op[p_idx];
	}
}

// Friend functions
inline bool do_intersect( const Bit_Set& lhs, const Bit_Set& rhs )
{
	assert( lhs.m_fset.max_index() == rhs.m_fset.max_index() );
	for ( unsigned k : lhs )
		if ( lhs.m_fset[k] && rhs.m_fset[k] ) return true;
	return false;
}

inline bool Bit_Set::contains( const Bit_Set& other ) const
{
	assert( other.m_fset.max_index() <= m_fset.max_index() );
	auto np = other.bits().npacks();
	auto op = other.bits().packs();
	for(unsigned p_idx = 0; p_idx < np; p_idx++) {
		if(~m_fset.packs()[p_idx] & op[p_idx])
			return false;
	}
	return true;

}

inline bool Bit_Set::intersects( const Bit_Set& other ) const
{
	assert( other.m_fset.max_index() <= m_fset.max_index() );
	auto np = other.bits().npacks();
	auto op = other.bits().packs();
	for(unsigned p_idx = 0; p_idx < np; p_idx++) {
		if(m_fset.packs()[p_idx] & op[p_idx])
			return true;
	}
	return false;
}

inline void Bit_Set::remove( const Bit_Set& other )
{
	assert( other.m_fset.max_index() == m_fset.max_index() );
	for ( unsigned k : other )
	{
		m_fset.unset(k);
		k = other.next(k);
	}
}

inline unsigned Bit_Set::min_elem(int lb) const {
	// https://graphics.stanford.edu/~seander/bithacks.html#ZerosOnRightModLookup
	auto packs = m_fset.packs();
	int last_pack = lb/32;
	int last_mask = (1 << (lb % 32)) - 1;
	for(unsigned i = last_pack; i < m_fset.npacks(); i++){
		if(packs[i] != 0){
			auto p = packs[i] & ~last_mask;
			if(p != 0)
				return 32 * i + Mod37BitPosition[(p & -p)%37];
			//The code above finds the number of zeros that are trailing on
			//the right, so binary 0100 would produce 2. It makes use of the
			//fact that the first 32 bit position values are relatively prime
			//with 37, so performing a modulus division with 37 gives a unique
			//number from 0 to 36 for each. These numbers may then be mapped
			//to the number of zeros using a small lookup table.
		}
		last_mask = 0;
	}
	return m_fset.max_index();
}

inline unsigned Bit_Set::min_missing(const Bit_Set& other ) const {
	assert( other.m_fset.max_index() == m_fset.max_index() );
	auto packs = m_fset.packs();
	auto opacks = other.m_fset.packs();

	for(unsigned i = 0; i < m_fset.npacks(); i++){
		auto p = opacks[i] & ~packs[i];
		if(p != 0){
			return 32 * i + Mod37BitPosition[(p & -p)%37];
		}
	}
	return max_index();
}

inline unsigned Bit_Set::max_index() const {
	return m_fset.max_index();
}

inline int Bit_Set::bits_in_word(unsigned p){
	return bit_count[p%256] +
		bit_count[(p>>8)%256] +
		bit_count[(p>>16)%256] +
		bit_count[(p>>24)%256];
}

inline unsigned Bit_Set::size() const {
	unsigned ret=0;
	auto packs = m_fset.packs();
	for(unsigned i = 0; i < m_fset.npacks(); i++){
		auto p = packs[i];
		ret += bits_in_word(p);
	}
	return ret;
}

inline unsigned Bit_Set::intersection_size(const Bit_Set& other ) const {
	unsigned ret=0;
	auto packs = m_fset.packs();
	auto opacks = other.m_fset.packs();
	assert(other.max_index() >= max_index());
	for(unsigned i = 0; i < m_fset.npacks(); i++){
		auto p = opacks[i] & packs[i];
		ret += bits_in_word(p);
	}
	return ret;
}

}

#endif // bitset.hxx
