#! /usr/bin/python3
import argparse

from libplanner import IW_Planner
from libplanner import Tarski_Instantiator
from tarski_parser.tarski_util import ground_generate_task

DEFAULT_IW_BOUND    =   2
DEFAULT_LOG_FILE    =   "iw.log"
DEFAULT_PLAN_FILE   =   "plan.ipc"

#---- MAIN -------------------------------------------------------------------#
def main( domain_file, problem_file, plan_file, log_file, bound, atomic) :
    task    =   IW_Planner()
    ground_generate_task( domain_file, problem_file, task)

    task.iw_bound   =   bound

    task.atomic     =   atomic

    task.log_filename   =   log_file

    task.plan_filename  =   plan_file

    task.setup()
    task.solve()

    return 0
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx#

if __name__ ==  "__main__" :
    parser  =   argparse.ArgumentParser( description= "Process planner input")
    parser.add_argument( '-b', '--bound', action='store', nargs='?', 
            default=DEFAULT_IW_BOUND, type=int, 
            help='bound for the max. IW Novelty value')
    parser.add_argument( '-d', '--domain', action='store', nargs='?',
            required=True, help='path to the domain pddl file')
    parser.add_argument( '-p', '--problem', action='store', nargs='?',
            required=True, help='path to the problem pddl file')
    parser.add_argument( '-l', '--log', action='store', nargs='?',
            default=DEFAULT_LOG_FILE, help='name of the log file')
    parser.add_argument( '-o', '--outplan', action='store', nargs='?',
            default=DEFAULT_PLAN_FILE, help='name of the plan file')
    parser.add_argument( '-a', '--atomic', action='store_true', 
            help='Split problem into set of problems with atomic goals')

    args    =   parser.parse_args()

    main( args.domain, args.problem, args.outplan, args.log, args.bound, args.atomic)
