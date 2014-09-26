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

#include <novelty.hxx>
#include <novelty_partition.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <landmark_graph_manager.hxx>
#include <landmark_count.hxx>
#include <h_2.hxx>
#include <h_1.hxx>
#include <rp_heuristic.hxx>

#include <aptk/open_list.hxx>
#include <aptk/at_gbfs_3h.hxx>
#include <aptk/string_conversions.hxx>
#include <ipc2014_rwa.hxx>
#include <aptk/iw.hxx>
#include <aptk/serialized_search.hxx>
#include <aptk/siw.hxx>

#include <fstream>

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
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using 	aptk::agnostic::Novelty_Partition;

using 	aptk::agnostic::Novelty;
using	aptk::search::brfs::IW;
using	aptk::search::Serialized_Search;

using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer_DH;
using	aptk::search::Node_Comparer_3H;
using	aptk::search::gbfs_3h::AT_GBFS_3H;
//using	aptk::search::gbfs_mh::Node;

using	aptk::search::bfs_dq_mh::IPC2014_RWA;

typedef         H2_Heuristic<Fwd_Search_Problem>                  H2_Fwd;
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     Gen_Lms_Fwd;
typedef         Landmarks_Count_Heuristic<Fwd_Search_Problem>     H_Lmcount_Fwd;
typedef         Landmarks_Graph_Manager<Fwd_Search_Problem>       Land_Graph_Man;

// MRJ: We start defining the type of nodes for our planner
typedef		aptk::search::gbfs_3h::Node< Fwd_Search_Problem, aptk::State >	Search_Node;
typedef         Novelty_Partition<Fwd_Search_Problem, Search_Node>              H_Novel_Fwd;

typedef		aptk::search::ipc2014::Node< aptk::State >		AT_Search_Node;

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer_3H< Search_Node >					Tie_Breaking_Algorithm;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >		BFS_Open_List;
typedef		AT_Search_Node::Open_List					AT_BFS_Open_List;


// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd; //, aptk::agnostic::H1_Cost_Function::Ignore_Costs
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		H_Add_Rp_Fwd;

// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_GBFS_3H< Fwd_Search_Problem, H_Novel_Fwd, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List >    	Anytime_GBFS_H_Add_Rp_Fwd;
//typedef		AT_RWBFS_DQ_MH< Fwd_Search_Problem, H_Add_Rp_Fwd, H_Unsat /*H_Lmcount_Fwd*/, AT_BFS_Open_List >		Anytime_RWA;
typedef		IPC2014_RWA< Fwd_Search_Problem, H_Add_Rp_Fwd, H_Lmcount_Fwd, AT_BFS_Open_List >		Anytime_RWA;


// MRJ: SIW definitions
typedef		aptk::search::brfs::Node< aptk::State >	          	IW_Node;
typedef         Novelty<Fwd_Search_Problem, IW_Node>                    H_Simple_Novel_Fwd;
typedef		aptk::search::SIW< aptk::agnostic::Fwd_Search_Problem >  SIW_Fwd;
typedef		IW< Fwd_Search_Problem, H_Simple_Novel_Fwd >	        IW_Fwd;


float do_stage_1( STRIPS_Problem& prob, SIW_Fwd& engine,  float& cost, int iw_bound, std::ofstream& details, std::string plan_filename ) {
	engine.set_max_bound( iw_bound );
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	cost = 0.0f;;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	if ( engine.find_solution( cost, plan ) ) {
		details << "Plan found with cost: " << cost << std::endl;
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

float do_stage_3(  STRIPS_Problem& prob, Anytime_RWA& engine, float B, float& cost,std::ofstream& details, std::string plan_filename  ) {
	engine.start(B);
	details << "Branch & Bound search: Initial Bound = " << B << std::endl;
	engine.set_schedule( 1000, 1, 10 );

	std::vector< aptk::Action_Idx > plan;
	cost = infty;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	while ( engine.find_solution( cost, plan ) ) {
		if ( !plan.empty() ) {
			details << "Plan found with cost: " << cost << std::endl;
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
	return total_time;
}

float do_stage_2(  STRIPS_Problem& prob, Anytime_GBFS_H_Add_Rp_Fwd& engine, float B, float& cost,std::ofstream& details, std::string plan_filename  ) {
	
	engine.start(B);

	std::vector< aptk::Action_Idx > plan;
	cost = 0.0f;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();


	if ( engine.find_solution( cost, plan ) ) {
		details << "Plan found with cost: " << cost << std::endl;
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


	bool enable_siw = !vm["disable-siw"].as<bool>();
	bool enable_bfs_f = !vm["disable-bfs-f"].as<bool>();

	std::ofstream details( "execution.details" );

	STRIPS_Problem	prob;

	aptk::FF_Parser::get_problem_description( vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob );
	details << "PDDL problem description loaded: " << std::endl;
	details << "\tDomain: " << prob.domain_name() << std::endl;
	details << "\tProblem: " << prob.problem_name() << std::endl;
	details << "\t#Actions: " << prob.num_actions() << std::endl;
	details << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );

	// if ( !prob.has_conditional_effects() ) {
	// 	H2_Fwd    h2( search_prob );
	// 	h2.compute_edeletes( prob );
	// 	if ( h2.eval( prob.goal() ) == infty ) {
	// 		details << "Problem has no solution!" << std::endl;
	// 		report_no_solution( "h2(s0) = infty", plan_filename );
	// 		return 0;	
	// 	}
	// }
	// else
	// 	prob.compute_edeletes();	


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
		float iw_t = do_stage_1(prob, siw_engine, siw_cost, vm["iw-bound"].as<int>(), details, plan_filename  );
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
		bfs_engine.set_arity( vm["max-novelty"].as<int>(), graph.num_landmarks_and_edges() );
		
		float bfs_t = do_stage_2(prob,  bfs_engine, siw_cost, bfs_f_cost, details, plan_filename  );
		details << "BFS(f) search completed in " << bfs_t << " secs, found plan cost = " << bfs_f_cost << std::endl;
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
		Anytime_RWA wbfs_engine( search_prob, 10.0f, 0.95f);
		//wbfs_engine.h2().set_graph( &graph );
		wbfs_engine.use_land_graph_manager( &lgm );
		float at_search_t = do_stage_3(prob, wbfs_engine, std::min(bfs_f_cost,siw_cost), rwa_cost, details, plan_filename );
		details << "RWA search completed in " << at_search_t << " secs, found plan cost = " << rwa_cost << std::endl;
	}

	details.close();

	return 0;
}
