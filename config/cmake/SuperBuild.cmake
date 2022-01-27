#---- BEGIN install python prerequisites ----#
#----Check Python Version ----#
find_package(Python3 3.7...<3.10  COMPONENTS Interpreter Development)
#-----------------------------#
execute_process(COMMAND ${Python3_EXECUTABLE} -m pip install -r ${PROJECT_SOURCE_DIR}/pip_requirements.txt
            RESULT_VARIABLE out)
message(STATUS "Python result: ${out}")
#---- END install python prerequisites ----#

include(ExternalProject)
set(CMAKE_CXX_STANDARD 17)

#set_property(DIRECTORY PROPERTY EP_BASE boost)


set(DEPENDENCIES)
set(EXTRA_CMAKE_ARGS)

list(APPEND DEPENDENCIES 
    external_boost 
    external_clingo_linux 
    external_clingo_win32 
    external_clingo_darwin
    )

if(CMAKE_BOOST_BUILD_TYPE STREQUAL "Debug")
    set(BOOST_VARIANT "debug")
else()
    set(BOOST_VARIANT "release")
endif()
message("Building Boost in " ${BOOST_VARIANT} " mode")

if(CMAKE_DOXYGEN_DOCS OR CMAKE_SPHINX_DOCS)
    list(APPEND DEPENDENCIES 
    external_doxygen
    )
    ExternalProject_Add( external_doxygen
        URL https://sourceforge.net/projects/doxygen/files/rel-1.9.3/doxygen-1.9.3.linux.bin.tar.gz
        URL_MD5 3aa5c8b282f194f0d0d3e9c5b8010e20
        DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external_package
        SOURCE_DIR  ${CMAKE_BINARY_DIR}/doxygen
        BUILD_IN_SOURCE 1
        CONFIGURE_COMMAND ""
        BUILD_COMMAND ""
        INSTALL_COMMAND "" # ./b2 install
        )
endif(CMAKE_DOXYGEN_DOCS OR CMAKE_SPHINX_DOCS)


ExternalProject_Add( external_clingo_linux
    URL https://github.com/potassco/clingo/releases/download/v5.4.0/clingo-5.4.0-linux-x86_64.tar.gz
    URL_MD5 d8e5767d1f482ddfc98d010191422af8
    DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external_package
    SOURCE_DIR  ${CMAKE_BINARY_DIR}/clingo/linux
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND "" # ./b2 install
    )

ExternalProject_Add( external_clingo_darwin
    URL https://github.com/potassco/clingo/releases/download/v5.4.0/clingo-5.4.0-macos-x86_64.tar.gz
    URL_MD5 64b46fde3a75e02368c25cd9f2d37029
    DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external_package
    SOURCE_DIR  ${CMAKE_BINARY_DIR}/clingo/darwin
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND "" # ./b2 install
    )

ExternalProject_Add( external_clingo_win32
    URL https://github.com/potassco/clingo/releases/download/v5.4.0/clingo-5.4.0-win64.zip
    URL_MD5 61815445476e20d4ce4f00060626d2da
    DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external_package
    SOURCE_DIR  ${CMAKE_BINARY_DIR}/clingo/win32
    BUILD_IN_SOURCE 1
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND "" # ./b2 install
    )

ExternalProject_Add( external_boost
    URL https://boostorg.jfrog.io/artifactory/main/release/1.78.0/source/boost_1_78_0.tar.bz2
    URL_MD5 db0112a3a37a3742326471d20f1a186a
    DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external_package
    TMP_DIR     ${CMAKE_BINARY_DIR}/boost/tmp
    SOURCE_DIR  ${CMAKE_BINARY_DIR}/boost/src
    BUILD_IN_SOURCE 1
    #INSTALL_DIR ${CMAKE_BINARY_DIR}/boost/lib
    #CONFIGURE_COMMAND ./bootstrap.sh --libdir=${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost --includedir=${CMAKE_INSTALL_PREFIX}/include
    CONFIGURE_COMMAND ./bootstrap.sh --libdir=${CMAKE_BINARY_DIR}/boost/lib --includedir=${CMAKE_BINARY_DIR}/boost/include
    #BUILD_COMMAND ./b2 --user-config=${CMAKE_SOURCE_DIR}/config/user-config.jam --with-python --with-program_options --build-dir=${CMAKE_BINARY_DIR}/boost/build toolset=gcc variant=${BOOST_VARIANT} optimization=space link=shared install
    BUILD_COMMAND ./b2 --user-config=${CMAKE_SOURCE_DIR}/config/boost/user-config.jam --with-python --with-program_options --build-dir=${CMAKE_BINARY_DIR}/boost/build toolset=gcc variant=${BOOST_VARIANT} optimization=space link=static install cxxflags=-fpic
    INSTALL_COMMAND "" # ./b2 install
    )

list (APPEND EXTRA_CMAKE_ARGS
  -DBOOST_ROOT=${CMAKE_BINARY_DIR}/boost/src
  #-DBOOST_INCLUDEDIR=${CMAKE_INSTALL_PREFIX}/include
  -DBOOST_INCLUDEDIR=${CMAKE_BINARY_DIR}/boost/include
  #-DBOOST_LIBRARYDIR=${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost/
  -DBOOST_LIBRARYDIR=${CMAKE_BINARY_DIR}/boost/lib
  -DBoost_NO_SYSTEM_PATHS=ON
  -DBoost_REALPATH=ON
  -DBoost_NO_BOOST_CMAKE=ON)

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
  CMAKE_ARGS -DUSE_SUPERBUILD=OFF ${EXTRA_CMAKE_ARGS} -DCMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX}
  INSTALL_COMMAND ""
  BINARY_DIR ${CMAKE_BINARY_DIR})
