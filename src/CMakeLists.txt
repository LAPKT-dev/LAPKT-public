
#----- Project Source -----#

add_subdirectory(wrapper)

# Translate PDDL input (leverages external libraries, including tarski)
add_subdirectory(translate)

# Search engines 
add_subdirectory(engine)

# Components of the engine
add_subdirectory(component)

# Algorithms to evaluate a node
add_subdirectory(node_eval)

# Blueprints for strips model
add_subdirectory(model)

# Other utility blueprints
add_subdirectory(utility)

# Planners which leverage engine(s) in some particular configuration
add_subdirectory(planner)

# Frontend scripts
add_subdirectory(script)

#----- legacy lapkt-ff executables -----#
if(CMAKE_LEGACY_PLANNER)
    set(CMAKE_FF_CXX ON)
    add_subdirectory(legacy_ff_planner)
endif(CMAKE_LEGACY_PLANNER)