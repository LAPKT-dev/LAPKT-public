#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 1 - PREREQUISITES

#----SECTION 1.1 -Install python prerequisites ----#

# Fetch Python Exec
if(MACOS_BUILD)
  set(Python_FIND_FRAMEWORK "FIRST")
  set(ENV{DYLD_FRAMEWORK_PATH} "/usr/local/Frameworks/")
  # set(ENV{DYLD_FRAMEWORK_PATH} "/Applications/Xcode_14.0.1.app/Contents/Developer/Library/Frameworks")
endif(MACOS_BUILD)

if(NOT DEFINED PY_VERSION)
  find_package(Python COMPONENTS Interpreter Development)
else()
  string(REPLACE "." ";" PY_VERSION_PART ${PY_VERSION})
  LIST(GET PY_VERSION_PART 0 PY_VMAJOR)
  LIST(GET PY_VERSION_PART 1 PY_VMINOR)
  MATH(EXPR PY_VMINOR_NEXT "${PY_VMINOR} + 1")
  find_package(Python ${PY_VMAJOR}.${PY_VMINOR}...<${PY_VMAJOR}.${PY_VMINOR_NEXT} 
    COMPONENTS Interpreter Development)
endif()
# if(${Python_VERSION} VERSION_LESS 3.6.0)
#   message(SEND_ERROR
#     "INCOMPATIBLE PYTHON VERSION, expected >3.6.x but found - "
#     ${Python_VERSION})
# endif()
message("The PYTHON_VERSION is ${Python_VERSION_MAJOR}.${Python_VERSION_MINOR}")

# Install pip requirements
execute_process(COMMAND ${Python_EXECUTABLE} -m pip install --user
  -r ${PROJECT_SOURCE_DIR}/pip_requirements.txt
  RESULT_VARIABLE out
)
message(STATUS "Status- Install general pip result: ${out}")

if(GEN_SPHINX_DOCS)
  execute_process(COMMAND ${Python_EXECUTABLE} -m pip install --user
    -r ${PROJECT_SOURCE_DIR}/config/pre_build/pip_auto_docs_requirements.txt
    RESULT_VARIABLE out
  )
endif(GEN_SPHINX_DOCS)
message(STATUS "Status- Install auto docs pip dependencies: ${out}")


#XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX#
#xxxx SECTION 2 - ADD EXTERNAL PROJECTS

include(ExternalProject)

# Dependencies of lapkt
set(DEPENDENCIES)


# Download Doxygen
if(GEN_DOXYGEN_DOCS OR GEN_DOXYSPHINX_DOCS)

  list(APPEND DEPENDENCIES
    external_doxygen
  )
  # DOXYGEN EXTRACT BINARIES
  if(LINUX_BUILD)
    ExternalProject_Add( external_doxygen
      URL https://sourceforge.net/projects/doxygen/files/rel-1.9.6/doxygen-1.9.6.linux.bin.tar.gz
      URL_MD5 b6193a16bc5128597f5affd878dbd7b7
      DOWNLOAD_EXTRACT_TIMESTAMP TRUE
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
      URL https://www.doxygen.nl/files/doxygen-1.9.6.windows.x64.bin.zip
      URL_MD5 bdf1af97a733edd0a60fce2cf375c5c3
      DOWNLOAD_EXTRACT_TIMESTAMP TRUE
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
endif(GEN_DOXYGEN_DOCS OR GEN_DOXYSPHINX_DOCS)

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
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
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

if(CMAKE_TESTING_ENABLED)
  list(APPEND DEPENDENCIES
    external_catch2
  )
  ExternalProject_Add(external_catch2
    # GIT_REPOSITORY https://github.com/catchorg/Catch2
    # GIT_TAG  v3.0.0-preview4
    URL ${PROJECT_SOURCE_DIR}/external_package/Catch2-3.0.0-preview4.tar.gz
    DOWNLOAD_EXTRACT_TIMESTAMP TRUE
    SOURCE_DIR ${DEPS_DOWNLOAD_DIR}/Catch2
    #SOURCE_SUBDIR src
    BINARY_DIR ${DEPS_BUILD_DIR}/Catch2/build
    INSTALL_DIR ${DEPS_INSTALL_PREFIX}/Catch2
    #GIT_REMOTE_UPDATE_STRATEGY    CHECKOUT
    CMAKE_ARGS 
      -DCMAKE_INSTALL_PREFIX=${DEPS_INSTALL_PREFIX}/Catch2
      -DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
    # INSTALL_COMMAND  cmake --install ${PROJECT_BINARY_DIR}/../build_external/Catch2/build
  )
  list (APPEND EXTRA_CMAKE_ARGS
    -DCatch2_ROOT=${DEPS_INSTALL_PREFIX}/Catch2
  )
endif(CMAKE_TESTING_ENABLED)

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
file(WRITE ${DEPS_BUILD_DIR}/boost/user-config.jam "using python  :  ${Python_VERSION_MAJOR}.${Python_VERSION_MINOR} ;")

# LOGS
message("Boost is built using python  :  ${Python_VERSION_MAJOR}.${Python_VERSION_MINOR} ;")
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
  URL ${PROJECT_SOURCE_DIR}/external_package/boost-1.81.0.tar.xz
  DOWNLOAD_EXTRACT_TIMESTAMP TRUE
  URL_MD5 6cf0cdd797bca685910d527ae3c08cb3
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
  -DBoost_ROOT=${DEPS_INSTALL_PREFIX}/boost
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
  DOWNLOAD_EXTRACT_TIMESTAMP TRUE
  DEPENDS ${DEPENDENCIES}
  SOURCE_DIR ${PROJECT_SOURCE_DIR}
  CMAKE_ARGS ${EXTRA_CMAKE_ARGS}
  INSTALL_COMMAND ""
  # ${CMAKE_COMMAND} --install  ${PROJECT_BINARY_DIR} --component lapkt &&
  # ${CMAKE_COMMAND} --install  ${PROJECT_BINARY_DIR} --component PYPACKAGE
  BINARY_DIR ${PROJECT_BINARY_DIR}
)
