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
