#include <bfsf_planner.hxx>
#include <fstream>

BFS_f_Planner::BFS_f_Planner()
	: STRIPS_Problem(), m_max_novelty(2), m_log_filename( "iw.log"), m_plan_filename( "plan.ipc" ), m_one_ha_per_fluent( false ) {
}

BFS_f_Planner::BFS_f_Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Problem( domain_file, instance_file ), m_max_novelty(2), m_log_filename( "iw.log" ), m_plan_filename( "plan.ipc" ), m_one_ha_per_fluent(false) {
}

BFS_f_Planner::~BFS_f_Planner() {
}


void	
BFS_f_Planner::setup() {
	// MRJ: Call superclass method, then do you own thing here
	STRIPS_Problem::setup();
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;

}

float
BFS_f_Planner::do_search( Anytime_GBFS_H_Add_Rp_Fwd& engine ) {
	
	engine.set_bound(m_max_novelty);
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	std::ofstream	plan_stream( m_plan_filename.c_str() );

	if ( engine.find_solution( cost, plan ) ) {
		std::cout << "Plan found with cost: " << cost << std::endl;
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			std::cout << k+1 << ". ";
			const aptk::Action& a = *(instance()->actions()[ plan[k] ]);
			std::cout << a.signature();
			std::cout << std::endl;
			plan_stream << a.signature() << std::endl;
		}
		float tf = aptk::time_used();
		unsigned expanded_f = engine.expanded();
		unsigned generated_f = engine.generated();
		std::cout << "Time: " << tf - t0 << std::endl;
		std::cout << "Generated: " << generated_f - generated_0 << std::endl;
		std::cout << "Expanded: " << expanded_f - expanded_0 << std::endl;
		t0 = tf;
		expanded_0 = expanded_f;
		generated_0 = generated_f;
		plan.clear();
	}
 	float total_time = aptk::time_used() - ref;
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	plan_stream.close();
	return total_time;	
}

void	
BFS_f_Planner::solve() {

	Fwd_Search_Problem	search_prob( instance() );

	// if ( !instance()->has_conditional_effects() ) {
	// 	H2_Fwd    h2( search_prob );
	// 	h2.compute_edeletes( *instance() );
	// }
	// else
	// 	instance()->compute_edeletes();	

	Gen_Lms_Fwd    gen_lms( search_prob );
	Landmarks_Graph graph( *instance() );

	gen_lms.compute_lm_graph_set_additive( graph );
	
	std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	//graph.print( std::cout );
	
	std::cout << "Starting search with BFS (time budget is 60 secs)..." << std::endl;

	Anytime_GBFS_H_Add_Rp_Fwd bfs_engine( search_prob );

	// MRJ: Setting "one h.a. per fluent" flag
	bfs_engine.h3().set_one_HA_per_fluent( m_one_ha_per_fluent );
	
	Land_Graph_Man lgm( search_prob, &graph);
	bfs_engine.use_land_graph_manager( &lgm );
	
	unsigned max_novelty = 2;

	bfs_engine.set_arity( max_novelty, graph.num_landmarks_and_edges() );

	float bfs_t = do_search( bfs_engine );
	
	std::cout << "BFS(f) search completed in " << bfs_t << " secs, check '" << m_log_filename << "' for details" << std::endl;

}

