#! /usr/bin/env python
import fd.grounding
import sys
import os
import libatbfsf


sys.path.append("/usr/lib")

def main( domain_file, problem_file, plan_file ) :
        task = libatbfsf.STRIPS_Problem()

	fd.grounding.numeric( domain_file, problem_file, task )
        			         #  enable_siw, enable_bfs
	factory = libatbfsf.ATFactory(plan_file, False, True)

        task.solve(factory)



if __name__ == "__main__":
        os.chdir(os.path.abspath(os.path.dirname(__file__)))
	main( sys.argv[1], sys.argv[2], sys.argv[3] )

