#include <py_strips_prob.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libaptk )
{
	class_<STRIPS_Problem>("STRIPS_Problem")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &STRIPS_Problem::add_atom )
		.def( "add_action", &STRIPS_Problem::add_action )
		.def( "add_invariant", &STRIPS_Problem::add_invariant )
		.def( "num_atoms", &STRIPS_Problem::n_atoms )
		.def( "num_actions", &STRIPS_Problem::n_actions )
		.def( "get_atom_name", &STRIPS_Problem::get_atom_name )
		.def( "get_domain_name", &STRIPS_Problem::get_domain_name )
		.def( "get_problem_name", &STRIPS_Problem::get_problem_name )
		.def( "add_precondition", &STRIPS_Problem::add_precondition )
		.def( "add_effect", &STRIPS_Problem::add_effect )
		.def( "notify_negated_conditions", &STRIPS_Problem::notify_negated_conditions )
		.def( "create_negated_fluents", &STRIPS_Problem::create_negated_fluents )
		.def( "set_init", &STRIPS_Problem::set_init )
		.def( "set_goal", &STRIPS_Problem::set_goal )
		.def( "set_domain_name", &STRIPS_Problem::set_domain_name )
		.def( "set_problem_name", &STRIPS_Problem::set_problem_name )
		.def( "write_ground_pddl", &STRIPS_Problem::write_ground_pddl )
		.def( "print_action", &STRIPS_Problem::print_action )
		.def_readwrite( "parsing_time", &STRIPS_Problem::m_parsing_time )
	;
}

