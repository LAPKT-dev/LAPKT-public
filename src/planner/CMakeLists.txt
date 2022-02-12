add_subdirectory(wrapper)
add_subdirectory(anytime_lapkt)
add_subdirectory(at_bfs_f)
add_subdirectory(bfs_f)
add_subdirectory(brfs)
add_subdirectory(bfws)
add_subdirectory(delete-free-iw)
add_subdirectory(delete-free-siw)
add_subdirectory(dfs_plus)
add_subdirectory(iw)
add_subdirectory(iw_plus)
add_subdirectory(siw)
add_subdirectory(siw_plus)
add_subdirectory(siw_plus-then-bfs_f)

target_include_directories(py_extension
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/planner/anytime_lapkt/anytime_lapkt.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/at_bfs_f/at_bfsf_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/bfs_f/bfsf_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/bfws/bfws.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/brfs/brfs_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/bfws/bfws.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/delete-free-iw/dfiw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/delete-free-siw/dfsiw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/dfs_plus/dfs_plus_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/iw/iw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/iw_plus/rp_iw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/siw/siw_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/siw_plus/siw_plus_planner.hxx
        ${PROJECT_SOURCE_DIR}/src/planner/siw_plus-then-bfs_f/siw_plus_bfs_f.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/lapkt/extension/include/planner
    COMPONENT
        lapkt
)

# PUBLIC_HEADER files can be installed with 
#   install(<target> ...PUBLIC_HEADER DESTINATION ...)

# set_target_properties(py_extension PROPERTIES
#     PUBLIC_HEADER
# "${PROJECT_SOURCE_DIR}/src/planner/anytime_lapkt/anytime_lapkt.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/anytime_lapkt/ipc2014_rwa.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/at_bfs_f/at_bfsf_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/bfs_f/bfsf_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/bfws/bfws.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/brfs/brfs_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/bfws/bfws.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/delete-free-iw/dfiw_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/delete-free-siw/dfsiw_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/dfs_plus/dfs_plus_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/iw/iw_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/iw_plus/rp_iw_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/siw/siw_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/siw_plus/siw_plus_planner.hxx;\
# ${PROJECT_SOURCE_DIR}/src/planner/siw_plus-then-bfs_f/siw_plus_bfs_f.hxx"
# )

# Planner configuration file in Python Package
file(TOUCH ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/lapkt_planner_config.yml)
install(
    FILES ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/lapkt_planner_config.yml
    DESTINATION ${REL_PYPI_LAPKT_ROOT}/planner
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)