#include <rp_iw_planner.hxx>
#include <aptk/string_conversions.hxx>

#include <iostream>
#include <fstream>




RPIW_Planner::RPIW_Planner()
	: STRIPS_Problem(), m_iw_bound(2), m_log_filename( "rpiw.log"), m_plan_filename( "plan.ipc" ) {
}

RPIW_Planner::RPIW_Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Problem( domain_file, instance_file ), m_iw_bound(2), m_log_filename( "iw.log" ), m_plan_filename( "plan.ipc" ) {
}

RPIW_Planner::~RPIW_Planner() {
}


void	
RPIW_Planner::setup() {
	// MRJ: Call superclass method, then do you own thing here
	STRIPS_Problem::setup();
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;
}

float RPIW_Planner::do_search_single_goal( RP_IW_Fwd& engine, aptk::STRIPS_Problem& plan_prob, std::ofstream& plan_stream ) {


	std::ofstream	details( m_log_filename );		

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	aptk::Fluent_Vec goals = plan_prob.goal();
	float total_time = 0;
	
	float max_bound = m_iw_bound;

	bool solved = true;
	
	for( unsigned i = 0; i < goals.size(); i++){

		if(!solved)
			engine.set_bound(engine.bound()+1);
		else
			engine.set_bound(1);
		
		engine.start();
		aptk::Fluent_Vec new_goals;
		new_goals.push_back(goals[i]);
		aptk::STRIPS_Problem::set_goal( plan_prob, new_goals );

		if ( engine.find_solution( cost, plan ) ) {
			details << "Plan found with cost: " << cost << std::endl;
			std::cout << "Plan found with cost: " << cost << std::endl;
			for ( unsigned k = 0; k < plan.size(); k++ ) {
				details << k+1 << ". ";
				const aptk::Action& a = *(plan_prob.actions()[ plan[k] ]);
				details << a.signature();
				details << std::endl;
				plan_stream << a.signature() << std::endl;
			}
			plan.clear();
			solved = true;
		} else {
			details << ";; NOT I-REACHABLE ;;" << std::endl;
			std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
			solved = false;
			if( engine.bound() < max_bound){
				i--;
				continue;
			}
		}

		float partial_time = aptk::time_used() - ref;
		total_time = partial_time;
		details << "Total time: " << partial_time << std::endl;
		details << "Nodes generated during search: " << engine.generated() << std::endl;
		details << "Nodes expanded during search: " << engine.expanded() << std::endl;
		if(solved)
			details << "Effective Width during search: " << engine.arity() << std::endl;
		else
			details << "Effective Width during search: " << engine.arity()+10 << std::endl;
		
		//details << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
		//details << "Average ef. width: " << engine.avg_B() << std::endl;
		//details << "Max ef. width: " << engine.max_B() << std::endl;

		std::cout << "Total time: " << partial_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		if(solved)
			std::cout << "Effective Width during search: " << engine.arity() << std::endl;
		else{
			std::cout << "Effective Width during search: " << engine.arity()+10 << std::endl;
			solved=true;
		}
	}	

	details.close();	
	return total_time;
}

float RPIW_Planner::do_search( RP_IW_Fwd& engine, aptk::STRIPS_Problem& plan_prob, std::ofstream& plan_stream ) {


	std::ofstream	details( m_log_filename );
	
	engine.set_bound(m_iw_bound);
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();       
	
	if ( engine.find_solution( cost, plan ) ) {
		details << "Plan found with cost: " << cost << std::endl;
		std::cout << "Plan found with cost: " << cost << std::endl;
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			details << k+1 << ". ";
			const aptk::Action& a = *(plan_prob.actions()[ plan[k] ]);
			details << a.signature();
			details << std::endl;
			plan_stream << a.signature() << std::endl;
		}
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
	} else {
		details << ";; NOT I-REACHABLE ;;" << std::endl;
		std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
	}

 	float total_time = aptk::time_used() - ref;
	details << "Total time: " << total_time << std::endl;
	details << "Nodes generated during search: " << engine.generated() << std::endl;
	details << "Nodes expanded during search: " << engine.expanded() << std::endl;
	
	//details << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
	//details << "Average ef. width: " << engine.avg_B() << std::endl;
	//details << "Max ef. width: " << engine.max_B() << std::endl;
	details.close();
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	
	
	return total_time;
}

void	
RPIW_Planner::solve() {

	Fwd_Search_Problem	search_prob( instance() );

	std::ofstream plan_stream;
	plan_stream.open( m_plan_filename );
	std::cout << "Starting search with RPIW ..." << std::endl;

	RP_IW_Fwd engine( search_prob );
	

	//float iw_t = do_search( engine, prob, plan_stream );
	float iw_t = do_search_single_goal( engine, search_prob.task(), plan_stream );
	
	std::cout << "RPIW search completed in " << iw_t << " secs" << std::endl;

	plan_stream.close();

}

