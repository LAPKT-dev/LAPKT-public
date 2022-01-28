#xxxxxxxxxxxxxxxxxx BEGIN TEST xxxxxxxxxxxxxxxxxxxxxxxxxxxx#

#----Add Catch2 for testing----#
find_package(Catch2 3 REQUIRED PATHS ${CMAKE_BINARY_DIR}/../build_external/Catch2 NO_DEFAULT_PATH)
if(Catch2_FOUND)
    message(STATUS "Catch2 v3 found")
endif()

enable_testing()

include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${LAPKT_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${LAPKT_VERSION_MINOR}")
include(CPack)

#xxxxxxxxxxxxxxxxxxxx END TEST xxxxxxxxxxxxxxxxxxxxxxxxxxx#

#---- Configure a Catch2 exec ----#
add_executable(cpp_unit_test)
target_link_libraries(cpp_unit_test PRIVATE
    Catch2::Catch2WithMain
    LAPKT
)


# Source files shared by tests
add_subdirectory(common)

# Test the problem model
add_subdirectory(test_model)

include(CTest)
# The Catch cmake file has the definition of catch_discover_tests method
include(Catch)

catch_discover_tests(cpp_unit_test)
