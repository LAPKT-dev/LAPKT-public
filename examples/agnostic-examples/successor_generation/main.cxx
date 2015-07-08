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
#include <vector>
#include <common/nwn.hxx>

#include <strips_prob.hxx>
#include <watched_lit_succ_gen.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>

#include <fwd_search_prob.hxx>
#include <aptk/string_conversions.hxx>
#include <aptk/time.hxx>

using	aptk::STRIPS_Problem;
using	aptk::State;
using	aptk::Action;
using	aptk::agnostic::Fwd_Search_Problem;

using aptk::WatchedLitSuccGen;

int main( int argc, char** argv ) {

	int 	dim = 10;
	float 	block_prob = 0.1f;
	int	n_items = 12;
	int	n_goal_items = 5;
	int 	n_goal_locs = 4;
	int 	i = 1;
	
	int TRIALS = 2000;

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
		if ( parm == "--trials" ) {
		    i++;
		    std::string value = argv[i];
		    aptk::from_string( TRIALS, value, std::dec );
		    std::cout << "Number of trials set to " << TRIALS << std::endl;
		    i++;
		    continue;
		}
		if( parm == "--help"){
		    std::cout << "::Options::" << std::endl;
		    std::cout << "\t--dim <int> \t\t\t default 10" << std::endl;
		    std::cout << "\t--block-prob <float> \t\t default 0.1f" << std::endl;
		    std::cout << "\t--num-items <int> \t\t default 12" << std::endl;
		    std::cout << "\t--num-goal-items <int> \t\t default 5" << std::endl;
		    std::cout << "\t--num-goal-locations <int> \t default 4" << std::endl;
		    std::cout << "\t--trials <int> \t\t\t default 2000" << std::endl;
		    return 0;
		 
		}
		    
	}

	NWN_Mockup fake_nwn_situation;
	STRIPS_Problem plan_prob;
	
	fake_nwn_situation.setup_nav_graph( dim, dim, block_prob );
	fake_nwn_situation.add_items( n_items );
	fake_nwn_situation.build_strips_problem( n_goal_items, n_goal_locs, plan_prob );
	
	Fwd_Search_Problem	search_prob( &plan_prob );

	int total_action_pres = 0;
	for ( int i = 0; i < search_prob.num_actions(); i++ ) {
		total_action_pres += plan_prob.actions()[i]->prec_vec().size();
	}

	std::cout << "Dumping STRIPS problem on file 'problem.strips'" << std::endl;
	std::ofstream outstream( "problem.strips" );
	plan_prob.print( outstream );
	outstream.close();
	std::cout << "Problem statistics:" << std::endl;
	std::cout << "\t# Fluents: " << plan_prob.num_fluents() << std::endl;
	std::cout << "\t# Actions: " << plan_prob.num_actions() << std::endl;
	std::cout << "\t# Avg Prec Size: " << (float(total_action_pres) / float(search_prob.num_actions())) << std::endl;
	std::cout << "Initial state: " << std::endl;
	plan_prob.print_fluent_vec( std::cout, plan_prob.init() );
	std::cout << std::endl;
	std::cout << "Goal state: " << std::endl;
	plan_prob.print_fluent_vec( std::cout, plan_prob.goal() );
	std::cout << std::endl;

	float old_time;

	// MRJ: Example of different successor generator modalities
	std::cout << std::endl << "Applicable actions at root by direct checking: " << std::endl;
	State* s0 = search_prob.init();
	old_time = aptk::time_used();
	int n = 0;
	
	for (int trial = 0; trial < TRIALS; trial++) {
		for ( int i = 0; i < search_prob.num_actions(); i++ ) {
			if ( search_prob.is_applicable( *s0, i ) ) {
				n++;
			    if (1 == TRIALS)
    				std::cout << plan_prob.actions()[i]->signature() << std::endl;
				//std::cout << '.';
			}
		}
	}
	//std::cout << std::endl;
	std::cout << "Generated: " << n << std::endl;
	std::cout << "Time: " << (aptk::time_used() - old_time) << std::endl << std::endl;
	
	/** NIR: currently by default we use match tree, 
	 * therefore we have to explicitly initialize the old successor generator
	 */
	plan_prob.initialize_successor_generator();

	//NIR: Initialize both successor generators
	plan_prob.make_action_tables();

	WatchedLitSuccGen w_succ_gen(plan_prob);

	old_time = aptk::time_used();

	std::cout << "Applicable actions at root with successor generator: " << std::endl;
	n = 0;
	for (int trial = 0; trial < TRIALS; trial++) {
		std::vector< aptk::Action_Idx > app_set;
		search_prob.applicable_set( *s0, app_set );
		for ( unsigned i = 0; i < app_set.size(); i++ ) {
			n++;
		    if (1 == TRIALS)
    			std::cout << plan_prob.actions()[app_set[i]]->signature() << std::endl;
			//std::cout << '.';
		}
	}
	//std::cout << std::endl;
	std::cout << "Generated: " << n << std::endl;
	std::cout << "Time: " << (aptk::time_used() - old_time) << std::endl << std::endl;
	
	
	std::cout << "Applicable actions at root with iterator interface: " << std::endl;
	old_time = aptk::time_used();
	Fwd_Search_Problem::Action_Iterator it(search_prob);
	n = 0;
	for (int trial = 0; trial < TRIALS; trial++) {
		int a = it.start( *s0 );
		while (a != aptk::no_op) {
			n++;
			if (1 == TRIALS)
			    std::cout << plan_prob.actions()[a]->signature() << std::endl;
			//std::cout << '.';
			a = it.next();
		}
	}
	//std::cout << std::endl;
	std::cout << "Generated: " << n << std::endl;

	std::cout << "Time: " << (aptk::time_used() - old_time) << std::endl << std::endl;
	old_time = aptk::time_used();
	

	old_time = aptk::time_used();

	
	std::cout << "Applicable actions at root with the new match tree: " << std::endl;
	n = 0;
	std::vector< aptk::Action_Idx > app_set;

	for (int trial = 0; trial < TRIALS; trial++) {
		app_set.clear();
		search_prob.applicable_set_v2( *s0, app_set );
		for ( unsigned i = 0; i < app_set.size(); i++ ) {
			n++;
			if (1 == TRIALS)
                std::cout << plan_prob.actions()[app_set[i]]->signature() << std::endl;
			//std::cout << '.';
		}
	}
	//std::cout << std::endl;
	std::cout << "Generated: " << n << std::endl;
	std::cout << "Time: " << (aptk::time_used() - old_time) << std::endl << std::endl;


	old_time = aptk::time_used();


	n = 0;	
	std::cout << "Applicable actions at root with watched literals iterator: " << std::endl;
	for (int trial = 0; trial < TRIALS; trial++) {
		for (auto i = w_succ_gen.applicable_actions(*s0) ; !i.finished(); ++i){
			n++;
			if (1 == TRIALS)
                std::cout << plan_prob.actions()[*i]->signature() << std::endl;
			// std::cout << '.';
		}
	}
	//std::cout << std::endl;
	std::cout << "Generated: " << n << std::endl;
	std::cout << "Time: " << (aptk::time_used() - old_time) << std::endl << std::endl;

	std::cout << "Applicable actions at root with watched literals: " << std::endl;
	n = 0;

	for (int trial = 0; trial < TRIALS; trial++) {
		app_set.clear();
		w_succ_gen.applicable_actions(*s0, app_set);
		for ( unsigned i = 0; i < app_set.size(); i++ ) {
			n++;
			if (1 == TRIALS)
                std::cout << plan_prob.actions()[app_set[i]]->signature() << std::endl;
			//std::cout << '.';
		}
	}
	//std::cout << std::endl;
	std::cout << "Generated: " << n << std::endl;
	std::cout << "Time: " << (aptk::time_used() - old_time) << std::endl << std::endl;

	return 0;
}
