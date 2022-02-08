find_package(FF REQUIRED)
target_sources(legacy_ff
    PRIVATE
        ff_to_aptk.cxx
        ff_to_aptk.hxx
        py_ff_to_aptk.cxx
        py_ff_to_aptk.hxx
)
target_include_directories(legacy_ff
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/package/core/include>
)

if(CMAKE_FF_PYWRAPPER)
    target_include_directories(ff_wrapper PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} ${FF_INCLUDE_DIR})
    target_link_libraries( py_wrapper PRIVATE
        legacy_ff
    )

    #
    target_sources(py_wrapper
        PRIVATE
            module.cxx
    )
    target_include_directories(py_wrapper
        PRIVATE
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    )
    #
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
#     EXPORT LAPKTTargets
#     )
#

