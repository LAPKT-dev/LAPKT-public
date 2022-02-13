#! /usr/bin/env python3
#import fd.grounding
import sys
import os
import time
from libplanner import BRFS_Planner
from libplanner import Tarski_Instantiator
from tarski_parser.tarski_util import ground_generate_task
# MRJ: Profiler imports
#from prof import profiler_start, profiler_stop

def main( domain_file, problem_file, plan_file ) :
    task = BRFS_Planner( )

    ground_generate_task( domain_file, problem_file, task )

    # MRJ: Uncomment to check what actions are being loaded
    #for i in range( 0, task.num_actions() ) :
    #	task.print_action( i )

    # MRJ: Settitng planner parameters is as easy as setting the values
    # of Python object attributes
    
    # MRJ: Maximum bound on width is set to 1
    task.max_novelty = 2

    # MRJ: log filename set
    task.log_filename = 'bfs_f.log'

    # MRJ: plan file
    task.plan_filename = plan_file

    # MRJ: one h.a. per fluent flag
    task.one_ha_per_fluent = False

    # MRJ: Comment line below to deactivate profiling
    #profiler_start( 'bfs_f.prof' )

# MRJ: We call the setup method in SIW_Planner
    task.setup()

    task.print_actions()
    task.print_fluents()
    
    # MRJ: And then we're ready to go
    task.solve()
    #MRJ: Comment lines below to deactivate profile
    #profiler_stop()	

    #rv = os.system( 'google-pprof --pdf libbfsf.so bfs_f.prof > bfs_f.pdf' )
    #if rv != 0 :
    #	print >> sys.stderr, "An error occurred while translating google-perftools profiling information into valgrind format"

def debug() :
    main( 	"/home/xoxo/Documents/Research_Project/anubhav-research/BFWS-Bloomfilter/benchmarks/ipc-2011/blocksworld/domain.pddl", 
		"/home/xoxo/Documents/Research_Project/anubhav-research/BFWS-Bloomfilter/benchmarks/ipc-2011/blocksworld/instances/blocksaips01.pddl",
		"plan.ipc" )

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2], sys.argv[3] )

