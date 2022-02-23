#include <py_strips_interface.hxx>
#include <tarski_instantiator.hxx>
#include <strips_prob.hxx>
#include <pybind11/pybind11.h>

namespace py = pybind11;

using namespace py::literals;
using namespace tarski;

// PYBIND11_MODULE(planner, m)
// {
//     py::class_<Tarski_Instantiator>(m, "Tarski_Instantiator")
//         .def(py::init< STRIPS_Interface* >() )
//         .def(py::init< STRIPS_Interface* , py::list&, Formula&,
//                 py::list&, py::list& >() )
//         .def("instantiate_action", &Tarski_Instantiator::instantiate_action)
//         .def("add_fluents", &Tarski_Instantiator::add_fluents )
//         .def("add_init", &Tarski_Instantiator::add_init )
//         .def("add_goal", &Tarski_Instantiator::add_goal )
//         .def("set_init", &Tarski_Instantiator::set_init )
//         .def("add_goal", &Tarski_Instantiator::add_goal )
//         .def("set_goal", &Tarski_Instantiator::set_goal )
//         .def("add_functions", &Tarski_Instantiator::add_functions )
//         .def("finalize_actions", &Tarski_Instantiator::finalize_actions )
//     ;

//     py::class_<Identifier>(m, "TI_Identifier")
//         .def(py::init< char, std::string >() )
//     ;

//     py::class_<Atom>(m, "TI_Atom")
//         .def(py::init< std::string, py::list& >() )
//         .def("publish", &Atom::publish)
//     ;
    
//     py::class_<Formula>(m, "TI_Formula")
//         .def(py::init<std::string, py::list&, 
//                 py::list&, bool >() )
//     ;

//     py::class_<Action>(m, "TI_Action")
//         .def(py::init< std::string,  py::list&, Formula*,
//                 py::list&, py::tuple& >() )
//         .def("publish", &Action::publish)
//     ;
// }