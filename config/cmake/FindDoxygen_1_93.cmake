# We
set(DOXYGEN_EXEC ${DOXYGEN_ROOT}/bin/doxygen)

find_package_handle_standard_args(Doxygen_1_93
                                  "doxygen not found"
                                  DOXYGEN_EXEC)