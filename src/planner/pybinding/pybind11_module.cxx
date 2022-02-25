#include<anytime_lapkt.hxx>
// #include<at_bfsf_planner.hxx>
// #include<bfsf_planner.hxx>
// #include<brfs_planner.hxx>
// #include<bfws.hxx>
// #include<dfiw_planner.hxx>
// #include<dfsiw_planner.hxx>
// #include<dfs_plus_planner.hxx>
// #include<iw_planner.hxx>
// #include<rp_iw_planner.hxx>
// #include<siw_planner.hxx>
// #include<siw_plus_planner.hxx>
// #include<siw_plus_bfs_f.hxx>

#include <py_strips_interface.hxx>
// #include <tarski_instantiator.hxx>
// #include <strips_prob.hxx>

namespace py = pybind11;

// using namespace tarski;

PYBIND11_MODULE(planner, m)
{
    py::module_::import("lapkt.core.lib.wrapper");

    py::class_<AT_LAPKT_Planner, STRIPS_Interface>(m, "AT_LAPKT_Planner")
        .def(py::init<>())
        .def("solve", &AT_LAPKT_Planner::solve)
        .def("setup", &AT_LAPKT_Planner::setup)
        .def_readwrite("iw_bound", &AT_LAPKT_Planner::m_iw_bound)
        .def_readwrite("max_novelty", &AT_LAPKT_Planner::m_max_novelty)
        .def_readwrite("log_filename", &AT_LAPKT_Planner::m_log_filename)
        .def_readwrite("plan_filename", &AT_LAPKT_Planner::m_plan_filename)
        .def_readwrite("enable_siw_plus", &AT_LAPKT_Planner::m_enable_siw_plus)
        .def_readwrite("enable_bfs_f", &AT_LAPKT_Planner::m_enable_bfs_f)
    ;
    // py::class_<Tarski_Instantiator>(m, "Tarski_Instantiator")
    //     .def(py::init< STRIPS_Interface* >() )
    //     .def(py::init< STRIPS_Interface* , py::list&, Formula&,
    //             py::list&, py::list& >() )
    //     .def("instantiate_action", &Tarski_Instantiator::instantiate_action)
    //     .def("add_fluents", &Tarski_Instantiator::add_fluents )
    //     .def("add_init", &Tarski_Instantiator::add_init )
    //     .def("add_goal", &Tarski_Instantiator::add_goal )
    //     .def("set_init", &Tarski_Instantiator::set_init )
    //     .def("add_goal", &Tarski_Instantiator::add_goal )
    //     .def("set_goal", &Tarski_Instantiator::set_goal )
    //     .def("add_functions", &Tarski_Instantiator::add_functions )
    //     .def("finalize_actions", &Tarski_Instantiator::finalize_actions )
    // ;

    // py::class_<Identifier>(m, "TI_Identifier")
    //     .def(py::init< char, std::string >() )
    // ;

    // py::class_<Atom>(m, "TI_Atom")
    //     .def(py::init< std::string, py::list& >() )
    //     .def("publish", &Atom::publish)
    // ;
    
    // py::class_<Formula>(m, "TI_Formula")
    //     .def(py::init<std::string, py::list&, 
    //             py::list&, bool >() )
    // ;

    // py::class_<tarski::Action>(m, "TI_Action")
    //     .def(py::init< std::string,  py::list&, Formula*,
    //             py::list&, py::tuple& >() )
    //     .def("publish", &tarski::Action::publish)
    // ;
}