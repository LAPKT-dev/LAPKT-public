#include <at_bfsf_planner.hxx>
#include <fstream>

AT_BFS_f_Planner::AT_BFS_f_Planner()
	: STRIPS_Problem(), m_max_novelty(2), m_log_filename( "iw.log"), m_plan_filename( "plan.ipc" ) {
}

AT_BFS_f_Planner::AT_BFS_f_Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Problem( domain_file, instance_file ), m_max_novelty(2), m_log_filename( "iw.log" ), m_plan_filename( "plan.ipc" ) {
}

AT_BFS_f_Planner::~AT_BFS_f_Planner() {
}


void	
AT_BFS_f_Planner::setup() {
	// MRJ: Call superclass method, then do you own thing here
	STRIPS_Problem::setup();
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;

}

float
AT_BFS_f_Planner::do_search( Anytime_RWA& engine, float B ) {
	engine.start();
	engine.set_bound( B );
	std::cout << "Branch & Bound search: Initial Bound = " << B << std::endl;
	engine.set_schedule( 10, 5, 1 );

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	while ( engine.find_solution( cost, plan ) ) {
		std::cout << "Plan found with cost: " << cost << std::endl;
		if ( !plan.empty() ) {
			std::ofstream	plan_stream( m_plan_filename.c_str() );
	
			for ( unsigned k = 0; k < plan.size(); k++ ) {
				std::cout << k+1 << ". ";
				const aptk::Action& a = *(instance()->actions()[ plan[k] ]);
				std::cout << a.signature();
				std::cout << std::endl;
				plan_stream << a.signature() << std::endl;
			}
			plan_stream.close();
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
	std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	std::cout << "Dead-end nodes: " << engine.dead_ends() << std::endl;
	std::cout << "Nodes in OPEN replaced: " << engine.open_repl() << std::endl;
	return total_time;
}

float
AT_BFS_f_Planner::do_search( Anytime_GBFS_H_Add_Rp_Fwd& engine, float& cost ) {
	
	engine.set_bound(m_max_novelty);
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	cost = 0.0f;

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
AT_BFS_f_Planner::solve() {

	Fwd_Search_Problem	search_prob( instance() );

	H2_Fwd    h2( search_prob );
	h2.compute_edeletes( *instance() );	

	Gen_Lms_Fwd    gen_lms( search_prob );
	Landmarks_Graph graph( *instance() );

	gen_lms.compute_lm_graph_set_additive( graph );
	
	std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	graph.print( std::cout );
	
	Land_Graph_Man lgm( search_prob, &graph);
	
	unsigned max_novelty = 2;

	float cost = infty;

	if ( h2.eval( instance()->goal() ) < infty )
	{
		
		Anytime_GBFS_H_Add_Rp_Fwd bfs_engine( search_prob );
		bfs_engine.use_land_graph_manager( &lgm );
		bfs_engine.set_arity( max_novelty, graph.num_landmarks() );
		float bfs_t = do_search( bfs_engine, cost  );
		std::cout << "BFS(f) search completed in " << bfs_t << " secs" << std::endl;
		
	}
	else {
		std::cout << "Problem has no solution!" << std::endl;
		return;
	}

	if ( cost < infty ) {
		Anytime_RWA wbfs_engine( search_prob, 5.0f, 0.75f);
		//wbfs_engine.h2().set_graph( &graph );
		float at_search_t = do_search( wbfs_engine, cost );
		std::cout << "RWA search completed in " << at_search_t << " secs" << std::endl;
	}

}

