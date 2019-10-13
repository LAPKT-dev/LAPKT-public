#include <brfs_planner.hxx>
#include <fstream>

BRFS_Planner::BRFS_Planner()
	: STRIPS_Problem(), m_log_filename( "iw.log"), m_plan_filename( "plan.ipc" ){
}

BRFS_Planner::BRFS_Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Problem( domain_file, instance_file ), m_log_filename( "iw.log" ), m_plan_filename( "plan.ipc" ) {
}

BRFS_Planner::~BRFS_Planner() {
}


void	
BRFS_Planner::setup() {
	// MRJ: Call superclass method, then do you own thing here
	STRIPS_Problem::setup();
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;

}

float
BRFS_Planner::do_search( BRFS_Fwd& engine ) {
	
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
BRFS_Planner::solve() {

	Fwd_Search_Problem	search_prob( instance() );
	
	std::cout << "Starting search with BRFS (time budget is 60 secs)..." << std::endl;

	BRFS_Fwd brfs_engine( search_prob );


	float brfs_t = do_search( brfs_engine );
	
	std::cout << "BRFS search completed in " << brfs_t << " secs, check '" << m_log_filename << "' for details" << std::endl;

}

