import os

debug = ARGUMENTS.get('debug', 0)
custom_gcc = ARGUMENTS.get('custom_gcc', 0)
custom_c = ARGUMENTS.get( 'GCC', 'gcc4.7' )
custom_cplus = ARGUMENTS.get( 'CCX', 'g++4.7' )

common_env = Environment()

include_paths = ['/usr/local/include','include']
lib_paths = [  ]
libs = ['judy']

common_env.Append( CPPPATH = [ os.path.abspath(p) for p in include_paths ] )

if int(debug) == 1 :
	common_env.Append( CCFLAGS = ['-g','-Wall', '-std=c++0x', '-DDEBUG' , '-fPIC' ] )
else:
	common_env.Append( CCFLAGS = [ '-Wall','-fPIC', '-std=c++11', '-O3', '-DNDEBUG'] )

if int(custom_gcc) == 1 :
	common_env.Replace( CC=custom_c )
	common_env.Replace( CXX=custom_cplus )

common_env.Append( LIBS=libs)
common_env.Append( LIBPATH=[ os.path.abspath(p) for p in lib_paths ] )


Export('common_env')
src_objs = SConscript( 'src/SConscript.aptk', 'common_env' )

common_env.Library( 'aptk', src_objs )


if 'debian' in COMMAND_LINE_TARGETS:
    planner = SConscript("planners/at_bfs_f-ffparser-reorder/SConstruct")
    deb = SConscript("deb/SConscript", 'common_env')
    Depends(deb, planner)

