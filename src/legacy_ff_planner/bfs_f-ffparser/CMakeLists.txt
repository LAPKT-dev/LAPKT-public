target_sources(run_bfs_f_ff_parser
    PRIVATE
        main.cxx
    )
target_include_directories(run_bfs_f_ff_parser PRIVATE ${Boost_INCLUDE_DIRS})
target_link_libraries(run_bfs_f_ff_parser PRIVATE
    ${EXTRA_LIBS}
    ${Boost_PROGRAM_OPTIONS_LIBRARY} 
    ${Boost_REGEX_LIBRARY}
    )
