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
#include <bit_array.hxx>
#include <iostream>
#include <cassert>

namespace aptk
{

Bit_Array::Bit_Array()
	: m_packs( nullptr ), m_n_packs(0), m_pack_sz( sizeof(Index) ), m_max_idx(0)
{
}

Bit_Array::Bit_Array( Index dim )
		: m_packs( nullptr ), m_pack_sz(sizeof(Index))
{
	m_max_idx = dim+1;
	Index nbits = (dim+1);
	m_n_packs = (nbits/sizeof(Index))+1;
	m_packs = new Index [m_n_packs];
	for ( unsigned k = 0; k < m_n_packs; k++ )
		m_packs[k] = 0;
}

Bit_Array::Bit_Array( const Bit_Array& other )
{
	m_pack_sz = sizeof(Index);
	m_n_packs = other.m_n_packs;
	m_packs = new Index [m_n_packs];
	m_max_idx = other.m_max_idx;
	for ( unsigned k = 0; k < m_n_packs; k++ )
		m_packs[k] = other.m_packs[k];
}

Bit_Array::Bit_Array( Bit_Array&& other ) 
{
	m_pack_sz = sizeof( Index );
	m_n_packs = other.m_n_packs;
	m_packs = other.m_packs;
	m_max_idx = other.m_max_idx;
	other.m_packs = nullptr;
}

const Bit_Array&	Bit_Array::operator=( Bit_Array&& other ) {
	m_pack_sz = sizeof( Index );
	m_n_packs = other.m_n_packs;
	if ( m_packs != nullptr ) delete m_packs;
	m_packs = other.m_packs;
	m_max_idx = other.m_max_idx;
	other.m_packs = nullptr;
	return *this;
}

void Bit_Array::resize( Index dim )
{
	m_max_idx = dim+1;
	Index nbits = (dim+1);
	m_n_packs = (nbits/sizeof(Index))+1;
	if ( m_packs != nullptr ) delete [] m_packs;
	m_packs = new Index[m_n_packs];
	for ( unsigned k = 0; k < m_n_packs; k++ )
		m_packs[k] = 0;
}

Bit_Array::~Bit_Array()
{
	assert( m_pack_sz == sizeof(Index) );
	assert( m_max_idx != 0 );
	assert( m_n_packs != 0 );
	if ( m_packs != nullptr ) {
		delete [] m_packs;
		m_packs = nullptr;
	}
}

}
