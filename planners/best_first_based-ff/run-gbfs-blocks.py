import os, glob, sys
import benchmark

def main() :
	commands = [ 
			('./bfs --heuristic 1 --domain ~/Sandboxes/Fast-Downward/benchmarks/blocks/domain.pddl --problem %(instance)s', 'hadd-' ),
			('./bfs --heuristic 2 --domain ~/Sandboxes/Fast-Downward/benchmarks/blocks/domain.pddl --problem %(instance)s', 'rp-hadd-' ),
			('./bfs --heuristic 3 --domain ~/Sandboxes/Fast-Downward/benchmarks/blocks/domain.pddl --problem %(instance)s', 'rp-hmax-' ) ]

	files = glob.glob( '/home/bowman/Sandboxes/Fast-Downward/benchmarks/blocks/probBLOCKS-*.pddl' )
	files.sort()
	os.system( 'rm -rf *.res' )

	for command, prefix in commands :
		for instance in files :
			output = prefix + os.path.split(instance)[-1].replace('pddl','res')
			instance_command = command%locals()
	
			log = benchmark.Log( output )
			signal, time = benchmark.run( instance_command, 60, 2048, log )
			print >> sys.stdout, "%s, %s, %s"%(instance, signal, time)

if __name__ == '__main__' :
	main()
