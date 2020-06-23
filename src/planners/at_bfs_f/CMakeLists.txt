target_sources(Planners
    PRIVATE
        at_bfsf_planner.hxx
        at_bfsf_planner.cxx
        ipc2014_rwa.hxx
    )

target_include_directories(Planners 
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
    )

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/lapkt_planner_config.yml
    )
