file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py 
    "from .planner_config import load_planner_config")
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    ${CMAKE_CURRENT_SOURCE_DIR}/planner_config.py
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/config
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    ${CMAKE_CURRENT_SOURCE_DIR}/planner_config.py
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/config
    COMPONENT Development EXCLUDE_FROM_ALL
  )
