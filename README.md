LAPKT
======

Lightweight Automated Planning Toolkit

Miquel Ramirez <miquel.ramirez@gmail.com>
Nir Lipovetzky <nirlipo@gmail.com>
Christian Muise <christian.muise@gmail.com>
Last update: September 2014

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
documentation on [`external/libff`](./external/libff) for instructions.

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

In order to build LAPKT you need to install scons (a GNU Makefile replacement)
in your system. Refer to http://www.scons.org for directions on how to achieve
this.

In order to compile some of the examples, you will also need a version >= 1.49 of the Boost C++ libraries available on your system.
You can check the version you have either manually by looking at the macro defined in `boost/version.hpp` or, on debian systems, by running
`dpkg -s libboost-dev`.
Be aware that systems such as the Ubuntu 12.04LTS release ship with older versions of Boost.

Finally, LAPKT requires the Judy library (http://judy.sourceforge.net/index.html) to
support the bitmap array class 'Varset Judy'. NOTE: This dependency will be optional
or entirely deprecated in the future.

2.1. Build instructions
=======================

Issue the command

$ scons

at the root of the source directory to obtain the (static) library containing essential data structures and other miscellaneous utilities. If debug symbols are needed, the command

$ scons debug=1

builds the library with optimizations disabled and debug symbols enabled.

If you want to use the planners using the ```ff``` variants of our planners, you'll need to compile the ```FF``` sources included in this repository into a library by running the following commands:

```
cd external/libff
make clean
make depend
make
```

is achieved by invoking scons in a similar manner in the corresponding folder.



3 - EXAMPLES
===========

3.1. AGNOSTIC INTERFACE EXAMPLES
================================

The examples for the 'planner agnostic' interface can be found on

[`examples/agnostic-examples`](./examples/agnostic-examples)

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
	* varjudy

In order to compile LAPKT, we recommend need g++ 4.6 or better. However, any 
compiler able to handle both boost libraries and C++0x standard new features, 
should also be usable (we have been able to compile it under Visual Studio 
2010 and llvm).

