find_package(FF REQUIRED)
target_sources(core
    PRIVATE
        ff_to_aptk.cxx
        ff_to_aptk.hxx
)
target_include_directories(core
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_include_directories(core 
    PRIVATE 
        ${FF_INCLUDE_DIRS}
)

target_link_libraries(core
    PRIVATE
        ${FF_LIBRARIES}
)

set_target_properties(core PROPERTIES
    LINK_FLAGS "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
)

install(
        FILES
            ${PROJECT_SOURCE_DIR}/src/translate/pddl/ff/ff_to_aptk.hxx
        DESTINATION
            ${CMAKE_INSTALL_PREFIX}/lapkt/core/include/translate
        COMPONENT
            lapkt
)

target_include_directories(pddl PRIVATE ${FF_INCLUDE_DIRS})
target_link_libraries(pddl PRIVATE
    core
)

target_sources(pddl
    PRIVATE
        py_ff_to_aptk.cxx
        py_ff_to_aptk.hxx
)

target_include_directories(pddl
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)
# Tarski Handler Pypi Package
file(WRITE ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/ff/__init__.py 
    "from ...core.lib.pddl import pddl_translate_ff ")
