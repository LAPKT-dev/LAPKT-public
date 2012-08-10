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
	Conditional_Effect_Vec&    	ceff_vec(){ return m_cond_effects; }

	const Fluent_Vec&		prec_vec() const { return m_prec_vec; }
	const Fluent_Set&	        prec_set() const { return m_prec_set; }
	const Fluent_Vec&	        add_vec()  const { return m_add_vec; }
	const Fluent_Set&	        add_set()  const { return m_add_set; }
	const Fluent_Vec&	        del_vec()  const { return m_del_vec; }
	const Fluent_Set&	        del_set()  const { return m_del_set; }
	const Conditional_Effect_Vec&   ceff_vec() const { return m_cond_effects; }



	std::string	          	signature() const { return m_signature; }
	void		           	set_signature(std::string sig) { m_signature = sig; }

	std::string	           	name() const { return m_name; }
	void		           	set_name(std::string nam) { m_name = nam; }

	unsigned	           	index() const { return m_index; }
	void		           	set_index( unsigned idx ) { m_index = idx; }

	void		           	define( Fluent_Vec& precs, Fluent_Vec& adds, Fluent_Vec& dels );
	void		           	define( Fluent_Vec& precs, Fluent_Vec& adds, Fluent_Vec& dels, Conditional_Effect_Vec& ceffs );

	void		           	define_fluent_list( Fluent_Vec& in, Fluent_Vec& list, Fluent_Set& set );

	bool		           	requires( unsigned f ) const;
	bool		           	asserts( unsigned f ) const;
	bool		           	retracts( unsigned f ) const;
	bool		           	consumes( unsigned f ) const;

	bool		           	can_be_applied_on( const State& s, bool regress=false ) const ;

	void		           	set_cost( Cost_Type c ) { m_cost = c; }
	Cost_Type	           	cost() const { return m_cost; }

	void				print( const STRIPS_Problem& prob, std::ostream& ) const;		

	static bool	           	are_effect_interfering( const Action& a1, const Action& a2 );
	static bool	           	deletes_precondition_of( const Action& a1, const Action& a2 );
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
	Conditional_Effect_Vec		m_cond_effects;
	Cost_Type			m_cost;	
	unsigned			m_index;

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

inline bool	Action::can_be_applied_on( const State& s, bool regress ) const
{
	if ( regress ) 
	{
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

	return s.entails( prec_vec() );
}

inline bool	Action::consumes( unsigned f ) const
{
	return requires(f) && retracts(f);
}

}

#endif // Action.hxx
