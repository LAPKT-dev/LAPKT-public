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

// MRJ: In this example, we'll show how to create a search problem out of
// a planning problem we acquired from some external source
#include <iostream>
#include <fstream>

#include <ff_to_aptk.hxx>
#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>
#include <fwd_search_prob.hxx>

#include <novelty_partition.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <landmark_graph_manager.hxx>
#include <landmark_count.hxx>
#include <h_2.hxx>
#include <h_1.hxx>
#include <layered_h_max.hxx>

#include <rp_heuristic.hxx>
#include <ff_rp_heuristic.hxx>

#include <aptk/open_list.hxx>
#include <aptk/at_gbfs_3h.hxx>
#include <aptk/string_conversions.hxx>

#include <boost/program_options.hpp>

namespace po = boost::program_options;

using	aptk::STRIPS_Problem;
using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using 	aptk::agnostic::Landmarks_Graph;
using 	aptk::agnostic::Landmarks_Graph_Generator;
using   aptk::agnostic::Landmarks_Graph_Manager;
using 	aptk::agnostic::Landmarks_Count_Heuristic;
using 	aptk::agnostic::H2_Heuristic;
using 	aptk::agnostic::H1_Heuristic;
using   aptk::agnostic::Layered_H_Max;

using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::H_Max_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using   aptk::agnostic::FF_Relaxed_Plan_Heuristic;
using 	aptk::agnostic::Novelty_Partition;


using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer_3H;
using	aptk::search::gbfs_3h::AT_GBFS_3H;
//using	aptk::search::gbfs_mh::Node;


typedef         H2_Heuristic<Fwd_Search_Problem>                  H2_Fwd;
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     Gen_Lms_Fwd;
typedef         Landmarks_Count_Heuristic<Fwd_Search_Problem>     H_Lmcount_Fwd;
typedef         Landmarks_Graph_Manager<Fwd_Search_Problem>       Land_Graph_Man;



// MRJ: We start defining the type of nodes for our planner
typedef		aptk::search::gbfs_3h::Node< Fwd_Search_Problem, aptk::State >	Search_Node;

typedef         Novelty_Partition<Fwd_Search_Problem, Search_Node>             H_Novel_Fwd;

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer_3H< Search_Node >					Tie_Breaking_Algorithm;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >		BFS_Open_List;

// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd;
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		H_Add_Rp_Fwd;

typedef         Layered_H_Max< Fwd_Search_Problem >				      Alt_H_Max;
typedef         FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, Alt_H_Max, unsigned >     Classic_FF_H_Max;

// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_GBFS_3H< Fwd_Search_Problem, H_Novel_Fwd, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List >    Anytime_GBFS_H_Add_Rp_Fwd;
typedef		AT_GBFS_3H< Fwd_Search_Problem, H_Novel_Fwd, H_Lmcount_Fwd, Classic_FF_H_Max, BFS_Open_List >    Anytime_GBFS_FF_Rp_Fwd;



template <typename Search_Engine>
float do_search( Search_Engine& engine, STRIPS_Problem& plan_prob, float max_novelty, std::ofstream& plan_stream ) {

	std::ofstream	details( "execution.details" );	
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	if ( engine.find_solution( cost, plan ) ) {
		details << "Plan found with cost: " << cost << std::endl;
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
	}
 	float total_time = aptk::time_used() - ref;
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	std::cout << "Plan found with cost: " << cost << std::endl;
	details.close();
	
	
	
	
	return total_time;
}


void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
	po::options_description desc( "Options:" );
	
	desc.add_options()
		( "help", "Show help message" )
		( "domain", po::value<std::string>(), "Input PDDL domain description" )
		( "problem", po::value<std::string>(), "Input PDDL problem description" )
		( "bound", po::value<int>()->default_value(2), "Max width w for novelty (default 2)")
		( "output", po::value<std::string>(), "Output file for plan" )
		( "one-ha-per-fluent", po::value<bool>()->default_value(false),
			"Extract only one helpful action per fluent" )
		( "use-original-ff-heur", po::value<bool>()->default_value(false),
			"Use original FF heuristic computed by layers" )
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

void report_no_solution( std::string reason, std::ofstream& plan_stream ) {
	plan_stream << ";; No solution found" << std::endl;
	plan_stream << ";; " << reason << std::endl;
	plan_stream.close();
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

	std::ofstream	plan_stream;
	
	if ( !vm.count( "output" ) ) {
		std::cerr << "No output plan file specified, defaulting to 'plan.ipc'" << std::endl;
		plan_stream.open( "plan.ipc" );
	}
	else
		plan_stream.open( vm["output"].as<std::string>() );


	STRIPS_Problem	prob;
	bool ignore_costs = true;

	aptk::FF_Parser::get_problem_description( vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob, ignore_costs  );
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << prob.domain_name() << std::endl;
	std::cout << "\tProblem: " << prob.problem_name() << std::endl;
	std::cout << "\t#Actions: " << prob.num_actions() << std::endl;
	std::cout << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );

	//if ( !prob.has_conditional_effects() ) {
	// 	H2_Fwd    h2( search_prob );
	// 	h2.compute_edeletes( prob );
	// 	if ( h2.eval( prob.goal() ) == infty ) {
	// 		std::ofstream	details( "execution.details" );
	// 		details << "Problem has no solution!" << std::endl;
	// 		details.close();
	// 		report_no_solution( "h2(s0) = infty", plan_stream );
	// 		return 0;	
	// 	}
	//
	//}
	//else
	// 	prob.compute_edeletes();	

	Gen_Lms_Fwd    gen_lms( search_prob );
	Landmarks_Graph graph( prob );

	//gen_lms.set_only_goals( true );
	
	gen_lms.compute_lm_graph_set_additive( graph );
	
	std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	//graph.print( std::cout );       

	





	if(vm["use-original-ff-heur"].as<bool>()){
		std::cout << "Starting search with BFS(novel,land,h_ff)..." << std::endl;

		Anytime_GBFS_FF_Rp_Fwd bfs_engine( search_prob );		
	
		bfs_engine.h3().set_one_HA_per_fluent( vm["one-ha-per-fluent"].as<bool>() );
		bfs_engine.h3().ignore_rp_h_value(false);

		Land_Graph_Man lgm( search_prob, &graph);
		bfs_engine.use_land_graph_manager( &lgm );
		
		unsigned max_novelty = 2;
		
		bfs_engine.set_arity( max_novelty, graph.num_landmarks_and_edges() );
		
		float bfs_t = do_search( bfs_engine, prob, max_novelty, plan_stream );
		
		std::cout << "BFS search completed in " << bfs_t << " secs" << std::endl;
	
	}
	else{
		std::cout << "Starting search with BFS(novel,land,h_add)..." << std::endl;

		Anytime_GBFS_H_Add_Rp_Fwd bfs_engine( search_prob );	
		bfs_engine.h3().set_one_HA_per_fluent( vm["one-ha-per-fluent"].as<bool>() );
		
		Land_Graph_Man lgm( search_prob, &graph);
		bfs_engine.use_land_graph_manager( &lgm );
		
		unsigned max_novelty = 2;
		
		bfs_engine.set_arity( max_novelty, graph.num_landmarks_and_edges() );
		
		float bfs_t = do_search( bfs_engine, prob, max_novelty, plan_stream );
		
		std::cout << "BFS search completed in " << bfs_t << " secs" << std::endl;
	}

	plan_stream.close();

	return 0;
}
