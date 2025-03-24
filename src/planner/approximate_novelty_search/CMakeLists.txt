add_subdirectory(approximate_bfws)
add_subdirectory(approximate_dfs_plus)
add_subdirectory(approximate_iw)
add_subdirectory(approximate_iw_plus)
add_subdirectory(approximate_siw)


install(
    FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/approximate_bfws/approximate_bfws.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/approximate_dfs_plus/approximate_dfs_plus.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/approximate_iw/approximate_iw.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/approximate_iw_plus/approximate_rp_iw.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/approximate_siw/approximate_siw.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/${REL_CORE_INC_DIR}/planner
    COMPONENT
        lapkt
)