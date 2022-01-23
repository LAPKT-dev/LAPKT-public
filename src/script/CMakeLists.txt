configure_file(${CMAKE_CURRENT_SOURCE_DIR}/gringo 
              ${CMAKE_CURRENT_BINARY_DIR}/gringo COPYONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/lapkt.py
              ${CMAKE_CURRENT_BINARY_DIR}/lapkt.py COPYONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/lapkt.py
              ${CMAKE_CURRENT_BINARY_DIR}/lapkt COPYONLY)

configure_file(${CMAKE_CURRENT_SOURCE_DIR}/run_planner.py 
              ${CMAKE_CURRENT_BINARY_DIR}/run_planner.py COPYONLY)

#
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt.py
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt
    ${CMAKE_CURRENT_BINARY_DIR}/gringo
    ${CMAKE_CURRENT_BINARY_DIR}/run_planner.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt.py
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt
    ${CMAKE_CURRENT_BINARY_DIR}/gringo
    ${CMAKE_CURRENT_BINARY_DIR}/run_planner.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
    COMPONENT Development EXCLUDE_FROM_ALL
  )

#
if(CMAKE_VAL)
    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/validate.py 
              ${CMAKE_CURRENT_BINARY_DIR}/validate.py COPYONLY)
    install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/validate.py
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
        COMPONENT Runtime
      )
    install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/validate.py
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
        COMPONENT Development EXCLUDE_FROM_ALL
      )
endif(CMAKE_VAL)
