find_path(FF_INCLUDE_DIRS NAME libff.h PATHS ${FF_ROOT}/include/
            REQUIRED NO_DEFAULT_PATH)
find_library(FF_LIBRARIES ff  PATHS ${FF_ROOT}/ 
            REQUIRED NO_DEFAULT_PATH)

find_package_handle_standard_args(FF
    DEFAULT_MSG
    FF_LIBRARIES FF_INCLUDE_DIRS
)