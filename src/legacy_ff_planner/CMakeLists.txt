set(CMAKE_INSTALL_RPATH 
"${CMAKE_INSTALL_RPATH}:$ORIGIN/../lib/lapkt/shared;\
${CMAKE_INSTALL_RPATH}:$ORIGIN/../lib/lapkt/interface;\
${CMAKE_INSTALL_RPATH}:$ORIGIN/../lib/lapkt/boost/;\
${CMAKE_INSTALL_RPATH}:$ORIGIN/../lib/lapkt/ff"
    )
add_executable(run_at_bfs_f_ff_parser "")
add_subdirectory(at_bfs_f-ffparser)
add_executable(run_bfs_f_ff_parser "")
add_subdirectory(bfs_f-ffparser)
add_executable(run_dfs_plus_ff_parser "")
add_subdirectory(dfs_plus-ffparser)
add_executable(run_ff_ff_parser "")
add_subdirectory(ff-ffparser)
add_executable(run_generic_best_first_ff_parser "")
add_subdirectory(generic-best_first-ffparser)
add_executable(run_iw_ff_parser "")
add_subdirectory(iw)
add_executable(run_iw_plus_ff_parser "")
add_subdirectory(iw_plus-ffparser)
add_executable(run_siw_ff_parser "")
add_subdirectory(siw-ffparser)
add_executable(run_siw_plus_ff_parser "")
add_subdirectory(siw_plus-ffparser)
add_executable(run_siw_plus_then_bfs_f_ff_parser "")
add_subdirectory(siw_plus-then-bfs_f-ffparser)

add_dependencies(planner run_siw_plus_then_bfs_f_ff_parser)

install(
    TARGETS 
        run_iw_ff_parser 
        run_iw_plus_ff_parser 
        run_at_bfs_f_ff_parser 
        run_bfs_f_ff_parser 
        run_dfs_plus_ff_parser 
        run_ff_ff_parser
        run_generic_best_first_ff_parser 
        run_siw_ff_parser 
        run_siw_plus_ff_parser 
        run_siw_plus_then_bfs_f_ff_parser
    DESTINATION 
        ${CMAKE_INSTALL_PREFIX}/lapkt/core/bin
    COMPONENT  
        lapkt
)
