[![BuildTestLAPKT](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/ubuntu_build_test.yml/badge.svg?branch=Devel2.0)](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/ubuntu_build_test.yml)

# LAPKT

LAPKT stands for Lightweight Automated Planning Toolkit

... < A more detailed description > ...

# Jump right in!

- Install using python pip

		python3 -m pip install lapkt

- Explore the options from shell

		lapkt_run.py -h

Note:  The directory where the `pip` command installs the scripts, including `lapkt_run.py`, is generally on the system `PATH`, if not, it needs to be added manually.

Introduction to LAPKT 4 Devs
============================

IMPORTANT! 
----------
Developers who intend to build from source are required to **manually** install the following PRE-BUILD dependencies. These will not be handled by the cmake tool.

**@Ubuntu**

	python3 >= 3.7 <= 3.9
	python3-dev >= 3.7 <= 3.9
	cmake >= 3.16
	gcc>=8
	g++>=8

As of 2022, the easiest way to get latest version is cmake's pypi package

*Note* -You would need the following if you plan to compile parser from FF to process PDDL input. Otherwise, these are not needed.

	* flex
	* bison
	* libfl-dev

AUTHORS
=======

- Miquel Ramirez <miquel.ramirez@gmail.com>
- Nir Lipovetzky <nirlipo@gmail.com>
- Anubhav Singh <anubhav.singh.er@protonmail.com>
- Christian Muise <christian.muise@gmail.com>

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

[Build instructions](developersguide/build.md)

`cmake` is the primary tool used to build the LAPKT's C++(backend) source code. We also use it to generate Python/C++ library package which is ready to go as a `pypi` package. 

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
