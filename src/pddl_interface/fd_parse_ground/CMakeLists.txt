file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/__init__.py "from .fd_util import default")
install(
    FILES fd_util.py timers.py ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION lib/lapkt/fd
    COMPONENT Runtime
    )
install(
    FILES fd_util.py timers.py ${CMAKE_CURRENT_BINARY_DIR}/__init__.py
    DESTINATION lib/lapkt/fd
    COMPONENT Development EXCLUDE_FROM_ALL
    )
#

