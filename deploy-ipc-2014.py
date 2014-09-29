import sys
import os

def create_planner_dir( base_dir, planner_id ) : 
	print >> sys.stdout, "Deploying planner:", planner_id
	planner_folder = os.path.join( base_dir, planner_id )

	if os.path.exists( planner_folder ) :
		print >> sys.stdout, "Folder", planner_folder, "already exists, deleting..."
		rv = os.system( 'rm -Rf %s'%planner_folder )
		if rv != 0 :
			print >> sys.stderr, "\tFolder", planner_folder, "could not be deleted, aborting!"
			sys.exit(1)

	print >> sys.stdout, "Creating folder", planner_folder
	rv = os.system( 'mkdir -p %s'%planner_folder )
	if rv != 0 :
		print >> sys.stderr, "\tCould not create folder", planner_folder, "aborting..."
		sys.exit(1)

	return os.path.join( base_dir, planner_id )

def copy_files( planner_dir, planner_name ) :
	
	dirs = [ 'include', 'interfaces', 'external/libff', 'src', 'planners/%s'%planner_name ]

	cmd_template = 'cp -Ra %s %s'
	print >> sys.stdout, "Creating folder %s/planners"%planner_dir
	build_base_dir = os.path.join( planner_dir, 'planners' )
	external_base_dir = os.path.join( planner_dir, 'external' )
	rv = os.system( 'mkdir -p %s'%build_base_dir )
	rv = os.system( 'mkdir -p %s'%external_base_dir )

	if rv != 0 :
		print >> sys.stderr, "Could not create %s, aborting..."%build_base_dir
		sys.exit(1)

	for directory in dirs :
	
		if 'planners' in directory :
			dest_dir = build_base_dir
		elif 'external' in directory :
			dest_dir = external_base_dir	
		else :
			dest_dir = planner_dir

		print >> sys.stdout, "Copying %s to %s"%(directory, dest_dir)
		rv = os.system( cmd_template%(directory, dest_dir) )

		if rv != 0 :
			print >> sys.stderr, "Could not copy", directory, ", aborting..."
			sys.exit(1)

def create_build_script( home_dir, planner, files ) :

	script_filename = os.path.join( home_dir, 'build' )
	
	with open( script_filename, 'w' ) as out :
		
		print >> out, "#!/bin/bash"
		print >> out, "source /opt/centos/devtoolset-1.1/x86_64/enable"
		build_dir = os.path.join( 'planners', planner )
		print >> out, "cd external/libff"
		print >> out, "make clean"
		print >> out, "make depend"
		print >> out, "make"
		print >> out, "cd ../.."
		print >> out, "cd %s"%build_dir
		print >> out, "scons -c"
		print >> out, "scons ipc14_build=1"
		print >> out, "cd ../.."
		for filename in files :
			print >> out, 'echo "Copying %s..."'%filename
			print >> out, "cp %s ."%(os.path.join( build_dir, filename ) )

	os.system( 'chmod u+x %s'%script_filename )

def create_clean_script( home_dir, planner, files ) :
	script_filename = os.path.join( home_dir, 'clean' )
	
	with open( script_filename, 'w' ) as out :
		
		print >> out, "#!/bin/bash"
		print >> out, "cd external/libff"
		print >> out, "make clean"
		print >> out, "cd ../.."
		build_dir = os.path.join( 'planners', planner )
		print >> out, "cd %s"%build_dir
		print >> out, "scons -c"
		print >> out, "cd ../.."
	os.system( 'chmod u+x %s'%script_filename )

def create_run_script( home_dir, executable ) :

	script_filename = os.path.join( home_dir, 'plan' )

	with open( script_filename, 'w' ) as out :
		print >> out, "#!/bin/bash"
		print >> out, "source /opt/centos/devtoolset-1.1/x86_64/enable"
		print >> out, "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH$:/opt/boost/lib"
		print >> out, "./%s --domain $1 --problem $2 --output $3"%executable
	
	os.system( 'chmod u+x %s'%script_filename )

def deploy_seq_agl_siw( base_dir ) :

	planner_id = 'seq-agl-siw'
	
	planner_dir = create_planner_dir( base_dir, planner_id )
	
	copy_files( planner_dir, 'siw-ffparser' )	

	planner_files = [ 'siw' ]

	create_build_script( planner_dir, 'siw-ffparser', planner_files )
	create_clean_script( planner_dir, 'siw-ffparser', planner_files )
	
	create_run_script( planner_dir, 'siw' )

def deploy_seq_agl_bfs_f( base_dir ) :
	planner_id = 'seq-agl-bfs-f'
	
	planner_dir = create_planner_dir( base_dir, planner_id )
	
	copy_files( planner_dir, 'bfs_f-ffparser' )	

	planner_files = [ 'bfs_f' ]

	create_build_script( planner_dir, 'bfs_f-ffparser', planner_files )
	create_clean_script( planner_dir, 'bfs_f-ffparser', planner_files )
	
	create_run_script( planner_dir, 'bfs_f' )

def deploy_sat_bfs_f( base_dir ) :
	planner_id = 'seq-sat-bfs-f'
	
	planner_dir = create_planner_dir( base_dir, planner_id )
	
	copy_files( planner_dir, 'at_bfs_f-ffparser' )	

	planner_files = [ 'at_bfs_f' ]

	create_build_script( planner_dir, 'at_bfs_f-ffparser', planner_files )
	create_clean_script( planner_dir, 'at_bfs_f-ffparser', planner_files )
	
	create_run_script( planner_dir, 'at_bfs_f' )


def main() :
	base_dir = '.'
	if len(sys.argv) == 2 :
		base_dir = sys.argv[1]
		if not os.path.exists( base_dir ) :
			print >> sys.stderr, "Base folder", base_dir, "does not exist!"
			sys.exit(1)
	
	deploy_seq_agl_siw( base_dir )
	deploy_seq_agl_bfs_f( base_dir )
	deploy_sat_bfs_f( base_dir )

if __name__ == "__main__" :
	main()
