# We
find_program(DOXYSPHINX_EXEC
             NAMES doxysphinx
             )

find_package_handle_standard_args(Doxysphinx
                                  "doxysphinx-build not found"
                                  DOXYSPHINX_EXEC)