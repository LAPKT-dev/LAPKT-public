# Configure the Build Directory
file(WRITE 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd/__init__.py 
    "from .fd_util import default"
)

configure_file(${PROJECT_SOURCE_DIR}/src/translate/pddl/fd/fd_util.py 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd/fd_util.py 
    COPYONLY
)
configure_file(${PROJECT_SOURCE_DIR}/src/translate/pddl/fd/timers.py 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd/timers.py 
    COPYONLY
)

file(COPY ${PROJECT_SOURCE_DIR}/external_package/fd_translate/
    DESTINATION ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd)


# Install the FD Library Handler which calls the necessary fd methods
install(DIRECTORY
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd
    DESTINATION ${REL_PYPI_LAPKT_ROOT}/pddl/
    COMPONENT PYPACKAGE EXCLUDE_FROM_ALL
)
