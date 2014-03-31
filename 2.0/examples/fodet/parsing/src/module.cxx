#include <py_fod_problem.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libaptk )
{
	class_<FOD_Problem>("FOD_Problem")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &FOD_Problem::add_atom )
		.def( "add_action", &FOD_Problem::add_action )
		.def( "add_axiom", &FOD_Problem::add_axiom )
		.def( "add_invariant", &FOD_Problem::add_invariant )
		.def( "num_atoms", &FOD_Problem::n_atoms )
		.def( "num_actions", &FOD_Problem::n_actions )
		.def( "get_atom_name", &FOD_Problem::get_atom_name )
		.def( "get_domain_name", &FOD_Problem::get_domain_name )
		.def( "get_problem_name", &FOD_Problem::get_problem_name )
		.def( "add_precondition", &FOD_Problem::add_precondition )
		.def( "add_effect", &FOD_Problem::add_effect )
		.def( "set_cost", &FOD_Problem::set_cost )
		.def( "set_init", &FOD_Problem::set_init )
		.def( "set_goal", &FOD_Problem::set_goal )
		.def( "set_domain_name", &FOD_Problem::set_domain_name )
		.def( "set_problem_name", &FOD_Problem::set_problem_name )
		.def( "write_ground_pddl", &FOD_Problem::write_ground_pddl )
		.def( "print_action", &FOD_Problem::print_action )
		.def_readwrite( "parsing_time", &FOD_Problem::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &FOD_Problem::m_ignore_action_costs )
	;
}

