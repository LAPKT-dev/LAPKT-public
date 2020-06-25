#
add_library(tarski_util)

target_sources(tarski_util
    PRIVATE
        tarski_instantiator.cxx
        tarski_instantiator.hxx
        module.cxx
    )
#
target_include_directories(tarski_util
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
#
list(APPEND EXTRA_LIBS pddl_py_interface)
target_include_directories(tarski_util PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( tarski_util PRIVATE
    ${EXTRA_LIBS} 
    ${Boost_LIBRARIES}
    )
#
install(
    FILES tarski_instantiator.hxx
    DESTINATION include
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#
install(
    FILES tarski_util.py
    DESTINATION lib/lapkt/tarski
    COMPONENT Runtime 
    )
#
install(
    FILES tarski_util.py
    DESTINATION lib/lapkt/tarski
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#
install(
    TARGETS tarski_util
    DESTINATION lib/lapkt/tarski
    COMPONENT Runtime 
    )
install(
    TARGETS tarski_util
    DESTINATION lib/lapkt/tarski
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )
#
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py 
    "from .tarski_util import * ")
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/tarski
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/tarski
    COMPONENT Development EXCLUDE_FROM_ALL
    )
