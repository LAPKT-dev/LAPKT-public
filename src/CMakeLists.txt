cmake_minimum_required(VERSION 3.15)

project(LAPKT VERSION 1.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INSTALL_RPATH 
    "${CMAKE_INSTALL_PREFIX}/lib/shared;${CMAKE_INSTALL_PREFIX}/lib/interface;${CMAKE_INSTALL_PREFIX}/lib/ff"
    )
#set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

#set(CMAKE_CXX_STANDARD_REQUIRED False)

option(BUILD_SHARED_LIBS "Build using shared libraries" ON)


#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#
function(cat FROM TO)
    file(READ ${FROM} CONTENTS)
    file(APPEND ${TO} "${CONTENTS}")
endfunction()

file(WRITE ${PROJECT_BINARY_DIR}/lapkt_planner_config.yml "")
file(WRITE ${PROJECT_BINARY_DIR}/__init__.py "")
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

# There should be a single shared library for source inside "shared"
add_subdirectory(shared)

# Need to compile external ff-parser grounder library
add_subdirectory(external)

# A single shared library for fd and tarski interface, ff interface lib is seperate
add_subdirectory(pddl_interface)

# Libraries for fd and tarski planners and executables for ff-planners
add_subdirectory(planners)

configure_file(config/lapkt_cmake_config.h.in lapkt_cmake_config.h)

install(FILES "${PROJECT_BINARY_DIR}/lapkt_cmake_config.h"
  DESTINATION include
  COMPONENT Development EXCLUDE_FROM_ALL
  )
install(
    EXPORT      LAPKTTargets
    FILE        LAPKTTargets.cmake
    DESTINATION lib/cmake/LAPKT
    COMPONENT Development EXCLUDE_FROM_ALL
    )

include(CMakePackageConfigHelpers)
# generate the config file that includes the exports
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/config/Config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/LAPKTConfig.cmake"
  INSTALL_DESTINATION "lib/cmake/example"
  NO_SET_AND_CHECK_MACRO
  NO_CHECK_REQUIRED_COMPONENTS_MACRO
  )
# generate the version file for the config file
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/LAPKTConfigVersion.cmake"
  VERSION "${LAPKT_VERSION_MAJOR}.${LAPKT_VERSION_MINOR}"
  COMPATIBILITY AnyNewerVersion
)

# install the configuration file
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/LAPKTConfig.cmake
    DESTINATION lib/cmake/LAPKT
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt_planner_config.yml
    DESTINATION config
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt_planner_config.yml
    DESTINATION config
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/lapkt.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/lapkt.py
    PERMISSIONS OWNER_EXECUTE OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Runtime
  )
install(FILES
    ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Development EXCLUDE_FROM_ALL
  )

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/../LICENSE.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${LAPKT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${LAPKT_VERSION_MINOR}")
include(CPack)

#enable_testing()
