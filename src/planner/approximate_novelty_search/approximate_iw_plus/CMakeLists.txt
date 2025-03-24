target_sources(planner
    PRIVATE
        approximate_rp_iw.cxx
        approximate_rp_iw.hxx
    )

target_include_directories(planner
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}
    )

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/lapkt_planner_config.yml
)
