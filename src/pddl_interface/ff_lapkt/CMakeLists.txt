#
#
add_library(ff_cpp_interface)
target_sources(ff_cpp_interface
    PRIVATE
        ff_to_aptk.cxx
        ff_to_aptk.hxx
    )
target_include_directories(ff_cpp_interface
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
list(APPEND EXTRA_LIBS ff)
target_link_libraries( ff_cpp_interface PRIVATE
    ${EXTRA_LIBS}
    "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
    )


#
add_library(ff_py_interface)
target_sources(ff_py_interface
    PRIVATE
        py_ff_to_aptk.cxx
        py_ff_to_aptk.hxx
        module.cxx
    )
target_include_directories(ff_py_interface
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
target_include_directories(ff_py_interface PRIVATE 
    ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( ff_py_interface PRIVATE
    ${EXTRA_LIBS} 
    ${Boost_LIBRARIES}
    )
list(APPEND EXTRA_LIBS pddl_py_interface)
list(APPEND EXTRA_LIBS ff_cpp_interface)

target_link_libraries( ff_py_interface PRIVATE
    ${EXTRA_LIBS}
    "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
    )

#
install(
    FILES
        ff_to_aptk.hxx
    DESTINATION
        include
    COMPONENT
        Development EXCLUDE_FROM_ALL
    )
install(
    TARGETS ff_cpp_interface ff_py_interface
    DESTINATION lib/lapkt/ff
    COMPONENT Runtime 
    )
install(
    TARGETS ff_cpp_interface ff_py_interface
    DESTINATION lib/lapkt/ff
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )
#
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .libff_py_interface import *" )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION lib/lapkt/ff
    COMPONENT Runtime 
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION lib/lapkt/ff
    COMPONENT Development EXCLUDE_FROM_ALL
    )
