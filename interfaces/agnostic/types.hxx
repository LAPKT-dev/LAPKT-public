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

	typedef         float                                		Cost_Type;
	
	
	typedef		std::vector<unsigned>				Fluent_Vec;
	typedef		std::vector<unsigned>				Index_Vec;
	typedef		std::vector<Cost_Type>				Value_Vec;
	typedef		std::pair<unsigned, unsigned>			Fluent_Pair;
	typedef		Bit_Set						Fluent_Set;
	typedef 	std::vector<Action* >				Action_Ptr_Vec;
	typedef 	std::vector<Fluent* >				Fluent_Ptr_Vec;
	typedef		std::vector<Conditional_Effect* > 		Conditional_Effect_Vec;
	typedef		std::vector< std::vector< const Action* > >	Fluent_Action_Table;
	typedef         std::vector< Action_Ptr_Vec >           	PDDLop_Action_Table;
	typedef		std::vector< Fluent_Ptr_Vec >	        	Type_Fluent_Table;
	typedef		std::vector< Fluent_Ptr_Vec >	        	Object_Fluent_Table;


#define no_such_index  std::numeric_limits<unsigned>::max()
#define	infty          std::numeric_limits<aptk::Cost_Type>::infinity()

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
