# Add the wrapper class to lapkt

target_sources(py_extension
    PRIVATE
        py_strips_interface.cxx
        py_strips_interface.hxx
)
target_include_directories(py_extension
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_sources(py_extension
    PRIVATE
        module.cxx
)

install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/translate/pddl/wrapper/py_strips_interface.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/lapkt/extension/include/
    COMPONENT
        lapkt EXCLUDE_FROM_ALL
)

