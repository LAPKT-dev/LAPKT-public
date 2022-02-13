#include<boostpy_strips_interface.hxx>
#include<strips_prob.hxx>
#include <boost/python.hpp>

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

BOOST_PYTHON_MODULE(fd_wrapper)
{
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
}
