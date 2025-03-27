add_subdirectory(apx_bfws)
add_subdirectory(apx_dfs_plus)
add_subdirectory(apx_iw)
add_subdirectory(apx_iw_plus)
add_subdirectory(apx_siw)


install(
    FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/apx_bfws/approximate_bfws.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/apx_dfs_plus/approximate_dfs_plus.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/apx_iw/approximate_iw.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/apx_iw_plus/approximate_rp_iw.hxx
        ${CMAKE_CURRENT_SOURCE_DIR}/apx_siw/approximate_siw.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/${REL_CORE_INC_DIR}/planner
    COMPONENT
        lapkt
)