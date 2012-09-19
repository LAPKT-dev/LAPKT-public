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

#include <aptk/memory.hxx>
#include <iostream>

namespace aptk
{

void report_memory_usage()
{
	struct rusage usage_report;
	getrusage( RUSAGE_SELF, &usage_report );
	std::cout << "Memory usage report:" << std::endl;
	std::cout << "Max. Resident Set Size:" << usage_report.ru_maxrss << std::endl;
	std::cout << "Shared Memory Size:" << usage_report.ru_ixrss << std::endl;
	std::cout << "Unshared Data Size:" << usage_report.ru_idrss << std::endl;
	std::cout << "Unshared Stack Size:" << usage_report.ru_isrss << std::endl;
}

}
