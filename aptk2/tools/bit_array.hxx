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

#include <cstring>
#include <cassert>

namespace aptk
{

class Bit_Array
{
public:

	typedef unsigned long int	Index;

	explicit Bit_Array();
	Bit_Array( Index dim );
	Bit_Array( const Bit_Array& other );
	Bit_Array( Bit_Array&& other );
	~Bit_Array();

	const Bit_Array& operator=( Bit_Array&& other );
	const Bit_Array& operator=( const Bit_Array& other );

	void resize( Index dim );

	Index* packs()
	{
		return m_packs;
	}

	const Index* packs() const
	{
		return m_packs;
	}

	unsigned npacks() const
	{
		return m_n_packs;
	}

	unsigned max_index() const
	{
		return m_max_idx;
	}
	
	unsigned size() const // in bytes
	{
		return m_n_packs*sizeof(Index);
	}

	void set_all()
	{
		memset( m_packs, 0xFFFFFFFF,  m_n_packs*sizeof(Index) );
	}

	void reset()
	{
		memset( m_packs, 0, m_n_packs*sizeof(Index) );
	}	

	bool equal( const Bit_Array& other ) const
	{
		for ( unsigned i = 0; i < m_n_packs; i++ )
			if ( m_packs[i] != other.m_packs[i] )
				return false;
		return true;
	}
	
	void set( Index i )
	{
		assert( m_packs != nullptr );
                assert(  i <= m_max_idx );
		Index base = i;
		Index index = base/sizeof(Index);
		Index offset = base%sizeof(Index);
		m_packs[index] |= (1 << offset);
	}
       
        void set( const Bit_Array &other )
        {
	  for ( unsigned i = 0; i < m_n_packs; i++ )
	    m_packs[i] |= other.m_packs[i];
	}

	void unset( Index i )
	{
                assert( i <= m_max_idx );
		Index base = i;
		Index index = base/sizeof(Index);
		Index offset = base%sizeof(Index);
		m_packs[index] &= ~(1 << offset);
	}


        void unset( Bit_Array &other )
        {
	        for ( unsigned i = 0; i < m_n_packs; i++ )
		  m_packs[i] &= ~(other.m_packs[i]);
	}


	bool isset( Index i ) const
	{
                assert( i <= m_max_idx );
		return m_packs[i/sizeof(Index)] & 1 << (i%sizeof(Index));
	}

	bool operator[]( Index i ) const
	{
		return m_packs[i/sizeof(Index)] & 1 << (i%sizeof(Index));
	}

	int count_elements()
	{
		int count = 0;
		for ( unsigned i = 0; i < m_max_idx; i++ )
			if ( isset( i ) ) count++;			
		return count;
		
	}

	size_t	nbytes() const { return m_n_packs*sizeof(Index) + 2*sizeof(Index) + sizeof(Index*); }	
protected:
	Index*      m_packs;
	Index       m_n_packs;
	Index       m_pack_sz;
	Index       m_max_idx;

};

}
