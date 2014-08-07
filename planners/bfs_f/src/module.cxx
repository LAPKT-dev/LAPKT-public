#include <bfsf_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libbfsf )
{
	class_<BFS_f_Planner>("BFS_f_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &BFS_f_Planner::add_atom )
		.def( "add_action", &BFS_f_Planner::add_action )
		.def( "add_mutex_group", &BFS_f_Planner::add_mutex_group )
		.def( "num_atoms", &BFS_f_Planner::n_atoms )
		.def( "num_actions", &BFS_f_Planner::n_actions )
		.def( "get_atom_name", &BFS_f_Planner::get_atom_name )
		.def( "get_domain_name", &BFS_f_Planner::get_domain_name )
		.def( "get_problem_name", &BFS_f_Planner::get_problem_name )
		.def( "add_precondition", &BFS_f_Planner::add_precondition )
		.def( "add_effect", &BFS_f_Planner::add_effect )
		.def( "add_cond_effect", &BFS_f_Planner::add_cond_effect )
		.def( "set_cost", &BFS_f_Planner::set_cost )
		.def( "notify_negated_conditions", &BFS_f_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &BFS_f_Planner::create_negated_fluents )
		.def( "set_init", &BFS_f_Planner::set_init )
		.def( "set_goal", &BFS_f_Planner::set_goal )
		.def( "set_domain_name", &BFS_f_Planner::set_domain_name )
		.def( "set_problem_name", &BFS_f_Planner::set_problem_name )
		.def( "write_ground_pddl", &BFS_f_Planner::write_ground_pddl )
		.def( "print_action", &BFS_f_Planner::print_action )
		.def( "print_actions", &BFS_f_Planner::print_actions )
		.def( "print_fluents", &BFS_f_Planner::print_fluents )
		.def( "setup", &BFS_f_Planner::setup )
		.def( "solve", &BFS_f_Planner::solve )
		.def_readwrite( "ignore_action_costs", &BFS_f_Planner::m_ignore_action_costs )
		.def_readwrite( "parsing_time", &BFS_f_Planner::m_parsing_time )
		.def_readwrite( "max_novelty", &BFS_f_Planner::m_max_novelty )
		.def_readwrite( "log_filename", &BFS_f_Planner::m_log_filename )
		.def_readwrite( "one_ha_per_fluent", &BFS_f_Planner::m_one_ha_per_fluent )
	;
}

