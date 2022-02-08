"""
Package Structure

- pacakge
    - lapkt
        - pddl
        - planner
        - search
        - model
    - core
    - external
    - script
"""

# Package build directory
file(TOUCH ${PROJECT_BINARY_DIR}/package/lapkt/__init__,py)
file(TOUCH ${PROJECT_BINARY_DIR}/package/lapkt/planner/__init__,py)
file(TOUCH ${PROJECT_BINARY_DIR}/package/lapkt/pddl/__init__,py)
file(TOUCH ${PROJECT_BINARY_DIR}/package/lapkt/model/__init__,py)
file(TOUCH ${PROJECT_BINARY_DIR}/package/lapkt/search/__init__,py)

# Prepare package installation directory
install(
    FILES ${PROJECT_BINARY_DIR}/package/lapkt/__init__,py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/package/lapkt/planner/__init__,py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/planner
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/package/lapkt/pddl/__init__,py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/package/lapkt/model/__init__,py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/model
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/package/lapkt/search/__init__,py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/search
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

#xxxx SECTION 2 - Install Python Wrapper over LAPKT Core CXX Library xxxx#
# Component name - PYPACKAGE

# Python Wrapper over LAPKT
install(
    TARGETS py_wrapper
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
)

# Tarski Handler
file(WRITE ${PROJECT_BINARY_DIR}/package/lapkt/pddl/tarski/__init__.py 
    "from .tarski_util import * ")

install(
    FILES 
        ${PROJECT_SOURCE_DIR}/src/pddl2strips/tarski/tarski_util.py
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/tarski/__init__.py 
    DESTINATION
        ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl/tarski
    COMPONENT 
        PYPACKAGE EXCLUDE_FROM_ALL
)

# Planner configuration file
file(TOUCH ${PROJECT_BINARY_DIR}/package/lapkt/config/lapkt_planner_config.yml)
install(
    FILES ${PROJECT_BINARY_DIR}/package/lapkt/config/lapkt_planner_config.yml
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/config
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

configure_file(${PROJECT_SOURCE_DIR}/src/script/lapkt.py
    ${PROJECT_BINARY_DIR}/package/lapkt/script/lapkt 
    FILE_PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    COPYONLY
)

configure_file(${PROJECT_SOURCE_DIR}/src/script/run_planner.py 
    ${PROJECT_BINARY_DIR}/package/lapkt/script/run_planner.py 
    FILE_PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    COPYONLY
)

install(FILES
    ${PROJECT_BINARY_DIR}/package/lapkt/script/lapkt
    ${PROJECT_BINARY_DIR}/package/lapkt/script/run_planner.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)
