add_subdirectory(wrapper)
add_subdirectory(anytime_lapkt)
add_subdirectory(at_bfs_f)
add_subdirectory(bfs_f)
add_subdirectory(brfs)
add_subdirectory(bfws)
add_subdirectory(delete-free-iw)
add_subdirectory(delete-free-siw)
add_subdirectory(dfs_plus)
add_subdirectory(iw)
add_subdirectory(iw_plus)
add_subdirectory(siw)
add_subdirectory(siw_plus)
add_subdirectory(siw_plus-then-bfs_f)

# target_include_directories(Planners PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )

# target_link_libraries(Planners PRIVATE
#     ${Boost_LIBRARIES}
#     ${EXTRA_LIBS}
#     )

# install(
#     TARGETS Planners
#     DESTINATION lib/lapkt/planner
#     COMPONENT Runtime
#     )
# install(
#     TARGETS Planners
#     DESTINATION lib/lapkt/planner
#     COMPONENT Development EXCLUDE_FROM_ALL
#     )   

# Write __init__.py file
#
file(TOUCH ${CMAKE_CURRENT_BINARY_DIR}/__init__.py )
file(APPEND ${CMAKE_CURRENT_BINARY_DIR}/__init__.py 
    "from .._pywrapper.planner import *\n")

install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/planner
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/planner
    COMPONENT Development EXCLUDE_FROM_ALL
    )

# #
# install(FILES
#     ${PROJECT_BINARY_DIR}/__init__.py
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
#     COMPONENT Development EXCLUDE_FROM_ALL
#   )
# install(FILES
#     ${PROJECT_BINARY_DIR}/__init__.py
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib
#     COMPONENT Runtime
#   )
#
# install(FILES
#     ${PROJECT_BINARY_DIR}/__init__.py
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt
#     COMPONENT Development EXCLUDE_FROM_ALL
#   )
# install(FILES
#     ${PROJECT_BINARY_DIR}/__init__.py
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt
#     COMPONENT Runtime
#   )
