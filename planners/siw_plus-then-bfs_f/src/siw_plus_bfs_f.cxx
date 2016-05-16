#include <siw_plus_bfs_f.hxx>

SIW_PLUS_BFS_F_Planner::SIW_PLUS_BFS_F_Planner()
	: STRIPS_Problem(), m_iw_bound(1), 
	m_max_novelty(2), m_log_filename( "planner.log"), m_plan_filename( "plan.ipc" ), m_enable_siw_plus( true ), m_enable_bfs_f( true ) {
}

SIW_PLUS_BFS_F_Planner::SIW_PLUS_BFS_F_Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Problem( domain_file, instance_file ), m_iw_bound(1),  
	m_max_novelty(2), m_log_filename( "planner.log" ), m_plan_filename( "plan.ipc" ), m_enable_siw_plus( true ), m_enable_bfs_f( true ) {
}

SIW_PLUS_BFS_F_Planner::SIW_PLUS_BFS_F_Planner( const SIW_PLUS_BFS_F_Planner& ) {
	assert( false );
}

SIW_PLUS_BFS_F_Planner::~SIW_PLUS_BFS_F_Planner() {
	m_details.close();
}


void	
SIW_PLUS_BFS_F_Planner::setup() {
	m_details.open( m_log_filename.c_str() );
	// MRJ: Call superclass method, then do you own thing here
	STRIPS_Problem::setup();
	m_details << "PDDL problem description loaded: " << std::endl;
	m_details << "\tDomain: " << instance()->domain_name() << std::endl;
	m_details << "\tProblem: " << instance()->problem_name() << std::endl;
	m_details << "\t#Actions: " << instance()->num_actions() << std::endl;
	m_details << "\t#Fluents: " << instance()->num_fluents() << std::endl;

}

float
SIW_PLUS_BFS_F_Planner::do_stage_1(  SIW_Plus_Fwd& engine,  float& cost ) {

        engine.set_bound(1);
	engine.set_max_bound( m_iw_bound-1 );
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	cost = 0.0f;;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	std::ofstream	plan_stream( m_plan_filename.c_str() );

	if ( engine.find_solution( cost, plan ) ) {
		m_details << "Plan found with cost: " << cost << std::endl;
		std::cout << "Plan found with cost: " << cost << std::endl;
		std::ofstream	plan_stream( m_plan_filename.c_str() );

		for ( unsigned k = 0; k < plan.size(); k++ ) {
			m_details << k+1 << ". ";
			const aptk::Action& a = *(instance()->actions()[ plan[k] ]);
			m_details << a.signature();
			m_details << std::endl;
			plan_stream << a.signature() << std::endl;
		}
		plan_stream.close();

		float tf = aptk::time_used();
		unsigned expanded_f = engine.expanded();
		unsigned generated_f = engine.generated();
		m_details << "Time: " << tf - t0 << std::endl;
		m_details << "Generated: " << generated_f - generated_0 << std::endl;
		m_details << "Expanded: " << expanded_f - expanded_0 << std::endl;
		t0 = tf;
		expanded_0 = expanded_f;
		generated_0 = generated_f;
		plan.clear();
	}
	else
		cost = infty;
 	float total_time = aptk::time_used() - ref;
	m_details << "Total time: " << total_time << std::endl;
	m_details << "Nodes generated during search: " << engine.generated() << std::endl;
	m_details << "Nodes expanded during search: " << engine.expanded() << std::endl;
	m_details << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
	m_details << "Average ef. width: " << engine.avg_B() << std::endl;
	m_details << "Max ef. width: " << engine.max_B() << std::endl;

	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	std::cout << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
	std::cout << "Average ef. width: " << engine.avg_B() << std::endl;
	std::cout << "Max ef. width: " << engine.max_B() << std::endl;
	plan_stream.close();
	return total_time;	
}


float
SIW_PLUS_BFS_F_Planner::do_stage_2( Anytime_GBFS_H_Add_Rp_Fwd& engine, float B, float& cost ) {
	
	engine.start(B);

	std::vector< aptk::Action_Idx > plan;
	cost = 0.0f;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();


	if ( engine.find_solution( cost, plan ) ) {
		m_details << "Plan found with cost: " << cost << std::endl;
		std::cout << "Plan found with cost: " << cost << std::endl;
		std::ofstream	plan_stream( m_plan_filename.c_str() );
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			m_details << k+1 << ". ";
			const aptk::Action& a = *(instance()->actions()[ plan[k] ]);
			m_details << a.signature();
			m_details << std::endl;
			plan_stream << a.signature() << std::endl;
		}
		plan_stream.close();
		float tf = aptk::time_used();
		unsigned expanded_f = engine.expanded();
		unsigned generated_f = engine.generated();
		m_details << "Time: " << tf - t0 << std::endl;
		m_details << "Generated: " << generated_f - generated_0 << std::endl;
		m_details << "Expanded: " << expanded_f - expanded_0 << std::endl;
		t0 = tf;
		expanded_0 = expanded_f;
		generated_0 = generated_f;
		plan.clear();
	}
	else {
		cost = infty;
	}
 	float total_time = aptk::time_used() - ref;
	m_details << "Total time: " << total_time << std::endl;
	m_details << "Nodes generated during search: " << engine.generated() << std::endl;
	m_details << "Nodes expanded during search: " << engine.expanded() << std::endl;
	m_details << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	return total_time;	
}

void
SIW_PLUS_BFS_F_Planner::report_no_solution( std::string reason) {
	std::ofstream	plan_stream( m_plan_filename.c_str() );
	plan_stream << ";; No solution found" << std::endl;
	plan_stream << ";; " << reason << std::endl;
	plan_stream.close();
	
}

void	
SIW_PLUS_BFS_F_Planner::solve() {

	Fwd_Search_Problem	search_prob( instance() );

	// if ( !instance()->has_conditional_effects() ) {
	// 	H2_Fwd    h2( search_prob );
	// 	h2.compute_edeletes( *instance() );	

	// 	if ( h2.eval( instance()->goal() ) == infty ) {
	// 		m_details << "Problem has no solution!" << std::endl;
	// 		report_no_solution( "h2(s0) = infty" );
	// 		return;	
	// 	}

		
	// }
	// else
	// 	instance()->compute_edeletes();


	float siw_cost = infty;


	if ( m_enable_siw_plus )
	{
		// MRJ: 1st Stage, SIW search with bounded width
		m_details << "Stage #1: SIW" << std::endl;
		Gen_Lms_Fwd    gen_lms( search_prob );
		Landmarks_Graph graph( *instance() );
		
		gen_lms.set_only_goals( true );
		gen_lms.compute_lm_graph_set_additive( graph );
		
		m_details << "Landmarks found: " << graph.num_landmarks() << std::endl;
		//graph.print( m_details );
	
		SIW_Plus_Fwd siw_plus_engine( search_prob );
		siw_plus_engine.set_goal_agenda( &graph );
		float iw_t = do_stage_1( siw_plus_engine, siw_cost );
		m_details << "SIW+ search completed in " << iw_t << " secs, found plan cost = " << siw_cost << std::endl;
		std::cout << "\nSIW+ search completed in " << iw_t << " secs, found plan cost = " << siw_cost << std::endl;
	}

	if(siw_cost != infty )
	    return;

	float bfs_f_cost = infty;
	Gen_Lms_Fwd    gen_lms( search_prob );
	Landmarks_Graph graph( *instance() );

	gen_lms.compute_lm_graph_set_additive( graph );
	
	m_details << "Landmarks and edges found: " << graph.num_landmarks_and_edges() << std::endl;
	//graph.print( m_details );

	Land_Graph_Man lgm( search_prob, &graph);

	if ( m_enable_bfs_f ) {
		// MRJ: 2nd Stage, full BFS(f) with bound informed by SIW search
		m_details << "Stage #2: BFS(f)" << std::endl;
	
		Anytime_GBFS_H_Add_Rp_Fwd bfs_engine( search_prob );
		bfs_engine.use_land_graph_manager( &lgm );
		bfs_engine.set_arity( m_max_novelty, graph.num_landmarks_and_edges() );
		
		float bfs_t = do_stage_2( bfs_engine, siw_cost, bfs_f_cost  );
		m_details << "BFS(f) search completed in " << bfs_t << " secs, found plan cost = " << bfs_f_cost << std::endl;
		std::cout << "\nBFS(f) search completed in " << bfs_t << " secs, found plan cost = " << bfs_f_cost << std::endl;
		if ( siw_cost == infty && bfs_f_cost == infty ) {
			report_no_solution( "BFS(f) did not found a plan" );
			return;
		}
	}
	bfs_f_cost = std::min( siw_cost, bfs_f_cost );

}

