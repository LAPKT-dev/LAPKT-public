# CXX Library
if(BUILD_LAPKT_STATIC)
    add_library(LAPKT STATIC)
    set_target_properties(LAPKT PROPERTIES POSITION_INDEPENDENT_CODE ON)
else()
    add_library(LAPKT SHARED)
endif(BUILD_LAPKT_STATIC)

set_target_properties(LAPKT PROPERTIES
         LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/package/core/lib)
set_target_properties(LAPKT PROPERTIES LINK_SEARCH_START_STATIC ON)
set_target_properties(LAPKT PROPERTIES LINK_SEARCH_END_STATIC ON)
target_link_libraries(LAPKT PRIVATE -static-libgcc -static-libstdc++)

if(CMAKE_FF_CXX OR CMAKE_FF_PYWRAPPER OR CMAKE_LEGACY_PLANNER)
    add_library(legacy_ff)
    set_target_properties(legacy_ff PROPERTIES
        LINK_FLAGS "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
        INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:$ORIGIN/../core/lib"
    )
    message(STATUS "LINKING legacy_ff with LAPKT and ${FF_LIBRARIES}")
    target_link_libraries( legacy_ff 
        PRIVATE
            LAPKT
            ${FF_LIBRARIES}
    )
    target_include_directories(legacy_ff
        PRIVATE
        ${FF_INCLUDE_DIR}
    )
    if(CMAKE_LEGACY_PLANNER)
        add_subdirectory(legacy_ff_planner)
    endif(CMAKE_LEGACY_PLANNER)
endif(CMAKE_FF_CXX OR CMAKE_FF_PYWRAPPER OR CMAKE_LEGACY_PLANNER)

# Create the PYTHON WRAPPER
add_library(py_wrapper)
set_target_properties(py_wrapper PROPERTIES
    PREFIX ""
    LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/package/lapkt/pywrapper
    PROPERTIES LINK_SEARCH_START_STATIC ON
    PROPERTIES LINK_SEARCH_END_STATIC ON
    INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:$ORIGIN/../core/lib"
)

target_include_directories(py_wrapper
    PRIVATE
        ${Python3_INCLUDE_DIRS} 
        ${Boost_INCLUDE_DIRS} 
)

target_link_libraries(py_wrapper PRIVATE
    LAPKT
    ${Boost_LIBRARIES}
    ${Python3_LIBRARIES}
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
