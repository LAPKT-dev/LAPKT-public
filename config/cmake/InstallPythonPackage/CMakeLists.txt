#[[
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
]]

#
# Package build directory
file(MAKE_DIRECTORY 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/model
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/search
)
file(TOUCH 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/__init__,py
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/__init__,py
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/__init__,py
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/model/__init__,py
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/search/__init__,py
)


file(TOUCH ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/setup.cfg)
file(WRITE ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/setup.cfg 
    "[options]\nscripts=\n\t${REL_PYPI_ROOT}/script/lapkt.py\n")

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/MANIFEST.in 
              ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/MANIFEST.in COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/pyproject.toml 
              ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/pyproject.toml COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/setup.py 
              ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/setup.py COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/../../../README.md
              ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/README.md COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/../../../LICENSE.txt
              ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/LICENSE.txt COPYONLY)

# Prepare package installation directory
install(
    FILES ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/__init__,py
    DESTINATION ${REL_PYPI_LAPKT_ROOT}
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/planner/__init__,py
    DESTINATION ${REL_PYPI_LAPKT_ROOT}/planner
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/__init__,py
    DESTINATION ${REL_PYPI_LAPKT_ROOT}/pddl
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/model/__init__,py
    DESTINATION ${REL_PYPI_LAPKT_ROOT}/model
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)

install(
    FILES ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/search/__init__,py
    DESTINATION ${REL_PYPI_LAPKT_ROOT}/search
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)


install(DIRECTORY
    ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/
    FILE_PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${REL_PYPI_ROOT}
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL 
)