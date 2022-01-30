# if(CMAKE_FF)
#     add_subdirectory(libff)
# endif(CMAKE_FF)
    
if(CMAKE_FD)
    install(DIRECTORY fd_translate
        DESTINATION lib/lapkt
        COMPONENT Runtime
        )
    install(DIRECTORY fd_translate
        DESTINATION lib/lapkt
        COMPONENT Development EXCLUDE_FROM_ALL
        )
endif(CMAKE_FD)
#
if(CMAKE_VAL)
    install(FILES ${PROJECT_BINARY_DIR}/../build_external/VAL-4.2.08/validate
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION bin
        COMPONENT Runtime
        )
    install(FILES ${PROJECT_BINARY_DIR}/../build_external/VAL-4.2.08/validate
        PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
        DESTINATION bin
        COMPONENT Development EXCLUDE_FROM_ALL
        )
endif(CMAKE_VAL)
