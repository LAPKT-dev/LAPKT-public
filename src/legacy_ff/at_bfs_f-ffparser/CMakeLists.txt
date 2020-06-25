target_sources(run_at_bfs_f_ff_parser
    PRIVATE
        main.cxx
        ipc2014_rwa.hxx
    )
find_package(Boost REQUIRED COMPONENTS program_options)
target_include_directories(run_at_bfs_f_ff_parser PRIVATE ${Boost_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(run_at_bfs_f_ff_parser PRIVATE
    ${EXTRA_LIBS}
    ${Boost_PROGRAM_OPTIONS_LIBRARY} 
    ${Boost_REGEX_LIBRARY}
    )
