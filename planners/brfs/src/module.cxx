#include <brfs_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libbrfs )
{
	class_<BRFS_Planner>("BRFS_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &BRFS_Planner::add_atom )
		.def( "add_action", &BRFS_Planner::add_action )
		.def( "add_mutex_group", &BRFS_Planner::add_mutex_group )
		.def( "num_atoms", &BRFS_Planner::n_atoms )
		.def( "num_actions", &BRFS_Planner::n_actions )
		.def( "get_atom_name", &BRFS_Planner::get_atom_name )
		.def( "get_domain_name", &BRFS_Planner::get_domain_name )
		.def( "get_problem_name", &BRFS_Planner::get_problem_name )
		.def( "add_precondition", &BRFS_Planner::add_precondition )
		.def( "add_effect", &BRFS_Planner::add_effect )
		.def( "add_cond_effect", &BRFS_Planner::add_cond_effect )
		.def( "set_cost", &BRFS_Planner::set_cost )
		.def( "notify_negated_conditions", &BRFS_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &BRFS_Planner::create_negated_fluents )
		.def( "set_init", &BRFS_Planner::set_init )
		.def( "set_goal", &BRFS_Planner::set_goal )
		.def( "set_domain_name", &BRFS_Planner::set_domain_name )
		.def( "set_problem_name", &BRFS_Planner::set_problem_name )
		.def( "write_ground_pddl", &BRFS_Planner::write_ground_pddl )
		.def( "print_action", &BRFS_Planner::print_action )
		.def( "print_actions", &BRFS_Planner::print_actions )
		.def( "print_fluents", &BRFS_Planner::print_fluents )
		.def( "setup", &BRFS_Planner::setup )
		.def( "solve", &BRFS_Planner::solve )
		.def_readwrite( "ignore_action_costs", &BRFS_Planner::m_ignore_action_costs )
		.def_readwrite( "parsing_time", &BRFS_Planner::m_parsing_time )
		.def_readwrite( "log_filename", &BRFS_Planner::m_log_filename )
	;
}

