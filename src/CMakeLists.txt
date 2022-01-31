# CXX Library
add_library(LAPKT STATIC)
set_target_properties(LAPKT PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/_cxx/lib)
# set_target_properties(LAPKT PROPERTIES LINK_SEARCH_START_STATIC ON)
# set_target_properties(LAPKT PROPERTIES LINK_SEARCH_END_STATIC ON)
set_target_properties(LAPKT PROPERTIES POSITION_INDEPENDENT_CODE ON)
# target_link_libraries(LAPKT PRIVATE -static-libgcc -static-libstdc++)
#
add_library(planner)
SET_TARGET_PROPERTIES(planner PROPERTIES PREFIX "")
set_target_properties(planner PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/_pywrapper)
set_target_properties(planner PROPERTIES LINK_SEARCH_START_STATIC ON)
set_target_properties(planner PROPERTIES LINK_SEARCH_END_STATIC ON)
target_link_libraries(planner PRIVATE -static-libstdc++)

target_include_directories(planner PRIVATE ${Python3_INCLUDE_DIRS} ${Boost_INCLUDE_DIRS} )
target_link_libraries( planner PRIVATE
    LAPKT
    ${Boost_LIBRARIES}
    )

# The source for PDDL to STRIPS problem translator resides here
add_subdirectory(pddl2strips)

# Source code for pre-processing associated with different planners
add_subdirectory(planner)

# Source code of all search algorithms available in the package
add_subdirectory(search)

# Source code of evaluations performed at each node
add_subdirectory(eval_node)

# Blueprints for strips model
add_subdirectory(model)

# Other utility blueprints
add_subdirectory(utility)

#
install(
    TARGETS LAPKT
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/lib/
    COMPONENT Runtime
    )

install(
    TARGETS LAPKT 
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/lib/
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )
#
install(
    TARGETS planner
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Runtime 
    )
install(
    TARGETS planner
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper/
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )

if(CMAKE_FF)
    add_subdirectory(legacy_ff)
endif(CMAKE_FF)

#  A compilation of python run scripts which are installed when preparing the python package
add_subdirectory(script)