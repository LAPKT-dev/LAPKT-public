#include <py_strips_interface.hxx>
// #include <tarski_instantiator.hxx>
#include <strips_prob.hxx>

namespace py = pybind11;

// using namespace tarski;

PYBIND11_MODULE(wrapper, m)
{
    py::class_<STRIPS_Interface>(m, "STRIPS_Interface")
        .def(py::init<std::string, std::string>())
        .def("instance", &STRIPS_Interface::instance)
        .def("add_atom", &STRIPS_Interface::add_atom)
        .def("add_action", &STRIPS_Interface::add_action)
        .def("add_mutex_group", &STRIPS_Interface::add_mutex_group)
        .def("num_atoms", &STRIPS_Interface::n_atoms)
        .def("num_actions", &STRIPS_Interface::n_actions)
        .def("get_atom_name", &STRIPS_Interface::get_atom_name)
        .def("get_domain_name", &STRIPS_Interface::get_domain_name)
        .def("get_problem_name", &STRIPS_Interface::get_problem_name)
        .def("add_precondition", 
            static_cast<void (STRIPS_Interface::*) 
                (int, std::vector<std::pair<int, bool>>&)>
            (&STRIPS_Interface::add_precondition)
        )
        .def("add_precondition",
            static_cast<void (STRIPS_Interface::*) (int, py::list&)>
            (&STRIPS_Interface::add_precondition)
        )
        .def("add_effect", 
            static_cast<void (STRIPS_Interface::*)
                (int, std::vector<std::pair<int, bool>>&)>
            (&STRIPS_Interface::add_effect)
        )
        .def("add_effect",
            static_cast<void (STRIPS_Interface::*) (int, py::list&)>
            (&STRIPS_Interface::add_effect)
        )
        .def("add_cond_effect",
            static_cast<void (STRIPS_Interface::*)
                (int, std::vector<std::pair<int, bool>>&,
                std::vector<std::pair<int, bool>>&)>
            (&STRIPS_Interface::add_cond_effect)
        )
        .def("add_cond_effect",
            static_cast<void (STRIPS_Interface::*)
                (int, py::list&, py::list&)>
            (&STRIPS_Interface::add_cond_effect)
        )
        .def("set_cost", &STRIPS_Interface::set_cost)
        .def("notify_negated_conditions", &STRIPS_Interface::notify_negated_conditions)
        .def("create_negated_fluents", &STRIPS_Interface::create_negated_fluents)
        .def("set_init", 
            static_cast<void (STRIPS_Interface::*)
                (std::vector<std::pair<int, bool>>&)>
            (&STRIPS_Interface::set_init)
        )
        .def("set_init",
            static_cast<void (STRIPS_Interface::*)
                (py::list&)>
            (&STRIPS_Interface::set_init)
        )
        .def("set_goal", 
            static_cast<void (STRIPS_Interface::*)
                (std::vector<std::pair<int, bool>>&)>
            (&STRIPS_Interface::set_goal)
        )
        .def("set_goal",
            static_cast<void (STRIPS_Interface::*)
                (py::list&)>
            (&STRIPS_Interface::set_goal)
        )
        .def("set_domain_name", &STRIPS_Interface::set_domain_name)
        .def("set_problem_name", &STRIPS_Interface::set_problem_name)
        .def("write_ground_pddl", &STRIPS_Interface::write_ground_pddl)
        .def("print_action", &STRIPS_Interface::print_action)
        .def("print_actions", &STRIPS_Interface::print_actions)
        .def("print_fluents", &STRIPS_Interface::print_fluents)
        .def("finalize_actions", &STRIPS_Interface::finalize_actions)
        .def_readwrite("parsing_time", &STRIPS_Interface::m_parsing_time)
        .def_readwrite("ignore_actions_costs", &STRIPS_Interface::m_ignore_action_costs)
    ;
}