import os, glob

def main() :
	command = './ff -E -g 0 -h 1 -o ~/Sandboxes/Fast-Downward/benchmarks/blocks/domain.pddl -f %(instance)s > %(output)s'
	files = glob.glob( '/home/bowman/Sandboxes/Fast-Downward/benchmarks/blocks/probBLOCKS-*.pddl' )

	for instance in files :
		output = os.path.split(instance)[-1].replace('pddl','res')
		instance_command = command%locals()
		os.system( instance_command )

if __name__ == '__main__' :
	main()
