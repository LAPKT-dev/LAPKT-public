#ifndef __FF_PDDL_TO_STRIPS__
#define __FF_PDDL_TO_STRIPS__

#include <string>
#include <strips_prob.hxx>
#include <libff/libff.h>

namespace aptk
{

class FF_PDDL_To_STRIPS
{
public:
	FF_PDDL_To_STRIPS();
	~FF_PDDL_To_STRIPS();
	
	void get_problem_description( 	std::string pddl_domain_path,
					std::string pddl_problem_path,
					STRIPS_Problem& strips_problem,
					bool get_detailed_fluent_names = false );
};

}

#endif // FF_PDDL_To_STRIPS.hxx
