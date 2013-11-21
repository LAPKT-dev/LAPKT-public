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

#include <strips_state.hxx>
#include <action.hxx>
#include <fluent.hxx>
#include <aptk/hash_table.hxx>
#include <iostream>
#include <cassert>

namespace aptk
{

State::State( const STRIPS_Problem& problem )
	: m_fluent_set( problem.num_fluents() ), m_problem( problem )
{
}

State::~State()
{
}

void	State::update_hash() {
	Hash_Key hasher;
	hasher.add( fluent_vec() );
	m_hash = (size_t)hasher;	
}

State* State::progress_through_df( const Action& a ) const
{
	assert( a.can_be_applied_on(*this) );

	State* succ = new State( problem() );


	succ->set( fluent_vec() );
	succ->set( a.add_vec() );

	//Add Conditional Effects
	if( !a.ceff_vec().empty() )
	{		
		for( unsigned i = 0; i < a.ceff_vec().size(); i++ )
		{
			Conditional_Effect* ce = a.ceff_vec()[i];
			if( ce->can_be_applied_on( *this ) )
				succ->set( ce->add_vec() );
		}
	}

	return succ;
}


State* State::progress_through( const Action& a ) const
{
	assert( a.can_be_applied_on(*this) );
	State* succ = new State( problem() );
	for ( unsigned k = 0; k < m_fluent_vec.size(); k++ ) 
	{
		if ( !a.retracts(m_fluent_vec[k]) ) 
		{

			//Check Conditional Effects
			if( !a.ceff_vec().empty() )
			{
				bool retracts = false;
				for( unsigned i = 0; i < a.ceff_vec().size() && !retracts; i++ )
				{
					Conditional_Effect* ce = a.ceff_vec()[i];
					if( ce->can_be_applied_on( *this ) )
						if( ce->retracts( m_fluent_vec[k] ) )
							retracts = true;
				}
				if( !retracts )
					succ->set( m_fluent_vec[k] );
			}
			else
				succ->set( m_fluent_vec[k] );
		}
	}

	
	succ->set( a.add_vec() );

	//Add Conditional Effects
	if( !a.ceff_vec().empty() )
	{		
		for( unsigned i = 0; i < a.ceff_vec().size(); i++ )
		{
			Conditional_Effect* ce = a.ceff_vec()[i];
			if( ce->can_be_applied_on( *this ) )
				succ->set( ce->add_vec() );
		}
	}

	return succ;
}

State* State::regress_through( const Action& a ) const
{
	if ( !a.can_be_regressed_from( *this ) )
		return NULL;

	State* succ = new State( problem() );
	for ( unsigned k = 0; k < m_fluent_vec.size(); k++ )
		if ( !a.asserts( m_fluent_vec[k] ) )
		{
			//Check Conditional Effects
			if( !a.ceff_vec().empty() )
			{
				bool asserts = false;
				for( unsigned i = 0; i < a.ceff_vec().size() && !asserts; i++ )
				{
					Conditional_Effect* ce = a.ceff_vec()[i];
					if( ce->can_be_applied_on( *this, true) )
						if( ce->asserts( m_fluent_vec[k] ) )
							asserts = true;
				}
				if( !asserts )
					succ->set( m_fluent_vec[k] );
			}
			else
				succ->set( m_fluent_vec[k] );
		}
	
	succ->set( a.prec_vec() );

	//Add Conditional Effects
	if( !a.ceff_vec().empty() )
	{		
		for( unsigned i = 0; i < a.ceff_vec().size(); i++ )
		{
			Conditional_Effect* ce = a.ceff_vec()[i];
			if( ce->can_be_applied_on( *this, true ) )
				succ->set( ce->prec_vec() );
		}
	}

	return succ;
}

void	State::print( std::ostream& os ) const {
	os << "(:state ";
	for ( auto p = m_fluent_vec.begin(); p != m_fluent_vec.end(); p++ ) {
		os << m_problem.fluents()[*p]->signature() << " ";
	}
	os << ")" << std::endl;
}

}

