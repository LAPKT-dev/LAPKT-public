
if(CMAKE_FF)

target_sources(ff_wrapper
    PRIVATE
        py_strips_interface.cxx
        py_strips_interface.hxx
    )
target_include_directories(ff_wrapper
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
endif(CMAKE_FF)

if(CMAKE_FD)

target_sources(fd_wrapper
    PRIVATE
        py_strips_interface.cxx
        py_strips_interface.hxx
    )
target_include_directories(fd_wrapper
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    )
endif(CMAKE_FD)

target_sources(tarski_wrapper
PRIVATE
    py_strips_interface.cxx
    py_strips_interface.hxx
)
target_include_directories(tarski_wrapper
PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)

install(
FILES
    py_strips_interface.hxx
DESTINATION
${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/include
COMPONENT
    Development EXCLUDE_FROM_ALL
)
