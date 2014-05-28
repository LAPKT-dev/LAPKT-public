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

#ifndef __APTK_ACTION__
#define __APTK_ACTION__

#include <types.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <cond_eff.hxx>
#include <iosfwd>

namespace aptk
{

class Action
{
public:
	Action(STRIPS_Problem& p);
	virtual ~Action();

	Fluent_Vec&	           	prec_vec() { return m_prec_vec; }
	Fluent_Set&	           	prec_set() { return m_prec_set; }
	Fluent_Vec&	           	add_vec()  { return m_add_vec; }
	Fluent_Set&	           	add_set()  { return m_add_set; }
	Fluent_Vec&	           	del_vec()  { return m_del_vec; }
	Fluent_Set&	           	del_set()  { return m_del_set; }
	Fluent_Vec&	           	edel_vec()  { return m_edel_vec; }
	Fluent_Set&	           	edel_set()  { return m_edel_set; }
	Conditional_Effect_Vec&    	ceff_vec(){ return m_cond_effects; }

	const Fluent_Vec&		prec_vec() const { return m_prec_vec; }
	const Fluent_Set&	        prec_set() const { return m_prec_set; }
	const Fluent_Vec&	        add_vec()  const { return m_add_vec; }
	const Fluent_Set&	        add_set()  const { return m_add_set; }
	const Fluent_Vec&	        del_vec()  const { return m_del_vec; }
	const Fluent_Set&	        del_set()  const { return m_del_set; }
	const Fluent_Vec&	        edel_vec()  const { return m_edel_vec; }
	const Fluent_Set&	        edel_set()  const { return m_edel_set; }
	const Conditional_Effect_Vec&   ceff_vec() const { return m_cond_effects; }
	
        bool                            has_ceff() const {return !m_cond_effects.empty(); }
	/* Added for match trees */
	VarVal_Vec&        prec_varval() { return m_prec_varval; }
	const VarVal_Vec&  prec_varval() const { return m_prec_varval; }



	std::string	          	signature() const { return m_signature; }
	void		           	set_signature(std::string sig) { m_signature = sig; }

	std::string	           	name() const { return m_name; }
	void		           	set_name(std::string nam) { m_name = nam; }

	unsigned	           	index() const { return m_index; }
	void		           	set_index( unsigned idx ) { m_index = idx; }

	void		           	define( const Fluent_Vec& precs, const Fluent_Vec& adds, const Fluent_Vec& dels );
	void		           	define( const Fluent_Vec& precs, const Fluent_Vec& adds, const Fluent_Vec& dels, const Conditional_Effect_Vec& ceffs );

	void		           	define_fluent_list( const Fluent_Vec& in, Fluent_Vec& list, Fluent_Set& set );

	bool		           	requires( unsigned f ) const;
	bool		           	asserts( unsigned f ) const;
	bool		           	retracts( unsigned f ) const;
	bool		           	consumes( unsigned f ) const;
	bool		           	edeletes( unsigned f ) const;

	bool		           	can_be_applied_on( const State& s ) const ;
	bool				can_be_regressed_from( const State& s ) const;

	void		           	set_cost( float c ) { m_cost = c; }
	float		           	cost() const { return m_cost; }

	bool				active() const { return m_active; }
	void				activate() { m_active = true; }
	void				deactivate() { m_active = false; }

	void				print( const STRIPS_Problem& prob, std::ostream& ) const;		

	static bool	           	are_effect_interfering( const Action& a1, const Action& a2 );
	static bool	           	deletes_precondition_of( const Action& a1, const Action& a2 );
	static bool	           	deletes_precondition_of( const Action& a1, const Action& a2, Fluent_Vec& deleted );

	static bool	           	possible_supporter( const Action& a1, const Action& a2, Fluent_Vec& pvec );
protected:
	// Preconditions and Effects ( Adds and Deletes)
	std::string			m_signature;
	std::string			m_name;
	Fluent_Vec			m_prec_vec;
	Fluent_Set			m_prec_set;
	Fluent_Vec			m_add_vec;
	Fluent_Set			m_add_set;
	Fluent_Vec			m_del_vec;
	Fluent_Set			m_del_set;
	Fluent_Vec			m_edel_vec;
	Fluent_Set			m_edel_set;
	VarVal_Vec			m_prec_varval;
	Conditional_Effect_Vec		m_cond_effects;
	float				m_cost;	
	unsigned			m_index;
	bool				m_active;

};



inline bool	Action::possible_supporter( const Action& a1, const Action& a2, Fluent_Vec& pvec )
{
	pvec.clear();
	for ( unsigned k = 0; k < a1.add_vec().size(); k++ )
		if ( a2.requires( a1.add_vec()[k] ) )
			pvec.push_back( a1.add_vec()[k] );
	return !pvec.empty();
}

inline bool	Action::deletes_precondition_of( const Action& a1, const Action& a2 )
{
	for ( unsigned k = 0; k < a1.del_vec().size(); k++ )
		if ( a2.requires( a1.del_vec()[k]) )
			return true;

	return false;
}

inline bool	Action::deletes_precondition_of( const Action& a1, const Action& a2, Fluent_Vec& deleted )
{
	for ( unsigned k = 0; k < a1.del_vec().size(); k++ )
		if ( a2.requires( a1.del_vec()[k]) )
			deleted.push_back( a1.del_vec()[k] );

	return !deleted.empty();
}

inline bool	Action::are_effect_interfering( const Action& a1, const Action& a2 )
{
	for ( unsigned k = 0; k < a1.add_vec().size(); k++ )
		if ( a2.retracts( a1.add_vec()[k] ) )
			return true;
	for ( unsigned k = 0; k < a1.del_vec().size(); k++ )
		if ( a2.asserts( a1.del_vec()[k] ) )
			return true;
	return false;
}

inline bool	Action::requires( unsigned f ) const
{
	return prec_set().isset(f);
}

inline bool	Action::asserts( unsigned f ) const 
{
	return add_set().isset(f);
}

inline bool	Action::retracts( unsigned f ) const
{
	return del_set().isset(f);
}

inline bool	Action::edeletes( unsigned f ) const
{
	return edel_set().isset(f);
}

inline bool	Action::can_be_regressed_from( const State& s ) const {
	// Relevance testing
	bool relevant = false;
	for ( unsigned k = 0; k < add_vec().size() && !relevant; k++ )
		if ( s.entails( add_vec()[k] ) ) relevant = true;		
	
	for( unsigned i = 0; i < ceff_vec().size() && !relevant; i++ )
	{
		for ( unsigned k = 0; k < ceff_vec()[i]->add_vec().size() && !relevant; k++ )
			if( s.entails( ceff_vec()[i]->add_vec()[k] ) )
				relevant = true;
	}
	
	
	if (!relevant) return false;
	// Now test if no deletes from a are entailed by s
	for ( unsigned k = 0; k < del_vec().size(); k++ )
		if ( s.entails( del_vec()[k] ) ) return false;

	for( unsigned i = 0; i < ceff_vec().size(); i++ )
	{
		for ( unsigned k = 0; k < ceff_vec()[i]->del_vec().size(); k++ )
			if( s.entails( ceff_vec()[i]->del_vec()[k] ) )
				return false;
		
	}

	return true;
}

inline bool	Action::can_be_applied_on( const State& s ) const
{
	return s.entails( prec_vec() );
}

inline bool	Action::consumes( unsigned f ) const
{
	return requires(f) && retracts(f);
}

}

#endif // Action.hxx
