#include <iw_planner.hxx>
using namespace boost::python;

BOOST_PYTHON_MODULE( libiw )
{
	class_<IW_Planner>("IW_Planner")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &IW_Planner::add_atom )
		.def( "add_action", &IW_Planner::add_action )
		.def( "add_mutex_group", &IW_Planner::add_mutex_group )
		.def( "num_atoms", &IW_Planner::n_atoms )
		.def( "num_actions", &IW_Planner::n_actions )
		.def( "get_atom_name", &IW_Planner::get_atom_name )
		.def( "get_domain_name", &IW_Planner::get_domain_name )
		.def( "get_problem_name", &IW_Planner::get_problem_name )
		.def( "add_precondition", &IW_Planner::add_precondition )
		.def( "add_effect", &IW_Planner::add_effect )
		.def( "add_cond_effect", &IW_Planner::add_cond_effect )
		.def( "set_cost", &IW_Planner::set_cost )
		.def( "notify_negated_conditions", &IW_Planner::notify_negated_conditions )
		.def( "create_negated_fluents", &IW_Planner::create_negated_fluents )
		.def( "set_init", &IW_Planner::set_init )
		.def( "set_goal", &IW_Planner::set_goal )
		.def( "set_domain_name", &IW_Planner::set_domain_name )
		.def( "set_problem_name", &IW_Planner::set_problem_name )
		.def( "write_ground_pddl", &IW_Planner::write_ground_pddl )
		.def( "print_action", &IW_Planner::print_action )
		.def( "setup", &IW_Planner::setup )
		.def( "solve", &IW_Planner::solve )
		.def_readwrite( "parsing_time", &IW_Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &IW_Planner::m_ignore_action_costs )
		.def_readwrite( "iw_bound", &IW_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &IW_Planner::m_log_filename )
	;
}

