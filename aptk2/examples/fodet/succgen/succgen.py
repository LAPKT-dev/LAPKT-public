#! /usr/bin/env python
import fd.grounding
import sys
import os
from libaptk import SuccGen_Example 

def debug() : # meant to be imported from within GDB
	domain_path = "/home/bowman/Sandboxes/Fast-Downward/benchmarks/blocks/domain.pddl"
	problem_path = "/home/bowman/Sandboxes/Fast-Downward/benchmarks/blocks/probBLOCKS-10-1.pddl"
	main( os.path.abspath(domain_path), problem_path )

def main( domain_file, problem_file) :
	task = SuccGen_Example( )

	fd.grounding.default( domain_file, problem_file, task )

	# setup internal data structures (sort operators, compute action lookup tables, etc.)
	task.setup()

	# do your thing
	task.execute()

if __name__ == "__main__":
	main( sys.argv[1], sys.argv[2])

