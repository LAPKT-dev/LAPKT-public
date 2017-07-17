#include <num_planner.hxx>
#include <strips_state.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <h_2.hxx>

#include <aptk/iw.hxx>
#include <aptk/serialized_search.hxx>
#include <aptk/string_conversions.hxx>

#include <iostream>
#include <fstream>

using	aptk::agnostic::Fwd_Search_Problem;

//typedef		Serialized_Search< Fwd_Search_Problem, IW_Fwd, IW_Node >        SIW_Fwd;

NUM_BFS::NUM_BFS(const Fwd_Search_Problem& search_problem ):
        BFS(search_problem)
{

}



void	
NUM_BFS::solve() {
    std::cout << "PDDL problem description loaded: " << std::endl;
    /*
    std::cout << "\tDomain: " << problem->domain_name() << std::endl;
    std::cout << "\tProblem: " << problem->problem_name() << std::endl;
    std::cout << "\t#Actions: " << problem->num_actions() << std::endl;
    std::cout << "\t#Fluents: " << problem->num_fluents() << std::endl;
*/

    this->start();
    float cost;
    std::vector<aptk::Action_Idx> plan;
    this->find_solution(cost, plan);
    std::cout << plan.size() << std::endl;

}

Solver *NUM_BFS_Factory::build(aptk::STRIPS_Problem * prob) const {
    Fwd_Search_Problem * search_problem = new Fwd_Search_Problem(prob);
    return new NUM_BFS(*search_problem);
}
