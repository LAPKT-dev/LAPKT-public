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
#include <common/nwn.hxx>

#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>

#include <fwd_search_prob.hxx>

#include <h_1.hxx>
#include <rp_heuristic.hxx>
#include <h_unsat.hxx>

#include <aptk/open_list.hxx>
#include <aptk/at_bfs_dq_mh.hxx>
#include <aptk/at_wbfs_dq_mh.hxx>
#include <aptk/at_rwbfs_dq_mh.hxx>
#include <aptk/string_conversions.hxx>

using	aptk::STRIPS_Problem;
using	aptk::State;
using	aptk::Action;

using	aptk::agnostic::Fwd_Search_Problem;

using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using	aptk::agnostic::Unsat_Goals_Heuristic;

using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer_DH;
using 	aptk::search::bfs_dq_mh::Node;
using	aptk::search::bfs_dq_mh::AT_BFS_DQ_MH;
using	aptk::search::bfs_dq_mh::AT_WBFS_DQ_MH;
using	aptk::search::bfs_dq_mh::AT_RWBFS_DQ_MH;

// MRJ: We start defining the type of nodes for our planner
typedef		Node< State >							Search_Node;

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer_DH< Search_Node >					Tie_Breaking_Algorithm;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >			BFS_Open_List;

// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd;
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		H_Add_Rp_Fwd;
typedef		Unsat_Goals_Heuristic< Fwd_Search_Problem >		H_Unsat;

// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_BFS_DQ_MH< Fwd_Search_Problem, H_Add_Rp_Fwd, H_Unsat, BFS_Open_List >		Anytime_BFS_H_Add_Rp_Fwd;
typedef		AT_WBFS_DQ_MH< Fwd_Search_Problem, H_Add_Rp_Fwd, H_Unsat, BFS_Open_List >		Anytime_WBFS_H_Add_Rp_Fwd;
typedef		AT_RWBFS_DQ_MH< Fwd_Search_Problem, H_Add_Rp_Fwd, H_Unsat, BFS_Open_List >		Anytime_RWBFS_H_Add_Rp_Fwd;

template <typename Search_Engine>
float do_search( Search_Engine& engine, STRIPS_Problem& plan_prob, float budget, std::string logfile ) {

	std::ofstream out( logfile.c_str() );

	engine.set_budget( budget );
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	while ( engine.find_solution( cost, plan ) ) {
		out << "Plan found with cost: " << cost << std::endl;
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			out << k+1 << ". ";
			const Action& a = *(plan_prob.actions()[ plan[k] ]);
			out << a.signature();
			out << std::endl;
		}
		float tf = aptk::time_used();
		unsigned expanded_f = engine.expanded();
		unsigned generated_f = engine.generated();
		out << "Time: " << tf - t0 << std::endl;
		out << "Generated: " << generated_f - generated_0 << std::endl;
		out << "Expanded: " << expanded_f - expanded_0 << std::endl;
		t0 = tf;
		expanded_0 = expanded_f;
		generated_0 = generated_f;
		plan.clear();
	}
	float total_time = aptk::time_used() - ref;
	out << "Total time: " << total_time << std::endl;
	out << "Nodes generated during search: " << engine.generated() << std::endl;
	out << "Nodes expanded during search: " << engine.expanded() << std::endl;
	out << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	out << "Dead-end nodes: " << engine.dead_ends() << std::endl;
	out << "Nodes in OPEN replaced: " << engine.open_repl() << std::endl;

	out.close();

	return total_time;
}

int main( int argc, char** argv ) {

	int 	dim = 5;
	float 	block_prob = 0.1f;
	int	n_items = 4;
	int	n_goal_items = 2;
	int 	n_goal_locs = 1;
	float	W_0 = 5.0f;
	float	decay = 0.75f;

	int i = 1;
	while ( i < argc ) {
		std::string parm = argv[i];
		if ( parm == "--dim" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( dim, value, std::dec );
			std::cout << "Grid dimensions set to " << dim << std::endl;
			i++;
			continue;	
		}
		if ( parm == "--block-prob" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( block_prob, value, std::dec );
			std::cout << "Block probability set to " << block_prob << std::endl;
			i++;
			continue;
		}
		if ( parm == "--num-items" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( n_items, value, std::dec );
			std::cout << "Number of items set to " << n_items << std::endl;
			i++;
			continue;
		}
		if ( parm == "--num-goal-items" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( n_goal_items, value, std::dec );
			std::cout << "Number of items relevant to goal set to " << n_goal_items << std::endl;
			i++;
			continue;
		}
		if ( parm == "--num-goal-locations" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( n_goal_locs, value, std::dec );
			std::cout << "Number of locations relevant to goal set to " << n_goal_locs << std::endl;
			i++;
			continue;
		}
		if ( parm == "--heuristic-weight" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( W_0, value, std::dec );
			std::cout << "Initial heuristic weight W set to " << W_0 << std::endl;
			i++; 
		}
		if ( parm == "--heuristic-weight-decay" ) {
			i++;
			std::string value = argv[i];
			aptk::from_string( decay, value, std::dec );
			std::cout << "Initial heuristic weight W set to " << W_0 << std::endl;
			i++; 			
		}
	}

	NWN_Mockup fake_nwn_situation;
	STRIPS_Problem plan_prob;
	
	fake_nwn_situation.setup_nav_graph( dim, dim, block_prob );
	fake_nwn_situation.add_items( n_items );
	fake_nwn_situation.build_strips_problem( n_goal_items, n_goal_locs, plan_prob );

	std::cout << "Dumping STRIPS problem on file 'problem.strips'" << std::endl;
	std::ofstream outstream( "problem.strips" );
	plan_prob.print( outstream );
	outstream.close();
	std::cout << "Problem statistics:" << std::endl;
	std::cout << "\t# Fluents: " << plan_prob.num_fluents() << std::endl;
	std::cout << "\t# Actions: " << plan_prob.num_actions() << std::endl;
	std::cout << "Initial state: " << std::endl;
	plan_prob.print_fluent_vec( std::cout, plan_prob.init() );
	std::cout << std::endl;
	std::cout << "Goal state: " << std::endl;
	plan_prob.print_fluent_vec( std::cout, plan_prob.goal() );
	std::cout << std::endl;


	Fwd_Search_Problem	search_prob( &plan_prob );


	std::cout << "Starting search with plain BFS (time budget is 5 secs)..." << std::endl;

	Anytime_BFS_H_Add_Rp_Fwd bfs_engine( search_prob );
	bfs_engine.set_schedule( 10, 5, 1 );
	float bfs_t = do_search( bfs_engine, plan_prob, 5.0f, "bfs-dq-mh.log" );

	std::cout << "BFS search completed in " << bfs_t << " secs, check 'bfs-dq-mh.log' for details" << std::endl;

	std::cout << "Starting search with Weighted BFS (time budget is 5 secs)..." << std::endl;

	Anytime_WBFS_H_Add_Rp_Fwd wbfs_engine( search_prob, W_0, decay);
	wbfs_engine.set_schedule( 10, 5, 1 );
	float wbfs_t = do_search( wbfs_engine, plan_prob, 5.0f, "wbfs-dq-mh.log" );
	
	std::cout << "Weighted BFS search completed in " << wbfs_t << " secs, check 'wbfs-dq-mh.log' for details" << std::endl;

	std::cout << "Starting search with Restarting Weighted BFS (time budget is 5 secs)" << std::endl;

	Anytime_RWBFS_H_Add_Rp_Fwd rwbfs_engine( search_prob, W_0, decay );
	rwbfs_engine.set_schedule( 10, 5, 1 );
	
	float rwbfs_t = do_search( rwbfs_engine, plan_prob, 5.0f, "rwbfs-dq-mh.log" );
	
	std::cout << "Restarting Weighted BFS search completed in " << rwbfs_t << " secs, check 'rwbfs-dq-mh.log' for details" << std::endl;	

	return 0;
}
