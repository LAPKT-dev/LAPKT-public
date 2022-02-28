# Add the planner class to lapkt
# pybind11_add_module(planner pybind11_module.cxx)
target_sources(planner PRIVATE pybind11_module.cxx)
# target_link_libraries(planner PUBLIC planner)
set_target_properties(planner PROPERTIES
    INSTALL_RPATH "${CMAKE_INSTALL_RPATH}:$ORIGIN"
)
# planner
# install(TARGETS planner
#     EXPORT lapkt-planner-Targets
#     LIBRARY DESTINATION ${REL_PYEXT_LIB_DIR}
#     COMPONENT lapkt    
#     INCLUDES DESTINATION    
#     ${REL_PYEXT_INC_DIR}
# )








