# We
find_program(SPHINX_EXEC
             NAMES sphinx-build
             )

find_package_handle_standard_args(Sphinx
                                  "sphinx-build not found"
                                  SPHINX_EXEC)