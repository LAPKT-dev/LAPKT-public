add_library(fd_wrapper)
SET_TARGET_PROPERTIES(fd_wrapper PROPERTIES PREFIX "")
set_target_properties(fd_wrapper PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/_pywrapper)
set_target_properties(fd_wrapper PROPERTIES LINK_SEARCH_START_STATIC ON)
set_target_properties(fd_wrapper PROPERTIES LINK_SEARCH_END_STATIC ON)
target_link_libraries(fd_wrapper PRIVATE -static-libgcc -static-libstdc++)

target_include_directories(fd_wrapper PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( fd_wrapper PRIVATE
    LAPKT
    ${Boost_LIBRARIES}
    )
target_link_libraries( planner PRIVATE
    tarski_wrapper
    )
#
target_sources(fd_wrapper
    PRIVATE
        module.cxx
    )
target_include_directories(fd_wrapper
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )

file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .fd_util import default")
install(
    FILES fd_util.py timers.py ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/fd
    COMPONENT Runtime
    )
install(
    FILES fd_util.py timers.py ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips/fd
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#
install(
    TARGETS fd_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Runtime 
    )
install(
    TARGETS fd_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )