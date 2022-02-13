target_sources(run_siw_plus_ff_parser
    PRIVATE
        main.cxx
)
set_target_properties(run_siw_plus_ff_parser PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lapkt/core/bin
)
target_include_directories(run_siw_plus_ff_parser 
    PRIVATE 
        ${Boost_INCLUDE_DIRS}
)
target_link_libraries(run_siw_plus_ff_parser 
    PRIVATE
        core
        ${Boost_PROGRAM_OPTIONS_LIBRARY} 
        ${Boost_REGEX_LIBRARY}
)
