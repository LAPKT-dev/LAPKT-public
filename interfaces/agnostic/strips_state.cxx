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
#include <aptk/resources_control.hxx>
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
	hasher.add( fluent_set().bits() );
	m_hash = (size_t)hasher;	
}

State* State::progress_through_df( const Action& a ) const
{
	assert( a.can_be_applied_on(*this) );

	State* succ = new State( problem() );

	succ->set( fluent_vec() );

	for ( auto p : a.add_vec() ) {
		if ( succ->entails(p) ) continue;
		succ->set(p);
	}

	//Add Conditional Effects
	if( !a.ceff_vec().empty() )
	{		
		for( unsigned i = 0; i < a.ceff_vec().size(); i++ )
		{
			Conditional_Effect* ce = a.ceff_vec()[i];
			if( ce->can_be_applied_on( *this ) ) {
				for ( auto p : ce->add_vec() ) 
					if ( !succ->entails(p) )
						succ->set(p);
			}
		}
	}

	return succ;
}


State* State::progress_through( const Action& a ) const
{

	assert( a.can_be_applied_on(*this) );
	State* succ = new State( problem() );
	succ->fluent_vec().reserve( m_fluent_vec.size() );


	for ( unsigned k = 0; k < m_fluent_vec.size(); k++ ) 
	{
		if ( a.retracts(m_fluent_vec[k]) ) 
			continue;
		if ( a.ceff_vec().empty() ) // it's not deleted by un-conditional effects, and there are no c.effs
			succ->set( m_fluent_vec[k] );
		//Check Conditional Effects
		bool retracts = false;
		for( unsigned i = 0; i < a.ceff_vec().size(); i++ )
		{
			Conditional_Effect* ce = a.ceff_vec()[i];
			if ( !ce->retracts( m_fluent_vec[k] ) ) // constant-time check
				continue;
			if( ce->can_be_applied_on( *this ) ) // linear-time check
			{
				retracts = true;
				break;
			}
		}
		if( retracts ) continue;
		succ->set( m_fluent_vec[k] );
	}

	
	succ->set( a.add_vec() );

	//Add Conditional Effects
	if( a.ceff_vec().empty() )
		return succ;

	for( unsigned i = 0; i < a.ceff_vec().size(); i++ )
	{
		Conditional_Effect* ce = a.ceff_vec()[i];
		if( !ce->can_be_applied_on( *this ) ) continue;
		succ->set( ce->add_vec() );
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

void State::progress_lazy_state(const Action* a, Fluent_Vec* added, Fluent_Vec* deleted){
	
	
	/**
	 * progress action
	 */
	Fluent_Vec::iterator it = m_fluent_vec.begin();
	while(it != m_fluent_vec.end() ){
		if( a->retracts(*it) ){
			if(deleted)
				deleted->push_back( *it );

			it = m_fluent_vec.erase( it );
		}
		else{
			//Check Conditional Effects
			bool retracts = false;
			for( unsigned i = 0; i < a->ceff_vec().size(); i++ ){
				Conditional_Effect* ce = a->ceff_vec()[i];
				if ( !ce->retracts( *it ) ) // constant-time check
					continue;
				if( ce->can_be_applied_on( *this ) ){ // linear-time check
					retracts = true;
					break;
				}
			}

			if( retracts ){
				if(deleted)
					deleted->push_back( *it );
	
				it = m_fluent_vec.erase( it );
			}
			else
				it++;					
		}
	}
			
	Fluent_Vec::const_iterator cit = a->add_vec().begin();
	while(cit != a->add_vec().end() ){
		if( ! this->entails(*cit) ){
			if(added)
				added->push_back( *cit );
			m_fluent_vec.push_back(*cit);
		}
		cit++;
	}
			
	for( unsigned i = 0; i < a->ceff_vec().size(); i++ ){
		Conditional_Effect* ce = a->ceff_vec()[i];
		if( !ce->can_be_applied_on( *this ) ) continue;

		cit = ce->add_vec().begin();
		while(cit != ce->add_vec().end() ){
			if( ! this->entails(*cit) ){
				if(added)
					added->push_back( *cit );
				m_fluent_vec.push_back(*cit);
			}
			cit++;
		}	
	}     

	/**
	 * If given, update the inclusion set
	 */

	if(added)
		for(it = added->begin(); it != added->end(); it++)
			this->set(*it);

	if(deleted)
		for(it = deleted->begin(); it != deleted->end(); it++)
			this->unset(*it);

}

void State::regress_lazy_state(const Action* a, Fluent_Vec* added, Fluent_Vec* deleted){

	Fluent_Vec::iterator it;
	/**
	 * If given, update the inclusion set
	 */
	if(added)
		for(it = added->begin(); it != added->end(); it++)
			this->unset(*it);

	if(deleted)
		for(it = deleted->begin(); it != deleted->end(); it++)
			this->set(*it);

	/**
	 * regress action
	 */
	it = m_fluent_vec.begin();
			
	while(it != m_fluent_vec.end() ){
		bool s_entails = this->entails( *it );
		if( s_entails ){
			it++;
		}
		else if( a->asserts( *it ) ) //if it wasn't true in prev state
			it = m_fluent_vec.erase( it );
		else{
			//Check Conditional Effects
			bool asserts = false;
			for( unsigned i = 0; i < a->ceff_vec().size(); i++ ){
				Conditional_Effect* ce = a->ceff_vec()[i];
				if ( !ce->asserts( *it ) ) // constant-time check
					continue;
				if( ce->can_be_applied_on( *this ) ){ // linear-time check
					asserts = true;
					break;
				}
			}
			if(asserts)
				it = m_fluent_vec.erase( it );
			else
				it++;					
		}
	}
			
	Fluent_Vec::const_iterator cit = a->del_vec().begin();
	while(cit != a->del_vec().end() ){
		if( this->entails( *cit ) )
			m_fluent_vec.push_back(*cit);
		cit++;
	}

	for( unsigned i = 0; i < a->ceff_vec().size(); i++ ){
		Conditional_Effect* ce = a->ceff_vec()[i];
		if( !ce->can_be_applied_on( *this ) ) continue;

		cit = ce->del_vec().begin();
		while(cit != ce->del_vec().end() ){
			if(  this->entails(*cit) )
				m_fluent_vec.push_back(*cit);
			cit++;
		}	
	}
		

}
	

void	State::print( std::ostream& os ) const {
	os << "(:state ";
	for ( auto p = m_fluent_vec.begin(); p != m_fluent_vec.end(); p++ ) {
		os << m_problem.fluents()[*p]->signature() << " ";
	}
	os << ")" << std::endl;
}

}

