
/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files
(the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject
 to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include <sys/time.h>
#ifdef __linux__
#include <sys/resource.h>
#endif
#ifdef WIN32
#include <Windows.h>
#define RUSAGE_SELF 0
#endif
#include <unistd.h>
#include <iostream>
#include <iomanip>
#include <resources_control.hxx>

#ifdef WIN32

#include <sys/time.h> /* for struct timeval */
#include <limits.h>   /* for CLK_TCK */

#define RUSAGE_SELF 0

struct rusage
{
    struct timeval ru_utime; /* user time used */
    struct timeval ru_stime; /* system time used */
};

int aptk::getrusage(int who, struct rusage *rusage)
{
    FILETIME starttime;
    FILETIME exittime;
    FILETIME kerneltime;
    FILETIME usertime;
    ULARGE_INTEGER li;

    if (who != RUSAGE_SELF)
    {
        /* Only RUSAGE_SELF is supported in this implementation for now */
        errno = EINVAL;
        return -1;
    }

    if (rusage == (struct rusage *)NULL)
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
    li.QuadPart /= 10L; /* Convert to microseconds */
    rusage->ru_stime.tv_sec = li.QuadPart / 1000000L;
    rusage->ru_stime.tv_usec = li.QuadPart % 1000000L;

    memcpy(&li, &usertime, sizeof(FILETIME));
    li.QuadPart /= 10L; /* Convert to microseconds */
    rusage->ru_utime.tv_sec = li.QuadPart / 1000000L;
    rusage->ru_utime.tv_usec = li.QuadPart % 1000000L;

    return 0;
}
#endif

double aptk::time_used()
{
    struct rusage data;

    getrusage(RUSAGE_SELF, &data);

    double system_time = (double)data.ru_stime.tv_sec + ((double)data.ru_stime.tv_usec / 1e6);
    double user_time = (double)data.ru_utime.tv_sec + ((double)data.ru_utime.tv_usec / (double)1e6);

    return user_time + system_time;
}

template <typename Stream>
void report_interval(double t0, double t1, Stream &os)
{
    double delta = t1 - t0;
    if (delta < 1e-12)
        os << "<1 msec" << std::endl;
    else
        os << std::setprecision(3) << delta << std::endl;
}

#ifndef WIN32
double aptk::mem_used()
{
    struct rusage data;

    getrusage(RUSAGE_SELF, &data);

    return (double)data.ru_maxrss / 1024.;
}
#endif
