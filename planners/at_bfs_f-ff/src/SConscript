import os
Import('common_env')

ipc14_build = ARGUMENTS.get( 'ipc14_build', 0 )

include_paths = ['.']
common_env.Append( CPPPATH = [ os.path.abspath(p) for p in include_paths ] )

libs = [ 'boost_program_options' ]
lib_paths = []

if int(ipc14_build) == 1 :
	include_paths.append( '/opt/boost/include' )	
	lib_paths.append( '/opt/boost/lib' )	

common_env.Append( LIBS=libs)
common_env.Append( LIBPATH=[ os.path.abspath(p) for p in lib_paths ] )

cxx_sources = Glob('*.cxx')
c_sources = Glob('*.c')

objects = [ common_env.Object(s) for s in cxx_sources ] + [ common_env.Object(s) for s in c_sources ]

Return('objects')
