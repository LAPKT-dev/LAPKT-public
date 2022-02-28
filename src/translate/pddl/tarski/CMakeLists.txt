target_include_directories(pddl
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)

target_sources(pddl
    PRIVATE
        tarski_instantiator.cxx
        tarski_instantiator.hxx
)

install(
    FILES
        tarski_instantiator.hxx
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/${REL_PYEXT_INC_DIR}/translate
    COMPONENT
        lapkt EXCLUDE_FROM_ALL
)

# Copy the Tarski Handlers into the build directory
file(COPY 
        ${PROJECT_SOURCE_DIR}/src/translate/pddl/tarski/tarski_util.py
    DESTINATION 
        ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/tarski/
)

# Tarski Handler Pypi Package
file(WRITE ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/tarski/__init__.py 
    "from .tarski_util import * ")

install(
    FILES 
        ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/tarski/tarski_util.py
        ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/tarski/__init__.py 
    DESTINATION
        ${REL_PYPI_LAPKT_ROOT}/pddl/tarski
    COMPONENT 
        PYPACKAGE EXCLUDE_FROM_ALL
)