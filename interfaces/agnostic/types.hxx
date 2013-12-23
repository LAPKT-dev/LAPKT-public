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

#ifndef __APTK_TYPES__
#define __APTK_TYPES__

#include <map>
#include <vector>
#include <limits>
#include <utility>
#include <aptk/bit_set.hxx>

namespace aptk
{

	class Action;
	class Fluent;
	class Conditional_Effect;
	
	
	typedef		std::vector<bool>				Bool_Vec;
	typedef		std::vector<bool*>				Bool_Vec_Ptr;
	typedef		std::vector<unsigned>				Fluent_Vec;
	typedef		std::vector<unsigned>				Index_Vec;
	typedef		std::vector<float>				Value_Vec;
	typedef		std::pair<unsigned, unsigned>			Fluent_Pair;
	typedef		Bit_Set						Fluent_Set;
	typedef 	std::vector<Action* >				Action_Ptr_Vec;
	typedef 	std::vector< const Action* >			Action_Ptr_Const_Vec;
	typedef 	std::vector<Fluent* >				Fluent_Ptr_Vec;
	typedef		std::vector<Conditional_Effect* > 		Conditional_Effect_Vec;
	typedef		std::vector< std::vector< const Action* > >	Fluent_Action_Table;
	typedef         std::vector< Action_Ptr_Vec >           	PDDLop_Action_Table;
	typedef		std::vector< Fluent_Ptr_Vec >	        	Type_Fluent_Table;
	typedef		std::vector< Fluent_Ptr_Vec >	        	Object_Fluent_Table;
	typedef		std::vector< std::pair<unsigned, unsigned> >   VarVal_Vec;


#define no_such_index  std::numeric_limits<unsigned>::max()
#define	infty          std::numeric_limits<float>::infinity()

	class Pair_Value_Table : public std::map< Fluent_Pair, unsigned >
	{
		typedef std::map< Fluent_Pair, unsigned >::iterator pv_iterator;
	public:

		unsigned get_value( unsigned p, unsigned q )
			{
				pv_iterator it = find( std::make_pair(p,q) );
				if ( it == end() ) return infty;
				return it->second;
			}

		void update_value( unsigned p, unsigned q, unsigned value )
			{
				pv_iterator it = find( std::make_pair(p,q) );
				if ( it == end() )
				{
					insert( std::make_pair( std::make_pair(p,q), value ) );
					return;
				}
				it->second = value;
		
			}
	};



}

#endif
