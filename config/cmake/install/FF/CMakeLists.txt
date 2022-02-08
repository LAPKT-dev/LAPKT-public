#xxxx SECTION 1 - Install FF Parser interface xxxx#
# Component name - FF
 
if(CMAKE_FF_CXX OR CMAKE_FF_PYWRAPPER)
    install(
            FILES
                ${PROJECT_SOURCE_DIR}/src/pddl2strips/ff/ff_to_aptk.hxx
                ${PROJECT_SOURCE_DIR}/src/pddl2strips/ff/py_ff_to_aptk.hxx
            DESTINATION
                ${CMAKE_INSTALL_PREFIX}/package/core/include
            COMPONENT
                FF EXCLUDE_FROM_ALL
        )
    install(
        TARGETS legacy_ff 
        DESTINATION ${CMAKE_INSTALL_PREFIX}/package/core/lib
        COMPONENT FF EXCLUDE_FROM_ALL
        EXPORT LAPKTTargets
    )
endif(CMAKE_FF_CXX OR CMAKE_FF_PYWRAPPER)


#xxxx SECTION 2 - Install Legacy FF Planner and Handler
# Component name - 

if(CMAKE_FF)

endif(CMAKE_FF)