
#include <py_ff_to_aptk.hxx>
#include <ff_to_aptk.hxx>
namespace aptk
{
    namespace FF_Parser
    {
        void py_get_problem_description(std::string pddl_domain_path,
                                        std::string pddl_problem_path,
                                        STRIPS_Interface &strips_interface,
                                        bool ignore_action_costs,
                                        bool get_detailed_fluent_names)
        {
            get_problem_description(pddl_domain_path, pddl_problem_path,
                                    *(strips_interface.instance()), ignore_action_costs,
                                    get_detailed_fluent_names, true);
        }
    }
}
