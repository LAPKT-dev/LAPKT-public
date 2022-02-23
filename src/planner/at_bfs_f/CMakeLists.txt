target_sources(planner
    PRIVATE
        # at_bfsf_planner.hxx
        at_bfsf_planner.cxx
        # ipc2014_rwa.hxx
)

target_include_directories(planner
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)


cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/lapkt_planner_config.yml
)
