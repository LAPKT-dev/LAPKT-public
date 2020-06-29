include(ExternalProject)

#set_property(DIRECTORY PROPERTY EP_BASE boost)


set(DEPENDENCIES)
set(EXTRA_CMAKE_ARGS)

list(APPEND DEPENDENCIES external_boost)

if(CMAKE_BOOST_BUILD_TYPE STREQUAL "Debug")
    set(BOOST_VARIANT "debug")
else()
    set(BOOST_VARIANT "release")
endif()
message("Building Boost in " ${BOOST_VARIANT} " mode")

ExternalProject_Add( external_boost
    URL https://dl.bintray.com/boostorg/release/1.73.0/source/boost_1_73_0.tar.bz2
    URL_MD5 9273c8c4576423562bbe84574b07b2bd
    DOWNLOAD_DIR ${CMAKE_SOURCE_DIR}/external
    TMP_DIR     ${CMAKE_BINARY_DIR}/../boost/tmp
    SOURCE_DIR  ${CMAKE_BINARY_DIR}/../boost/src
    BUILD_IN_SOURCE 1
    #INSTALL_DIR ${CMAKE_BINARY_DIR}/boost/lib
    #CONFIGURE_COMMAND ./bootstrap.sh --libdir=${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost --includedir=${CMAKE_INSTALL_PREFIX}/include
    CONFIGURE_COMMAND ./bootstrap.sh --libdir=${CMAKE_BINARY_DIR}/../boost/lib --includedir=${CMAKE_BINARY_DIR}/../boost/include
    BUILD_COMMAND ./b2 --user-config=${CMAKE_SOURCE_DIR}/config/user-config.jam --with-python --with-program_options --build-dir=${CMAKE_BINARY_DIR}/boost/build toolset=gcc variant=${BOOST_VARIANT} optimization=space link=shared install #cxxflags=-fpic
    INSTALL_COMMAND "" # ./b2 install
    )

list (APPEND EXTRA_CMAKE_ARGS
  -DBOOST_ROOT=${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost/
  #-DBOOST_INCLUDEDIR=${CMAKE_INSTALL_PREFIX}/include
  -DBOOST_INCLUDEDIR=${CMAKE_BINARY_DIR}/../boost/include
  #-DBOOST_LIBRARYDIR=${CMAKE_INSTALL_PREFIX}/lib/lapkt/boost/
  -DBOOST_LIBRARYDIR=${CMAKE_BINARY_DIR}/../boost/lib
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
