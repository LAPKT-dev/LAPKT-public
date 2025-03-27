
#ifndef __PY_FF_PDDL_TO_STRIPS__
#define __PY_FF_PDDL_TO_STRIPS__

#include <string>
#include <py_strips_interface.hxx>
namespace aptk
{
	namespace FF_Parser
	{
		void py_get_problem_description(std::string pddl_domain_path,
																		std::string pddl_problem_path,
																		STRIPS_Interface &strips_interface,
																		bool ignore_action_costs = false,
																		bool get_detailed_fluent_names = false);
	}
}

#endif // PY_FF_PDDL_To_STRIPS.hxx
