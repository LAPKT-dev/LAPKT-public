import os
import sys
import glob

def parse_report() :
	if not os.path.exists( 'report.csv' ) :
		raise RuntimeError, "Could not find file 'report.csv'"
	with open( 'report.csv' ) as instream :
		for line in instream :
			line = line.strip()
			tokens = line.split(',')
	return tokens

def extract_inputs( folder ) :
	pddl_files = glob.glob( folder + "/*.pddl" )

	if len(pddl_files) == 0 :
		print >> sys.stderr, "No PDDL files in folder", folder
		sys.exit(1)

	domain_name = os.path.split(folder)[-1]
	
	domain_pddl = os.path.join( folder, 'domain.pddl' )
 
	if domain_pddl not in pddl_files :
		print >> sys.stderr, "No domain file found in folder", folder
		sys.exit(1)


	pddl_files.remove( domain_pddl )
	
	inputs = []

	for pddl_instance in pddl_files :
		inputs.append( ( domain_name, os.path.split(pddl_instance)[-1].replace('.pddl',''), domain_pddl, pddl_instance ) )

	inputs.sort()

	return inputs

if __name__ == '__main__' :
	inputs = []
	if 'faults' in sys.argv[1] :
		inputs =  extract_faults_inputs( sys.argv[1] )
	else :
		inputs = extract_inputs( sys.argv[1] )
	for i in inputs :
		print i
