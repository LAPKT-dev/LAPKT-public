if(CMAKE_FF)
    add_subdirectory(ff_parser)
endif(CMAKE_FF)
list(APPEND EXTRA_LIBS lapkt_shared)
list(APPEND EXTRA_LIBS pddl_py_interface)

add_library(Planners "")
add_subdirectory(common)
add_subdirectory(anytime_lapkt)
add_subdirectory(at_bfs_f)
add_subdirectory(bfs_f)
add_subdirectory(brfs)
add_subdirectory(delete-free-iw)
add_subdirectory(delete-free-siw)
add_subdirectory(dfs_plus)
add_subdirectory(iw)
add_subdirectory(iw_plus)
add_subdirectory(siw)
add_subdirectory(siw_plus)
add_subdirectory(siw_plus-then-bfs_f)

find_package(Python3 COMPONENTS Interpreter Development)
find_package(Boost REQUIRED COMPONENTS python38)
#find_package(Boost REQUIRED COMPONENTS program_options)
#find_package(Python3 COMPONENTS Interpreter Development)
target_include_directories(Planners PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )

target_link_libraries(Planners PRIVATE
    ${PYTHON_LIBRARIES}
    ${Boost_LIBRARIES}
    ${EXTRA_LIBS}
    )

install(
    TARGETS Planners
    DESTINATION lib/planner
    COMPONENT Runtime
    )
install(
    TARGETS Planners
    DESTINATION lib/planner
    COMPONENT Development EXCLUDE_FROM_ALL
    )   
# Write __init__.py file
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .libPlanners import *")
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/planner
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/planner
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#
install(FILES
    ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Runtime
  )
install(FILES
    ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
    COMPONENT Development EXCLUDE_FROM_ALL
  )
