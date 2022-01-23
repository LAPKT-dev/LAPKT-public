# #
# target_include_directories(LAPKT PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
# target_link_libraries( LAPKT PRIVATE
#     ${EXTRA_LIBS} 
#     ${Boost_LIBRARIES}
#     )

if(CMAKE_FF)
    add_subdirectory(ff)
endif(CMAKE_FF)
if(CMAKE_FD)
    add_subdirectory(fd)
endif(CMAKE_FD)
add_subdirectory(tarski)
add_subdirectory(common)

# file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .libpddl_py_interface import *")
# install(
#     FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/interface
#     COMPONENT Runtime
#     )
# install(
#     FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/interface
#     COMPONENT Development EXCLUDE_FROM_ALL
#     )
