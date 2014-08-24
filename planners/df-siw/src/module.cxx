#include <siw_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libsiw )
{
	class_<SIW_Planner>("SIW_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &SIW_Planner::add_atom )
		.def( "add_action", &SIW_Planner::add_action )
		.def( "add_mutex_group", &SIW_Planner::add_mutex_group )
		.def( "num_atoms", &SIW_Planner::n_atoms )
		.def( "num_actions", &SIW_Planner::n_actions )
		.def( "get_atom_name", &SIW_Planner::get_atom_name )
		.def( "get_domain_name", &SIW_Planner::get_domain_name )
		.def( "get_problem_name", &SIW_Planner::get_problem_name )
		.def( "add_precondition", &SIW_Planner::add_precondition )
		.def( "add_effect", &SIW_Planner::add_effect )
		.def( "add_cond_effect", &SIW_Planner::add_cond_effect )
		.def( "set_cost", &SIW_Planner::set_cost )
		.def( "notify_negated_conditions", &SIW_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &SIW_Planner::create_negated_fluents )
		.def( "set_init", &SIW_Planner::set_init )
		.def( "set_goal", &SIW_Planner::set_goal )
		.def( "set_domain_name", &SIW_Planner::set_domain_name )
		.def( "set_problem_name", &SIW_Planner::set_problem_name )
		.def( "write_ground_pddl", &SIW_Planner::write_ground_pddl )
		.def( "print_action", &SIW_Planner::print_action )
		.def( "setup", &SIW_Planner::setup )
		.def( "solve", &SIW_Planner::solve )
		.def_readwrite( "parsing_time", &SIW_Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &SIW_Planner::m_ignore_action_costs )
		.def_readwrite( "iw_bound", &SIW_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &SIW_Planner::m_log_filename )
	;
}

