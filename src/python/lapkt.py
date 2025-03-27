#!/usr/bin/env python3
"""
MIT License

Copyright (c) 2022 Anubhav Singh(anubhav.singh.er@pm.me)
"""

from os import getpid
from importlib.util import find_spec as find_module

# lapkt imports
from lapkt.parseargs import process_arguments
from lapkt.load_planner import Planner


def wait_debug(s: str):
    """wait for user input

    :param s: message
    :type s: string
    """

    # Attach gdb to this PID
    print("PID =", getpid(), ' ; ', s)
    input()


if __name__ == "__main__":

    config = process_arguments(True)

    if(config.get('wait', False)):
        # if(exists_python_module('lapkt.tarski')):
        #     from _package.lapkt.fd import *
        # if(exists_python_module('lapkt.tarski')):
        #     from _package.lapkt.tarski import *
        # if(exists_python_module('lapkt.ff')):
        #     from _package.lapkt.ff import *
        wait_debug('Press a key to begin run...')

    planner = Planner(config)
    run_status = planner.solve()
    print("PLANNER_EXIT_CODE:", run_status)

    if config.get('validate', None) and config['validate']['value']:
        planner.validate()
