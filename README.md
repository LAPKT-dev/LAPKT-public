## 'Devel' BRANCH User Guide - (Brief)

- Working towards windows compatibility - not there yet
- 'install.sh' will install the lapkt libraries in 'release' directory
- Inside 'release', 'lapkt.py' is the primary frontend, use 'lapkt.py -h' for help
- External Dependencies
    * Tarski
    * Python>=3.7
    * cmake
    * gcc
    * flex
    * bison
    * boost-python
    * clingo

LAPKT
======

Lightweight Automated Planning Toolkit

Miquel Ramirez <miquel.ramirez@gmail.com>
Nir Lipovetzky <nirlipo@gmail.com>
Christian Muise <christian.muise@gmail.com>
Anubhav Singh <anubhav.singh.er@protonmail.com>
Last update: January 2021

CONTENTS
========

1. Overview of toolkit components
2. Building LAPKT
3. Search algorithms implemented
4. Examples
5. Contributing
6. Requirements

1 - OVERVIEW
===========

LAPKT separates search engines from the data structures used to represent
planning tasks. This second component receives the name of 'interface' since
it is indeed the interface that provides the search model to be solved.

At the moment of writing this, the following interfaces are offered:

* 'agnostic': this interface does not depend on a particular planning language,
so it is easy to wrap PDDL parsers, separating parsing representation of planning
tasks from a representation optimized for off-line planning. This interface should
also make easy to integrate STRIPS planners into applications by suitably
defining planning tasks programatically.

* 'ff': this interface wraps FF parsing components to obtain 'agnostic' looking
tasks. **NOTE**: this requires to compile the FF planner as a library. See the 
documentation on ```external/libff``` for instructions.

Future interfaces planned are:

* 'hsps': this interface wraps Patrik Haslum's HSP codebase, which supports parsing
of PDDL 3.0 features.

* 'SAS+': this interface is meant to support SAS representations natively. Since
there is no SAS-based planning language, this will probably be useful to integrate
planners into applications that are able to define SAS planning tasks programatically.

Search engine components are meant to be modular, allowing users of LAPKT to
assemble and combine features of different search engines to come up with customized
search strategies, within reason and without sacrificing (much) efficiency. In order to
do so, LAPKT makes heavy use of C++ templates and the Static Strategy design pattern.
At the time of writing this, the modularity and decoupling of components isn't as high 
as I would like, there's still a lot of work to do :)

LAPKT is bound to change rapidly and dramatically over the next months, so please keep
this in mind when using this library.

2 - BUILDING LAPKT
==================
`cmake` is the primary tool used to build the LAPKT's C++(backend) source code. We also use it to generate Python/C++ library package which is ready to go as a `pypi` package. 


2.1. Build instructions
=======================

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

- Include Fastdownward PDDL parser and grounder

        -DCMAKE_FD=ON

- Include FF parser and grounder
        
        -DCMAKE_FF=ON

- Include KCL VAL plan validator
  
        -DCMAKE_VAL=ON

### Extras

- Compile using specific compiler

        -DCMAKE_CXX_COMPILER=g++-8 -DCMAKE_C_COMPILER=gcc-8

3 - EXAMPLES
===========

3.1. AGNOSTIC INTERFACE EXAMPLES
================================

The examples for the 'planner agnostic' interface can be found on

examples/agnostic-examples

and cover the following topics:

	* agnostic-examples/assembling_strips_problems

		Shows how to define a STRIPS planning problem programatically.

	* agnostic-examples/successor_generation
		
		Discusses the different way of generating successors during search.

	* agnostic-examples/bfs
	* agnostic-examples/bfs-double-queue 
	* agnostic-examples/bfs-double-queue-secondary-heuristic

		Shows how can one assemble available components to deliver a
		planner built around a BFS search engine, with multiple queues and
		secondary heuristics, on a parametrized planning task.

	* agnostic-examples/das

		Shows how can one assemble available components to deliver a
		planner built around Deadline Aware Search.


4 - REQUIREMENTS
==============

LAPKT requires the following libraries:
* boost::program_options
* boost::python3

In order to compile LAPKT, we recommend need g++ 4.6 or better. However, any 
compiler able to handle both boost libraries and C++0x standard new features, 
should also be usable (we have been able to compile it under Visual Studio 
2010 and llvm).

