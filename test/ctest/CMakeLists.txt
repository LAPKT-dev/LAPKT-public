#xxxx BEGIN TEST xxxx#

# Configure a Catch2 exec 
add_executable(cpp_unit_test)
target_link_libraries(cpp_unit_test PRIVATE
    Catch2::Catch2WithMain
    core
)

# post-build event - Since RPATH can't be used in windows
if(WINDOWS_BUILD)
    add_custom_command(TARGET cpp_unit_test POST_BUILD           
        COMMAND ${CMAKE_COMMAND} -E copy_if_different   
            "${PROJECT_BINARY_DIR}/libcore.dll"         
            $<TARGET_FILE_DIR:cpp_unit_test>            # <-- copy next to test exec
    )
endif(WINDOWS_BUILD)

if(CMAKE_FF_CXX)
    set_target_properties(cpp_unit_test PROPERTIES
        LINK_FLAGS "-Wl,--allow-multiple-definition" # multiple definitions of gbracket_count in libff.c and scan.#$$^.c file
    )
endif(CMAKE_FF_CXX)

# Source files shared by tests
add_subdirectory(common)

# Test the problem model
add_subdirectory(test_model)
include(CTest)

# The Catch cmake file has the definition of catch_discover_tests method
include(Catch)

catch_discover_tests(cpp_unit_test)

# Trigger the tests from cmake itself
# add_custom_command(TARGET cpp_unit_test 
#     COMMAND ctest
#     WORKING_DIRECTORY ${PROJECT_BINARY_DIR}
# )
