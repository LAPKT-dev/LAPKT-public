#xxxx BEGIN TEST xxxx#

# Configure a Catch2 exec 
add_executable(cpp_unit_test)
target_link_libraries(cpp_unit_test PRIVATE
    Catch2::Catch2WithMain
    core
    wrapper
    planner
    ${Python_LIBRARIES}
)

# post-build event - Since RPATH can't be used in windows
if(WINDOWS_BUILD)
    add_custom_command(TARGET cpp_unit_test POST_BUILD           
        COMMAND ${CMAKE_COMMAND} -E copy_if_different   
            "${PROJECT_BINARY_DIR}/libcore.dll"         
            $<TARGET_FILE_DIR:cpp_unit_test>            # <-- copy next to test exec
    )
endif(WINDOWS_BUILD)


# Source files shared by tests
add_subdirectory(common)

# Test the problem model
add_subdirectory(test_create_model)
add_subdirectory(test_planner)
include(CTest)

# The Catch cmake file has the definition of catch_discover_tests method
include(Catch)

catch_discover_tests(cpp_unit_test)

# Trigger the tests from cmake itself
# add_custom_command(TARGET cpp_unit_test 
#     COMMAND ctest
#     WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
# )
