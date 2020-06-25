#
install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/run_planner.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/run
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/run_planner.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/run
    COMPONENT Development EXCLUDE_FROM_ALL
  )

#
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py 
    "from .run_planner import Run_planner, validate_plan ")
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/run
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/run
    COMPONENT Development EXCLUDE_FROM_ALL
    )
