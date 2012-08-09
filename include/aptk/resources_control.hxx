#ifndef __RESOURCES_CONTROL__
#define __RESOURCES_CONTROL__

#include <sys/times.h>
#include <sys/resource.h>
#include <unistd.h>
#include <iostream>
#include <iomanip>


namespace aptk
{
inline double  time_used()
{
	struct rusage  data;

	getrusage( RUSAGE_SELF, &data );

	double system_time = (double)data.ru_stime.tv_sec + ((double)data.ru_stime.tv_usec/1e6);
	double user_time = (double)data.ru_utime.tv_sec + ((double)data.ru_utime.tv_usec/(double)1e6);

	return user_time + system_time;
}

template <typename Stream>
void report_interval( double t0, double t1, Stream& os )
{
	double delta = t1 - t0;
	if (delta < 1e-12)
		os << "<1 msec" << std::endl;
	else
		os << std::setprecision(3) << delta << std::endl;
}

inline double mem_used()
{
	struct rusage data;

	getrusage( RUSAGE_SELF, &data );
	
	return (double)data.ru_maxrss / 1024.;
}

}

#endif // Resources_Control.hxx
