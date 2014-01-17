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

#include <aptk/varset_judy.hxx>
#include <iostream>

namespace aptk
{

Var_Set_Judy::Var_Set_Judy( int biggest_var_name )
{
	m_max_var = biggest_var_name;
	m_array = (Pvoid_t) NULL;	
}

Var_Set_Judy::Var_Set_Judy( Var_Set_Judy& other )
{
	m_max_var = other.m_max_var;
	copy( other );
}


Var_Set_Judy::~Var_Set_Judy()
{
	reset();
}

void Var_Set_Judy::dump()
{
	std::cout.flush();
	for ( int x = 1; x <= m_max_var; x++ )
		if ( isset(x) )
			std::cout << x << " ";
	std::cout.flush();
}

}
