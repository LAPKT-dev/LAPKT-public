target_sources(run_generic_best_first_ff_parser
    PRIVATE
        main.cxx
        ff_gbfs.hxx
        ff_rp_heuristic.hxx
    )
find_package(Boost REQUIRED COMPONENTS program_options)
target_include_directories(run_generic_best_first_ff_parser PRIVATE ${Boost_INCLUDE_DIRS} ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(run_generic_best_first_ff_parser PRIVATE
    ${EXTRA_LIBS}
    ${Boost_PROGRAM_OPTIONS_LIBRARY} 
    ${Boost_REGEX_LIBRARY}
    )
