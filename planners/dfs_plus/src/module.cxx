#include <dfs_plus_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libdfs_plus )
{
	class_<DFS_Plus_Planner>("DFS_Plus_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &DFS_Plus_Planner::add_atom )
		.def( "add_action", &DFS_Plus_Planner::add_action )
		.def( "add_mutex_group", &DFS_Plus_Planner::add_mutex_group )
		.def( "num_atoms", &DFS_Plus_Planner::n_atoms )
		.def( "num_actions", &DFS_Plus_Planner::n_actions )
		.def( "get_atom_name", &DFS_Plus_Planner::get_atom_name )
		.def( "get_domain_name", &DFS_Plus_Planner::get_domain_name )
		.def( "get_problem_name", &DFS_Plus_Planner::get_problem_name )
		.def( "add_precondition", &DFS_Plus_Planner::add_precondition )
		.def( "add_effect", &DFS_Plus_Planner::add_effect )
		.def( "add_cond_effect", &DFS_Plus_Planner::add_cond_effect )
		.def( "set_cost", &DFS_Plus_Planner::set_cost )
		.def( "notify_negated_conditions", &DFS_Plus_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &DFS_Plus_Planner::create_negated_fluents )
		.def( "set_init", &DFS_Plus_Planner::set_init )
		.def( "set_goal", &DFS_Plus_Planner::set_goal )
		.def( "set_domain_name", &DFS_Plus_Planner::set_domain_name )
		.def( "set_problem_name", &DFS_Plus_Planner::set_problem_name )
		.def( "write_ground_pddl", &DFS_Plus_Planner::write_ground_pddl )
		.def( "print_action", &DFS_Plus_Planner::print_action )
		.def( "setup", &DFS_Plus_Planner::setup )
		.def( "solve", &DFS_Plus_Planner::solve )
		.def_readwrite( "parsing_time", &DFS_Plus_Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &DFS_Plus_Planner::m_ignore_action_costs )
		.def_readwrite( "iw_bound", &DFS_Plus_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &DFS_Plus_Planner::m_log_filename )
		.def_readwrite( "plan_filename", &DFS_Plus_Planner::m_plan_filename )
	;
}

