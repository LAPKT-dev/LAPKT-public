#include <helpers.hxx>
#include <replan.hxx>

float do_stage_1( aptk::STRIPS_Problem& prob, SIW_Fwd& engine,  float& cost, int iw_bound, std::ofstream& details, std::string plan_filename ) {
    engine.set_max_bound( iw_bound );
    engine.start();

    std::vector< aptk::Action_Idx > plan;
    cost = 0.0f;;

    float ref = aptk::time_used();
    float t0 = aptk::time_used();

    unsigned expanded_0 = engine.expanded();
    unsigned generated_0 = engine.generated();

    if ( engine.find_solution( cost, plan ) ) {
        details << "stage1: Plan found with cost: " << cost << std::endl;
        std::ofstream	plan_stream( plan_filename.c_str() );

        for ( unsigned k = 0; k < plan.size(); k++ ) {
            details << k+1 << ". ";
            const aptk::Action& a = *(prob.actions()[ plan[k] ]);
            details << a.signature();
            details << std::endl;
            plan_stream << a.signature() << std::endl;
        }
        plan_stream.close();

        float tf = aptk::time_used();
        unsigned expanded_f = engine.expanded();
        unsigned generated_f = engine.generated();
        details << "Time: " << tf - t0 << std::endl;
        details << "Generated: " << generated_f - generated_0 << std::endl;
        details << "Expanded: " << expanded_f - expanded_0 << std::endl;
        t0 = tf;
        expanded_0 = expanded_f;
        generated_0 = generated_f;
        plan.clear();
    }
    else
        cost = infty;
    float total_time = aptk::time_used() - ref;
    details << "Total time: " << total_time << std::endl;
    details << "Nodes generated during search: " << engine.generated() << std::endl;
    details << "Nodes expanded during search: " << engine.expanded() << std::endl;
    details << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
    details << "Average ef. width: " << engine.avg_B() << std::endl;
    details << "Max ef. width: " << engine.max_B() << std::endl;
    return total_time;
}

std::pair<float, std::vector< aptk::Action_Idx > >  do_stage_3(  aptk::STRIPS_Problem& prob, Anytime_RWA& engine, float B, float& cost, std::ofstream& details, std::string plan_filename  ) {
    engine.start(B);
    details << "Branch & Bound search: Initial Bound = " << B << std::endl;
    engine.set_schedule( 1000, 1, 10 );

    std::vector< aptk::Action_Idx > plan, final_plan;
    cost = infty;
    float final_cost = infty;
    float metric = infty;
    float final_metric = infty;
    float ref = aptk::time_used();
    float t0 = aptk::time_used();

    unsigned expanded_0 = engine.expanded();
    unsigned generated_0 = engine.generated();
    engine.set_budget(5);
    while ( engine.find_solution(metric, cost, plan ) ) {
        if ( !plan.empty() ) {
            details << "stage3: Plan found with cost: " << cost << std::endl;
            details << "stage3: Plan found with metric: " << metric << std::endl;
            final_plan = plan;
            final_cost = cost;
            final_metric = metric;
            std::ofstream plan_stream( plan_filename.c_str() );
            for ( unsigned k = 0; k < plan.size(); k++ ) {
                details << k+1 << ". ";
                const aptk::Action& a = *(prob.actions()[ plan[k] ]);
                details << a.signature();
                details << std::endl;
                plan_stream << a.signature() << std::endl;
            }
            plan_stream.close();
        }
        else
            details << "No plan found" << std::endl;
        float tf = aptk::time_used();
        unsigned expanded_f = engine.expanded();
        unsigned generated_f = engine.generated();
        details << "Time: " << tf - t0 << std::endl;
        details << "Generated: " << generated_f - generated_0 << std::endl;
        details << "Expanded: " << expanded_f - expanded_0 << std::endl;
        t0 = tf;
        expanded_0 = expanded_f;
        generated_0 = generated_f;
        plan.clear();
    }
    float total_time = aptk::time_used() - ref;
    details << "Total time: " << total_time << std::endl;
    details << "Nodes generated during search: " << engine.generated() << std::endl;
    details << "Nodes expanded during search: " << engine.expanded() << std::endl;
    details << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
    details << "Dead-end nodes: " << engine.dead_ends() << std::endl;
    details << "Nodes in OPEN replaced: " << engine.open_repl() << std::endl;
    details << "Plan length stage3: " << plan.size() << std::endl;
    details << "Plan metric: " << final_metric << std::endl;
    details << "Plan cost: " << final_cost << std::endl;
    return std::pair<float, std::vector< aptk::Action_Idx > > (metric, final_plan);
}

std::pair<float, std::vector< aptk::Action_Idx > > do_stage_2(  aptk::STRIPS_Problem& prob, Anytime_GBFS_H_Add_Rp_Fwd& engine, float B, float& cost,std::ofstream& details, std::string plan_filename  ) {

    engine.start(B);

    std::vector< aptk::Action_Idx > plan, result_plan;
    cost = 0.0f;

    float ref = aptk::time_used();
    float t0 = aptk::time_used();

    unsigned expanded_0 = engine.expanded();
    unsigned generated_0 = engine.generated();


    if ( engine.find_solution( cost, plan ) ) {
        details << "stage2: Plan found with cost: " << cost << std::endl;
        result_plan = plan;
        std::ofstream plan_stream( plan_filename.c_str() );
        for ( unsigned k = 0; k < plan.size(); k++ ) {
            details << k+1 << ". ";
            const aptk::Action& a = *(prob.actions()[ plan[k] ]);
            details << a.signature();
            details << std::endl;
            plan_stream << a.signature() << std::endl;
        }
        plan_stream.close();
        float tf = aptk::time_used();
        unsigned expanded_f = engine.expanded();
        unsigned generated_f = engine.generated();
        details << "Time: " << tf - t0 << std::endl;
        details << "Generated: " << generated_f - generated_0 << std::endl;
        details << "Expanded: " << expanded_f - expanded_0 << std::endl;
        t0 = tf;
        expanded_0 = expanded_f;
        generated_0 = generated_f;
        plan.clear();
    }
    else {
        cost = infty;
    }
    float total_time = aptk::time_used() - ref;
    details << "Total time: " << total_time << std::endl;
    details << "Nodes generated during search: " << engine.generated() << std::endl;
    details << "Nodes expanded during search: " << engine.expanded() << std::endl;
    details << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
    return std::pair<float, std::vector< aptk::Action_Idx > > (total_time, result_plan);
}

void report_no_solution( std::string reason, std::string plan_filename ) {
    std::ofstream plan_stream( plan_filename.c_str() );
    plan_stream << ";; No solution found" << std::endl;
    plan_stream << ";; " << reason << std::endl;
    plan_stream.close();
}

void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
    po::options_description desc( "Options:" );

    desc.add_options()
        ( "help", "Show help message" )
        ( "domain", po::value<std::string>(), "Input PDDL domain description" )
        ( "problem", po::value<std::string>(), "Input PDDL problem description" )
        ( "iw-bound", po::value<int>()->default_value(2), "Max width w for SIW (default 2)" )
        ( "max-novelty", po::value<int>()->default_value(2), "Max width w for novelty heuristic in BFS(f) (default 2)")
        ( "output", po::value<std::string>(), "Output file for plan" )
        ( "one-ha-per-fluent", po::value<bool>()->default_value(false), "Extract only one helpful action per fluent" )
        ( "disable-siw", po::value<bool>()->default_value(false), "Disable SIW stage")
        ( "disable-bfs-f", po::value<bool>()->default_value(false), "Disable BFS(f) stage")
    ;

    try {
        po::store( po::parse_command_line( ac, av, desc ), vars );
        po::notify( vars );
    }
    catch ( std::exception& e ) {
        std::cerr << "Error: " << e.what() << std::endl;
        std::exit(1);
    }
    catch ( ... ) {
        std::cerr << "Exception of unknown type!" << std::endl;
        std::exit(1);
    }

    if ( vars.count("help") ) {
        std::cout << desc << std::endl;
        std::exit(0);
    }

}

void write_reordered_plan(std::string reordered_plan_filename,
                          aptk::STRIPS_Problem & plan_prob,
                          std::map<int,
                          std::list<aptk::Action_Idx>>& p_plan,
                          float metric,
                          float cost)
{
    std::ofstream myfile;
    myfile.open (reordered_plan_filename);
    myfile << "Cost: " << cost << std::endl;
    myfile << "Metric: " << metric << std::endl;
    for (uint k=0; k<p_plan.size(); k++){
        std::cout << "Level: " << k << std::endl;
        if (!reordered_plan_filename.empty())
            myfile << "Level: " << k << std::endl;
        for(auto id: p_plan[k]){
            std::cout << plan_prob.actions()[id]->signature() << std::endl;
            if (!reordered_plan_filename.empty())
                myfile << plan_prob.actions()[id]->signature() << std::endl;
        }
    }
}

void process_plan(aptk::State & goal, Fwd_Search_Problem & search_prob, aptk::State & root, aptk::STRIPS_Problem & prob, std::string & plan_filename, std::pair<float, std::vector< aptk::Action_Idx > > & result, float cost)
{

    aptk::Fluent_Vec backup_init = prob.init();
    aptk::Fluent_Vec backup_goal = prob.goal();

    aptk::STRIPS_Problem::set_init( prob, root.fluent_vec() );
    aptk::STRIPS_Problem::set_goal( prob, goal.fluent_vec() );


    std::list<aptk::Action_Idx> plan_list(result.second.begin(), result.second.end());
    std::map<int, std::list<aptk::Action_Idx>> reordered_plan = partial_reordering(search_prob, prob, plan_list);
    // void write_reordered_plan(std::string reordered_plan_filename, aptk::STRIPS_Problem & plan_prob,
    // std::map<int, std::list<aptk::Action_Idx>>& p_plan, float metric, float cost)
    write_reordered_plan(plan_filename, prob, reordered_plan, result.first, cost);

    aptk::STRIPS_Problem::set_init( prob, backup_init );
    aptk::STRIPS_Problem::set_goal( prob, backup_goal );
}


int
run_planners(aptk::STRIPS_Problem & prob, bool enable_siw, bool enable_bfs_f, std::string & plan_filename, int max_novelty, int iw_bound){
    std::ofstream details( "execution.details" );
    details << "PDDL problem description loaded: " << std::endl;
    details << "\tDomain: " << prob.domain_name() << std::endl;
    details << "\tProblem: " << prob.problem_name() << std::endl;
    details << "\t#Actions: " << prob.num_actions() << std::endl;
    details << "\t#Fluents: " << prob.num_fluents() << std::endl;

    for ( unsigned k = 0; k < prob.num_actions(); k++ ) {
        std::cout << k+1 << ". ";
        const aptk::Action& a = *(prob.actions()[ k ]);
        std::cout << a.signature();
        std::cout << std::endl;
    }

    // store state
    aptk::State root( prob );
    root.set( prob.init() );
    aptk::State goal( prob );
    goal.set( prob.goal() );

    Fwd_Search_Problem	search_prob( &prob );

    details << "All Fluents:   action signature" << std::endl;
    for (auto fptr: prob.fluents()){
        details << "     " << fptr->signature() << ": " << fptr->index() << std::endl;
    }

    details << "ActionId:   action signature " << std::endl;
    for ( unsigned k = 0; k < prob.actions().size(); k++ ) {
        details << k << ". ";
        const aptk::Action& a = *(prob.actions()[ k ]);
        details << a.signature();
        details << std::endl  << "   Preconditions:" << std::endl;
        for (auto it: a.prec_vec()){
            auto fptr = prob.fluents()[it];
            details << "     " << fptr->signature() << ": " << fptr->index() << std::endl;
        }
        details << "   AddList:" << std::endl;
        for (auto it: a.add_vec()){
            auto fptr = prob.fluents()[it];
            details << "     " << fptr->signature() << ": " << fptr->index() << std::endl;
        }
        details << "   DelList:" << std::endl;
        for (auto it: a.del_vec()){
            auto fptr = prob.fluents()[it];
            details << "     " << fptr->signature() << ": " << fptr->index() << std::endl;
        }
        details << std::endl;
    }



    float siw_cost = infty;


    if ( enable_siw )
    {
        // MRJ: 1st Stage, SIW search with bounded width
        details << "Stage #1: SIW" << std::endl;
        Gen_Lms_Fwd    gen_lms( search_prob );
        Landmarks_Graph graph( prob );

        gen_lms.set_only_goals( true );
        gen_lms.compute_lm_graph_set_additive( graph );

        details << "Landmarks found: " << graph.num_landmarks() << std::endl;
        //graph.print( details );

        SIW_Fwd siw_engine( search_prob );
        siw_engine.set_goal_agenda( &graph );
        float iw_t = do_stage_1(prob, siw_engine, siw_cost, iw_bound, details, plan_filename  );

        details << "SIW search completed in " << iw_t << " secs, found plan cost = " << siw_cost << std::endl;
        std::cout << "SIW search completed in " << iw_t << " secs \nfound plan cost = " << siw_cost << std::endl;
    }

    float bfs_f_cost = infty;
    Gen_Lms_Fwd    gen_lms( search_prob );
    Landmarks_Graph graph( prob );

    gen_lms.compute_lm_graph_set_additive( graph );

    details << "Landmarks and edges found: " << graph.num_landmarks_and_edges() << std::endl;
    graph.print( details );

    Land_Graph_Man lgm( search_prob, &graph);

    if ( enable_bfs_f ) {
        // MRJ: 2nd Stage, full BFS(f) with bound informed by SIW search
        details << "Stage #2: BFS(f)" << std::endl;

        Anytime_GBFS_H_Add_Rp_Fwd bfs_engine( search_prob );
        bfs_engine.use_land_graph_manager( &lgm );
        bfs_engine.set_arity( max_novelty, graph.num_landmarks_and_edges() );

        float bfs_t;
        std::pair<float, std::vector< aptk::Action_Idx > > result = do_stage_2(prob,  bfs_engine, siw_cost, bfs_f_cost, details, plan_filename  );
        bfs_t = result.first;
        details << "BFS(f) search completed in " << bfs_t << " secs, found plan cost = " << bfs_f_cost << std::endl;




        std::cout << result.second.size() << std::endl;
        if ( 0 < result.second.size() ) {
            process_plan(goal, search_prob, root, prob, plan_filename, result);
        }
        if ( siw_cost == infty && bfs_f_cost == infty ) {
            report_no_solution( "BFS(f) did not found a plan", plan_filename );
            return 0;
        }
    }

    bfs_f_cost = std::min( siw_cost, bfs_f_cost );
    if ( (bfs_f_cost < infty) || (!enable_siw && !enable_bfs_f) ) {
        // MRJ: 3rd Stage, RWA* with bound informed by BFS(f) search
        float rwa_cost = infty;
        details << "Stage #3: RWA* " << std::endl;
        Anytime_RWA wbfs_engine( search_prob, 10.0f, 0.94f);
        //wbfs_engine.h2().set_graph( &graph );
        wbfs_engine.use_land_graph_manager( &lgm );
        float at_search_t;
        std::pair<float, std::vector< aptk::Action_Idx > > result = do_stage_3(prob, wbfs_engine, std::min(bfs_f_cost,siw_cost), rwa_cost, details, plan_filename );
        at_search_t = result.first;

        std::cout << result.second.size() << std::endl;
        if ( 0 < result.second.size() ) {
            process_plan(goal, search_prob, root, prob, plan_filename, result, rwa_cost);
        }
        details << "RWA search completed in " << at_search_t << " secs, found plan cost = " << rwa_cost << std::endl;
    }

    details.close();
    return 0;
}

