 #include <dfiw_planner.hxx>
#include <strips_state.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <h_2.hxx>

#include <string_conversions.hxx>

#include <iostream>
#include <fstream>

using	aptk::agnostic::Fwd_Search_Problem;
using 	aptk::agnostic::Landmarks_Graph_Generator;
using 	aptk::agnostic::Landmarks_Graph;
using 	aptk::agnostic::H2_Heuristic;

using 	aptk::agnostic::Novelty;
using	aptk::search::brfs::IW;



typedef         H2_Heuristic<Fwd_Search_Problem>                  	H2_Fwd;
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     	Gen_Lms_Fwd;





DFIW_Planner::DFIW_Planner()
	: STRIPS_Interface(), m_iw_bound(2), m_log_filename( "iw.log"), m_plan_filename( "plan.ipc" ) {
}

DFIW_Planner::DFIW_Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Interface( domain_file, instance_file ), m_iw_bound(2), m_log_filename( "iw.log" ), m_plan_filename( "plan.ipc" ) {
}

DFIW_Planner::~DFIW_Planner() {
}


void	
DFIW_Planner::setup(bool gen_match_tree) {
	// MRJ: Call superclass method, then do you own thing here
	STRIPS_Interface::setup(gen_match_tree);
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;

	std::string new_name = "df_" + instance()->domain_name();
	aptk::STRIPS_Problem::make_delete_relaxation( *instance(), m_df_relaxation );
	m_df_relaxation.set_domain_name( new_name );
	m_df_relaxation.set_problem_name( instance()->problem_name() );
	m_df_relaxation.make_action_tables(); 
}

float
DFIW_Planner::do_search( IW_Fwd& engine ) {
	
	engine.set_bound(m_iw_bound);
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
			const aptk::Action& a = *(m_df_relaxation.actions()[ plan[k] ]);
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
	} else {
		std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
	}
 	float total_time = aptk::time_used() - ref;
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	//std::cout << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
	//std::cout << "Average ef. width: " << engine.avg_B() << std::endl;
	//std::cout << "Max ef. width: " << engine.max_B() << std::endl;
	plan_stream.close();
	return total_time;	
}

void	
DFIW_Planner::solve() {

	Fwd_Search_Problem	search_prob( &m_df_relaxation );

	if ( !instance()->has_conditional_effects() ) {
		Fwd_Search_Problem actual( instance() );
		H2_Fwd    h2( actual );
		h2.compute_edeletes( m_df_relaxation );
	}
	else 
		instance()->compute_edeletes();	

	Gen_Lms_Fwd    gen_lms( search_prob );
	Landmarks_Graph graph( m_df_relaxation );

	gen_lms.set_only_goals( true );
	gen_lms.set_goal_ordering( false );

	gen_lms.compute_lm_graph_set_additive( graph );
	
	std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	graph.print( std::cout );
	
	std::cout << "Starting search with IW (time budget is 60 secs)..." << std::endl;

	IW_Fwd iw_engine( search_prob );
	
	float iw_t = do_search( iw_engine );
	
	std::cout << "IW search completed in " << iw_t << " secs, check '" << m_log_filename << "' for details" << std::endl;

}

