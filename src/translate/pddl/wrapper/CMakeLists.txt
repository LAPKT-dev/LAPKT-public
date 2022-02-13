# Add the wrapper class to lapkt

if(NOT PYBIND11_NOBOOST)
    target_sources(pddl
        PRIVATE
            boostpy_strips_interface.cxx
            boostpy_strips_interface.hxx
    )

    target_sources(pddl
        PRIVATE
            boostpy_module.cxx
    )

    install(
        FILES
            ${PROJECT_SOURCE_DIR}/src/translate/pddl/wrapper/boostpy_strips_interface.hxx
        DESTINATION
            ${CMAKE_INSTALL_PREFIX}/${REL_CORE_INC_DIR}/extension
        COMPONENT
            lapkt EXCLUDE_FROM_ALL
    )
else()
    target_sources(pddl
    PRIVATE
        pybind11_strips_interface.cxx
        pybind11_strips_interface.hxx
    )

    target_sources(pddl
    PRIVATE
        pybind11_module.cxx
    )

    install(
    FILES
        ${PROJECT_SOURCE_DIR}/src/translate/pddl/wrapper/pybind11_strips_interface.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/${REL_CORE_INC_DIR}/extension
    COMPONENT
        lapkt EXCLUDE_FROM_ALL
    )
endif(NOT PYBIND11_NOBOOST)


target_include_directories(pddl
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)