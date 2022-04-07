target_sources(wrapper
    PRIVATE
        py_strips_interface.cxx
        py_strips_interface.hxx
        pybind11_module.cxx
        h_1_callback.hxx
)

install(
    FILES
        py_strips_interface.hxx
        h_1_callback.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/${REL_CORE_INC_DIR}/extension
    COMPONENT
        lapkt EXCLUDE_FROM_ALL
)

target_include_directories(wrapper
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)