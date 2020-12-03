cmake_minimum_required(VERSION 3.15)


#----BEGIN SUPER.BUILD for BOOST----#
# This must stay at the beginning of the top level CMakeLists.txt
option (USE_SUPERBUILD "flag that a superbuild should be invoked" ON)

if (USE_SUPERBUILD)
    project(SUPERBUILD NONE)
    include(config/SuperBuild.cmake)
    return()
else()
    project(LAPKT VERSION 1.0)
endif(USE_SUPERBUILD)
#----END   SUPER.BUILD for BOOST----#

#----Check Python Version ----#
find_package(Python3 COMPONENTS Interpreter Development)
if(${Python3_VERSION} GREATER 3.9 OR ${Python3_VERSION} LESS 3.7)
    message(SEND_ERROR 
        "INCOMPATIBLE PYTHON VERSION, expected 3.7.x or 3.8.x. Found - " 
        ${Python3_VERSION})
endif()
#-----------------------------#

message("The PYTHON_VERSION is " ${CMAKE_PYTHON_VERSION})
message("The CMAKE_INSTALL_PREFIX is " ${CMAKE_INSTALL_PREFIX})
message("Building LAPKT in " ${CMAKE_BUILD_TYPE} " mode")

find_package(Boost REQUIRED COMPONENTS python${CMAKE_PYTHON_VERSION} program_options)

message("THE BOOST INCLUDE dirs search path is " ${Boost_INCLUDE_DIRS} )

set(CMAKE_CXX_STANDARD 17)

#### THIS IS SPECIFIC TO LINUX/SOLARIS
set(CMAKE_INSTALL_RPATH 
"${CMAKE_INSTALL_RPATH}:$ORIGIN/../shared;\
${CMAKE_INSTALL_RPATH}:$ORIGIN/../interface;\
${CMAKE_INSTALL_RPATH}:$ORIGIN/../boost/;\
${CMAKE_INSTALL_RPATH}:$ORIGIN/../ff"
    )

# Link with static Boost libraries instead of dynamic
set(Boost_USE_STATIC_LIBS ON)
#set(Boost_USE_DEBUG_PYTHON OFF)
#set(CMAKE_INSTALL_RPATH "$ORIGIN/../lib")

#set(CMAKE_CXX_STANDARD_REQUIRED False)

option(BUILD_SHARED_LIBS "Build using shared libraries" ON)
option(CMAKE_FF "CMAKE_FF" OFF)
option(CMAKE_FD "CMAKE_FD" OFF)
option(CMAKE_VAL "CMAKE_FD" OFF)
option(CMAKE_STATIC_BOOST "CMAKE_STATIC_BOOST" OFF)
#add_definitions(/DBOOST_PYTHON_STATIC_LIB)
if(CMAKE_STATIC_BOOST)
    set(Boost_USE_STATIC_LIBS ON)
endif(CMAKE_STATIC_BOOST)
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
add_subdirectory(config)
if(CMAKE_FF)
    add_subdirectory(legacy_ff)
endif(CMAKE_FF)

# Add run scripts
add_subdirectory(run)
add_subdirectory(scripts)

configure_file(config/lapkt_cmake_config.h.in lapkt_cmake_config.h)

install(FILES "${PROJECT_BINARY_DIR}/lapkt_cmake_config.h"
  DESTINATION include
  COMPONENT Development EXCLUDE_FROM_ALL
  )
install(
    EXPORT      LAPKTTargets
    FILE        LAPKTTargets.cmake
    DESTINATION cmake/LAPKT
    COMPONENT Development EXCLUDE_FROM_ALL
    )

include(CMakePackageConfigHelpers)
# generate the config file that includes the exports
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/config/Config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/LAPKTConfig.cmake"
  INSTALL_DESTINATION "cmake/example"
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
    DESTINATION cmake/LAPKT
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt_planner_config.yml
    DESTINATION lib/lapkt/config
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt_planner_config.yml
    DESTINATION lib/lapkt/config
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
file(WRITE ${PROJECT_BINARY_DIR}/setup.cfg 
    "[options]\nscripts=\n\tbin/lapkt\n")


if(CMAKE_VAL)
    file(APPEND ${PROJECT_BINARY_DIR}/setup.cfg 
        "\tbin/validate.py\n\tbin/gringo\n")
endif(CMAKE_VAL)
install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
    ${CMAKE_CURRENT_SOURCE_DIR}/../README.md
    ${CMAKE_CURRENT_SOURCE_DIR}/../LICENSE.txt
    ${PROJECT_BINARY_DIR}/setup.cfg
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_CURRENT_SOURCE_DIR}/setup.py
    ${CMAKE_CURRENT_SOURCE_DIR}/../README.md
    ${CMAKE_CURRENT_SOURCE_DIR}/../LICENSE.txt
    ${PROJECT_BINARY_DIR}/setup.cfg
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${Boost_LIBRARIES}
    ${Boost_PROGRAM_OPTIONS_LIBRARY}
    ${Boost_REGEX_LIBRARY}
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost
    COMPONENT Runtime
  )
install(FILES
    ${Boost_LIBRARIES}
    ${Boost_PROGRAM_OPTIONS_LIBRARY}
    ${Boost_REGEX_LIBRARY}
    PERMISSIONS OWNER_WRITE OWNER_READ
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(DIRECTORY
    ${Boost_INCLUDE_DIRS}
    DESTINATION ${CMAKE_INSTALL_PREFIX}
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${CMAKE_BINARY_DIR}/clingo/linux/gringo
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/clingo/linux
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_BINARY_DIR}/clingo/linux/gringo
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/clingo/linux
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${CMAKE_BINARY_DIR}/clingo/darwin/gringo
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/clingo/darwin
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_BINARY_DIR}/clingo/darwin/gringo
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/clingo/darwin
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#
install(FILES
    ${CMAKE_BINARY_DIR}/clingo/win32/gringo.exe
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/clingo/win32
    COMPONENT Runtime
  )
install(FILES
    ${CMAKE_BINARY_DIR}/clingo/win32/gringo.exe
    PERMISSIONS OWNER_WRITE OWNER_READ OWNER_EXECUTE
    DESTINATION ${CMAKE_INSTALL_PREFIX}/bin/clingo/win32
    COMPONENT Development EXCLUDE_FROM_ALL
  )

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/../LICENSE.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${LAPKT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${LAPKT_VERSION_MINOR}")
include(CPack)

#enable_testing()
