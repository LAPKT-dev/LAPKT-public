#!/usr/bin/python
import os
import sys

def main() :
	
    # 1. Copy FD python parsing files
    rv = os.system( 'cp -Ra ../python3/tools/tarski_parser .'%globals() )
    if rv != 0 :
        print( sys.stderr, "Could not copy Tarski parser util!")
        sys.exit(1)

    # 2. Call scons to build
    if len(sys.argv)>1 :
        rv = os.system( "scons %s" % sys.argv[1] )
    else:
            rv = os.system( 'scons -j 8' )
    if rv != 0 :
        #print( sys.stderr, "Build failed!")
        sys.exit(1)

    # 3. Build profiler
    rv = os.system( 'make -f prof.makefile' )
    if rv != 0 :
        #print( sys.stderr, "Could not build profiling tools")
        sys.exit(1)	

if __name__ == '__main__' :
	main()
