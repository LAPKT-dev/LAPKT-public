#!/usr/bin/python
import 	sys, os, glob
import 	benchmark
from	options import PlannerOptions

def report_and_bail_out( msg ) :
	print >> sys.stderr, msg
	print >> sys.stderr, "Bailing out!"
	sys.exit(1)

def main() :
	
	usr_opts = PlannerOptions( sys.argv[1:] )
	
	command = '%s --domain %s --problem %s --time %s'%( usr_opts.planner, usr_opts.domain, usr_opts.problem, usr_opts.max_time )	
	log_filename = [ os.path.basename(usr_opts.domain).replace('.pddl',''),
			 '_',  os.path.basename( usr_opts.problem).replace('.pddl',''),
			 '_', usr_opts.planner.split('/')[-2], '.log' ]

	print log_filename
	
	log = benchmark.Log( ''.join(log_filename) )
	rv, time = benchmark.run( command, usr_opts.max_time, usr_opts.max_memory, log )

	print >> sys.stdout, "Exit Code:", rv, "Time:", time	


if __name__ == '__main__' :
	main()
