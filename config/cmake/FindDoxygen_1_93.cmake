# We
set(DOXYGEN_EXEC ${PROJECT_BINARY_DIR}/doxygen/bin/doxygen)

find_package_handle_standard_args(Doxygen_1_93
                                  "doxygen not found"
                                  DOXYGEN_EXEC)