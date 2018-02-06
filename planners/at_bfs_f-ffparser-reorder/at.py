#! /usr/bin/env python
import fd.grounding
import sys
import os
import libatbfsf
import time

sys.path.append("/usr/lib")

def main( domain_file, problem_file, plan_file ) :
        start = time.time()
        task = libatbfsf.STRIPS_Problem()
        fd.grounding.numeric( domain_file, problem_file, task )
        factory = libatbfsf.ATFactory(plan_file, False, False, 1.0)
        before_solve = time.time()
        task.solve(factory)
        after_solve = time.time()
        print("Time preprocessing time: {0}".format(before_solve - start))
        print("Time solving: {0}".format(after_solve - before_solve))



if __name__ == "__main__":
        os.chdir(os.path.abspath(os.path.dirname(sys.argv[3])))
        main( sys.argv[1], sys.argv[2], sys.argv[3] )

