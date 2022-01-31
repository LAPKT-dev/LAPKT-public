
#
add_library(legacy_ff)
target_link_libraries( legacy_ff PRIVATE
    ${FF_LIBRARIES}
    LAPKT
    "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
    )
target_sources(legacy_ff
    PRIVATE
        ff_to_aptk.cxx
        ff_to_aptk.hxx
    )
target_include_directories(legacy_ff
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
        ${FF_INCLUDE_DIR}
    )



SET_TARGET_PROPERTIES(ff_wrapper PROPERTIES PREFIX "")
set_target_properties(ff_wrapper PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/_pywrapper)
set_target_properties(ff_wrapper PROPERTIES LINK_SEARCH_START_STATIC ON)
set_target_properties(ff_wrapper PROPERTIES LINK_SEARCH_END_STATIC ON)
target_link_libraries(ff_wrapper PRIVATE -static-libstdc++)

target_include_directories(ff_wrapper PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( ff_wrapper PRIVATE
    LAPKT
    ${Boost_LIBRARIES}
    )
target_link_libraries( planner PRIVATE
    tarski_wrapper
    )
#
target_sources(ff_wrapper
    PRIVATE
        module.cxx
        py_ff_to_aptk.cxx
        py_ff_to_aptk.hxx
    )
target_include_directories(ff_wrapper
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
#
install(
    TARGETS ff_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Runtime 
    )
install(
    TARGETS ff_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )
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

#
install(
    FILES
        ff_to_aptk.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/include
    COMPONENT
        Development EXCLUDE_FROM_ALL
    )
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
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from ..._pywrapper.ff_wrapper import *" )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/ff
    COMPONENT Runtime 
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/ff
    COMPONENT Development EXCLUDE_FROM_ALL
    )
