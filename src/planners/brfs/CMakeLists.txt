target_sources(Planners
    PRIVATE
        brfs_planner.cxx
        brfs_planner.hxx
    )

target_include_directories(Planners 
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
    )

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/lapkt_planner_config.yml
    )
