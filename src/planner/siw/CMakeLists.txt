target_sources(planner
    PRIVATE
        siw_planner.cxx
        # siw_planner.hxx
)

target_include_directories(planner
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)
cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/lapkt_planner_config.yml
)
