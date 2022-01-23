#
file(TOUCH ${PROJECT_BINARY_DIR}/setup.cfg)
file(WRITE ${PROJECT_BINARY_DIR}/setup.cfg 
    "[options]\nscripts=\n\tpackage/lapkt/script/lapkt\n")

if(CMAKE_VAL)
    file(APPEND ${PROJECT_BINARY_DIR}/setup.cfg 
        "\tpackage/lapkt/script/validate.py\n\tpackage/lapkt/script/gringo\n")
endif(CMAKE_VAL)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/MANIFEST.in 
              ${PROJECT_BINARY_DIR}/MANIFEST.in COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/pyproject.toml 
              ${PROJECT_BINARY_DIR}/pyproject.toml COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/setup.py 
              ${PROJECT_BINARY_DIR}/setup.py COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/../../../README.md
              ${PROJECT_BINARY_DIR}/README.md COPYONLY)
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/../../../LICENSE.txt
              ${PROJECT_BINARY_DIR}/LICENSE.txt COPYONLY)

install(FILES
    ${PROJECT_BINARY_DIR}/setup.py
    ${PROJECT_BINARY_DIR}/README.md
    ${PROJECT_BINARY_DIR}/LICENSE.txt
    ${PROJECT_BINARY_DIR}/setup.cfg
    ${PROJECT_BINARY_DIR}/pyproject.toml
    ${PROJECT_BINARY_DIR}/MANIFEST.in
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Runtime
  )
install(FILES
    ${PROJECT_BINARY_DIR}/setup.py
    ${PROJECT_BINARY_DIR}/README.md
    ${PROJECT_BINARY_DIR}/LICENSE.txt
    ${PROJECT_BINARY_DIR}/setup.cfg
    ${PROJECT_BINARY_DIR}/pyproject.toml
    ${PROJECT_BINARY_DIR}/MANIFEST.in
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Development EXCLUDE_FROM_ALL    
  )