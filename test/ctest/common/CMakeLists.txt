target_sources(cpp_unit_test PRIVATE
    toy_graph.cxx
    toy_graph.hxx
)

target_include_directories(cpp_unit_test 
    PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
)