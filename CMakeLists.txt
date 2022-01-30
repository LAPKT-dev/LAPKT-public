cmake_minimum_required(VERSION 3.16)

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 0 - PRE-BUILD STEP/SUPERBUILD xxxx#
# This must stay at the beginning of the top level CMakeLists.txt

option (USE_SUPERBUILD "flag that a superbuild should be invoked" ON)

if (USE_SUPERBUILD)
    project(SUPERBUILD NONE)
    set(CMAKE_BUILD_DIREC)
    include(config/cmake/SuperBuild.cmake)
    return()
else()
    project(LAPKT VERSION 1.0)
endif(USE_SUPERBUILD)

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 1 - CMAKE CUSTOMIZATION xxxx#

#---- SECTION 1.1 SETTINGS ----#

set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_CXX_STANDARD_REQUIRED False)

# https://stackoverflow.com/a/17032841/7248295
# set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")

# Global flag to cause add_library() to create shared libraries
set(BUILD_SHARED_LIBS ON)

# The Find<Package>.cmake file are located here
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/config/cmake)

# THIS IS SPECIFIC TO LINUX/SOLARIS
set(CMAKE_INSTALL_RPATH 
    "${CMAKE_INSTALL_RPATH}:$ORIGIN/../_cxx/lib;\
    ${CMAKE_INSTALL_RPATH}:$ORIGIN/../_pywrapper"
)

# DEFAULT PARAMETER VALUES
option(CMAKE_FF "CMAKE_FF" OFF)
option(CMAKE_FD "CMAKE_FD" OFF)
option(CMAKE_VAL "CMAKE_FD" OFF)
option(CMAKE_SPHINX_DOCS "CMAKE_SPHINX_DOCS" OFF)
option(CMAKE_DOXYGEN_DOCS "CMAKE_DOXYGEN_DOCS" OFF)

# Echo Log

message("The CMAKE_INSTALL_PREFIX is " ${CMAKE_INSTALL_PREFIX})
message("Building LAPKT in " ${CMAKE_BUILD_TYPE} " mode")

#---- SECTION 1.2 CUSTOM METHODS ----#
function(cat FROM TO)
    file(READ ${FROM} CONTENTS)
    file(APPEND ${TO} "${CONTENTS}")
endfunction()

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 2 - External packages/libraries xxxx#

#---- Python3  ----#
# find_package(Python3 3.7...<3.10  COMPONENTS Interpreter Development)
# if(${Python3_VERSION} GREATER 3.9 OR ${Python3_VERSION} LESS 3.7)
#     message(SEND_ERROR 
#         "INCOMPATIBLE PYTHON VERSION, expected 3.7.x < 3.9.x but found - " 
#         ${Python3_VERSION})
# endif()
find_package(Python3 COMPONENTS Interpreter Development)
if(${Python3_VERSION} VERSION_LESS 3.7.0)
    message(SEND_ERROR 
        "INCOMPATIBLE PYTHON VERSION, expected >3.7.x but found - " 
        ${Python3_VERSION})
endif()

message("The PYTHON_VERSION is " ${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR})

#---- Boost ----#

find_package(Boost REQUIRED COMPONENTS python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR} program_options)

message("THE BOOST INCLUDE dirs search path is " ${Boost_INCLUDE_DIRS} )

#
# install(FILES
#     ${Boost_LIBRARIES}
#     ${Boost_PROGRAM_OPTIONS_LIBRARY}
#     ${Boost_REGEX_LIBRARY}
#     PERMISSIONS OWNER_WRITE OWNER_READ
#     DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost
#     COMPONENT Development EXCLUDE_FROM_ALL
#   )
# #
# install(DIRECTORY
#     ${Boost_INCLUDE_DIRS}
#     DESTINATION ${CMAKE_INSTALL_PREFIX}
#     COMPONENT Development EXCLUDE_FROM_ALL
#   )

# Link with static Boost libraries instead of dynamic
option(CMAKE_STATIC_BOOST "CMAKE_STATIC_BOOST" ON)
if(CMAKE_STATIC_BOOST)
    set(Boost_USE_STATIC_LIBS ON)
endif(CMAKE_STATIC_BOOST)

#---- Catch2 ----#
find_package(Catch2 3 REQUIRED PATHS ${CMAKE_BINARY_DIR}/../build_external/Catch2 NO_DEFAULT_PATH)

# 
if(CMAKE_TESTING_ENABLED)
    enable_testing()
endif()

##XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 3 - Add subdirectories

# Add src
add_subdirectory(src)
# All package configurations
add_subdirectory(config)
# All external depedencies(to be compiled/installed) are stored here
add_subdirectory(external_package)
# Unit tests
add_subdirectory(test)

##XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 4 Python Package

file(TOUCH ${PROJECT_BINARY_DIR}/lapkt_planner_config.yml)
file(TOUCH ${PROJECT_BINARY_DIR}/__init__.py)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt
    COMPONENT Runtime
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt
    COMPONENT Development EXCLUDE_FROM_ALL
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips
    COMPONENT Runtime
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/pddl2strips
    COMPONENT Development EXCLUDE_FROM_ALL
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper
    COMPONENT Runtime
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_pywrapper
    COMPONENT Development EXCLUDE_FROM_ALL
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
    COMPONENT Runtime
)
install(
    FILES ${PROJECT_BINARY_DIR}/__init__.py
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/script
    COMPONENT Development EXCLUDE_FROM_ALL
)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt_planner_config.yml
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/planner
    COMPONENT Runtime
)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/lapkt_planner_config.yml
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/planner
    COMPONENT Development EXCLUDE_FROM_ALL
)

###XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 5 CMAKE EXPORT CONFIGURATION

## NEED TO EXPLAIN THIS
configure_file(${PROJECT_SOURCE_DIR}/config/cmake/lapkt_cmake_config.h.in lapkt_cmake_config.h)

## NEED TO EXPLAIN THIS
install(FILES "${PROJECT_BINARY_DIR}/lapkt_cmake_config.h"
  DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/include
  COMPONENT Development EXCLUDE_FROM_ALL
  )
  install(
    EXPORT      LAPKTTargets
    FILE        LAPKTTargets.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/cmake
    COMPONENT Runtime
    )
install(
    EXPORT      LAPKTTargets
    FILE        LAPKTTargets.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/cmake
    COMPONENT Development EXCLUDE_FROM_ALL
    )

include(CMakePackageConfigHelpers)
# generate the config file that includes the exports
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/config/cmake/Config.cmake.in
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

# 
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/LAPKTConfig.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_cxx/cmake/
    COMPONENT Development EXCLUDE_FROM_ALL
  )
#

###XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 6 CPACK CONFIGURATIOn

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${LAPKT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${LAPKT_VERSION_MINOR}")
include(CPack)

###XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 7 POST BUILD

# The script will run during the installation(We want this at the bottom of all install target)
install(SCRIPT ${PROJECT_SOURCE_DIR}/config/cmake/PostInstallScript.cmake)