#!/usr/bin/python
import 	sys, os
from tools import benchmark, ipc

def main() :

	if len(sys.argv) < 2 :
		print >> sys.stderr, "No folder was specified!"
		sys.exit(1)		
	
	if not os.path.exists( sys.argv[1] ) :
		print >> sys.stderr, sys.argv[1], "not a valid path!"
		sys.exit(1)

	if not os.path.isdir( sys.argv[1] ) :
		print >> sys.stderr, sys.argv[1], "not a directory!"
		sys.exit(1)

	inputs = ipc.extract_inputs( sys.argv[1] )

	command = './compute.py %(domain_pddl)s %(instance_pddl)s'
	logname = '%(domain_name)s-%(instance_name)s-heuristics.log'

	results = []
	
	for domain_name, instance_name, domain_pddl, instance_pddl in inputs :
		log = benchmark.Log( logname%locals() )
		rv, time = benchmark.run( command%locals(), 1800, 2048, log )
		results.append( [ str(rv), str(time) ] )
		if rv != 0 :
			results[-1] += ipc.parse_report() + ['?']
		else :
			results[-1] += ipc.parse_report( )

	with open( '%s.heuristics.csv'%inputs[0][0], 'w' ) as outstream :
		for res in results :
			res = [ str(field) for field in res ]
			print >> outstream, ",".join(res)


if __name__ == '__main__' :
	main()
