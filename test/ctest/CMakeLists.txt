#xxxx BEGIN TEST xxxx#

# Configure a Catch2 exec 
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

# add_custom_command(TARGET cpp_unit_test 
#     COMMAND ctest
#     WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
# )