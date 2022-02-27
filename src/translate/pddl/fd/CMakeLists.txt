file(WRITE 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd/__init__.py 
    "from .fd_util import default"
)

add_custom_target(copy_fd 
    COMMAND ${CMAKE_COMMAND} -E copy_directory
    ${PROJECT_SOURCE_DIR}/external_package/fd_translate/
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd
)
add_dependencies(copy_fd copy_package)

add_custom_target(copy_fd_extensions
    COMMAND ${CMAKE_COMMAND} -E copy fd_util.py timers.py __init__.py 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}/pddl/fd/
)
add_dependencies(copy_fd_extensions copy_fd)
