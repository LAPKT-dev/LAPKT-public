#!/usr/bin/env python3
import sys
from clingo.application import Application, clingo_main

"""
A wrapper to emulate the default clingo app behavior
"""
class WrapperClingo(Application):
    def __init__(self, name):
        self.app_name = name

    def main(self, ctl, files):
        """
        The default implementation from clingo documentation
        Note- main(...) must be implemented
        """
        for f in files:
            ctl.load(f)
        if not files:
            ctl.load("-")
        ctl.ground([("base", [])])
        ctl.solve()

# The gringo binary option -t (plain text) is --text in pypi package
for i in range(len(sys.argv[1:])):
    if sys.argv[i] == '-t':
        sys.argv[i] = '--text'
    
"""
run the clingo application in the "gringo" mode to simulate the gringo binary
"""
clingo_main(WrapperClingo("gringo"), ["--mode", "gringo"]+sys.argv[1:])