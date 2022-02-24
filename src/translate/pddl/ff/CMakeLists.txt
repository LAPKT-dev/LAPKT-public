find_package(FF REQUIRED)
target_sources(core
    PRIVATE
        ff_to_aptk.cxx
        ff_to_aptk.hxx
)
target_include_directories(core
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_include_directories(core 
    PRIVATE 
        ${FF_INCLUDE_DIRS}
)

target_link_libraries(core
    PRIVATE
        ${FF_LIBRARIES}
)

set_target_properties(core PROPERTIES
    LINK_FLAGS "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
)

install(
        FILES
            ${PROJECT_SOURCE_DIR}/src/translate/pddl/ff/ff_to_aptk.hxx
        DESTINATION
            ${CMAKE_INSTALL_PREFIX}/lapkt/core/include/translate
        COMPONENT
            lapkt
)

if(CMAKE_FF_PYWRAPPER)
    target_include_directories(pddl PRIVATE ${FF_INCLUDE_DIRS})
    target_link_libraries(pddl PRIVATE
        core
    )

    target_sources(pddl
        PRIVATE
            py_ff_to_aptk.cxx
            py_ff_to_aptk.hxx
    )

    target_include_directories(pddl
        PRIVATE
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    )
endif(CMAKE_FF_PYWRAPPER)


# target_include_directories(ff_wrapper PRIVATE 
#     ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
# target_link_libraries( ff_wrapper PRIVATE
#     ${Boost_LIBRARIES}
#     )
# list(APPEND EXTRA_LIBS pddl_py_interface)
# list(APPEND EXTRA_LIBS ff_cpp_interface)

# target_link_libraries( ff_wrapper PRIVATE
#     ff
#     "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
#     )

# install(
#     TARGETS ff_cpp_interface ff_py_interface
#     DESTINATION lib/lapkt/ff
#     COMPONENT Runtime 
#     )
# install(
#     TARGETS ff_cpp_interface ff_py_interface
#     DESTINATION lib/lapkt/ff
#     COMPONENT Development EXCLUDE_FROM_ALL
#     EXPORT lapktTargets
#     )
#

