#! /usr/bin/python3
from lapkt.load_planner import Planner
from lapkt.load_planner import load_planner_config
from pathlib import Path
from os.path import join


parent_folder = Path(__file__).parent.absolute()


def test_all_planners():
    print("here")
    config = load_planner_config()
    for k, options in config.items():

        print("# Testing {}\n".format(k))
        if isinstance(options, dict):
            for k1, v in options.items():
                if v.get("cmd_arg", None):
                    v["value"] = v["cmd_arg"]["default"]
        options["grounder"] = {}
        options["grounder"]["value"] = "Tarski"
        options["domain"] = {}
        options["domain"]["value"] = join(parent_folder, "domain.pddl")
        options["problem"] = {}
        options["problem"]["value"] = join(parent_folder, "problem.pddl")
        options["planner"] = {}
        options["planner"]["value"] = k
        Planner(options)
