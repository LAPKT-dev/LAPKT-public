install(
    FILES fd_util.py timers.py
    DESTINATION lib/fd
    COMPONENT Runtime
    )
install(
    FILES fd_util.py timers.py
    DESTINATION lib/fd
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .fd_util import default")

install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION lib/fd
    COMPONENT Runtime
    )
install(
    FILES ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION lib/fd
    COMPONENT Development EXCLUDE_FROM_ALL
    )

