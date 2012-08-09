#include <action.hxx>

namespace aptk 
{

Action::Action( STRIPS_Problem& p )
	: m_cost( 1 )
{
	prec_set().resize( p.num_fluents() + 1 );
	add_set().resize( p.num_fluents() + 1 );
	del_set().resize( p.num_fluents() + 1 );
}

Action::~Action()
{
}

void Action::define( Fluent_Vec& precs, Fluent_Vec& adds, Fluent_Vec& dels )
{
	// define the precondition, adds and deletes
	define_fluent_list( precs, prec_vec(), prec_set() );
	define_fluent_list( adds, add_vec(), add_set() );
	define_fluent_list( dels, del_vec(), del_set() );
}

void Action::define( Fluent_Vec& precs, Fluent_Vec& adds, Fluent_Vec& dels, Conditional_Effect_Vec& ceffs )
{
	// define the precondition, adds, deletes and conditional effects
	define( precs, adds, dels );
	m_cond_effects = ceffs;	
}

void Action::define_fluent_list(  Fluent_Vec& in, Fluent_Vec& fluent_list, Fluent_Set& fluent_set )
{
	for ( unsigned k = 0; k < in.size(); k++ )
	{
		fluent_list.push_back( in[k] );
		fluent_set.set( in[k] );
	}
}

}
