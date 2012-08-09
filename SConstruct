import os

debug = ARGUMENTS.get('debug', 0)

common_env = Environment()

include_paths = ['include']
lib_paths = [  ]
libs = ['judy']

common_env.Append( CPPPATH = [ os.path.abspath(p) for p in include_paths ] )

if int(debug) == 1 :
	common_env.Append( CCFLAGS = ['-g','-Wall', '-std=c++0x', '-DDEBUG' ] )
else:
	common_env.Append( CCFLAGS = ['-O3','-Wall', '-std=c++0x', '-DNDEBUG'] )


common_env.Append( LIBS=libs)
common_env.Append( LIBPATH=[ os.path.abspath(p) for p in lib_paths ] )


Export('common_env')
src_objs = SConscript( 'src/SConscript', 'common_env' )
if src_objs is None : print "src_objs is None"

common_env.Library( 'aptk', src_objs )
