add_custom_command(OUTPUT scan-fct_pddl.tab.c
    COMMAND bison ARGS -pfct_pddl -bscan-fct_pddl 
            ${CMAKE_CURRENT_SOURCE_DIR}/scan-fct_pddl.y
    DEPENDS #${CMAKE_CURRENT_SOURCE_DIR}/scan-fct_pddl.y 
            lex.fct_pddl.c
    )
add_custom_command(OUTPUT scan-ops_pddl.tab.c
    COMMAND bison ARGS -pops_pddl -bscan-ops_pddl
            ${CMAKE_CURRENT_SOURCE_DIR}/scan-ops_pddl.y
    DEPENDS     #${CMAKE_CURRENT_SOURCE_DIR}/scan-ops_pddl.y 
            lex.ops_pddl.c
    )

add_custom_command(OUTPUT lex.fct_pddl.c
    COMMAND flex ARGS -Pfct_pddl 
            ${CMAKE_CURRENT_SOURCE_DIR}/lex-fct_pddl.l
    )
add_custom_command(OUTPUT lex.ops_pddl.c
    COMMAND flex -Pops_pddl ARGS 
            ${CMAKE_CURRENT_SOURCE_DIR}/lex-ops_pddl.l
    )

add_library(ff STATIC
        scan-fct_pddl.tab.c
        scan-ops_pddl.tab.c
        libff.c 
        memory.c
        output.c
        parse.c 
        expressions.c 
        inst_pre.c 
        inst_easy.c 
        inst_hard.c 
        inst_final.c 
        relax.c 
        search.c 
        utility.c 
    )

set_property(TARGET ff PROPERTY POSITION_INDEPENDENT_CODE ON)
target_include_directories(ff
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:include>
    ) 
