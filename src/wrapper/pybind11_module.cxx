/**
 * @file pybind11_module.hxx
 * @author Anubhav Singh (anubhav.singh.er@pm.me)
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files
  (the "Software"), to deal in the Software without restriction,
  including without limitation the rights to use, copy, modify, merge,
  publish, distribute, sublicense, and/or sell copies of the Software,
  and to permit persons to whom the Software is furnished to do so, subject
  to the following conditions:

  The above copyright notice and this permission notice shall be included
  in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <py_strips_interface.hxx>
#include <h_1.hxx>
#include <h_1_callback.hxx>
#include <strips_prob.hxx>
#include <fwd_search_prob.hxx>
#include <strips_prob.hxx>

namespace py = pybind11;

// using namespace tarski;
using namespace aptk::agnostic;

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
             static_cast<void (STRIPS_Interface::*)(int, std::vector<std::pair<int, bool>> &)>(&STRIPS_Interface::add_precondition))
        .def("add_precondition",
             static_cast<void (STRIPS_Interface::*)(int, py::list &)>(&STRIPS_Interface::add_precondition))
        .def("add_effect",
             static_cast<void (STRIPS_Interface::*)(int, std::vector<std::pair<int, bool>> &)>(&STRIPS_Interface::add_effect))
        .def("add_effect",
             static_cast<void (STRIPS_Interface::*)(int, py::list &)>(&STRIPS_Interface::add_effect))
        .def("add_cond_effect",
             static_cast<void (STRIPS_Interface::*)(int, std::vector<std::pair<int, bool>> &,
                                                    std::vector<std::pair<int, bool>> &)>(&STRIPS_Interface::add_cond_effect))
        .def("add_cond_effect",
             static_cast<void (STRIPS_Interface::*)(int, py::list &, py::list &)>(&STRIPS_Interface::add_cond_effect))
        .def("set_cost", &STRIPS_Interface::set_cost)
        .def("notify_negated_conditions", &STRIPS_Interface::notify_negated_conditions)
        .def("create_negated_fluents", &STRIPS_Interface::create_negated_fluents)
        .def("set_init",
             static_cast<void (STRIPS_Interface::*)(std::vector<std::pair<int, bool>> &)>(&STRIPS_Interface::set_init))
        .def("set_init",
             static_cast<void (STRIPS_Interface::*)(py::list &)>(&STRIPS_Interface::set_init))
        .def("set_goal",
             static_cast<void (STRIPS_Interface::*)(std::vector<std::pair<int, bool>> &)>(&STRIPS_Interface::set_goal))
        .def("set_goal",
             static_cast<void (STRIPS_Interface::*)(py::list &)>(&STRIPS_Interface::set_goal))
        .def("set_domain_name", &STRIPS_Interface::set_domain_name)
        .def("set_problem_name", &STRIPS_Interface::set_problem_name)
        .def("write_ground_pddl", &STRIPS_Interface::write_ground_pddl)
        .def("print_action", &STRIPS_Interface::print_action)
        .def("print_actions", &STRIPS_Interface::print_actions)
        .def("print_fluents", &STRIPS_Interface::print_fluents)
        .def("finalize_actions", &STRIPS_Interface::finalize_actions)
        .def_readwrite("parsing_time", &STRIPS_Interface::m_parsing_time)
        .def_readwrite("ignore_action_costs", &STRIPS_Interface::m_ignore_action_costs);

    py::class_<aptk::STRIPS_Problem>(m, "STRIPS_Problem")
        .def(py::init<std::string, std::string>());

    py::class_<Fwd_Search_Problem>(m, "Fwd_Search_Problem")
        .def(py::init<aptk::STRIPS_Problem *>());

    typedef H1_Callback<STRIPS_Interface, Fwd_Search_Problem, H_Add_Evaluation_Function> H_Add;

    py::class_<H_Add>(m, "H_Add")
        .def(py::init<STRIPS_Interface &>())
        .def("print_values", &H_Add::print_values)
        .def("compute_init_h", static_cast<std::string (H_Add::*)(py::list &, py::list &)>(&H_Add::compute_init_h))
        .def("compute_init_h", static_cast<std::string (H_Add::*)()>(&H_Add::compute_init_h))
        .def("fetch_relevant_actions", &H_Add::fetch_relevant_actions)
        .def("fetch_supporting_actions", &H_Add::fetch_supporting_actions)
        .def("fetch_best_supporters", &H_Add::fetch_best_supporters)
        .def("fetch_hval_fluents", &H_Add::fetch_hval_fluents);

    typedef H1_Callback<STRIPS_Interface, Fwd_Search_Problem, H_Max_Evaluation_Function> H_Max;

    py::class_<H_Max>(m, "H_Max")
        .def(py::init<STRIPS_Interface &>())
        .def("print_values", &H_Max::print_values)
        .def("compute_init_h", static_cast<std::string (H_Max::*)(py::list &, py::list &)>(&H_Max::compute_init_h))
        .def("compute_init_h", static_cast<std::string (H_Max::*)()>(&H_Max::compute_init_h))
        .def("fetch_relevant_actions", &H_Max::fetch_relevant_actions)
        .def("fetch_supporting_actions", &H_Max::fetch_supporting_actions)
        .def("fetch_best_supporters", &H_Max::fetch_best_supporters)
        .def("fetch_hval_fluents", &H_Max::fetch_hval_fluents);
}
