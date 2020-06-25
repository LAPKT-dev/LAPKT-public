if(CMAKE_FF)
    add_subdirectory(libff)
endif(CMAKE_FF)
    
if(CMAKE_FD)
    install(DIRECTORY fd
        DESTINATION lib/lapkt
        COMPONENT Runtime
        )
    install(DIRECTORY fd
        DESTINATION lib/lapkt
        COMPONENT Development EXCLUDE_FROM_ALL
        )
endif(CMAKE_FD)
#
if(CMAKE_VAL)
    file(COPY VAL-4.2.08 DESTINATION ${CMAKE_CURRENT_BINARY_DIR})

    add_custom_target(validate ALL COMMAND make
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/VAL-4.2.08
    )

    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/VAL-4.2.08/validate
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION bin
        COMPONENT Runtime
        )
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/VAL-4.2.08/validate
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION bin
        COMPONENT Development EXCLUDE_FROM_ALL
        )
endif(CMAKE_VAL)
