file(MAKE_DIRECTORY 
    ${PROJECT_BINARY_DIR}/${REL_PYPI_LAPKT_ROOT}
)

add_custom_target(copy_package
    COMMAND ${CMAKE_COMMAND} -E copy_directory 
    ${CMAKE_CURRENT_SOURCE_DIR}/_package
    ${PROJECT_BINARY_DIR}/${REL_PYPI_ROOT}/
)

add_dependencies(wrapper copy_package)
