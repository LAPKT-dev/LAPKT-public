#include <action.hxx>
#include <iostream>

namespace aptk 
{

Action::Action( STRIPS_Problem& p )
	: m_cost( 1 )
{
	prec_set().resize( p.num_fluents() );
	add_set().resize( p.num_fluents() );
	del_set().resize( p.num_fluents() );
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

void	Action::print( const STRIPS_Problem& prob, std::ostream& os ) const {

	os << "Action " << signature() << std::endl;
	os << "\tPre(a) = {";
	prob.print_fluent_vec( os, prec_vec() );
	os << "}" << std::endl;
	os << "\tAdd(a) = {";
	prob.print_fluent_vec( os, add_vec() );
	os << "}" << std::endl;
	os << "\tDel(a) = {";
	prob.print_fluent_vec( os, del_vec() );
	os << "}" << std::endl;
	os << "\tConditional Effects:" << std::endl;
	for ( unsigned l = 0; l < ceff_vec().size(); l++ )
	{
		os << "\t\tcond_eff " << l+1 << ":" << std::endl;
		os << "\t\tPre(cond_eff) = {";
		prob.print_fluent_vec( os, ceff_vec()[l]->prec_vec() );
		os << "}" << std::endl;
		os << "\t\tAdd(cond_eff) = {";
		prob.print_fluent_vec( os, ceff_vec()[l]->add_vec() );
		os << "}" << std::endl;
		os << "\t\tDel(cond_eff) = {";
		prob.print_fluent_vec( os, ceff_vec()[l]->del_vec() );
		os << "}" << std::endl;
	}	
}

}
