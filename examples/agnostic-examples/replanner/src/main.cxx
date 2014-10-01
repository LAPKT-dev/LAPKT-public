/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/**
 * NIR: In this example, we'll show how to create a replanner, 
 * illustrating how to change the initial and goal states, and solving the problem with bfs+h_max
 */
#include <iostream>
#include <fstream>

#include <ff_to_aptk.hxx>
#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>
#include <fwd_search_prob.hxx>

#include <h_1.hxx>

#include <aptk/open_list.hxx>
#include <aptk/string_conversions.hxx>
#include <aptk/at_bfs.hxx>

#include <fstream>

#include <boost/program_options.hpp>


namespace po = boost::program_options;

using	aptk::STRIPS_Problem;

using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;


using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::H_Max_Evaluation_Function;

using 	aptk::search::Open_List;
using	aptk::search::bfs::AT_BFS_SQ_SH;
using	aptk::search::Node_Comparer;



//NIR: We start defining the type of nodes for our planner
typedef		aptk::search::bfs::Node< aptk::State >	Search_Node;

//NIR: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer< Search_Node >					Tie_Breaking_Algorithm;


//NIR: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >		BFS_Open_List;


//NIR: Now we define the heuristics

typedef 	H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function>	H_Max_Fwd;

//NIR: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_BFS_SQ_SH< Fwd_Search_Problem, H_Max_Fwd, BFS_Open_List >		BFS_H_Max_Fwd;



float do_search(  Fwd_Search_Problem& search_prob,  std::vector< aptk::Action_Idx >& plan, float& cost,std::ofstream& details, std::string plan_filename,  bool anytime, bool delayed, bool greedy  ) {

	cost = infty;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	BFS_H_Max_Fwd engine( search_prob );
	engine.set_greedy( greedy );
	engine.set_delay_eval( delayed );
	engine.start();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	while ( engine.find_solution( cost, plan ) ) {
		if ( !plan.empty() ) {
			details << "Plan found with cost: " << cost << std::endl;
			if( anytime ) std::cout << "Plan found with cost: " << cost << std::endl;
			std::ofstream plan_stream( plan_filename.c_str() );
			for ( unsigned k = 0; k < plan.size(); k++ ) {
				details << k+1 << ". ";
				const aptk::Action& a = *(search_prob.task().actions()[ plan[k] ]);
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
		if(anytime){
			std::cout << "Time: " << tf - t0 << std::endl;
			std::cout << "Generated: " << generated_f - generated_0 << std::endl;
			std::cout << "Expanded: " << expanded_f - expanded_0 << std::endl << std::endl;
		}
		t0 = tf;
		expanded_0 = expanded_f;
		generated_0 = generated_f;

		if(!anytime) break;
		plan.clear();

	}

	float total_time = aptk::time_used() - ref;
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;
	std::cout << "Plan found with cost: " << cost << std::endl;

	return total_time;


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
		( "greedy", po::value<bool>()->default_value(false), "Greedy (default False)" )
		( "delayed", po::value<bool>()->default_value(false), "Delayed Evaluation (default False)" )
		( "anytime", po::value<bool>()->default_value(false), "Anytime (default False)" )
		( "output", po::value<std::string>(), "Output file for plan" )
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

/**
 * NIR: this function illustrates how can we change initial and goal states
 * without having to parse the problem again.
 *
 * It applies first action of the plan to progress initial state, 
 * and last action of the plan to regress goal state
 */
void change_init_goal_state( STRIPS_Problem& prob,  std::vector< aptk::Action_Idx >& plan, std::ofstream& details){

	//NIR: theres nothing to change if there not a plan
	if( plan.empty() ) return;

	//NIR: Create current init and goal states
	aptk::State root( prob );
	root.set( prob.init() );

	aptk::State goal( prob );
	goal.set( prob.goal() );
	
	//NIR: Ger first and last action of the current plan
	aptk::Action* first_action_plan = prob.actions()[ plan.front() ];
	aptk::Action* last_action_plan = prob.actions()[ plan.back() ];

	//NIR: Printing useful info
	details << "\tProgressing through " << first_action_plan->signature() << std::endl;
	details << "\tRegressing through " << last_action_plan->signature() << std::endl;	
	std::cout << "\tProgressing through " << first_action_plan->signature() << std::endl;
	std::cout << "\tRegressing through " << last_action_plan->signature() << std::endl;

	//NIR Progress the initial state
	aptk::State* next_root_state = root.progress_through( *first_action_plan  );

	//NIR: Regress the goal state
	aptk::State* next_goal_state = goal.regress_through( *last_action_plan  );
	
	//NIR: Set the new initial and goal states
	STRIPS_Problem::set_init( prob, next_root_state->fluent_vec() );
	STRIPS_Problem::set_goal( prob, next_goal_state->fluent_vec() );
	
	//Nir: Don't forget to delete the new states resulting from the progression :)
	delete next_root_state;
	delete next_goal_state;
}

int main( int argc, char** argv ) {

	po::variables_map vm;

	process_command_line_options( argc, argv, vm );

	
	if ( !vm.count( "domain" ) ) {
		std::cerr << "No PDDL domain was specified!" << std::endl;
		std::exit(1);
	}

	if ( !vm.count( "problem" ) ) {
		std::cerr << "No PDDL problem was specified!" << std::endl;
		std::exit(1);
	}

	std::string plan_filename;	
	if ( !vm.count( "output" ) ) {
		std::cerr << "No output plan file specified, defaulting to 'plan.ipc'" << std::endl;
		plan_filename = "plan.ipc";
	}
	else
		plan_filename = vm["output"].as<std::string>();



	bool anytime = vm["anytime"].as<bool>();
	bool delayed = vm["delayed"].as<bool>();
	bool greedy =  vm["greedy"].as<bool>();


	std::ofstream details( "execution.details" );

	STRIPS_Problem	prob;

	//NIR: Load PDDL files and save info in our STRIPS_Problem
	aptk::FF_Parser::get_problem_description( vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob );

	details << "PDDL problem description loaded: " << std::endl;
	details << "\tDomain: " << prob.domain_name() << std::endl;
	details << "\tProblem: " << prob.problem_name() << std::endl;
	details << "\t#Actions: " << prob.num_actions() << std::endl;
	details << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );
	std::vector< aptk::Action_Idx > plan;

	do{
		plan.clear();
		float cost = 0;
		
		details << "Initial State: ";
		prob.print_fluent_vec( details, prob.init());
		details << std::endl;

		details << "Goal State: ";
		prob.print_fluent_vec( details, prob.goal());
		details << std::endl;

		std::cout << "Initial State: ";
		prob.print_fluent_vec( std::cout, prob.init());
		std::cout << std::endl;
		std::cout << "Goal State: ";
		prob.print_fluent_vec( std::cout, prob.goal());
		std::cout << std::endl;


		float at_search_t = do_search(search_prob, plan, cost, details, plan_filename,  anytime, delayed, greedy );	  

		details << "Best First H_max search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
		std::cout << "Best First H_max search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;


		/**
		 * NIR: Apply first action of the plan to progress initial state, 
		 * and last action of the plan to regress goal state
		 */		
		change_init_goal_state( prob, plan, details );


		details << "*****************************" << std::endl;
		std::cout <<  "*****************************" << std::endl;

	}while( !plan.empty() );

	details.close();

	return 0;
}
