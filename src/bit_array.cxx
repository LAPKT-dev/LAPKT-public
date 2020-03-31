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
#include <aptk/bit_array.hxx>
#include <iostream>

namespace aptk
{

Bit_Array::Bit_Array()
	: m_packs( NULL ), m_n_packs(0), m_pack_sz( 32 ),  m_max_idx(0)
{
}

Bit_Array::Bit_Array( unsigned dim )
		: m_packs( NULL ), m_pack_sz(32)
{
	m_max_idx = dim+1;
	unsigned nbits = (dim+1);
	m_n_packs = (nbits+31)/32;
	m_packs = new unsigned [m_n_packs];
	memset( m_packs, 0, m_n_packs*sizeof(unsigned) );
}

Bit_Array::Bit_Array( const Bit_Array& other )
{
	m_pack_sz = 32;
	m_n_packs = other.m_n_packs;
	m_max_idx = other.m_max_idx;
	if(m_n_packs){
		m_packs = new unsigned [m_n_packs];
		memcpy( m_packs, other.m_packs, m_n_packs*sizeof(unsigned) );
	}
}

Bit_Array::Bit_Array( Bit_Array&& other ) 
{
	m_pack_sz = sizeof( unsigned );
	m_n_packs = other.m_n_packs;
	m_packs = other.m_packs;
	m_max_idx = other.m_max_idx;
	other.m_packs = nullptr;
}

const Bit_Array&	Bit_Array::operator=( Bit_Array&& other ) {
	m_pack_sz = sizeof( unsigned );
	m_n_packs = other.m_n_packs;
	if ( m_packs != nullptr ) delete m_packs;
	m_packs = other.m_packs;
	m_max_idx = other.m_max_idx;
	other.m_packs = nullptr;
	return *this;
}


const Bit_Array&	Bit_Array::operator=( const Bit_Array& other ) {
	m_pack_sz = sizeof( unsigned );
	m_n_packs = other.m_n_packs;
	if ( m_packs != nullptr ) delete m_packs;
	m_packs = new unsigned [m_n_packs];
	m_max_idx = other.m_max_idx;
	memcpy( m_packs, other.m_packs, m_n_packs*sizeof(unsigned) );
	return *this;
}

void Bit_Array::resize( unsigned dim )
{
	m_max_idx = dim+1;
	unsigned nbits = (dim+1);
	m_n_packs = (nbits/32)+1;
	m_packs = new unsigned[m_n_packs];
	memset( m_packs, 0, m_n_packs*sizeof(unsigned) );
}

Bit_Array::~Bit_Array()
{
	if ( m_packs != NULL )
		delete [] m_packs;
}

}
