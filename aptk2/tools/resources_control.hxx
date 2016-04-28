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

#pragma once

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
