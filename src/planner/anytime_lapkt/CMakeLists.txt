target_sources(planner
    PRIVATE
        # anytime_lapkt.hxx
        anytime_lapkt.cxx
        #ipc2014_rwa.hxx
    )

target_include_directories(planner
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/lapkt_planner_config.yml
)
