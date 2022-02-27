#!/usr/bin/env python3

"""
MIT License

Copyright (c) 2022 Anubhav Singh(anubhav.singh.er@pm.me)
"""

from lapkt.parseargs import process_arguments
from lapkt.load_planner import Planner

if __name__ == "__main__":
    config = process_arguments()
    planner = Planner(config)
    run_status = planner.solve()
    print("PLANNER_EXIT_CODE:", run_status)

    if config.get('validate', None) and config['validate']['value']:
        planner.validate()
