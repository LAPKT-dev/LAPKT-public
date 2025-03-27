"""
MIT License

Copyright (c) 2022 Anubhav Singh(anubhav.singh.er@pm.me)
"""

import builtins
from argparse import ArgumentParser
from re import match

# lapkt Imports
from .load_planner import load_planner_config

# CWD = dirname(realpath(__file__))
"""
NOTE
Verify input against BUILTIN_TYPES to prevent
security issue with eval(...)
"""
BUILTIN_TYPES = [d for d in dir(builtins) if isinstance(getattr(builtins, d), type)]
# -----------------------------------------------------------------------------#


def store_value(args, config) -> None:
    """A utility to generate config from cmd args

    :param args: attributes returned by ArgumentParser
    :type args: namespace
    :param config: planner run configuration
    :type config: dict
    """
    for k in dir(args):
        if match(r"^[^_]\w*", k):
            config.setdefault(k, dict())["value"] = getattr(args, k)


def process_arguments(debug: bool = False) -> dict:
    """parses command line arguments and generates a config to run

    :param config: additional options for debug run
    :type config: boolean
    :return: run configuration
    :rtype: dict
    """

    parser_main = ArgumentParser(description="Process planner input")
    parser_sub = parser_main.add_subparsers(help="sub-command help")

    # Load the parsing args from the config file on PLANNER_CONFIG_PATH
    list_planner_config = load_planner_config()
    for k, options in list_planner_config.items():  # k is the planner name
        parser = parser_sub.add_parser(
            k, help="Use " + k + " -h" + " to view planner options"
        )
        # Add common config args
        parser.add_argument(
            "-d",
            "--domain",
            action="store",
            nargs="?",
            required=True,
            help="path to the domain pddl file",
        )
        parser.add_argument(
            "-p",
            "--problem",
            action="store",
            nargs="?",
            required=True,
            help="path to the problem pddl file",
        )
        parser.add_argument(
            "--no_match_tree",
            action="store_true",
            help="If specified, match tree is not generated",
        )
        parser.add_argument(
            "--validate",
            action="store_true",
            help="If specified, plan is checked for correctioness" + "using validate",
        )
        parser.add_argument(
            "--anytime_fd",
            action="store",
            nargs="?",
            required=False,
            help="Anytime variant using Fast Downward (FD) as the complete solver. Specify the path to FD.",
        )
        parser.add_argument(
            "--grounder",
            action="store",
            nargs="?",
            default="Tarski",
            help="Choice of parser - Tarski<Default>,FD or FF",
        )
        if debug:
            parser.add_argument(
                "--wait_debug",
                action="store_true",
                help="For"
                + " debugging, program waits for key press while user attaches gdb",
            )
        parser.set_defaults(planner=k)
        # Planner specific config
        for opt, parser_args in options.items():
            if isinstance(parser_args, dict) and parser_args.get("cmd_arg", None):
                has_type = parser_args["cmd_arg"].get("type", None)
                if has_type and has_type in BUILTIN_TYPES:
                    parser_args["cmd_arg"]["type"] = eval(has_type)
                if parser_args["cmd_arg"].get("default", None):
                    parser_args["cmd_arg"]["help"] = (
                        parser_args["cmd_arg"]["help"]
                        + "; **Default = "
                        + str(parser_args["cmd_arg"]["default"])
                    )
                parser.add_argument("--" + opt, **parser_args["cmd_arg"])
                del parser_args["cmd_arg"]  # Will be in the Arg-parser

    args = parser_main.parse_args()

    try:
        config = list_planner_config[args.planner]
    except Exception:
        print("Use option '-h' for help")
        exit(0)

    if debug and args.wait_debug:
        config["wait"] = True

    store_value(args, config)

    return config
