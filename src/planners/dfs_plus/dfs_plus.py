#! /usr/bin/env python
import sys
import os
import argparse
from libplanner import DFS_Plus_Planner 
from libplanner import Tarski_Instantiator
from tarski_parser.tarski_util import ground_generate_task

DEFAULT_IW_BOUND    =   100
DEFAULT_LOG_FILE    =   "iw.log"
DEFAULT_PLAN_FILE   =   "plan.ipc"

# MRJ: Profiler imports
#from prof import profiler_start, profiler_stop

#---- MAIN -------------------------------------------------------------------#
def main( domain_file, problem_file, plan_file, log_file, bound) :
    task = DFS_Plus_Planner( )

    ground_generate_task( domain_file, problem_file, task )

    #MRJ: Uncomment to check what actions are being loaded
    #for i in range( 0, task.num_actions() ) :
    #	task.print_action( i )

	# MRJ: Setting planner parameters is as easy as setting the values
	# of Python object attributes
	
	# MRJ: Maximum bound on width is set to 2
    task.iw_bound = bound

	# MRJ: log filename set
    task.log_filename = log_file

	# MRJ: plan file
    task.plan_filename = plan_file

	# MRJ: Comment line below to deactivate profiling
	#profiler_start( 'dfs_plus.prof' )

	# MRJ: We call the setup method in DFS_Plus_Planner
    task.setup()

	# MRJ: And then we're ready to go
    task.solve()

	#MRJ: Comment lines below to deactivate profile
	#profiler_stop()	

	#rv = os.system( 'google-pprof --pdf libdfs_plus.so dfs_plus.prof > dfs_plus.pdf' )
	#if rv != 0 :
	#	print >> sys.stderr, "An error occurred while translating google-perftools profiling information into valgrind format"



#---- DEBUG ------------------------------------------------------------------#
def debug() :
    main( "/home/xoxo/Documents/Research_Project/anubhav-research/BFWS-Bloomfilter/benchmarks/ipc-2018/sat/caldera/domain.pddl"
            ,"/home/xoxo/Documents/Research_Project/anubhav-research/BFWS-Bloomfilter/benchmarks/ipc-2018/sat/caldera/p02.pddl",
            "plan.ipc")
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

    args    =   parser.parse_args()

    main( args.domain, args.problem, args.outplan, args.log, args.bound)

