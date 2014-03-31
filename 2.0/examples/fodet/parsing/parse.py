#! /usr/bin/env python
import fd.grounding
import sys
from libaptk import FOD_Problem

def main( domain_file, problem_file) :
	task = FOD_Problem( )

	fd.grounding.fodet( domain_file, problem_file, task )

	for i in range( 0, task.num_actions() ) :
		task.print_action( i )

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2])

