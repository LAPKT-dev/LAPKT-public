target_sources(LAPKT
    PRIVATE
        anytime_lapkt.hxx
        anytime_lapkt.cxx
        #ipc2014_rwa.hxx
    )

target_include_directories(LAPKT
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
)

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/package/lapkt/config/lapkt_planner_config.yml
)
