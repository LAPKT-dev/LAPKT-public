target_sources(run_iw_plus_ff_parser
    PRIVATE
        main.cxx
    )
target_include_directories(run_iw_plus_ff_parser PUBLIC ${Boost_INCLUDE_DIRS})
target_link_libraries(run_iw_plus_ff_parser
    ${EXTRA_LIBS}
    ${Boost_PROGRAM_OPTIONS_LIBRARY} 
    ${Boost_REGEX_LIBRARY}
    )
