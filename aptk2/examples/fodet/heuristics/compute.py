#! /usr/bin/env python
import fd.grounding
import sys
from libaptk import Heuristics_Example 

def main( domain_file, problem_file) :
	task = Heuristics_Example( )

	fd.grounding.default( domain_file, problem_file, task )

	task.compute()

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2])

