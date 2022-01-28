find_path(FF_INCLUDE_DIR NAME libff.h PATHS ${PROJECT_BINARY_DIR}/../build_external/ff/include/
            REQUIRED NO_DEFAULT_PATH)
find_library(FF_LIBRARIES ff  PATHS ${PROJECT_BINARY_DIR}/../build_external/ff/ 
            REQUIRED NO_DEFAULT_PATH)

find_package_handle_standard_args(FF
    DEFAULT_MSG
    FF_LIBRARIES FF_INCLUDE_DIR
)