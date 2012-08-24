#include <cond_eff.hxx>

namespace aptk
{

Conditional_Effect::Conditional_Effect( STRIPS_Problem& p )
{
	prec_set().resize( p.num_fluents() );
	add_set().resize( p.num_fluents() );
	del_set().resize( p.num_fluents() );
}

Conditional_Effect::~Conditional_Effect()
{
}

void Conditional_Effect::define( Fluent_Vec& precs, Fluent_Vec& adds, Fluent_Vec& dels )
{
	// define the precondition, adds and deletes
	define_fluent_list( precs, prec_vec(), prec_set() );
	define_fluent_list( adds, add_vec(), add_set() );
	define_fluent_list( dels, del_vec(), del_set() );
}

	
void Conditional_Effect::define_fluent_list(  Fluent_Vec& in, Fluent_Vec& fluent_list, Fluent_Set& fluent_set )
{
	for ( unsigned k = 0; k < in.size(); k++ )
	{
		fluent_list.push_back( in[k] );
		fluent_set.set( in[k] );
	}
}


}
