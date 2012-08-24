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
#include <aptk/string_conversions.hxx>

using	aptk::STRIPS_Problem;
using	aptk::State;
using	aptk::Action;
using	aptk::agnostic::Fwd_Search_Problem;

int main( int argc, char** argv ) {

	int 	dim = 10;
	float 	block_prob = 0.1f;
	int	n_items = 12;
	int	n_goal_items = 5;
	int 	n_goal_locs = 4;
	int 	i = 1;

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

	// MRJ: Example of different successor generator modalities
	std::cout << "Applicable actions at root by direct checking: " << std::endl;
	State* s0 = search_prob.init();
	
	for ( int i = 0; i < search_prob.num_actions(); i++ ) {
		if ( search_prob.is_applicable( *s0, i ) ) 
			std::cout << plan_prob.actions()[i]->signature() << std::endl;		
	}

	std::cout << "Applicable actions at root with successor generator: " << std::endl;
	std::vector< aptk::Action_Idx > app_set;
	search_prob.applicable_set( *s0, app_set );
	for ( int i = 0; i < app_set.size(); i++ ) {
		std::cout << plan_prob.actions()[app_set[i]]->signature() << std::endl;		
	}

	std::cout << "Applicable actions at root with iterator interface: " << std::endl;
	Fwd_Search_Problem::Action_Iterator it(search_prob);
	int a = it.start( *s0 );
	while (a != aptk::no_op) {
		std::cout << plan_prob.actions()[a]->signature() << std::endl;	
		a = it.next();
	}

	return 0;
}
