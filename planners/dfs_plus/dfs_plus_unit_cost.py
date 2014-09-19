#! /usr/bin/env python
import fd.grounding
import sys
import os
from libdfs_plus import DFS_Plus_Planner 
# MRJ: Profiler imports
#from prof import profiler_start, profiler_stop

def main( domain_file, problem_file, plan_file ) :
	task = DFS_Plus_Planner( )
	
	task.ignore_action_costs = True

	fd.grounding.default( domain_file, problem_file, task )

	#MRJ: Uncomment to check what actions are being loaded
	#for i in range( 0, task.num_actions() ) :
	#	task.print_action( i )

	# MRJ: Setting planner parameters is as easy as setting the values
	# of Python object attributes
	
	# MRJ: Maximum bound on width is set to 1
	task.iw_bound = 2 

	# MRJ: log filename set
	task.log_filename = 'iw.log'

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


def debug() :
	main( "/home/bowman/Sandboxes/Fast-Downward/benchmarks/miconic-simpleadl/domain.pddl",
		"/home/bowman/Sandboxes/Fast-Downward/benchmarks/miconic-simpleadl/s3-0.pddl" )

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2], sys.argv[3] )

