# Add the planner class to lapkt

target_sources(planner
    PRIVATE
        py_strips_interface.cxx
        py_strips_interface.hxx
)

install(
FILES
    py_strips_interface.hxx
DESTINATION
    ${CMAKE_INSTALL_PREFIX}/${REL_CORE_INC_DIR}/extension
COMPONENT
    lapkt EXCLUDE_FROM_ALL
)

target_include_directories(planner
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)