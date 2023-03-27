Building LAPKT {#build}
===============

@tableofcontents

`cmake` is the primary tool used to build the lapkt's C++(backend) source code. We also use it to generate Python/C++ library package which is ready to go as a `pypi` package. 

# IMPORTANT

0. If you have a pre-existing `build` directory delete it if you are having compilation issues.

1. Install the manual build dependencies listed in [`https://github.com/LAPKT-dev/LAPKT-public/blob/Devel2.0/config/pre_build/general_pip_requirements.txt`](config/pre_build/general_pip_requirements.txt) prior to the cmake build. The file is located in the repo's root directory.

2. Build LAPKT with the following command

        cmake -Bbuild -DCMAKE_INSTALL_PREFIX=Release -DCMAKE_BUILD_TYPE=Release -DUSE_SUPERBUILD=ON
        cmake --build build -j4 [--target clean](optional)
3. Install the built sourcecode if you want to have system wide access        
       
        cmake  --install build

<!-- 4. Test to check everything went correctly

        cd Release && ctest && ctest .. -->

The three steps above involve, configure, build, and install which take the following user defined paramaters. 

- *build_dir* - The directory where the build files are stored
- *src_dir* - The root directory of the source with the top level `CMakeList` config file. 
- *install_dir* - The path of the directory where the installation files will be stored.

**Configuration step**
  
        cmake -B<build_dir> -S<src_dir> -DCMAKE_INSTALL_PREFIX=<install_dir> -DCMAKE_BUILD_TYPE={Release|Debug}

**Build step**

        cmake --build <build_dir> -j<cpu_count>
        
**Installation step**

        cmake  --install <build_dir> [--component {Runtime|Development}]


### Cmake options 

- **Cmake properties**
  - Specify compiler version

                -DCMAKE_CXX_COMPILER=g++-8 -DCMAKE_C_COMPILER=gcc-8

- **Project specific** Cmake configuration

  - Add external package - FD PDDL parser and grounder

                -DCMAKE_FD=ON

  - Add external package - FF parser and grounder
        
                -DCMAKE_FF=ON

  - Build doxygen docs

                -DCMAKE_DOXYGEN_DOCS=ON

  - Select doxygen themes

                -DCMAKE_DOXYGEN_FLAT_THEME=ON
                -DCMAKE_DOXYGEN_AWESOME_THEME=ON
                
  - Prepare sphinx rtf theme docs via Doxygen->exhale(Sphinx extension) pipline
                
                -DCMAKE_SPHINX_DOCS=ON

  - Boost build parameters
    - Path to where the pre-build dependencies compiled by the superbuild cmake script are installed

                -DDEPS_INSTALL_PREFIX="<Path>"

    - Path to the directory where Boost2 lib is installed(only required if SUPERBUILD is not used)

                -DBOOST_ROOT="<Path>"

    - Path to the directory where Catch2 lib is installed(only required if SUPERBUILD is not used)

                -DCATCH2_ROOT="<Path>"

### Superbuild
2. Certain pre-build dependencies are handled by lapkt's SuperBuild cmake script. This can be disabled using the cmake argument `-DUSE_SUPERBUILD=OFF`.
