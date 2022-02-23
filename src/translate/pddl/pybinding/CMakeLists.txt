# Add the wrapper class to lapkt

if(NOT PYBIND11_NOBOOST)
    target_sources(pddl
        PRIVATE
            boostpy_module.cxx
    )
else()
    target_sources(planner
    PRIVATE
        pybind11_module.cxx
    )
endif(NOT PYBIND11_NOBOOST)
