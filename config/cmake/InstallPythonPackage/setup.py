#!/usr/bin/env python3
from setuptools import setup, find_packages

with open("README.md", "r") as fh:
    project_description = fh.read()

setup(
    name            =   "lapkt",
    version         =   "0.0.1",
    author          =   "Anubhav Singh, Nir Lipovetzky, "
                        +"Miquel Ramirez, Christian Muise",
    author_email    =   "anubhav.singh.er@pm.me, nirlipo@gmail.com, "
                        +"miquel.ramirez@gmail.com, christian.muise@gmail.com",
    description     =   "LAPKT planning toolkit",
    long_description=   project_description,
    url             =   "https://github.com/LAPKT-dev/LAPKT-Public",
    packages        =   find_packages('package'),  
    package_dir     =   {'': 'package'},  
    classifiers     =   [
                        "Programming Language :: Python :: 3",
                        "License :: OSI Approved :: BSD License",
                        "Operating System :: Microsoft :: Windows",
                        "Operating System :: POSIX :: Linux",
                        "Operating System :: MacOS"
                        ],
    python_requires =   '>=3.7',
    install_requires=   [
                        # 'tarski',
                        # "tarski[gringo] @ git+https://github.com/aig-upf/tarski.git@devel",
                        "tarski[gringo] @ git+https://github.com/anubhav-cs/tarski.git@devel",
                        'ruamel.yaml',
                        ],
    extras_require  =   {
                        },
    # scripts         =   ['lapkt/script/lapkt_run.py', ],
    include_package_data = True,
    )
