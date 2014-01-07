#! /usr/bin/env python
import fd.grounding
import sys
from libsiw import STRIPS_Problem

def main( domain_file, problem_file) :
	task = STRIPS_Problem( )

	fd.grounding.default( domain_file, problem_file, task )

	for i in range( 0, task.num_actions() ) :
		task.print_action( i )

def debug() :
	main( "/home/bowman/Sandboxes/Fast-Downward/benchmarks/miconic-simpleadl/domain.pddl",
		"/home/bowman/Sandboxes/Fast-Downward/benchmarks/miconic-simpleadl/s3-0.pddl" )

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2])

