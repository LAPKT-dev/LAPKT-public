target_sources(py_extension
    PRIVATE
        siw_plus_bfs_f.cxx
        # siw_plus_bfs_f.hxx
)

target_include_directories(py_extension
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

cat(${CMAKE_CURRENT_SOURCE_DIR}/planner_config.yml 
    ${PROJECT_BINARY_DIR}/pypi_release/package/lapkt/config/lapkt_planner_config.yml
)
