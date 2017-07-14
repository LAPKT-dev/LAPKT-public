#! /usr/bin/env python
import fd.grounding
import sys
import os
import libnum




def main( domain_file, problem_file, plan_file ) :
        task = libnum.STRIPS_Problem()

	fd.grounding.numeric( domain_file, problem_file, task )

	factory = libnum.NUM_BFS_Factory()

        task.solve(factory)



if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2], sys.argv[3] )

