#! /usr/bin/env python
import fd.grounding
import sys
import os
from libfdplanner import Planner 
# MRJ: Profiler imports
#from prof import profiler_start, profiler_stop

def main( domain_file, problem_file, plan_file ) :
	task = Planner( )
	
	task.ignore_action_costs = True

	fd.grounding.default( domain_file, problem_file, task )

	#MRJ: Uncomment to check what actions are being loaded
	#for i in range( 0, task.num_actions() ) :
	#	task.print_action( i )

	# MRJ: Setting planner parameters is as easy as setting the values
	# of Python object attributes
	
 	# MRJ: log filename set
	task.log_filename = 'iw.log'

	# MRJ: plan file
	task.plan_filename = plan_file

	# MRJ: Comment line below to deactivate profiling
	#profiler_start( 'planner.prof' )

	# MRJ: We call the setup method in SIW_Planner
	task.setup()

	# MRJ: And then we're ready to go
	task.solve()

	#MRJ: Comment lines below to deactivate profile
	#profiler_stop()	

	#rv = os.system( 'google-pprof --pdf libsiw.so siw.prof > siw.pdf' )
	#if rv != 0 :
	#	print >> sys.stderr, "An error occurred while translating google-perftools profiling information into valgrind format"


def debug() :
	main( "domain.pddl",
		"problem.pddl" )

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2], sys.argv[3] )

