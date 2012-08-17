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
#include <aptk/open_list.hxx>
#include <aptk/at_wbfs.hxx>
#include <aptk/at_wbfs_dq.hxx>
#include <aptk/at_rwbfs_dq.hxx>
#include <aptk/string_conversions.hxx>

using	aptk::STRIPS_Problem;
using	aptk::State;
using	aptk::Action;
using	aptk::agnostic::Fwd_Search_Problem;
using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::H_Max_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer;
using	aptk::search::bfs::AT_WBFS_SQ_SH;
using	aptk::search::bfs_dq::AT_WBFS_DQ_SH;
using	aptk::search::bfs_dq::AT_RWBFS_DQ_SH;
using	aptk::search::bfs::Node;

// MRJ: We start defining the type of nodes for our planner
typedef		Node< State >							Search_Node;
typedef	aptk::search::bfs_dq::Node< State >					DQ_Search_Node;				

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer< Search_Node >					Tie_Breaking_Algorithm;
typedef		Node_Comparer< DQ_Search_Node >					DQ_Tie_Breaking_Algorithm;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >			BFS_Open_List;
typedef		Open_List< DQ_Tie_Breaking_Algorithm, DQ_Search_Node >			DQ_BFS_Open_List;

// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function>	H_Max_Fwd;
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd;
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd >		H_FF_Fwd;
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		H_Add_Rp_Fwd;

// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_WBFS_SQ_SH< Fwd_Search_Problem, H_Add_Fwd, BFS_Open_List >		Anytime_WBFS_H_Add;
typedef		AT_WBFS_SQ_SH< Fwd_Search_Problem, H_Max_Fwd, BFS_Open_List >		Anytime_WBFS_H_Max;
typedef		AT_WBFS_SQ_SH< Fwd_Search_Problem, H_FF_Fwd, BFS_Open_List >		Anytime_WBFS_H_FF;
typedef		AT_WBFS_SQ_SH< Fwd_Search_Problem, H_Add_Rp_Fwd, BFS_Open_List >	Anytime_WBFS_H_Add_Rp_Fwd;


typedef		AT_WBFS_DQ_SH< Fwd_Search_Problem, H_FF_Fwd, DQ_BFS_Open_List >		Anytime_DQ_WBFS_H_FF;
typedef		AT_WBFS_DQ_SH< Fwd_Search_Problem, H_Add_Rp_Fwd, DQ_BFS_Open_List >	Anytime_DQ_WBFS_H_Add_Rp_Fwd;
typedef		AT_RWBFS_DQ_SH< Fwd_Search_Problem, H_Add_Rp_Fwd, DQ_BFS_Open_List >	Anytime_DQ_RWBFS_H_Add_Rp_Fwd;

int main( int argc, char** argv ) {

	int 	dim = 10;
	float 	block_prob = 0.1f;
	int	n_items = 12;
	int	n_goal_items = 5;
	int 	n_goal_locs = 4;
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
			aptk::from_string( n_goal_items, value, std::dec );
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

	std::cout << "Starting search..." << std::endl;

	Fwd_Search_Problem	search_prob( &plan_prob );

	// MRJ: Uncomment for seeing how the combination of search strategy
	// and heuristic work for the particular class of problems generated by
	// the NWN Mock up

	//Anytime_WBFS_H_Add_Rp_Fwd search_engine( search_prob, W_0, decay);
	//Anytime_WBFS_H_FF	search_engine( search_prob, W_0, decay );
	//Anytime_DQ_WBFS_H_Add_Rp_Fwd search_engine( search_prob, W_0, decay );
	Anytime_DQ_RWBFS_H_Add_Rp_Fwd search_engine( search_prob, W_0, decay );

	// MRJ: Only works for DQ search engines. Allows to control the 'greediness'
	// of the search while maintaining completeness (which is a big difference
	// w.r.t. FF).
	search_engine.set_schedule( 100, 1 );

	search_engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float 		ref = aptk::time_used();
	float t0 = aptk::time_used();
	unsigned expanded_0 = search_engine.expanded();
	unsigned generated_0 = search_engine.generated();
	while ( search_engine.find_solution( cost, plan ) ) {
		std::cout << "Plan found with cost: " << cost << std::endl;
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			std::cout << k+1 << ". ";
			const Action& a = *(plan_prob.actions()[ plan[k] ]);
			std::cout << a.signature();
			std::cout << std::endl;
		}
		float tf = aptk::time_used();
		unsigned expanded_f = search_engine.expanded();
		unsigned generated_f = search_engine.generated();
		std::cout << "Time: " << tf - t0 << std::endl;
		std::cout << "Generated: " << generated_f - generated_0 << std::endl;
		std::cout << "Expanded: " << expanded_f - expanded_0 << std::endl;
		t0 = tf;
		expanded_0 = expanded_f;
		generated_0 = generated_f;
		plan.clear();
	}
	std::cout << "Total time: " << aptk::time_used() - ref << std::endl;
	std::cout << "Nodes generated during search: " << search_engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << search_engine.expanded() << std::endl;
	std::cout << "Nodes pruned by bound: " << search_engine.pruned_by_bound() << std::endl;
	std::cout << "Dead-end nodes: " << search_engine.dead_ends() << std::endl;
	std::cout << "Nodes in OPEN replaced: " << search_engine.open_repl() << std::endl;

	return 0;
}
