#
find_package(Python3 COMPONENTS Interpreter Development)
find_package(Boost REQUIRED COMPONENTS python38)
#
add_library(pddl_py_interface)
#
list(APPEND EXTRA_LIBS lapkt_shared)
target_include_directories(pddl_py_interface PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( pddl_py_interface PRIVATE
    ${PYTHON_LIBRARIES}
    ${EXTRA_LIBS} 
    ${Boost_LIBRARIES}
    )

#
if(CMAKE_FF)
    add_subdirectory(ff_lapkt)
endif(CMAKE_FF)
if(CMAKE_FD)
    add_subdirectory(fd_parse_ground)
endif(CMAKE_FD)
add_subdirectory(tarski_parse_ground)
add_subdirectory(common)

#
install(
    TARGETS pddl_py_interface 
    DESTINATION lib/interface
    COMPONENT Runtime 
    )
install(
    TARGETS pddl_py_interface 
    DESTINATION lib/interface
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )

file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .libpddl_py_interface import *")
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/interface
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/interface
    COMPONENT Development EXCLUDE_FROM_ALL
    )

