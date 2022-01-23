#!/usr/bin/env python3
from setuptools import setup, find_packages

with open("README.md", "r") as fh:
    project_description = fh.read()

setup(
    name            =   "LAPKT",
    version         =   "2.0",
    author          =   "Anubhav Singh, Nir Lipovetzky, "
                        +"Miquel Ramirez, Christian Muise",
    author_email    =   "anubhav.singh.eng@gmail.com, nirlipo@gmail.com, "
                        +"miquel.ramirez@gmail.com, christian.muise@gmail.com",
    description     =   "LAPKT planning toolkit",
    long_description=   project_description,
    url             =   "https://github.com/LAPKT-dev/LAPKT-Public",
    packages        =   find_packages('package'),  
    package_dir     =   {'': 'package'},  
    classifiers     =   [
                        "Programming Language :: Python :: 3",
                        "License :: OSI Approved :: GPL3",
                        "Operating System :: OS Independent",
                        ],
    python_requires =   '>=3.7',
    install_requires=   [
                        'tarski',
                        'ruamel.yaml',
                        ],
    extras_require  =   {
                        'test':'psutil',
                        'lab_module':'lab',
                        },
    # scripts         =   ['lapkt/script/lapkt', ],
    include_package_data = True,
    )
