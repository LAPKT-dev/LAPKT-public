if(NOT PYBIND11_NOBOOST)
    target_sources(planner
        PRIVATE
            boostpy_module.cxx
    )
else()
    target_sources(planner
        PRIVATE
            pybind11_module.cxx
    )
endif()
