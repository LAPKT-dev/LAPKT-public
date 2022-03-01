#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 1 - PREREQUISITES

#----SECTION 1.1 -Install python prerequisites ----#

# Fetch Python Exec
find_package(Python3 COMPONENTS Interpreter Development)
if(${Python3_VERSION} VERSION_LESS 3.6.0)
  message(SEND_ERROR
    "INCOMPATIBLE PYTHON VERSION, expected >3.6.x but found - "
    ${Python3_VERSION})
endif()
message("The PYTHON_VERSION is ${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR}")

# Install pip requirements
execute_process(COMMAND ${Python3_EXECUTABLE} -m pip install
  -r ${PROJECT_SOURCE_DIR}/config/pre_build/pip_requirements.txt
  RESULT_VARIABLE out
)
message(STATUS "Python result: ${out}")

#Fetch path to Pybind11
execute_process(COMMAND ${Python3_EXECUTABLE} -m pybind11 --cmakedir 
  OUTPUT_VARIABLE PYBIND11_CMAKE_DIR
  ERROR_VARIABLE PYBIND11_CMAKE_DIR_ERROR
  OUTPUT_STRIP_TRAILING_WHITESPACE
  ERROR_STRIP_TRAILING_WHITESPACE
)

if(PYBIND11_CMAKE_DIR_ERROR)
  message(FATAL_ERROR "Failed to find pybind11 cmake directory from pip\n ERROR: ${PYBIND11_CMAKE_DIR_ERROR}")
endif()


#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 2 - ADD EXTERNAL PROJECTS

set(ENV{PATH} $ENV{PATH}":C:\\GnuWin32\\bin")
include(ExternalProject)

# Dependencies of lapkt
set(DEPENDENCIES)


# Download Doxygen
if(CMAKE_DOXYGEN_DOCS)

  find_package(Doxygen)

  if(Doxygen_FOUND)
    message(STATUS  ${DOXYGEN_EXEC} will be used to generate auto docs)
  elseif(NOT Doxygen_FOUND)
    list(APPEND DEPENDENCIES
      external_doxygen
    )
    # DOXYGEN EXTRACT BINARIES
    if(LINUX_BUILD)
      ExternalProject_Add( external_doxygen
        URL https://sourceforge.net/projects/doxygen/files/rel-1.9.3/doxygen-1.9.3.linux.bin.tar.gz
        URL_MD5 3aa5c8b282f194f0d0d3e9c5b8010e20
        DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}
        SOURCE_DIR  ${DEPS_INSTALL_PREFIX}/doxygen
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND "" # ./b2 install
      )
      list (APPEND EXTRA_CMAKE_ARGS
        -DDOXYGEN_ROOT=${DEPS_INSTALL_PREFIX}/doxygen
      )
    elseif(WINDOWS_BUILD)
      ExternalProject_Add( external_doxygen
        URL https://www.doxygen.nl/files/doxygen-1.9.3.windows.x64.bin.zip
        URL_MD5 35db2d56a78e9a6d15696ac65f0e2ee1
        DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}
        SOURCE_DIR  ${DEPS_INSTALL_PREFIX}/doxygen
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND "" # ./b2 install
      )
      list (APPEND EXTRA_CMAKE_ARGS
        -DDOXYGEN_ROOT=${DEPS_INSTALL_PREFIX}/doxygen
      )
    else()
      message(ERROR "Doxygen exec is not found on the host system.")
    endif()
  endif(Doxygen_FOUND)
endif(CMAKE_DOXYGEN_DOCS)

# Synchronize and update the FD submodule
if(NOT EXISTS ${PROJECT_SOURCE_DIR}/external_package/fd_translate/translate.py)
  find_package(Git REQUIRED)
  execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init
  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
  COMMAND_ERROR_IS_FATAL ANY)
endif()

# BUILD FF
if(CMAKE_FF_CXX)
  list(APPEND DEPENDENCIES
    external_ff
  )
  ExternalProject_Add(external_ff
    GIT_REPOSITORY https://github.com/LAPKT-dev/libff_parser
    SOURCE_DIR ${DEPS_DOWNLOAD_DIR}/libff
    #SOURCE_SUBDIR src
    BINARY_DIR ${DEPS_BUILD_DIR}/ff/build
    INSTALL_DIR ${DEPS_INSTALL_PREFIX}/ff
    #GIT_REMOTE_UPDATE_STRATEGY    CHECKOUT
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_PREFIX}/ff
    # INSTALL_COMMAND  cmake --install ${PROJECT_BINARY_DIR}/../build_external/ff/build
  )
  list (APPEND EXTRA_CMAKE_ARGS
    -DFF_ROOT=${DEPS_INSTALL_PREFIX}/ff
  )
endif()

# BUILD CATCH2
list(APPEND DEPENDENCIES
  external_catch2
)
ExternalProject_Add(external_catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2
  GIT_TAG  v3.0.0-preview4
  SOURCE_DIR ${DEPS_DOWNLOAD_DIR}/Catch2
  #SOURCE_SUBDIR src
  BINARY_DIR ${DEPS_BUILD_DIR}/Catch2/build
  INSTALL_DIR ${DEPS_INSTALL_PREFIX}/Catch2
  #GIT_REMOTE_UPDATE_STRATEGY    CHECKOUT
  CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_PREFIX}/Catch2
    -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
    -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
  # INSTALL_COMMAND  cmake --install ${PROJECT_BINARY_DIR}/../build_external/Catch2/build
)
list (APPEND EXTRA_CMAKE_ARGS
  -DCATCH2_ROOT=${DEPS_INSTALL_PREFIX}/Catch2
)

# BUILD BOOST

list(APPEND DEPENDENCIES
  external_boost
)

# Allow boost to be compiled with debug flag
if(CMAKE_BOOST_BUILD_TYPE STREQUAL "Debug")
  set(BOOST_VARIANT "debug")
else()
  set(BOOST_VARIANT "release")
endif()
message("Building Boost in " ${BOOST_VARIANT} " mode")
file(WRITE ${DEPS_BUILD_DIR}/boost/user-config.jam "using python  :  ${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR} ;")

# LOGS
message("Boost is built using python  :  ${Python3_VERSION_MAJOR}.${Python3_VERSION_MINOR} ;")
message("The boost build command is : ./b2 --user-config=${PROJECT_BINARY_DIR}/../build_external/boost/user-config.jam --with-python --with-program_options --build-dir=${PROJECT_BINARY_DIR}/../build_external/boost/build variant=${BOOST_VARIANT} optimization=space link=static install cxxflags=-fpic")


# Boost Configure and Build commands

if(WINDOWS_BUILD)
  list(APPEND CONFIGURE_COMMAND
    cd tools/build && bootstrap.bat mingw
  )
  list(APPEND BUILD_COMMAND
    ${DEPS_BUILD_DIR}/boost/src/tools/build/b2 -d0
    toolset=gcc 
  )
elseif(MACOS_BUILD)
  list(APPEND CONFIGURE_COMMAND
    ./bootstrap.sh
  )
  list(APPEND BUILD_COMMAND
    ./b2 -d0
    toolset=darwin
  )
else()
  list(APPEND CONFIGURE_COMMAND
    ./bootstrap.sh
  )
  list(APPEND BUILD_COMMAND
    ./b2 -d0
    toolset=gcc 
  )
endif()

list(APPEND BUILD_COMMAND
    --user-config=${DEPS_BUILD_DIR}/boost/user-config.jam
    # --build-dir=${DEPS_BUILD_DIR}/boost/build
    --with-program_options --with-random
    --prefix=${DEPS_INSTALL_PREFIX}/boost install
    cxxflags=-fPIC cflags=-fPIC 
    # toolset=gcc link=shared
    link=static
    variant=${BOOST_VARIANT}
)

ExternalProject_Add( external_boost
  URL https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.bz2
  URL_MD5 db0112a3a37a3742326471d20f1a186a
  DOWNLOAD_DIR ${DEPS_DOWNLOAD_DIR}
  TMP_DIR     ${DEPS_BUILD_DIR}/boost/tmp
  SOURCE_DIR  ${DEPS_BUILD_DIR}/boost/src
  BUILD_IN_SOURCE 1
  #CONFIGURE_COMMAND ./bootstrap.sh --libdir=${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost --includedir=${CMAKE_INSTALL_PREFIX}/include
  CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
  BUILD_COMMAND ${BUILD_COMMAND}
  INSTALL_COMMAND ""
)

# Set the path to find Boost Cmake Config
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${DEPS_INSTALL_PREFIX}/boost/lib/cmake/Boost-1.78.0")

list (APPEND EXTRA_CMAKE_ARGS
  -DBOOST_ROOT=${DEPS_INSTALL_PREFIX}/boost
  -DBOOST_INCLUDEDIR=${BOOST_ROOT}/include
  -DBOOST_LIBRARYDIR=${BOOST_ROOT}/lib
  # -DBoost_NO_SYSTEM_PATHS=ON
  # -DBoost_REALPATH=ON
  # -DBoost_NO_BOOST_CMAKE=ON
)

#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 3 - CALL THE MAIN SCRIPT TO BUILD lapkt
#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#

list(APPEND EXTRA_CMAKE_ARGS
  -DUSE_SUPERBUILD=OFF
  -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  -DPYBIND11_CMAKE_DIR=${PYBIND11_CMAKE_DIR}
)

get_cmake_property(vars CACHE_VARIABLES)
foreach(var ${vars})
  get_property(currentHelpString CACHE "${var}" PROPERTY HELPSTRING)
  if("${currentHelpString}" MATCHES "No help, variable specified on the command line." OR "${currentHelpString}" STREQUAL "")
    # message("${var} = [${${var}}]  --  ${currentHelpString}") # uncomment to see the variables being processed
    list(APPEND EXTRA_CMAKE_ARGS "-D${var}=${${var}}")
  endif()
endforeach()

ExternalProject_Add (external_lapkt
  DEPENDS ${DEPENDENCIES}
  SOURCE_DIR ${PROJECT_SOURCE_DIR}
  CMAKE_ARGS ${EXTRA_CMAKE_ARGS}
  INSTALL_COMMAND
  ${CMAKE_COMMAND} --install  ${PROJECT_BINARY_DIR} --component lapkt &&
  ${CMAKE_COMMAND} --install  ${PROJECT_BINARY_DIR} --component PYPACKAGE
  BINARY_DIR ${PROJECT_BINARY_DIR}
)
