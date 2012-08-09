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
