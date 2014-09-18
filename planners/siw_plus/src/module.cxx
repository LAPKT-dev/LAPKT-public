#include <siw_plus_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libsiw_plus )
{
	class_<SIW_Plus_Planner>("SIW_Plus_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &SIW_Plus_Planner::add_atom )
		.def( "add_action", &SIW_Plus_Planner::add_action )
		.def( "add_mutex_group", &SIW_Plus_Planner::add_mutex_group )
		.def( "num_atoms", &SIW_Plus_Planner::n_atoms )
		.def( "num_actions", &SIW_Plus_Planner::n_actions )
		.def( "get_atom_name", &SIW_Plus_Planner::get_atom_name )
		.def( "get_domain_name", &SIW_Plus_Planner::get_domain_name )
		.def( "get_problem_name", &SIW_Plus_Planner::get_problem_name )
		.def( "add_precondition", &SIW_Plus_Planner::add_precondition )
		.def( "add_effect", &SIW_Plus_Planner::add_effect )
		.def( "add_cond_effect", &SIW_Plus_Planner::add_cond_effect )
		.def( "set_cost", &SIW_Plus_Planner::set_cost )
		.def( "notify_negated_conditions", &SIW_Plus_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &SIW_Plus_Planner::create_negated_fluents )
		.def( "set_init", &SIW_Plus_Planner::set_init )
		.def( "set_goal", &SIW_Plus_Planner::set_goal )
		.def( "set_domain_name", &SIW_Plus_Planner::set_domain_name )
		.def( "set_problem_name", &SIW_Plus_Planner::set_problem_name )
		.def( "write_ground_pddl", &SIW_Plus_Planner::write_ground_pddl )
		.def( "print_action", &SIW_Plus_Planner::print_action )
		.def( "setup", &SIW_Plus_Planner::setup )
		.def( "solve", &SIW_Plus_Planner::solve )
		.def_readwrite( "parsing_time", &SIW_Plus_Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &SIW_Plus_Planner::m_ignore_action_costs )
		.def_readwrite( "iw_bound", &SIW_Plus_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &SIW_Plus_Planner::m_log_filename )
	;
}

