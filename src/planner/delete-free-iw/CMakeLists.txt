target_sources(planner
    PRIVATE
        dfiw_planner.cxx
        dfiw_planner.hxx
    )

target_include_directories(planner 
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
    )

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/lapkt_planner_config.yml
    )
