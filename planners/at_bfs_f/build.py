#!/usr/bin/python
import os
import sys

LWAPTK_ROOT = '../..'

def main() :
	
	# 1. Copy FD python parsing files
	os.system( 'rm -Rf fd' )
	rv = os.system( 'cp -Ra %(LWAPTK_ROOT)s/external/fd .'%globals() )
	if rv != 0 :
		sys.stderr.write("Could not copy FD parser files!")
		sys.exit(1)

	# 2. Call scons to build
	if len(sys.argv) > 1:
			rv = os.system( "scons %s" % sys.argv[1] )
	else:
		rv = os.system( 'scons -j 8' )

	if rv != 0 :
		sys.stderr.write("Build failed!")
		sys.exit(1)


if __name__ == '__main__' :
	main()
