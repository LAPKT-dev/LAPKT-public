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

#ifndef __BIT_SQUARE_MATRIX__
#define __BIT_SQUARE_MATRIX__

#include <aptk/bit_array.hxx>

namespace aptk
{

class Bit_Square_Matrix
{
public:

	Bit_Square_Matrix()
		: m_data(NULL), m_N( 0 )
	{
	}
	
	Bit_Square_Matrix( unsigned N )
		: m_data(NULL), m_N( N )
	{
		resize( m_N*m_N );
	}

	Bit_Square_Matrix( Bit_Square_Matrix& other )
	{
		m_N = other.m_N;
		m_data = new Bit_Array( *(other.m_data) );
	}
	
	~Bit_Square_Matrix()
	{
		if ( m_data ) delete m_data;
	}

	void set_dim( unsigned N )
	{
		m_N = N;
	}
	
	void set( unsigned i, unsigned j )
	{
		m_data->set( i*m_N+j );
	}
	
	void unset( unsigned i, unsigned j )
	{
		m_data->unset( i*m_N+j);
	}

	unsigned isset( unsigned i, unsigned j )
	{
		return m_data->isset( i*m_N+j );
	}


	void resize( unsigned sz )
	{
		m_data = new Bit_Array(sz);
		m_data->reset();
	}
	
protected:
	Bit_Array*   m_data;
	unsigned     m_N;
};

}
#endif // square_matrix.hxx
