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
    std::cout << "\t#Fluents: " << problem->num_fluents() << std::endl;*/
    this->set_delay_eval(false);
    this->start();
    float cost;
    std::vector<aptk::Action_Idx> plan;
    this->find_solution(cost, plan);
    std::cout << plan.size() << std::endl;

    if (output_filename.size() != 0){
        std::ofstream	plan_stream( output_filename.c_str() );

        std::cout << "Plan found with cost: " << cost << std::endl;
        for ( unsigned k = 0; k < plan.size(); k++ ) {
            std::cout << k+1 << ". ";
            const aptk::Action& a = *(m_problem.task().actions()[ plan[k] ]);
            std::cout << a.signature();
            std::cout << std::endl;
            plan_stream << a.signature() << std::endl;
        }
        plan_stream.close();
    } else {
        std::cout << "Empty output filename" << std::endl;
    }

}

Solver *NUM_BFS_Factory::build(aptk::STRIPS_Problem * prob) const {
    Fwd_Search_Problem * search_problem = new Fwd_Search_Problem(prob);
    return new NUM_BFS(*search_problem);
}


void
NUM_BFS::process(  Search_Node *head ) {


#ifdef DEBUG
    std::cout << "Expanding:" << std::endl;
    head->print(std::cout);
    std::cout << std::endl;
    head->state()->print( std::cout );
    std::cout << std::endl;
#endif
    std::vector< aptk::Action_Idx > app_set;
    this->problem().applicable_set_v2( *(head->state()), app_set );

    for (unsigned i = 0; i < app_set.size(); ++i ) {
        int a = app_set[i];

        State *succ = m_problem.next( *(head->state()), a );

        Search_Node* n = new Search_Node( succ,
                                          m_problem.cost( *(head->state()), a ),
                                          a, head );
        n->set_metric(m_problem.metric(*n, a));


        #ifdef DEBUG
        std::cout << "Successor:" << std::endl;
        n->print(std::cout);
        std::cout << "State:"<< std::endl;
        n->state()->print( std::cout );
        std::cout << std::endl;
        #endif

        if ( is_closed( n ) ) {
            #ifdef DEBUG
            std::cout << "Already in CLOSED" << std::endl;
            #endif
            delete n;
            continue;
        }
        if(m_delay_eval)
            n->hn() = head->hn();
        else
            eval(n);

        if(m_greedy)
            n->fn() = n->hn();
        else
            n->fn() = n->hn() + n->gn();

        if( previously_hashed(n) ) {
            #ifdef DEBUG
            std::cout << "Already in OPEN" << std::endl;
            #endif
            delete n;
        }

        else
        {
            #ifdef DEBUG
            std::cout << "Inserted into OPEN" << std::endl;
            #endif
            open_node(n);
        }
    }
    inc_eval();
}


void
NUM_BFS::set_output_filename(std::string out){
    output_filename = out;
}

