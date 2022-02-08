# PROF.PYX

cdef extern from "google/profiler.h" :
	void	ProfilerStart( char* fname )
	void	ProfilerStop()

def profiler_start( fname ) :
	ProfilerStart(<char *>fname)

def profiler_stop() :
	ProfilerStop()
