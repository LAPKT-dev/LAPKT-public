[![BuildTest](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/build_test.yml/badge.svg)](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/build_test.yml)
[![PypiPublish](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/pypi_publish.yml/badge.svg)](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/pypi_publish.yml)
[![CodeQL](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/LAPKT-dev/LAPKT-public/actions/workflows/codeql-analysis.yml)

# LAPKT

LAPKT stands for Lightweight Automated Planning Toolkit

... < A more detailed description > ...


# Pypi package(linux and windows): Jump right in!

- Install package

		python3 -m pip install lapkt

- Checkout lapkt options

		lapkt_cmd.py -h

The python script can be found [here](https://github.com/LAPKT-dev/LAPKT-public/blob/Devel2.0/src/python/_package/script/lapkt_cmd.py)
### *Note* - as of Oct 2022 `pypi` package for `macos` is `work in progress` 

## Important platform requirements:  

**Platform agnostic**

1. The directory where the `pip` command installs the scripts, including `lapkt_cmd.py`, is generally on the system `PATH`, if not, it needs to be added manually.
2. Python version [ `3.7`, `3.7`, `3.8`, `3.9`, `3.10` ] are supported

**@Windows**

1. `clingo/gringo` python package requires `MSVCP140.dll` which comes with visual studio redistributable. [latest vc-redist](https://docs.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist)
2. To be able to run `lapkt_run.py` script directly from command line, change the default handler for ".py" files to `Python'.


# Introduction to LAPKT 4 Devs
============================

IMPORTANT! 
----------
Developers who intend to build from source are required to **manually** install the following PRE-BUILD dependencies. These will not be handled by the cmake tool.

**@Ubuntu**

	python3 >= 3.7 <= 3.10
	python3-dev >= 3.7 <= 3.10
	cmake >= 3.19
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

