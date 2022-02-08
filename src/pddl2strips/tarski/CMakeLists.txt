target_sources(LAPKT
    PRIVATE
        tarski_instantiator.cxx
        tarski_instantiator.hxx
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
target_include_directories(tarski_wrapper
    PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

# Copy the Tarski Handlers into the build directory
file(COPY 
        ${PROJECT_SOURCE_DIR}/src/pddl2strips/tarski/tarski_util.py
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/tarski/__init__.py 
    DESTINATION 
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/tarski/
)