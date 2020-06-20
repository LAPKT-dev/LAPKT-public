#include<anytime_lapkt.hxx>
#include<at_bfsf_planner.hxx>
#include<bfsf_planner.hxx>
#include<brfs_planner.hxx>
#include<bfws.hxx>
#include<dfiw_planner.hxx>
#include<dfsiw_planner.hxx>
#include<dfs_plus_planner.hxx>
#include<iw_planner.hxx>
#include<rp_iw_planner.hxx>
#include<siw_planner.hxx>
#include<siw_plus_planner.hxx>
#include<siw_plus_bfs_f.hxx>

#include <py_strips_interface.hxx>
#include <strips_prob.hxx>
using namespace boost::python;
void (STRIPS_Interface::*pre)   (int, std::vector<std::pair<int, bool>>&) = 
    &STRIPS_Interface::add_precondition;
void (STRIPS_Interface::*ce)    (int, std::vector<std::pair<int, bool>>& , 
        std::vector<std::pair<int, bool>>&) =   
    &STRIPS_Interface::add_cond_effect;
void (STRIPS_Interface::*eff)   (int , std::vector<std::pair<int, bool>>&)=
    &STRIPS_Interface::add_effect;
void (STRIPS_Interface::*si)    (std::vector<std::pair<int, bool>>&)      =
    &STRIPS_Interface::set_init;
void (STRIPS_Interface::*sg)    ( std::vector<std::pair<int, bool>>&)    =
    &STRIPS_Interface::set_goal;

void (STRIPS_Interface::*pre_fd)
    (int, boost::python::list&) =   &STRIPS_Interface::add_precondition;
void (STRIPS_Interface::*ce_fd)
    (int, boost::python::list&, boost::python::list&) 
                                =   &STRIPS_Interface::add_cond_effect;
void (STRIPS_Interface::*eff_fd)
    (int, boost::python::list& )=   &STRIPS_Interface::add_effect;
void (STRIPS_Interface::*si_fd)
    (boost::python::list&)      =   &STRIPS_Interface::set_init;
void (STRIPS_Interface::*sg_fd) 
    (boost::python::list&)      =   &STRIPS_Interface::set_goal;

BOOST_PYTHON_MODULE(libPlanners)
{
    class_<aptk::STRIPS_Problem>("STRIPS_Problem")
        .def( "num_actions", &aptk::STRIPS_Problem::num_actions )
        ;
    boost::python::type_info info = boost::python::type_id<STRIPS_Interface>();
    const boost::python::converter::registration* reg_pointer = 
            boost::python::converter::registry::query(info);
    if (reg_pointer == NULL ||(*reg_pointer).m_to_python == NULL) {
        class_<STRIPS_Interface>("STRIPS_Interface")
            .def( init< std::string, std::string >() )
            .def( "instance", &STRIPS_Interface::boost_instance )
            .def( "add_atom", &STRIPS_Interface::add_atom )
            .def( "add_action", &STRIPS_Interface::add_action )
            .def( "add_mutex_group", &STRIPS_Interface::add_mutex_group )
            .def( "num_atoms", &STRIPS_Interface::n_atoms )
            .def( "num_actions", &STRIPS_Interface::n_actions )
            .def( "get_atom_name", &STRIPS_Interface::get_atom_name )
            .def( "get_domain_name", &STRIPS_Interface::get_domain_name )
            .def( "get_problem_name", &STRIPS_Interface::get_problem_name )
            .def( "add_precondition", pre )
            .def( "add_precondition", pre_fd )
            .def( "add_effect", eff )
            .def( "add_effect", eff_fd )
            .def( "add_precondition", pre_fd )
            .def( "add_cond_effect", ce )
            .def( "add_cond_effect", ce_fd )
            .def( "set_cost", &STRIPS_Interface::set_cost )
            .def( "notify_negated_conditions", 
                    &STRIPS_Interface::notify_negated_conditions )
            .def( "create_negated_fluents", 
                    &STRIPS_Interface::create_negated_fluents )
            .def( "set_init", si )
            .def( "set_init", si_fd )
            .def( "set_goal", sg )
            .def( "set_goal", sg_fd )
            .def( "set_domain_name", &STRIPS_Interface::set_domain_name )
            .def( "set_problem_name", &STRIPS_Interface::set_problem_name )
            .def( "write_ground_pddl", &STRIPS_Interface::write_ground_pddl )
            .def( "print_action", &STRIPS_Interface::print_action )
            .def( "print_actions", &STRIPS_Interface::print_actions )
            .def( "print_fluents", &STRIPS_Interface::print_fluents )
            .def( "finalize_actions", &STRIPS_Interface::finalize_actions )
            .def_readwrite( "parsing_time", &STRIPS_Interface::m_parsing_time )
            .def_readwrite( "ignore_action_costs", 
                    &STRIPS_Interface::m_ignore_action_costs )
        ;
    }     

        class_<AT_LAPKT_Planner, bases<STRIPS_Interface>>("AT_LAPKT_Planner")
		.def( "setup", &AT_LAPKT_Planner::setup )
		.def( "solve", &AT_LAPKT_Planner::solve )
        .def_readwrite( "iw_bound", &AT_LAPKT_Planner::m_iw_bound )
		.def_readwrite( "max_novelty", &AT_LAPKT_Planner::m_max_novelty )
		.def_readwrite( "log_filename", &AT_LAPKT_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &AT_LAPKT_Planner::m_plan_filename )
		.def_readwrite( "enable_siw_plus", &AT_LAPKT_Planner::m_enable_siw_plus )
		.def_readwrite( "enable_bfs_f", &AT_LAPKT_Planner::m_enable_bfs_f )
	;

	class_<AT_BFS_f_Planner, bases<STRIPS_Interface>>("AT_BFS_f_Planner")
		.def( "setup", &AT_BFS_f_Planner::setup )
		.def( "solve", &AT_BFS_f_Planner::solve )
        .def_readwrite( "iw_bound", &AT_BFS_f_Planner::m_iw_bound )
		.def_readwrite( "max_novelty", &AT_BFS_f_Planner::m_max_novelty )
		.def_readwrite( "log_filename", &AT_BFS_f_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &AT_BFS_f_Planner::m_plan_filename )
		.def_readwrite( "enable_siw", &AT_BFS_f_Planner::m_enable_siw )
		.def_readwrite( "enable_bfs_f", &AT_BFS_f_Planner::m_enable_bfs_f )
	;
	class_<BFS_f_Planner, bases<STRIPS_Interface>>("BFS_f_Planner")
        .def( "setup", &BFS_f_Planner::setup )
		.def( "solve", &BFS_f_Planner::solve )
		.def_readwrite( "max_novelty", &BFS_f_Planner::m_max_novelty )
		.def_readwrite( "log_filename", &BFS_f_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &BFS_f_Planner::m_plan_filename )
		.def_readwrite( "one_ha_per_fluent", &BFS_f_Planner::m_one_ha_per_fluent )
	;
	class_<BRFS_Planner, bases<STRIPS_Interface>>("BRFS_Planner")
        .def( "setup", &BRFS_Planner::setup )
		.def( "solve", &BRFS_Planner::solve )
		.def_readwrite( "log_filename", &BRFS_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &BRFS_Planner::m_plan_filename )
	;
	class_<BFWS, bases<STRIPS_Interface>>("BFWS")
        .def( "setup", &BFWS::setup )
		.def( "solve", &BFWS::solve )
		.def_readwrite( "log_filename", &BFWS::m_log_filename )
        .def_readwrite( "plan_filename", &BFWS::m_plan_filename )
	    .def_readwrite( "anytime", &BFWS::m_anytime )
	    .def_readwrite( "search", &BFWS::m_search_alg )
        .def_readwrite( "m_value", &BFWS::m_M )
	    .def_readwrite( "max_novelty", &BFWS::m_max_novelty )
        .def_readwrite( "found_plan", &BFWS::m_found_plan )
        .def_readwrite( "plan_cost", &BFWS::m_cost )
        .def_readwrite( "cost_bound", &BFWS::m_cost_bound )	    	    
	;
	class_<DFIW_Planner, bases<STRIPS_Interface>>("DFIW_Planner")
        .def( "setup", &DFIW_Planner::setup )
		.def( "solve", &DFIW_Planner::solve )
		.def_readwrite( "iw_bound", &DFIW_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &DFIW_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &DFIW_Planner::m_plan_filename )
	;
	class_<DFSIW_Planner, bases<STRIPS_Interface>>("DFSIW_Planner")
        .def( "setup", &DFSIW_Planner::setup )
		.def( "solve", &DFSIW_Planner::solve )
		.def_readwrite( "parsing_time", &DFSIW_Planner::m_parsing_time )
		.def_readwrite( "ignore_action_costs", &DFSIW_Planner::m_ignore_action_costs )
		.def_readwrite( "iw_bound", &DFSIW_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &DFSIW_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &DFSIW_Planner::m_plan_filename )
	;
	class_<DFS_Plus_Planner, bases<STRIPS_Interface>>("DFS_Plus_Planner")
        .def( "setup", &DFS_Plus_Planner::setup )
		.def( "solve", &DFS_Plus_Planner::solve )
		.def_readwrite( "iw_bound", &DFS_Plus_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &DFS_Plus_Planner::m_log_filename )
		.def_readwrite( "plan_filename", &DFS_Plus_Planner::m_plan_filename )
	;
    class_<IW_Planner, bases<STRIPS_Interface>>("IW_Planner")
        .def( "setup", &IW_Planner::setup )
        .def( "solve", &IW_Planner::solve )
        .def_readwrite( "iw_bound", &IW_Planner::m_iw_bound )
        .def_readwrite( "log_filename", &IW_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &IW_Planner::m_plan_filename )
        .def_readwrite( "atomic", &IW_Planner::m_atomic )
    ;
    class_<RPIW_Planner, bases<STRIPS_Interface>>("RPIW_Planner")
        .def( "setup", &RPIW_Planner::setup )
        .def( "solve", &RPIW_Planner::solve )
        .def_readwrite( "iw_bound", &RPIW_Planner::m_iw_bound )
        .def_readwrite( "log_filename", &RPIW_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &RPIW_Planner::m_plan_filename )
        .def_readwrite( "atomic", &RPIW_Planner::m_atomic )
    ;
	class_<SIW_Planner, bases<STRIPS_Interface>>("SIW_Planner")
        .def( "setup", &SIW_Planner::setup )
		.def( "solve", &SIW_Planner::solve )
		.def_readwrite( "iw_bound", &SIW_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &SIW_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &SIW_Planner::m_plan_filename )
	;
	class_<SIW_Plus_Planner, bases<STRIPS_Interface>>("SIW_Plus_Planner")
        .def( "setup", &SIW_Plus_Planner::setup )
		.def( "solve", &SIW_Plus_Planner::solve )
		.def_readwrite( "iw_bound", &SIW_Plus_Planner::m_iw_bound )
		.def_readwrite( "log_filename", &SIW_Plus_Planner::m_log_filename )
        .def_readwrite( "plan_filename", &SIW_Plus_Planner::m_plan_filename )
	;
	class_<SIW_PLUS_BFS_F_Planner, bases<STRIPS_Interface>>("SIW_PLUS_BFS_F_Planner")
        .def( "setup", &SIW_PLUS_BFS_F_Planner::setup )
		.def( "solve", &SIW_PLUS_BFS_F_Planner::solve )
		.def_readwrite( "iw_bound", &SIW_PLUS_BFS_F_Planner::m_iw_bound )
		.def_readwrite( "max_novelty", &SIW_PLUS_BFS_F_Planner::m_max_novelty )
		.def_readwrite( "log_filename", &SIW_PLUS_BFS_F_Planner::m_log_filename )
		.def_readwrite( "plan_filename", &SIW_PLUS_BFS_F_Planner::m_plan_filename )
		.def_readwrite( "enable_siw_plus", &SIW_PLUS_BFS_F_Planner::m_enable_siw_plus )
		.def_readwrite( "enable_bfs_f", &SIW_PLUS_BFS_F_Planner::m_enable_bfs_f )
	;

}
