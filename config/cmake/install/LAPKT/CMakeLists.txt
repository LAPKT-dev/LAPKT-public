#xxxx SECTION 1 - Install LAPKT Core CXX Library xxxx#
# Component name - LAPKT

install(
    TARGETS LAPKT 
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/core/lib/
    COMPONENT LAPKT EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/model/action.hxx
        ${PROJECT_SOURCE_DIR}/src/model/cond_eff.hxx
        ${PROJECT_SOURCE_DIR}/src/model/conj_comp_prob.hxx
        ${PROJECT_SOURCE_DIR}/src/model/fl_conj.hxx
        ${PROJECT_SOURCE_DIR}/src/model/fluent.hxx
        ${PROJECT_SOURCE_DIR}/src/model/fwd_search_prob.hxx
        ${PROJECT_SOURCE_DIR}/src/model/mutex_set.hxx
        ${PROJECT_SOURCE_DIR}/src/model/strips_prob.hxx
        ${PROJECT_SOURCE_DIR}/src/model/strips_state.hxx
        ${PROJECT_SOURCE_DIR}/src/model/search_prob.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/core/include/model
    COMPONENT
        LAPKT EXCLUDE_FROM_ALL
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/search/at_bfs.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_bfs_dq.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_bfs_dq_mh.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_gbfs.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_gbfs_3h.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_rwbfs_dq.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_rwbfs_dq_mh.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_wbfs.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_wbfs_dq.hxx
        ${PROJECT_SOURCE_DIR}/src/search/at_wbfs_dq_mh.hxx
        ${PROJECT_SOURCE_DIR}/src/search/brfs.hxx
        ${PROJECT_SOURCE_DIR}/src/search/bfws_2h.hxx
        ${PROJECT_SOURCE_DIR}/src/search/bfws_4h.hxx
        ${PROJECT_SOURCE_DIR}/src/search/bfws_2h_M.hxx
        ${PROJECT_SOURCE_DIR}/src/search/bfws_2h_consistency.hxx
        ${PROJECT_SOURCE_DIR}/src/search/bfws_2h_consistency_M.hxx
        ${PROJECT_SOURCE_DIR}/src/search/new_node_comparer.hxx
        ${PROJECT_SOURCE_DIR}/src/search/ipc2014_rwa.hxx
        ${PROJECT_SOURCE_DIR}/src/search/closed_list.hxx
        ${PROJECT_SOURCE_DIR}/src/search/das.hxx
        ${PROJECT_SOURCE_DIR}/src/search/dfs_plus.hxx
        ${PROJECT_SOURCE_DIR}/src/search/ff_ehc.hxx
        ${PROJECT_SOURCE_DIR}/src/search/ff_gbfs.hxx
        ${PROJECT_SOURCE_DIR}/src/search/iw.hxx
        ${PROJECT_SOURCE_DIR}/src/search/match_tree.hxx
        ${PROJECT_SOURCE_DIR}/src/search/open_list.hxx
        ${PROJECT_SOURCE_DIR}/src/search/reachability.hxx
        ${PROJECT_SOURCE_DIR}/src/search/rp_iw.hxx
        ${PROJECT_SOURCE_DIR}/src/search/serialized_search.hxx
        ${PROJECT_SOURCE_DIR}/src/search/siw.hxx
        ${PROJECT_SOURCE_DIR}/src/search/siw_plus.hxx
        ${PROJECT_SOURCE_DIR}/src/search/succ_gen.hxx
        ${PROJECT_SOURCE_DIR}/src/search/watched_lit_succ_gen.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/core/include/search
    COMPONENT
        LAPKT EXCLUDE_FROM_ALL
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/utility/bit_array.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/bit_matrix.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/bit_set.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/bit_square_matrix.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/ext_math.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/hash_table.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/jenkins_12bit.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/memory.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/resources_control.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/sliding_window.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/string_conversions.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/time.hxx
        ${PROJECT_SOURCE_DIR}/src/utility/types.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/core/include/utility
    COMPONENT
        LAPKT EXCLUDE_FROM_ALL
)

install(
    FILES 
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/bs_graph.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/ff_rp_heuristic.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/h_1.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/h_2.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/h_C.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/h_null.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/h_unsat.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/h_unsat_mutex.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/heuristic.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/landmark_count.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/landmark_graph.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/landmark_graph_generator.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/landmark_graph_manager.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/layered_h_max.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/heuristic/rp_heuristic.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/core/include/heuristic
    COMPONENT
        LAPKT EXCLUDE_FROM_ALL
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/eval_node/novelty/node_novelty_spaces.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/novelty/novelty.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/novelty/novelty_partition.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/novelty/novelty_partition_1.hxx
        ${PROJECT_SOURCE_DIR}/src/eval_node/novelty/novelty_partition_2.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/core/include/novelty
    COMPONENT
        LAPKT EXCLUDE_FROM_ALL
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/pddl2strips/wrapper/py_strips_interface.hxx
        ${PROJECT_SOURCE_DIR}/src/pddl2strips/tarski/tarski_instantiator.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/core/include/wrapper
    COMPONENT
        LAPKT EXCLUDE_FROM_ALL
)

install(
    FILES 
        ${PROJECT_SOURCE_DIR}/src/planner/anytime_lapkt/anytime_lapkt.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/at_bfs_f/at_bfsf_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/bfs_f/bfsf_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/bfws/bfws.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/brfs/brfs_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/bfws/bfws.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/delete-free-iw/dfiw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/delete-free-siw/dfsiw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/dfs_plus/dfs_plus_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/iw/iw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/iw_plus/rp_iw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/siw/siw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/siw_planner/siw_plus_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/siw_plus-then-bfs_f/siw_plus_bfs_f.hxx
    DESTINATION 
        ${CMAKE_INSTALL_PREFIX}/package/core/include/planner
    COMPONENT 
        LAPKT EXCLUDE_FROM_ALL
)