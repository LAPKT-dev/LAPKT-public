#include <anytime_lapkt.hxx>
#include <at_bfsf_planner.hxx>
#include <bfsf_planner.hxx>
#include <brfs_planner.hxx>
#include <bfws.hxx>
#include <dfiw_planner.hxx>
#include <dfsiw_planner.hxx>
#include <dfs_plus_planner.hxx>
#include <iw_planner.hxx>
#include <rp_iw_planner.hxx>
#include <siw_planner.hxx>
#include <siw_plus_planner.hxx>
#include <siw_plus_bfs_f.hxx>

#include <approximate_bfws.hxx>
#include <approximate_dfs_plus.hxx>
#include <approximate_iw.hxx>
#include <approximate_rp_iw.hxx>
#include <approximate_siw.hxx>

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
    .def_readwrite("enable_bfs_f", &AT_LAPKT_Planner::m_enable_bfs_f);

  py::class_<AT_BFS_f_Planner, STRIPS_Interface>(m, "AT_BFS_f_Planner")
    .def(py::init<>())
    .def("setup", &AT_BFS_f_Planner::setup)
    .def("solve", &AT_BFS_f_Planner::solve)
    .def_readwrite("iw_bound", &AT_BFS_f_Planner::m_iw_bound)
    .def_readwrite("max_novelty", &AT_BFS_f_Planner::m_max_novelty)
    .def_readwrite("log_filename", &AT_BFS_f_Planner::m_log_filename)
    .def_readwrite("plan_filename", &AT_BFS_f_Planner::m_plan_filename)
    .def_readwrite("enable_siw", &AT_BFS_f_Planner::m_enable_siw)
    .def_readwrite("enable_bfs_f", &AT_BFS_f_Planner::m_enable_bfs_f);

  py::class_<BFS_f_Planner, STRIPS_Interface>(m, "BFS_f_Planner")
    .def(py::init<>())
    .def("setup", &BFS_f_Planner::setup)
    .def("solve", &BFS_f_Planner::solve)
    .def_readwrite("max_novelty", &BFS_f_Planner::m_max_novelty)
    .def_readwrite("log_filename", &BFS_f_Planner::m_log_filename)
    .def_readwrite("plan_filename", &BFS_f_Planner::m_plan_filename)
    .def_readwrite("one_ha_per_fluent", &BFS_f_Planner::m_one_ha_per_fluent);

  py::class_<BRFS_Planner, STRIPS_Interface>(m, "BRFS_Planner")
    .def(py::init<>())
    .def("setup", &BRFS_Planner::setup)
    .def("solve", &BRFS_Planner::solve)
    .def_readwrite("log_filename", &BRFS_Planner::m_log_filename)
    .def_readwrite("plan_filename", &BRFS_Planner::m_plan_filename);

  py::class_<BFWS, STRIPS_Interface>(m, "BFWS")
    .def(py::init<>())
    .def("setup", &BFWS::setup)
    .def("solve", &BFWS::solve)
    .def_readwrite("log_filename", &BFWS::m_log_filename)
    .def_readwrite("plan_filename", &BFWS::m_plan_filename)
    .def_readwrite("anytime", &BFWS::m_anytime)
    .def_readwrite("search", &BFWS::m_search_alg)
    .def_readwrite("m_value", &BFWS::m_M)
    .def_readwrite("max_novelty", &BFWS::m_max_novelty)
    .def_readwrite("found_plan", &BFWS::m_found_plan)
    .def_readwrite("plan_cost", &BFWS::m_cost)
    .def_readwrite("cost_bound", &BFWS::m_cost_bound)
    .def_readwrite("verbose", &BFWS::m_verbose);

  py::class_<Approximate_BFWS, STRIPS_Interface>(m, "Approximate_BFWS")
    .def(py::init<>())
    .def( "setup", &Approximate_BFWS::setup )
    .def( "solve", &Approximate_BFWS::solve )
    .def_readwrite( "parsing_time", &Approximate_BFWS::m_parsing_time )
    .def_readwrite( "ignore_action_costs", &Approximate_BFWS::m_ignore_action_costs )
    .def_readwrite( "anytime", &Approximate_BFWS::m_anytime )
    .def_readwrite( "log_filename", &Approximate_BFWS::m_log_filename )
    .def_readwrite( "search", &Approximate_BFWS::m_search_alg )
    .def_readwrite( "m_value", &Approximate_BFWS::m_M )
    .def_readwrite( "max_novelty", &Approximate_BFWS::m_max_novelty )
    .def_readwrite( "plan_filename", &Approximate_BFWS::m_plan_filename )
    .def_readwrite( "found_plan", &Approximate_BFWS::m_found_plan )
    .def_readwrite( "plan_cost", &Approximate_BFWS::m_cost )
    .def_readwrite( "cost_bound", &Approximate_BFWS::m_cost_bound )
    .def_readwrite( "bf_fs", &Approximate_BFWS::m_bf_fs_gb )
    .def_readwrite( "bf_max_size", &Approximate_BFWS::m_bf_max_size_gb )
    .def_readwrite( "sample_fs", &Approximate_BFWS::m_sample_fs )
    .def_readwrite( "sample_factor", &Approximate_BFWS::m_sample_factor )
    .def_readwrite( "sampling_strategy", &Approximate_BFWS::m_sampling_strategy )
    .def_readwrite( "rand_seed", &Approximate_BFWS::m_rand_seed )
    .def_readwrite( "min_k4sample", &Approximate_BFWS::m_min_k4sample )
    .def_readwrite( "alpha_rand_prune", &Approximate_BFWS::m_alpha_rand_prune )
    .def_readwrite( "slack", &Approximate_BFWS::m_rand_prune_slack )
    .def_readwrite( "use_hq", &Approximate_BFWS::m_enable_hold_q )
    .def_readwrite( "verbose", &Approximate_BFWS::m_verbose )
    ;

  py::class_<DFIW_Planner, STRIPS_Interface>(m, "DFIW_Planner")
    .def(py::init<>())
    .def("setup", &DFIW_Planner::setup)
    .def("solve", &DFIW_Planner::solve)
    .def_readwrite("iw_bound", &DFIW_Planner::m_iw_bound)
    .def_readwrite("log_filename", &DFIW_Planner::m_log_filename)
    .def_readwrite("plan_filename", &DFIW_Planner::m_plan_filename);

  py::class_<DFSIW_Planner, STRIPS_Interface>(m, "DFSIW_Planner")
    .def(py::init<>())
    .def("setup", &DFSIW_Planner::setup)
    .def("solve", &DFSIW_Planner::solve)
    .def_readwrite("parsing_time", &DFSIW_Planner::m_parsing_time)
    .def_readwrite("ignore_action_costs", &DFSIW_Planner::m_ignore_action_costs)
    .def_readwrite("iw_bound", &DFSIW_Planner::m_iw_bound)
    .def_readwrite("log_filename", &DFSIW_Planner::m_log_filename)
    .def_readwrite("plan_filename", &DFSIW_Planner::m_plan_filename);

  py::class_<DFS_Plus_Planner, STRIPS_Interface>(m, "DFS_Plus_Planner")
    .def(py::init<>())
    .def("setup", &DFS_Plus_Planner::setup)
    .def("solve", &DFS_Plus_Planner::solve)
    .def_readwrite("iw_bound", &DFS_Plus_Planner::m_iw_bound)
    .def_readwrite("log_filename", &DFS_Plus_Planner::m_log_filename)
    .def_readwrite("plan_filename", &DFS_Plus_Planner::m_plan_filename);

  py::class_<Approximate_DFS_Plus, STRIPS_Interface>(m, "Approximate_DFS_Plus")
    .def(py::init<>())
    .def("setup", &Approximate_DFS_Plus::setup)
    .def("solve", &Approximate_DFS_Plus::solve)
    .def_readwrite("iw_bound", &Approximate_DFS_Plus::m_iw_bound)
    .def_readwrite("log_filename", &Approximate_DFS_Plus::m_log_filename)
    .def_readwrite("plan_filename", &Approximate_DFS_Plus::m_plan_filename);

  py::class_<IW_Planner, STRIPS_Interface>(m, "IW_Planner")
    .def(py::init<>())
    .def("setup", &IW_Planner::setup)
    .def("solve", &IW_Planner::solve)
    .def_readwrite("iw_bound", &IW_Planner::m_iw_bound)
    .def_readwrite("log_filename", &IW_Planner::m_log_filename)
    .def_readwrite("plan_filename", &IW_Planner::m_plan_filename)
    .def_readwrite("atomic", &IW_Planner::m_atomic);

  py::class_<Approximate_IW, STRIPS_Interface>(m, "Approximate_IW")
    .def(py::init<>())
    .def("setup", &Approximate_IW::setup)
    .def("solve", &Approximate_IW::solve)
    .def_readwrite("iw_bound", &Approximate_IW::m_iw_bound)
    .def_readwrite("log_filename", &Approximate_IW::m_log_filename)
    .def_readwrite("plan_filename", &Approximate_IW::m_plan_filename);

  py::class_<RPIW_Planner, STRIPS_Interface>(m, "RPIW_Planner")
    .def(py::init<>())
    .def("setup", &RPIW_Planner::setup)
    .def("solve", &RPIW_Planner::solve)
    .def_readwrite("iw_bound", &RPIW_Planner::m_iw_bound)
    .def_readwrite("log_filename", &RPIW_Planner::m_log_filename)
    .def_readwrite("plan_filename", &RPIW_Planner::m_plan_filename)
    .def_readwrite("atomic", &RPIW_Planner::m_atomic);

  py::class_<Approximate_RP_IW, STRIPS_Interface>(m, "Approximate_RP_IW")
    .def(py::init<>())
    .def("setup", &Approximate_RP_IW::setup)
    .def("solve", &Approximate_RP_IW::solve)
    .def_readwrite("iw_bound", &Approximate_RP_IW::m_iw_bound)
    .def_readwrite("log_filename", &Approximate_RP_IW::m_log_filename)
    .def_readwrite("plan_filename", &Approximate_RP_IW::m_plan_filename);

  py::class_<SIW_Planner, STRIPS_Interface>(m, "SIW_Planner")
    .def(py::init<>())
    .def("setup", &SIW_Planner::setup)
    .def("solve", &SIW_Planner::solve)
    .def_readwrite("iw_bound", &SIW_Planner::m_iw_bound)
    .def_readwrite("log_filename", &SIW_Planner::m_log_filename)
    .def_readwrite("plan_filename", &SIW_Planner::m_plan_filename);

  py::class_<Approximate_SIW, STRIPS_Interface>(m, "Approximate_SIW")
    .def(py::init<>())
    .def("setup", &Approximate_SIW::setup)
    .def("solve", &Approximate_SIW::solve)
    .def_readwrite("iw_bound", &Approximate_SIW::m_iw_bound)
    .def_readwrite("log_filename", &Approximate_SIW::m_log_filename)
    .def_readwrite("plan_filename", &Approximate_SIW::m_plan_filename);

  py::class_<SIW_Plus_Planner, STRIPS_Interface>(m, "SIW_Plus_Planner")
    .def(py::init<>())
    .def("setup", &SIW_Plus_Planner::setup)
    .def("solve", &SIW_Plus_Planner::solve)
    .def_readwrite("iw_bound", &SIW_Plus_Planner::m_iw_bound)
    .def_readwrite("log_filename", &SIW_Plus_Planner::m_log_filename)
    .def_readwrite("plan_filename", &SIW_Plus_Planner::m_plan_filename);

  py::class_<SIW_PLUS_BFS_F_Planner, STRIPS_Interface>(m, "SIW_PLUS_BFS_F_Planner")
    .def(py::init<>())
    .def("setup", &SIW_PLUS_BFS_F_Planner::setup)
    .def("solve", &SIW_PLUS_BFS_F_Planner::solve)
    .def_readwrite("iw_bound", &SIW_PLUS_BFS_F_Planner::m_iw_bound)
    .def_readwrite("max_novelty", &SIW_PLUS_BFS_F_Planner::m_max_novelty)
    .def_readwrite("log_filename", &SIW_PLUS_BFS_F_Planner::m_log_filename)
    .def_readwrite("plan_filename", &SIW_PLUS_BFS_F_Planner::m_plan_filename)
    .def_readwrite("enable_siw_plus", &SIW_PLUS_BFS_F_Planner::m_enable_siw_plus)
    .def_readwrite("enable_bfs_f", &SIW_PLUS_BFS_F_Planner::m_enable_bfs_f);
}