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

#ifndef __VARSET_Judy__
#define __VARSET_Judy__

#include <cstring>
#include <cassert>
#include <Judy.h>

namespace aptk
{

class Var_Set_Judy
{
public:
	Var_Set_Judy( int biggest_var_name );

	Var_Set_Judy( Var_Set_Judy& other );
	
	~Var_Set_Judy( );

	
	void reset()
	{
		if ( m_array == (Pvoid_t)NULL ) return;
		int res;
		J1FA( res, m_array );
		m_array = (Pvoid_t)NULL;
	}

	void set( Word_t var )
	{
		int res;
		J1S( res, m_array, (Word_t)var );
		//assert( res == 1 );
	}

	void unset( Word_t var )
	{
		int res;
		J1U( res, m_array, (Word_t)var );
		//assert( res == 1 );
	}

	int isset( Word_t var )
	{
		int res;
		J1T( res, m_array, var );
		return (int)res;
	}

	void copy( Var_Set_Judy& s )
	{
		int res;
		J1FA( res, s.m_array );
		Word_t i = 0;
		J1N( res, m_array, i );
		while ( res != 0 )
		{
			J1S( res, s.m_array, i );
			J1N( res, m_array, i );
		}
		
	}

	void set_complement()
	{
		int res;
		for ( int x = 1; x < m_max_var; x++ )
		{
			J1T( res, m_array, (Word_t)x );
			if ( res ) 
			{
				J1U( res, m_array, x );
			}
			else 
			{
				J1S( res, m_array, x );
			}
		}
	}

	void set_intersection( Var_Set_Judy& left, Var_Set_Judy& right )
	{
		int res;
		Word_t left_sz, right_sz;
		J1C( left_sz, left.m_array, 1, left.m_max_var );
		J1C( right_sz, right.m_array, 1, right.m_max_var );

		Pvoid_t* psmall;
		Pvoid_t* pbig;

		if ( left_sz >= right_sz )
		{
			psmall = &right.m_array;
			pbig = &left.m_array;
		}
		else
		{
			psmall = &left.m_array;
			pbig = &right.m_array;
		}
		
		Word_t i = 0;
		J1N( res, *psmall, i );
		while ( res != 0 )
		{
			J1T( res, *pbig, i );
			if ( res ) 
			{
				J1S( res, m_array, i );
			}
			J1N( res, *psmall, i );
		}
	}

	int  first()
	{
		int res;
		Word_t i = 0;
		J1N( res, m_array, i );
		if ( res == 0 ) return 0;
		else return i;
	}

	int next( int i )
	{
		int res;
		Word_t var = i;
		J1N( res, m_array, var );
		if ( res == 0 ) return res;
		return var;
	}

	void add( Var_Set_Judy& other )
	{
		int res;
		Word_t i = 0;
		J1N( res, other.m_array, i );
		while ( res != 0 )
		{
			J1S( res, m_array, i );
			J1N( res, other.m_array, i );
		}
	}

	void remove( Var_Set_Judy& other )
	{
		int res;
		Word_t i = 0;
		J1N( res, other.m_array, i );
		while ( res != 0 )
		{
			J1U( res, m_array, i );
			J1N( res, other.m_array, i );
		}
	}
	
	void set_union( Var_Set_Judy& left, Var_Set_Judy& right )
	{
		int res;
		Word_t i = 0;
		J1N( res, left.m_array, i );
		while ( res != 0 )
		{
			J1S( res, m_array, i );
			J1N( res, left.m_array, i );
		}
		i = 0;
		J1N( res, right.m_array, i );
		while ( res != 0 )
		{
			J1S( res, m_array, i );
			J1N( res, right.m_array, i );
		}		
	}

	void set_difference( Var_Set_Judy& left, Var_Set_Judy& right )
	{
		int res;
		Word_t i = 0;
		J1N( res, left.m_array, i );
		while ( res != 0 )
		{
			J1T( res, right.m_array, i );
			if ( res == 0 ) 
			{
				J1S( res, m_array, i );
			}
			J1N( res, left.m_array, i );
		}
		
	}

	int count_elements( )
	{
		int res;
		J1C(res, m_array, 1, m_max_var);
		return res;
	}
		
	void dump();
	
private:
	int            m_max_var;
	Pvoid_t        m_array;	
};

}

#endif // varset.hxx
