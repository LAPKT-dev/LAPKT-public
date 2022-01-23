add_library(tarski_wrapper)
SET_TARGET_PROPERTIES(tarski_wrapper PROPERTIES PREFIX "")
set_target_properties(tarski_wrapper PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/_pywrapper)
set_target_properties(tarski_wrapper PROPERTIES LINK_SEARCH_START_STATIC ON)
set_target_properties(tarski_wrapper PROPERTIES LINK_SEARCH_END_STATIC ON)
target_link_libraries(tarski_wrapper PRIVATE -static-libgcc -static-libstdc++)

target_include_directories(tarski_wrapper PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( tarski_wrapper PRIVATE
    LAPKT
    ${Boost_LIBRARIES}
    )
target_link_libraries( planner PRIVATE
    tarski_wrapper
    )
#
target_sources(tarski_wrapper
    PRIVATE
        tarski_instantiator.cxx
        tarski_instantiator.hxx
        module.cxx
    )
#
target_include_directories(tarski_wrapper
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
#
#
# target_sources(tarski_wrapper
#     PRIVATE
#         module.cxx
#     )
#
# target_include_directories(tarski_wrapper
#     PUBLIC
#         $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
#         $<INSTALL_INTERFACE:include>
#     )

#
install(
    TARGETS tarski_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Runtime 
    )
install(
    TARGETS tarski_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )
#
install(
    FILES tarski_instantiator.hxx
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/include
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#
install(
    FILES tarski_util.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/tarski
    COMPONENT Runtime 
    )
#
install(
    FILES tarski_util.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/tarski
    COMPONENT Development EXCLUDE_FROM_ALL
    )

#
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py 
    "from .tarski_util import * ")
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/tarski
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/tarski
    COMPONENT Development EXCLUDE_FROM_ALL
    )
