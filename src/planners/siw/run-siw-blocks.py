import os, glob, sys
import benchmark

def main() :

	commands = [ 
			('./siw.py ~/Sandboxes/Fast-Downward/benchmarks/blocks/domain.pddl %(instance)s plan.ipc', 'siw-' ),
			]



	files = glob.glob( '/home/bowman/Sandboxes/Fast-Downward/benchmarks/blocks/probBLOCKS-*.pddl' )
	files.sort()
	os.system( 'rm -rf *.res' )


	for command, prefix in commands :
		res_file = '%sresult.csv'%prefix
		if os.path.exists( res_file ) :
			os.system( 'rm -rf %s'%res_file )
		results = []
		for instance in files :
			output = prefix + os.path.split(instance)[-1].replace('pddl','res')
			instance_command = command%locals()
	
			log = benchmark.Log( output )
			signal, time = benchmark.run( instance_command, 1800, 2048, log )
			print >> sys.stdout, "%s, %s, %s"%(instance, signal, time)
			expanded = None
			cost = None
			with open( output ) as log_output :
				for line in log_output :
					if 'expanded during' in line :
						exp_tok = line.split(':')[-1]
						expanded = exp_tok.strip()
						continue
					if 'Plan found with cost' in line :
						cost_tok = line.split( ':' )[-1]
						cost = cost_tok.strip()
						continue
			results.append( [ os.path.split(instance)[-1].replace('.pddl','').replace('-',' '), expanded, cost ] )
		results.sort()
		with open( res_file, 'w' ) as output :
			for instance, exp, cost in results :
				print >> output, "%s,%s,%s"%(instance, exp, cost )
					
					

if __name__ == '__main__' :
	main()
