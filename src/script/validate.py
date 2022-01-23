#!/usr/bin/env python3
from lapkt.script.run_planner import validate_plan
from argparse import ArgumentParser

if __name__ == "__main__" :
    parser  =   ArgumentParser(description= "Run validate")
    parser.add_argument( '-d', '--domain', action='store', nargs='?',
            required=True, help='path to the domain pddl file')
    parser.add_argument( '-p', '--problem', action='store', nargs='?',
            required=True, help='path to the problem pddl file')
    parser.add_argument( '-c', '--plan', action='store', nargs='?',
            required=True, help='path to the plan file with the plan')
    args    =   parser.parse_args()

    validate_plan(args.domain, args.problem, args.plan)
