if(CMAKE_FD)
    # Configure the Build Directory
    file(WRITE ${PROJECT_BINARY_DIR}/package/lapkt/pddl/__init__.py "from .fd_util import default")

    configure_file(${PROJECT_SOURCE_DIR}/src/pddl2strips/fd/fd_util.py 
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/fd/fd_util.py 
        COPYONLY
    )
    configure_file(${PROJECT_SOURCE_DIR}/src/pddl2strips/fd/timers.py 
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/fd/timers.py 
        COPYONLY
    )

    file(COPY ${PROJECT_SOURCE_DIR}/external_package/fd_translate 
        DESTINATION ${PROJECT_BINARY_DIR}/package/lapkt/pddl/fd)
    

    # Install the FD Library Handler which calls the necessary fd methods
    install(
        FILES 
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/fd_util.py 
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/timers.py 
        ${PROJECT_BINARY_DIR}/package/lapkt/pddl/__init__.py
        DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl/fd
        COMPONENT FD EXCLUDE_FROM_ALL
    )

    # Install FD library
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/external_package/fd_translate
        DESTINATION ${CMAKE_INSTALl_PREFIX}/package/lapkt/pddl/fd
        COMPONENT FD EXCLUDE_FROM_ALL
    )
endif(CMAKE_FD)
