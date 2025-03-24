# Building LAPKT

We use `cmake` to manage the build process. The build handles the compilation of core LAPKT libraries which are written in C++. It also compiles python bindings that allow us to expose the core C++ classes and methods to the python frontend. 

The `cmake` build also restructures the compiled binary the a package that can be shipped as a `pip` installable.

The cmake script has been tested on standard [os images](https://github.com/actions/runner-images) available on Github Actions. The [build-test](../.github/workflows/build_test.yml) workflow configuration lists all the build and test commands.

(user) can also use the [Apptainer configuration](../Apptainer.ApxNoveltyTarski) to build a self contained package

## Build prerequisites

The build requires development tools specific to the operating system that you are using.

| Operating System | Tested Versions | 
|----|-----|
| [Ubuntu](ubuntu_requirements.md)|18.04/ 20.04/ 22.04|
| [Windows](windows_requirements.md)| 2019 |

## Build steps

0. If you have a pre-existing `build` directory, then delete it if you are having compilation issues.


1. To build LAPKT, run the following command from the root of the lapkt source directory

        cmake -Bbuilds/build -DCMAKE_INSTALL_PREFIX=Release -DCMAKE_BUILD_TYPE=Release -DUSE_SUPERBUILD=ON

        cmake --build builds/build -j4 [--target clean](optional)

   This would create a package, `lapkt_package`, at the root of the source directory. Users can directly run/debug lapkt with the following command

        cd <source_dir>

        python3 lapkt_package/lapkt.py -h

2. Install the built source code if you want to have system wide access (optional)

        cmake  --install builds/build

   Same can achieved with the pip install as well
        
        python3 -m pip install --user  Release/_package/

   In Ubuntu, this installs the python script `lapkt_cmd.py` in local binary directory, typically at `$HOME/.local/bin/lapkt_cmd.py`, and `lapkt` library files into the python shared module directory, `$HOME/.local/lib/python<version>/site-packages/lapkt/`. 

<!-- 4. Test to check everything went correctly

        cd Release && ctest && ctest .. -->


## Custom build steps (advanced usage)

The build process involves three step, configure, build, and install. Each step can take additional parameter. We list some of the useful configuration parameters below.

**Configuration step**
  
        cmake -B<build_dir> -S<src_dir> -DCMAKE_INSTALL_PREFIX=<install_dir> -DCMAKE_BUILD_TYPE={Release|Debug}

| Parameter | Usage |
|----|----|
| *build_dir* | build output path |
| *src_dir* | source directory |
| `CMAKE_INSTALL_PREFIX` | installation path |
| `CMAKE_CXX_COMPILER` | specify a g++ version, tested with `g++-8`, `g++-9`, `g++-10`, `g++-11` `g++-12` |
| `CMAKE_C_COMPILER` | specify a gcc version, tested with `gcc-8`, `gcc-9`, `gcc-10`, `gcc-11` `gcc-12` |
| `CMAKE_INSTALL_PREFIX` | installation path |
| `CMAKE_BUILD_TYPE` | Release for production and Debug for debugging the source|
| `USE_SUPERBUILD` | builds all dependencies from source (makes the build independent of any pre-existing installation of dependencies), it is set to ON by default |
| `CMAKE_FD` | add fast-downward parser and grounder to the package, default ON |
| `CMAKE_TARSKI` | add tarski parser and grounder to the package, default ON |
| `GEN_DOXYGEN_DOCS` | automatically generate doxygen html docs from source and md files, default OFF |
| `GEN_DOXYSPHINX_DOCS` | automatically generate sphinx rtd theme html docs, default OFF |
| `CMAKE_STATIC_BOOST` | Static link boost, default ON |
| `CMAKE_TESTING_ENABLED` | build ctest executables, default OFF |
| `CMAKE_FF`, `CMAKE_LEGACY_PLANNER`| build executables for planners that use the FF parser and grounder, only for testing, default OFF |
| `CMAKE_FF`, `CMAKE_LEGACY_PLANNER`| build executables for planners that use the FF parser and grounder, only for testing, default OFF |
| `BOOST_ROOT`| Path to Boost installtion (required if `USE_SUPERBUILD=OFF` is not used), default "" |
| `CATCH2_ROOT`| Path to Catch2 installtion (required if `USE_SUPERBUILD=OFF` is not used), default "" |

**Build step**

        cmake --build <build_dir> -j<cpu_count>

| Parameter | Usage |
|----|----|
| *build_dir* | build path, same as configuration step |
| *cpu_count* | maximum CPUs used in parallel |
        
**Installation step**

        cmake  --install <build_dir>

| Parameter | Usage |
|----|----|
| *build_dir* | build path, same as configuration step |