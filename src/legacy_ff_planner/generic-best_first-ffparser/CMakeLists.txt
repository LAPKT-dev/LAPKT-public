target_sources(run_generic_best_first_ff_parser
    PRIVATE
        main.cxx
        ff_gbfs.hxx
        ff_rp_heuristic.hxx
)
set_target_properties(run_generic_best_first_ff_parser PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lapkt/core/bin
    INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:$ORIGIN/../lib"
)
target_include_directories(run_generic_best_first_ff_parser 
    PRIVATE 
        ${Boost_INCLUDE_DIRS} 
        ${CMAKE_CURRENT_SOURCE_DIR}
)
target_link_libraries(run_generic_best_first_ff_parser 
    PRIVATE
        core
        ${Boost_PROGRAM_OPTIONS_LIBRARY} 
        ${Boost_REGEX_LIBRARY}
)
