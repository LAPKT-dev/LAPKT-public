#include <planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libfdplanner )
{
	class_<Planner>("Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &Planner::add_atom )
		.def( "add_action", &Planner::add_action )
		.def( "add_mutex_group", &Planner::add_mutex_group )
		.def( "num_atoms", &Planner::n_atoms )
		.def( "num_actions", &Planner::n_actions )
		.def( "get_atom_name", &Planner::get_atom_name )
		.def( "get_domain_name", &Planner::get_domain_name )
		.def( "get_problem_name", &Planner::get_problem_name )
		.def( "add_precondition", &Planner::add_precondition )
		.def( "add_effect", &Planner::add_effect )
		.def( "add_cond_effect", &Planner::add_cond_effect )
		.def( "set_cost", &Planner::set_cost )
		.def( "notify_negated_conditions", &Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &Planner::create_negated_fluents )
		.def( "set_init", &Planner::set_init )
		.def( "set_goal", &Planner::set_goal )
		.def( "set_domain_name", &Planner::set_domain_name )
		.def( "set_problem_name", &Planner::set_problem_name )
		.def( "write_ground_pddl", &Planner::write_ground_pddl )
		.def( "dump_pddl", &Planner::dump_pddl )
		.def( "print_action", &Planner::print_action )
		.def( "setup", &Planner::setup )
		.def( "solve", &Planner::solve )
		.def_readwrite( "parsing_time", &Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &Planner::m_ignore_action_costs )
		.def_readwrite( "log_filename", &Planner::m_log_filename )
	;
}

