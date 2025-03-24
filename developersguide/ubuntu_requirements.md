# Build prerequisites for a standard Ubuntu 18.04/ 20.04/ 22.04 machine

  - python3 >=3.7
  - python3-dev
  - python3-pip
  - graphviz 
  - cmake  >=3.19
  - make
  - pybind11
  - git
  - tarski-lapkt[gringo, arithmetic]
  - ruamel.yaml

 **NOTE :** As of 2022, the easiest way to get the latest cmake version is to install the cmake pypi package.

There are additional prerequisites if you plan to compile parser from FF to process PDDL input
  - flex
  - bison
  - libfl-dev


## (todo devs)
Need to install lapkt on a bare bone ubuntu and list down all the required packages that are not installed

### `apt` installable requirements
(todo user) these packages should be installed manually before running `cmake`

  - python3 >=3.7
  - python3-dev
  - python3-pip
  - graphviz 
  - cmake >=3.19
  - make
  - git

### `pip` installable requirements

(user) the `cmake` script should take care of all the pip requirements automatically. These packages are listed for reference.

  - pybind11
  - tarski-lapkt[gringo, arithmetic]
  - ruamel.yaml