#include <heuristics.hxx>
#include <fstream>
#include <h1.hxx>
#include <prop_h2.hxx>
#include <time.hxx>

using namespace boost::python;

typedef aptk::H1_Heuristic< aptk::H_Add_Evaluation_Function >	H_Additive;
typedef aptk::H1_Heuristic< aptk::H_Max_Evaluation_Function >	H_Max;
typedef aptk::Rule_Based_H2_Heuristic				H2;

Heuristics_Example::Heuristics_Example() 
	: FOD_Problem() {
}

Heuristics_Example::Heuristics_Example( std::string dom, std::string prob )
	: FOD_Problem( dom, prob ) {
}

Heuristics_Example::~Heuristics_Example() {
}

void
Heuristics_Example::compute() {
	std::ofstream report( "report.csv" );

	report << get_domain_name() << ",";
	report << get_problem_name() << ",";
	report << n_atoms() << ",";
	report << n_actions() << ",";

	float t0, tf;

	H_Additive 	h_add( *instance() );
	H_Max		h_max( *instance() );
	H2		h2_max( *instance() );

	t0 = aptk::read_time_in_seconds();
	float h_val = h_add.full_eval( instance()->init, instance()->goal );
	tf = aptk::read_time_in_seconds();
	report << tf - t0 << ",";
	report << h_val << ",";

	t0 = aptk::read_time_in_seconds();
	h_val =  h_max.full_eval( instance()->init, instance()->goal );
	tf = aptk::read_time_in_seconds();
	report << tf - t0 << ",";
	report << h_val << ",";

	t0 = aptk::read_time_in_seconds();
	h2_max.setup();
	h_val = h2_max.eval( instance()->goal ); 
	tf = aptk::read_time_in_seconds();
	report << tf - t0 << ",";
	report << h_val << ",";

	report << std::endl;
	report.close();
}

BOOST_PYTHON_MODULE( libaptk )
{
	class_<Heuristics_Example>("Heuristics_Example")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &Heuristics_Example::add_atom )
		.def( "add_action", &Heuristics_Example::add_action )
		.def( "add_invariant", &Heuristics_Example::add_invariant )
		.def( "num_atoms", &Heuristics_Example::n_atoms )
		.def( "num_actions", &Heuristics_Example::n_actions )
		.def( "get_atom_name", &Heuristics_Example::get_atom_name )
		.def( "get_domain_name", &Heuristics_Example::get_domain_name )
		.def( "get_problem_name", &Heuristics_Example::get_problem_name )
		.def( "add_precondition", &Heuristics_Example::add_precondition )
		.def( "add_effect", &Heuristics_Example::add_effect )
		.def( "set_init", &Heuristics_Example::set_init )
		.def( "set_goal", &Heuristics_Example::set_goal )
		.def( "set_domain_name", &Heuristics_Example::set_domain_name )
		.def( "set_problem_name", &Heuristics_Example::set_problem_name )
		.def( "write_ground_pddl", &Heuristics_Example::write_ground_pddl )
		.def( "print_action", &Heuristics_Example::print_action )
		.def( "compute", &Heuristics_Example::compute )
		.def_readwrite( "parsing_time", &Heuristics_Example::m_parsing_time )
	;
}

