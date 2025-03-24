# We
set(DOXYGEN_EXEC ${DOXYGEN_ROOT}/bin/doxygen)

find_package_handle_standard_args(Doxygen
                                  "Doxygen not found"
                                  DOXYGEN_EXEC)