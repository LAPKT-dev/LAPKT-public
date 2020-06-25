#
add_library(lapkt_shared "")

#
add_subdirectory(search)
add_subdirectory(compute)
add_subdirectory(model)
add_subdirectory(utility)

#
install(
    TARGETS lapkt_shared 
    DESTINATION lib/lapkt/shared
    COMPONENT Runtime
    )

install(
    TARGETS lapkt_shared 
    DESTINATION lib/lapkt/shared
    COMPONENT Development EXCLUDE_FROM_ALL
    EXPORT LAPKTTargets
    )
