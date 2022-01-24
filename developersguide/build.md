Building LAPKT {#build}
===============

@tableofcontents

`cmake` is the primary tool used to build the LAPKT's C++(backend) source code. We also use it to generate Python/C++ library package which is ready to go as a `pypi` package. 

### A typical set of commands used to build LAPKT

        cmake -Bbuild -Ssrc -DCMAKE_INSTALL_PREFIX=Release -DCMAKE_BUILD_TYPE=Release
        cmake --build build -j4
        cmake  --install build

It involves three steps, configure, build, and install which take the following user defined paramaters. 

- *build_dir* - The directory where the build files are stored
- *src_dir* - The root directory of the source with the top level `CMakeList` config file.
- *install_dir* - The path of the directory where the installation files will be stored.

**Configuration step**
  
        cmake -B<build_dir> -S<src_dir> -DCMAKE_INSTALL_PREFIX=<install_dir> -DCMAKE_BUILD_TYPE={Release|Debug}

**Build step**

        cmake --build <build_dir> -j<cpu_count>
        
**Installation step**

        cmake  --install <build_dir> [--component {Runtime|Development}]


### Cmake options to install features, including ff and fd pddl parsers

- Sync the FF, FD and VAL submodule packages from github.com

        git submodule update --init

- Update the CMAKE configuration step command with the following options

  - for FD PDDL parser and grounder

                -DCMAKE_FD=ON

  - for FF parser and grounder
        
                -DCMAKE_FF=ON

  - for KCL VAL plan validator
  
                -DCMAKE_VAL=ON

### Extras

- Compile using specific compiler

        -DCMAKE_CXX_COMPILER=g++-8 -DCMAKE_C_COMPILER=gcc-8