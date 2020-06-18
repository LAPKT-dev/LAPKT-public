#include <planner.hxx>
#include <strips_state.hxx>
#include <aptk/string_conversions.hxx>

#include <iostream>
#include <fstream>

using	aptk::agnostic::Fwd_Search_Problem;

Planner::Planner()
	: STRIPS_Problem(), m_log_filename( "planner.log"), m_plan_filename( "plan.ipc" ) {
}

Planner::Planner( std::string domain_file, std::string instance_file )
	: STRIPS_Problem( domain_file, instance_file ),  m_log_filename( "planner.log" ), m_plan_filename( "plan.ipc" ) {
}

Planner::~Planner() {
}


void	
Planner::setup() {
	//Call superclass method, then do you own thing here
	STRIPS_Problem::setup();
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;

}

float
Planner::do_search(  ) {
    return 0.0;
}


void
Planner::dump_pddl( ) {
	
	std::cout << "NOT IMPLEMENTED YET :)" << std::endl;
	
	/*
	  std::ofstream domain_stream( domain.c_str() );
	  m_inst->write_domain( domain_stream );
	  std::ofstream problem_stream( problem.c_str() );
	  m_inst->write_problem( problem_stream );
	*/
}

void	
Planner::solve() {

	Fwd_Search_Problem	search_prob( instance() );

	do_search(  );
	

}

