/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __RESOURCES_CONTROL__
#define __RESOURCES_CONTROL__

#include <sys/time.h>
#ifdef __linux__
	#include <sys/resource.h>
#endif
#ifdef WIN32
	#include <Windows.h>
	#define RUSAGE_SELF		0
#endif
#include <unistd.h>
#include <iostream>
#include <iomanip>


namespace aptk
{


#ifdef WIN32

#include <sys/time.h>			/* for struct timeval */
#include <limits.h>				/* for CLK_TCK */

#define RUSAGE_SELF		0

struct rusage
{
	struct timeval ru_utime;	/* user time used */
	struct timeval ru_stime;	/* system time used */
};

int
getrusage(int who, struct rusage *rusage)
{
    FILETIME    starttime;
    FILETIME    exittime;
    FILETIME    kerneltime;
    FILETIME    usertime;
    ULARGE_INTEGER li;

    if (who != RUSAGE_SELF)
    {
        /* Only RUSAGE_SELF is supported in this implementation for now */
        errno = EINVAL;
        return -1;
    }

    if (rusage == (struct rusage *) NULL)
    {
        errno = EFAULT;
        return -1;
    }
    memset(rusage, 0, sizeof(struct rusage));
    if (GetProcessTimes(GetCurrentProcess(),
                        &starttime, &exittime, &kerneltime, &usertime) == 0)
    {
        return -1;
    }

    /* Convert FILETIMEs (0.1 us) to struct timeval */
    memcpy(&li, &kerneltime, sizeof(FILETIME));
    li.QuadPart /= 10L;         /* Convert to microseconds */
    rusage->ru_stime.tv_sec = li.QuadPart / 1000000L;
    rusage->ru_stime.tv_usec = li.QuadPart % 1000000L;

    memcpy(&li, &usertime, sizeof(FILETIME));
    li.QuadPart /= 10L;         /* Convert to microseconds */
    rusage->ru_utime.tv_sec = li.QuadPart / 1000000L;
    rusage->ru_utime.tv_usec = li.QuadPart % 1000000L;
}
#endif

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

#ifndef WIN32
inline double mem_used()
{
	struct rusage data;

	getrusage( RUSAGE_SELF, &data );
	
	return (double)data.ru_maxrss / 1024.;
}
#endif

}

#endif // Resources_Control.hxx
