target_sources(LAPKT
    PRIVATE
        bs_graph.hxx
        ff_rp_heuristic.hxx
        h_1.hxx
        h_2.hxx
        h_C.hxx
        h_null.hxx
        h_unsat.hxx
        h_unsat_mutex.hxx
        heuristic.hxx
        landmark_count.hxx
        landmark_graph.cxx
        landmark_graph.hxx
        landmark_graph_generator.hxx
        landmark_graph_manager.hxx
        layered_h_max.hxx
        rp_heuristic.hxx
)
target_include_directories(LAPKT
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/package/core/include>
)


