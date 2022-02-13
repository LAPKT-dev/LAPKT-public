#include <siw_planner.hxx>
#include <py_strips_prob.hxx>
#include <tarski_instantiator.hxx>
using namespace boost::python;
using namespace tarski;

void (STRIPS_Problem::*pre) ( int , std::vector<std::pair<int, bool>>& ) = 
    &STRIPS_Problem::add_precondition;
void (STRIPS_Problem::*ce)  ( int , std::vector<std::pair<int, bool>>& , 
        std::vector<std::pair<int, bool>>&) =   
    &STRIPS_Problem::add_cond_effect;
void (STRIPS_Problem::*eff) ( int , std::vector<std::pair<int, bool>>& )  =
    &STRIPS_Problem::add_effect;
void (STRIPS_Problem::*si)  ( std::vector<std::pair<int, bool>>& )    =
    &STRIPS_Problem::set_init;
void (STRIPS_Problem::*sg)   ( std::vector<std::pair<int, bool>>& )    =
    &STRIPS_Problem::set_goal;
// TARSKI Parser CPP bindings
void (SIW_Planner::*pre_siw) ( int , std::vector<std::pair<int, bool>>& ) = 
    &SIW_Planner::add_precondition;
void (SIW_Planner::*ce_siw)  ( int , std::vector<std::pair<int, bool>>& , 
        std::vector<std::pair<int, bool>>&) =   
    &SIW_Planner::add_cond_effect;
void (SIW_Planner::*eff_siw) ( int , std::vector<std::pair<int, bool>>& )  =
    &SIW_Planner::add_effect;
void (SIW_Planner::*si_siw)  ( std::vector<std::pair<int, bool>>& )    =
    &SIW_Planner::set_init;
void (SIW_Planner::*sg_siw)   ( std::vector<std::pair<int, bool>>& )    =
   &SIW_Planner::set_goal;

/*
// FD Parser
void (SIW_Planner::*pre_siw)
    ( int , boost::python::list& )  =   &SIW_Planner::add_precondition;
void (SIW_Planner::*ce_siw)
    ( int , boost::python::list&, boost::python::list&) 
                                    =   &SIW_Planner::add_cond_effect;
void (SIW_Planner::*eff_siw)
    ( int , boost::python::list& )  =   &SIW_Planner::add_effect;
void (SIW_Planner::*si_siw)
    ( boost::python::list& )        =   &SIW_Planner::set_init;
void (SIW_Planner::*sg_siw) 
    ( boost::python::list& )        =   &SIW_Planner::set_goal;
*/

BOOST_PYTHON_MODULE( libplanner )
{   
    class_<STRIPS_Problem>("STRIPS_Problem")
        .def( init< std::string, std::string >() )
        .def( "add_atom", &STRIPS_Problem::add_atom )
        .def( "add_action", &STRIPS_Problem::add_action )
        .def( "add_mutex_group", &STRIPS_Problem::add_mutex_group )
        .def( "num_atoms", &STRIPS_Problem::n_atoms )
        .def( "num_actions", &STRIPS_Problem::n_actions )
        .def( "get_atom_name", &STRIPS_Problem::get_atom_name )
        .def( "get_domain_name", &STRIPS_Problem::get_domain_name )
        .def( "get_problem_name", &STRIPS_Problem::get_problem_name )
        .def( "add_precondition", pre )
        .def( "add_effect", eff )
        .def( "add_cond_effect", ce )
        .def( "set_cost", &STRIPS_Problem::set_cost )
        .def( "notify_negated_conditions", &STRIPS_Problem::notify_negated_conditions )
        .def( "create_negated_fluents", &STRIPS_Problem::create_negated_fluents )
        .def( "set_init", si )
        .def( "set_goal", sg )
        .def( "set_domain_name", &STRIPS_Problem::set_domain_name )
        .def( "set_problem_name", &STRIPS_Problem::set_problem_name )
        .def( "write_ground_pddl", &STRIPS_Problem::write_ground_pddl )
        .def( "print_action", &STRIPS_Problem::print_action )
        .def( "print_actions", &STRIPS_Problem::print_actions )
        .def( "print_fluents", &STRIPS_Problem::print_fluents )
        .def( "finalize_actions", &STRIPS_Problem::finalize_actions )
        .def_readwrite( "parsing_time", &STRIPS_Problem::m_parsing_time )
        .def_readwrite( "ignore_action_costs", &STRIPS_Problem::m_ignore_action_costs )
    ;
    class_<SIW_Planner, bases<STRIPS_Problem>>("SIW_Planner")
        .def( init< std::string, std::string >() )
        .def( "add_atom", &SIW_Planner::add_atom )
        .def( "add_action", &SIW_Planner::add_action )
        .def( "add_mutex_group", &SIW_Planner::add_mutex_group )
        .def( "num_atoms", &SIW_Planner::n_atoms )
        .def( "num_actions", &SIW_Planner::n_actions )
        .def( "get_atom_name", &SIW_Planner::get_atom_name )
        .def( "get_domain_name", &SIW_Planner::get_domain_name )
        .def( "get_problem_name", &SIW_Planner::get_problem_name )
        .def( "add_precondition", pre_siw )
        .def( "add_effect", eff_siw )
        .def( "add_cond_effect", ce_siw )
        .def( "set_cost", &SIW_Planner::set_cost )
        .def( "notify_negated_conditions", &SIW_Planner::notify_negated_conditions )
        .def( "create_negated_fluents", &SIW_Planner::create_negated_fluents )
        .def( "set_init", si_siw )
        .def( "set_goal", sg_siw )
        .def( "set_domain_name", &SIW_Planner::set_domain_name )
        .def( "set_problem_name", &SIW_Planner::set_problem_name )
        .def( "write_ground_pddl", &SIW_Planner::write_ground_pddl )
        .def( "print_action", &SIW_Planner::print_action )
        .def( "print_actions", &SIW_Planner::print_actions )
        .def( "print_fluents", &SIW_Planner::print_fluents )
        .def( "finalize_actions", &SIW_Planner::finalize_actions )
        .def( "setup", &SIW_Planner::setup )
        .def( "solve", &SIW_Planner::solve )
        .def_readwrite( "parsing_time", &SIW_Planner::m_parsing_time )
        .def_readwrite( "ignore_action_costs", &SIW_Planner::m_ignore_action_costs )
        .def_readwrite( "iw_bound", &SIW_Planner::m_iw_bound )
        .def_readwrite( "log_filename", &SIW_Planner::m_log_filename )
	;
    
    boost::python::class_<Tarski_Instantiator>("Tarski_Instantiator")
        .def( init< STRIPS_Problem* >() )
        .def( init< STRIPS_Problem* , boost::python::list&, Formula&,
                boost::python::list&, boost::python::list& >() )
        .def( "instantiate_action", &Tarski_Instantiator::instantiate_action)
        .def( "add_fluents", &Tarski_Instantiator::add_fluents )
        .def( "add_init", &Tarski_Instantiator::add_init )
        .def( "add_goal", &Tarski_Instantiator::add_goal )
        .def( "set_init", &Tarski_Instantiator::set_init )
        .def( "add_goal", &Tarski_Instantiator::add_goal )
        .def( "set_goal", &Tarski_Instantiator::set_goal )
        .def( "add_functions", &Tarski_Instantiator::add_functions )
        .def( "finalize_actions", &Tarski_Instantiator::finalize_actions )
    ;

    boost::python::class_<Identifier>("TI_Identifier")
        .def( init< char, std::string >() )
    ;

    boost::python::class_<Atom>("TI_Atom")
        .def( init< std::string, boost::python::list& >() )
        .def( "publish", &Atom::publish)
    ;
    
    boost::python::class_<Formula>("TI_Formula")
        .def( init<std::string, boost::python::list&, 
                boost::python::list&, bool >() )
    ;
    boost::python::class_<Action>("TI_Action")
        .def(  init< std::string,  boost::python::list&, Formula*,
                boost::python::list&, boost::python::tuple& >() )
    ;
}
