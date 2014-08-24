#include <at_bfsf_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libatbfsf )
{
	class_<AT_BFS_f_Planner>("AT_BFS_f_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &AT_BFS_f_Planner::add_atom )
		.def( "add_action", &AT_BFS_f_Planner::add_action )
		.def( "add_mutex_group", &AT_BFS_f_Planner::add_mutex_group )
		.def( "num_atoms", &AT_BFS_f_Planner::n_atoms )
		.def( "num_actions", &AT_BFS_f_Planner::n_actions )
		.def( "get_atom_name", &AT_BFS_f_Planner::get_atom_name )
		.def( "get_domain_name", &AT_BFS_f_Planner::get_domain_name )
		.def( "get_problem_name", &AT_BFS_f_Planner::get_problem_name )
		.def( "add_precondition", &AT_BFS_f_Planner::add_precondition )
		.def( "add_effect", &AT_BFS_f_Planner::add_effect )
		.def( "add_cond_effect", &AT_BFS_f_Planner::add_cond_effect )
		.def( "set_cost", &AT_BFS_f_Planner::set_cost )
		.def( "notify_negated_conditions", &AT_BFS_f_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &AT_BFS_f_Planner::create_negated_fluents )
		.def( "set_init", &AT_BFS_f_Planner::set_init )
		.def( "set_goal", &AT_BFS_f_Planner::set_goal )
		.def( "set_domain_name", &AT_BFS_f_Planner::set_domain_name )
		.def( "set_problem_name", &AT_BFS_f_Planner::set_problem_name )
		.def( "write_ground_pddl", &AT_BFS_f_Planner::write_ground_pddl )
		.def( "print_action", &AT_BFS_f_Planner::print_action )
		.def( "setup", &AT_BFS_f_Planner::setup )
		.def( "solve", &AT_BFS_f_Planner::solve )
		.def_readwrite( "ignore_action_costs", &AT_BFS_f_Planner::m_ignore_action_costs )
		.def_readwrite( "parsing_time", &AT_BFS_f_Planner::m_parsing_time )
		.def_readwrite( "iw_bound", &AT_BFS_f_Planner::m_iw_bound )
		.def_readwrite( "max_novelty", &AT_BFS_f_Planner::m_max_novelty )
		.def_readwrite( "log_filename", &AT_BFS_f_Planner::m_log_filename )
		.def_readwrite( "enable_siw", &AT_BFS_f_Planner::m_enable_siw )
		.def_readwrite( "enable_bfs_f", &AT_BFS_f_Planner::m_enable_bfs_f )
	;
}

