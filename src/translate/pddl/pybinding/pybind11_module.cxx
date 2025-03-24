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
#include <tarski_instantiator.hxx>
#include <strips_prob.hxx>
#include <pybind11/pybind11.h>
#ifdef USE_FF
#include <py_ff_to_aptk.hxx>
#endif

namespace py = pybind11;

using namespace py::literals;
using namespace tarski;

PYBIND11_MODULE(pddl, m)
{
    py::class_<Tarski_Instantiator>(m, "Tarski_Instantiator")
        .def(py::init<STRIPS_Interface *>())
        .def(py::init<STRIPS_Interface *, py::list &, Formula &,
                      py::list &, py::list &>())
        .def("instantiate_action", &Tarski_Instantiator::instantiate_action)
        .def("add_fluents", &Tarski_Instantiator::add_fluents)
        .def("add_init", &Tarski_Instantiator::add_init)
        .def("add_goal", &Tarski_Instantiator::add_goal)
        .def("set_init", &Tarski_Instantiator::set_init)
        .def("add_goal", &Tarski_Instantiator::add_goal)
        .def("set_goal", &Tarski_Instantiator::set_goal)
        .def("add_functions", &Tarski_Instantiator::add_functions)
        .def("finalize_actions", &Tarski_Instantiator::finalize_actions);

    py::class_<Identifier>(m, "TI_Identifier")
        .def(py::init<char, std::string>());

    py::class_<Atom>(m, "TI_Atom")
        .def(py::init<std::string, py::list &>())
        .def("publish", &Atom::publish);

    py::class_<Formula>(m, "TI_Formula")
        .def(py::init<std::string, py::list &,
                      py::list &, bool>());

    py::class_<Action>(m, "TI_Action")
        .def(py::init<std::string, py::list &, Formula *,
                      py::list &, py::tuple &>())
        .def("publish", &Action::publish);
#ifdef USE_FF
    m.def("pddl_translate_ff", &aptk::FF_Parser::py_get_problem_description);
#endif
}