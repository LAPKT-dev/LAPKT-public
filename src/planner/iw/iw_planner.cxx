#include <iw_planner.hxx>
#include <string_conversions.hxx>
#include <memory.hxx>

#include <fstream>
#include <iostream>
// #include <sys/wait.h>

//---- Constructor ----------------------------------------------------------//
IW_Planner::IW_Planner()
    : STRIPS_Interface(), m_iw_bound(IW_BOUND), m_log_filename(LOG_FILE),
      m_plan_filename(PLAN_FILE) {}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---- Constructor ----------------------------------------------------------//
IW_Planner::IW_Planner(std::string domain_file, std::string instance_file)
    : STRIPS_Interface(domain_file, instance_file), m_iw_bound(IW_BOUND),
      m_log_filename(LOG_FILE), m_plan_filename(PLAN_FILE) {}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---- Constructor ----------------------------------------------------------//
IW_Planner::IW_Planner(std::string domain_file, std::string instance_file,
                       unsigned bound, std::string log_file, std::string plan_file)
    : STRIPS_Interface(domain_file, instance_file), m_iw_bound(bound),
      m_log_filename(log_file), m_plan_filename(plan_file) {}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---- Destructor -----------------------------------------------------------//
IW_Planner::~IW_Planner() {}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---------------------------------------------------------------------------//
void IW_Planner::setup(bool gen_match_tree)
{
    // MRJ: Call superclass method, then do you own thing here
    STRIPS_Interface::setup(gen_match_tree);
    std::cout << "PDDL problem description loaded: " << std::endl;
    std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
    std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
    std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
    std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;
}

// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---------------------------------------------------------------------------//
template <typename Search_Engine>
float IW_Planner::do_search_single_goal(Search_Engine &engine,
                                        aptk::STRIPS_Problem &plan_prob, std::ofstream &plan_stream)
{
    std::ofstream details(m_log_filename);

    std::vector<aptk::Action_Idx> plan;
    float cost;

    float ref = aptk::time_used();
    aptk::Fluent_Vec goals = plan_prob.goal();
    float total_time = 0;

    float max_bound = m_iw_bound;

    bool solved = true;

    for (unsigned i = 0; i < goals.size(); i++)
    {

        if (solved)
        {
            engine.set_bound(1);
        }

        engine.start();
        aptk::Fluent_Vec new_goals;
        new_goals.push_back(goals[i]);
        aptk::STRIPS_Problem::set_goal(plan_prob, new_goals);

        if (engine.find_solution(cost, plan))
        {
            details << "Plan found with cost: " << cost << std::endl;
            std::cout << "Plan found with cost: " << cost << std::endl;
            for (unsigned k = 0; k < plan.size(); k++)
            {
                details << k + 1 << ". ";
                const aptk::Action &a = *(plan_prob.actions()[plan[k]]);
                details << a.signature();
                details << std::endl;
                plan_stream << a.signature() << std::endl;
            }
            plan.clear();
            solved = true;
        }
        else
        {
            solved = false;
            if (!(engine.bound() < max_bound &&
                  engine.set_bound(engine.bound() + 1)))
            {
                details << ";; NOT I-REACHABLE ;;" << std::endl;
                std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
                solved = true;
            }
            else
            {
                i--;
                continue;
            }
        }

        float partial_time = aptk::time_used() - ref;
        total_time = partial_time;
        details << "Total time: " << partial_time << std::endl;
        details << "Nodes generated during search: " << engine.generated() << std::endl;
        details << "Nodes expanded during search: " << engine.expanded() << std::endl;
        details << "Effective Width during search: " << engine.bound() << std::endl;

        // details << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
        // details << "Average ef. width: " << engine.avg_B() << std::endl;
        // details << "Max ef. width: " << engine.max_B() << std::endl;

        std::cout << "Total time: " << partial_time << std::endl;
        std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
        std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
        std::cout << "Max novelty expanded: " << engine.bound() << std::endl;
    }

    details.close();
    return total_time;
}

//---------------------------------------------------------------------------//
template <typename Search_Engine>
float IW_Planner::do_inc_bound_search(Search_Engine &engine, aptk::STRIPS_Problem &plan_prob,
                                      std::ofstream &plan_stream)
{
    std::ofstream details(m_log_filename);

    float ref = aptk::time_used();
    float t0 = aptk::time_used();
    bool solved = false;
    unsigned b = 0;
    unsigned expanded_0 = 0;
    unsigned generated_0 = 0;
    unsigned pruned_0 = 0;
    unsigned expanded_f = 0;
    unsigned generated_f = 0;
    unsigned pruned_f = 0;
    std::vector<aptk::Action_Idx> plan;
    float cost;
    do
    {
        b++;
        if (!engine.set_bound(b))
            break;
        engine.start();

        expanded_0 = engine.expanded();
        generated_0 = engine.generated();
        pruned_0 = engine.pruned_by_bound();
        solved = engine.find_solution(cost, plan);
        expanded_f += engine.expanded() - expanded_0;
        generated_f += engine.generated() - generated_0;
        pruned_f += engine.pruned_by_bound() - pruned_0;
        if (b == m_iw_bound)
            break;
    } while (!solved);

    if (solved)
    {
        details << "Plan found with cost: " << cost << std::endl;
        std::cout << "Plan found with cost: " << cost << std::endl;
        for (unsigned k = 0; k < plan.size(); k++)
        {
            details << k + 1 << ". ";
            const aptk::Action &a = *(plan_prob.actions()[plan[k]]);
            details << a.signature();
            details << std::endl;
            plan_stream << a.signature() << std::endl;
        }
        float tf = aptk::time_used();
        details << "Time: " << (tf - t0) << std::endl;
        details << "Generated: " << (generated_f) << std::endl;
        details << "Expanded: " << (expanded_f) << std::endl;
        t0 = tf;
        plan.clear();
    }
    else
    {
        details << ";; NOT I-REACHABLE ;;" << std::endl;
        std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
    }

    float total_time = aptk::time_used() - ref;
    details << "Total time: " << total_time << std::endl;
    details << "Nodes generated during search: " << std::endl;
    details << "Nodes expanded during search: " << std::endl;

    // details <<  "Nodes pruned by bound: "   <<  engine.sum_pruned_by_bound() <<
    //     std::endl;
    // details <<  "Average ef. width: "   <<  engine.avg_B()  <<  std:endl;
    // details <<  "Max ef. width: "   <<  engine.max_B()  <<  std::endl;
    details.close();
    std::cout << "Total time: " << total_time << std::endl;
    std::cout << "Nodes generated during search: " << generated_f << std::endl;
    std::cout << "Nodes expanded during search: " << expanded_f << std::endl;
    std::cout << "Nodes pruned by bound: " << pruned_f << std::endl;
    std::cout << "Max novelty expanded: " << engine.bound() << std::endl;
#ifdef __linux__
    aptk::report_memory_usage();
#endif
    return total_time;
}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---------------------------------------------------------------------------//
template <typename Search_Engine>
float IW_Planner::do_search(Search_Engine &engine, aptk::STRIPS_Problem &plan_prob,
                            std::ofstream &plan_stream)
{
    std::ofstream details(m_log_filename);

    engine.set_bound(m_iw_bound);
    engine.start();

    std::vector<aptk::Action_Idx> plan;
    float cost;

    float ref = aptk::time_used();
    float t0 = aptk::time_used();

    unsigned expanded_0 = engine.expanded();
    unsigned generated_0 = engine.generated();

    if (engine.find_solution(cost, plan))
    {
        details << "Plan found with cost: " << cost << std::endl;
        std::cout << "Plan found with cost: " << cost << std::endl;
        for (unsigned k = 0; k < plan.size(); k++)
        {
            details << k + 1 << ". ";
            const aptk::Action &a = *(plan_prob.actions()[plan[k]]);
            details << a.signature();
            details << std::endl;
            plan_stream << a.signature() << std::endl;
        }
        float tf = aptk::time_used();
        unsigned expanded_f = engine.expanded();
        unsigned generated_f = engine.generated();
        details << "Time: " << (tf - t0) << std::endl;
        details << "Generated: " << (generated_f - generated_0) << std::endl;
        details << "Expanded: " << (expanded_f - expanded_0) << std::endl;
        t0 = tf;
        expanded_0 = expanded_f;
        generated_0 = generated_f;
        plan.clear();
    }
    else
    {
        details << ";; NOT I-REACHABLE ;;" << std::endl;
        std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
    }

    float total_time = aptk::time_used() - ref;
    details << "Total time: " << total_time << std::endl;
    details << "Nodes generated during search: " << std::endl;
    details << "Nodes expanded during search: " << std::endl;

    // details <<  "Nodes pruned by bound: "   <<  engine.sum_pruned_by_bound() <<
    //     std::endl;
    // details <<  "Average ef. width: "   <<  engine.avg_B()  <<  std:endl;
    // details <<  "Max ef. width: "   <<  engine.max_B()  <<  std::endl;
    details.close();
    std::cout << "Total time: " << total_time << std::endl;
    std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
    std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
    std::cout << "Max novelty expanded: " << engine.bound() << std::endl;
#ifdef __linux__
    aptk::report_memory_usage();
#endif

    return total_time;
}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//

//---------------------------------------------------------------------------//
void IW_Planner::solve()
{
    // Attempting to fetch accurate memory statistics for the IW
    // pid_t pid   =   fork();
    // if ( pid == 0) {
    Fwd_Search_Problem search_prob(instance());

    std::ofstream plan_stream;
    plan_stream.open(m_plan_filename);

    std::cout << "Starting search with IW ..." << std::endl;

    IW_Fwd iw_engine(search_prob);

    // float iw_t = do_search( iw_engine, search_prob.task(), plan_stream );
    float iw_t;
    if (m_atomic)
        iw_t = do_search_single_goal(iw_engine, search_prob.task(), plan_stream);
    else
        iw_t = do_inc_bound_search(iw_engine, search_prob.task(), plan_stream);

    std::cout << "IW search completed in " << iw_t << " secs, check '" << m_log_filename << "' for details" << std::endl;

    plan_stream.close();
    //}
    // wait for the child process to finish
    // int stat_val;
    // pid_t child_pid;
    // child_pid   =   wait(&stat_val);
}
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//
