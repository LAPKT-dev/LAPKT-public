target_sources(run_at_bfs_f_ff_parser
    PRIVATE
        main.cxx
        ipc2014_rwa.hxx
)
target_include_directories(run_at_bfs_f_ff_parser 
    PRIVATE 
        ${Boost_INCLUDE_DIRS} 
        ${CMAKE_CURRENT_SOURCE_DIR}
)
set_target_properties(run_at_bfs_f_ff_parser PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lapkt/core/bin
    INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:$ORIGIN/../lib"
)
target_link_libraries(run_at_bfs_f_ff_parser PRIVATE
    core
    ${Boost_PROGRAM_OPTIONS_LIBRARY} 
    ${Boost_REGEX_LIBRARY}
)
