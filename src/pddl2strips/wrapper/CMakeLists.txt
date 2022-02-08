# Add the wrapper class to LAPKT

target_sources(LAPKT
    PRIVATE
        py_strips_interface.cxx
        py_strips_interface.hxx
)
target_include_directories(LAPKT
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/package/core/include>

)

target_sources(py_wrapper
    PRIVATE
        module.cxx
)

target_include_directories(py_wrapper
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

