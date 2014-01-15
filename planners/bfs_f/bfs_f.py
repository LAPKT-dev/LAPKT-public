#! /usr/bin/env python
import fd.grounding
import sys
import os
from libbfsf import BFS_f_Planner 
# MRJ: Profiler imports
#from prof import profiler_start, profiler_stop

def main( domain_file, problem_file, plan_file ) :
	task = BFS_f_Planner( )

	fd.grounding.default( domain_file, problem_file, task )

	# MRJ: Uncomment to check what actions are being loaded
	#for i in range( 0, task.num_actions() ) :
	#	task.print_action( i )

	# MRJ: Setting planner parameters is as easy as setting the values
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

	# MRJ: And then we're ready to go
	task.solve()

	#MRJ: Comment lines below to deactivate profile
	#profiler_stop()	

	#rv = os.system( 'google-pprof --pdf libbfsf.so bfs_f.prof > bfs_f.pdf' )
	#if rv != 0 :
	#	print >> sys.stderr, "An error occurred while translating google-perftools profiling information into valgrind format"

def debug() :
	main( 	"/home/nirlipo/Sandboxes/ipc7-data/domains/seq-sat/woodworking/domain/domain.pddl", 
		"/home/nirlipo/Sandboxes/ipc7-data/domains/seq-sat/woodworking/problems/p06.pddl",
		"plan.ipc" )

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2], sys.argv[3] )

