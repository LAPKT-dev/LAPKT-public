cmake_minimum_required(VERSION 3.16)

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#------------ PRE-BUILD STEP/SUPERBUILD -------------#
#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 0 -  LAPKT DEPENDENCIES
# THIS SECTION MUST STAY AT THE TOP OF ROOT CMakeLists.txt
# Use -DUSE_SUPERBUILD=OFF to skip the section

# LOG
message(STATUS "SUPERBUILD IS ${USE_SUPERBUILD}")

# SUPERBUILD is ON by default but can be disabled by -DUSE_SUPERBUILD=OFF
option (USE_SUPERBUILD "flag that a superbuild should be invoked" ON)

message(STATUS "SUPERBUILD IS ${USE_SUPERBUILD}")

if (USE_SUPERBUILD)
    project(SUPERBUILD NONE)

    # Set pre_build user parameters
    set(LINUX_BUILD OFF)
    set(WINDOWS_BUILD OFF)
    set(MACOS_BUILD OFF)
    set(CUSTOM_EXT_INSTALL_PREFIX "${PROJECT_BINARY_DIR}/../external_lib")
    set(CUSTOM_EXT_DOWNLOAD_DIR "${PROJECT_BINARY_DIR}/../external_download")
    set(CUSTOM_EXT_BUILD_DIR "${PROJECT_BINARY_DIR}/../external_build")

    message(STATUS "THE LOCAL BUILD SYSTEM NAME IS : ${CMAKE_SYSTEM_NAME}")
    if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
        set(LINUX_BUILD ON)
        add_subdirectory(config/cmake/SuperBuildLinux)
        # include(config/cmake/SuperBuildLinux.cmake)
    elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
        set(WINDOWS_BUILD ON)
        include(config/cmake/SuperBuildWindows.cmake)
    elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
        set(MACOS_BUILD ON)
        include(config/cmake/SuperBuildMacos.cmake)
    else()
        message(FATAL_ERROR
"The Super build is only configured for Linux, Windows, \
and Darwin.\
RESOLUTION: \
1. Create the Superbuild cmake config specific to you system and \
update the call to the script in the root CMakeLists.txt.\
2. Create a Pull request on Github."
        )
    endif()

    return()
else()
    project(LAPKT VERSION 1.0)
endif(USE_SUPERBUILD)

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx#
#--------- LAPKT PROJECT BUILD BEGINS HERE ----------#
#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 1 - CMAKE CUSTOMIZATION xxxx#

#---- SECTION 1.1 SETTINGS ----#

set(CMAKE_CXX_STANDARD 17)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER   gcc)
set(CMAKE_CXX_COMPILER g++)

# https://stackoverflow.com/a/17032841/7248295
# set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")

# Global flag to cause add_library() to create shared libraries
set(BUILD_SHARED_LIBS ON)

# The Find<Package>.cmake file are located here
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/config/cmake)

# FLAG THE LOCAL BUILD SYSTEM
message(STATUS "THE LOCAL BUILD SYSTEM NAME IS : ${CMAKE_SYSTEM_NAME}")
if(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
    set(LINUX_BUILD ON)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    set(MACOS_BUILD ON)
elseif(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
    set(WINDOWS_BUILD ON)
else()
    message(FATAL_ERROR
"The Super build is only configured for Linux, Windows, \
and Darwin.\
RESOLUTION: \
1. Create the Superbuild cmake config specific to you system and \
update the call to the script in the root CMakeLists.txt.\
2. Create a Pull request on Github."
    )
endif()

# Link with FF Library and include the wrapper over FF and LAPKT
#   which acts as a pipe between output of FF parser and LAPKT
option(CMAKE_FF_CXX "CMAKE_FF_CXX" OFF)
option(CMAKE_FF_PYWRAPPER "CMAKE_FF_PYWRAPPER" OFF)

# Link with FD Library and include the wrapper over FD and LAPKT
#   which acts as a pipe between output of FD tarnslate and LAPKT
option(CMAKE_FD "CMAKE_FD" OFF)

# Include the wrapper over Tarski and LAPKT
#   which acts as a pipe between output of Tarski grounder and LAPKT
option(CMAKE_TARSKI "CMAKE_TARSKI" ON)

# Compile KCL VAL 
option(CMAKE_VAL "CMAKE_VAL" OFF)

# Create Sphinx Docs (Translated from Doxygen XML)
option(CMAKE_SPHINX_DOCS "CMAKE_SPHINX_DOCS" OFF)

# Create Doxygen html Docs
option(CMAKE_DOXYGEN_DOCS "CMAKE_DOXYGEN_DOCS" OFF)

# LOG
message(STATUS "The CMAKE_INSTALL_PREFIX is " ${CMAKE_INSTALL_PREFIX})
message(STATUS "Building LAPKT in " ${CMAKE_BUILD_TYPE} " mode")

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

message("The PYTHON_VERSION is ${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}")

#---- Boost ----#

# LOGS
message(STATUS "BOOST_ROOT is set to ${BOOST_ROOT}")
message(STATUS "BOOST_INCLUDEDIR is set to ${BOOST_INCLUDEDIR}")
message(STATUS "BOOST_LIBRARYDIR is set to ${BOOST_LIBRARYDIR}")
message(STATUS "CMAKE_MODULE_PATH is set to ${CMAKE_MODULE_PATH}")
set(Boost_VERBOSE ON)
set(Boost_DEBUG ON)

# Link with static Boost libraries instead of dynamic
option(CMAKE_STATIC_BOOST "CMAKE_STATIC_BOOST" ON)
if(CMAKE_STATIC_BOOST)
    set(Boost_USE_STATIC_LIBS ON)
    set(BOOST_PYTHON_STATIC_LIB ON)
endif(CMAKE_STATIC_BOOST)

message("Boost_USE_STATIC_LIBS is ${Boost_USE_STATIC_LIBS}")
message("BOOST_PYTHON_STATIC_LIB is ${BOOST_PYTHON_STATIC_LIB}")
# find_package(Boost REQUIRED COMPONENTS python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR} program_options)

# set(BOOST_ROOT C:/Boost)
# set(BOOST_INCLUDEDIR ${BOOST_ROOT}/include)
# set(BOOST_LIBRARYDIR ${BOOST_ROOT}/lib)
# set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "C:/Boost/lib/cmake/Boost-1.78.0")
find_package(Boost REQUIRED COMPONENTS program_options  python${Python3_VERSION_MAJOR}${Python3_VERSION_MINOR})
message("THE BOOST INCLUDE dirs search path is " ${Boost_INCLUDE_DIRS} )

#---- Catch2 ----#
find_package(Catch2 3 REQUIRED PATHS ${CATCH2_ROOT} NO_DEFAULT_PATH)

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
#xxxx SECTION 4 Installed Package

# Package Structure and Configuration
add_subdirectory(config/cmake/install)

#---- SECTION 4.1 CMAKE EXPORT CONFIGURATION

## Allow developers using the LAPKT library to fetch information, including library version
configure_file(${PROJECT_SOURCE_DIR}/config/cmake/lapkt_cmake_config.h.in lapkt_cmake_config.h)

install(FILES "${PROJECT_BINARY_DIR}/lapkt_cmake_config.h"
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/core/include
    COMPONENT LAPKT EXCLUDE_FROM_ALL
)

# Allows the developers to use find_package(...) to find LAPKT library from their cmake project
install(
    EXPORT      LAPKTTargets
    FILE        LAPKTTargets.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/core/cmake
    COMPONENT LAPKT
)
install(
    EXPORT      LAPKTTargets
    FILE        LAPKTTargets.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/lapkt/_lapkt_core/cmake
    COMPONENT LAPKT EXCLUDE_FROM_ALL
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
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/LAPKTConfig.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/package/core/cmake/
    COMPONENT LAPKT EXCLUDE_FROM_ALL
)

###XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 6 CPACK CONFIGURATIOn

# include(InstallRequiredSystemLibraries)
# set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE.txt")
# set(CPACK_PACKAGE_VERSION_MAJOR "${LAPKT_VERSION_MAJOR}")
# set(CPACK_PACKAGE_VERSION_MINOR "${LAPKT_VERSION_MINOR}")
# include(CPack)

###XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 7 POST BUILD

# The script will run during the installation(We want this at the bottom of all install target)
install(SCRIPT ${PROJECT_SOURCE_DIR}/config/cmake/PostInstallScript.cmake)