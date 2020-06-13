target_sources(pddl_py_interface
    PRIVATE
        module.cxx
        py_strips_interface.cxx
        py_strips_interface.hxx
    )
target_include_directories(pddl_py_interface
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )

install(
    FILES
        py_strips_interface.hxx
    DESTINATION
        include
    COMPONENT
        Development EXCLUDE_FROM_ALL
    )
