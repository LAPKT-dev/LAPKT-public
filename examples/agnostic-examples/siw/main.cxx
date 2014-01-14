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
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <h_2.hxx>

#include <aptk/iw.hxx>
#include <aptk/siw.hxx>
#include <aptk/serialized_search.hxx>
#include <aptk/string_conversions.hxx>

#include <boost/program_options.hpp>

namespace po = boost::program_options;

using	aptk::STRIPS_Problem;
using	aptk::agnostic::Fwd_Search_Problem;

using 	aptk::agnostic::Landmarks_Graph_Generator;
using 	aptk::agnostic::Landmarks_Graph;
using 	aptk::agnostic::H2_Heuristic;

using 	aptk::agnostic::Novelty;
using	aptk::search::brfs::IW;
using	aptk::search::Serialized_Search;
using	aptk::search::SIW;

typedef		aptk::search::brfs::Node< aptk::State >	          IW_Node;
typedef         Novelty<Fwd_Search_Problem, IW_Node>              H_Novel_Fwd;
typedef         H2_Heuristic<Fwd_Search_Problem>                  H2_Fwd;
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     Gen_Lms_Fwd;
typedef		IW< Fwd_Search_Problem, H_Novel_Fwd >	          IW_Fwd;


//typedef		Serialized_Search< Fwd_Search_Problem, IW_Fwd, IW_Node >        SIW_Fwd;
typedef		SIW< Fwd_Search_Problem >        SIW_Fwd;


template <typename Search_Engine>
float do_search( Search_Engine& engine, STRIPS_Problem& plan_prob, float bound, std::string logfile ) {

	
	engine.set_bound(bound);
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	if ( engine.find_solution( cost, plan ) ) {
		std::cout << "Plan found with cost: " << cost << std::endl;
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			std::cout << k+1 << ". ";
			const aptk::Action& a = *(plan_prob.actions()[ plan[k] ]);
			std::cout << a.signature();
			std::cout << std::endl;
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
	std::cout << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
	std::cout << "Average ef. width: " << engine.avg_B() << std::endl;
	std::cout << "Max ef. width: " << engine.max_B() << std::endl;

	
	return total_time;
}


void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
	po::options_description desc( "Options:" );
	
	desc.add_options()
		( "help", "Show help message" )
		( "domain", po::value<std::string>(), "Input PDDL domain description" )
		( "problem", po::value<std::string>(), "Input PDDL problem description" )
		( "bound", po::value<int>()->default_value(1), "Max width w for IW(w)")
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

	STRIPS_Problem	prob;

	aptk::FF_Parser::get_problem_description( vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob );
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << prob.domain_name() << std::endl;
	std::cout << "\tProblem: " << prob.problem_name() << std::endl;
	std::cout << "\t#Actions: " << prob.num_actions() << std::endl;
	std::cout << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );

	H2_Fwd    h2( search_prob );
	h2.compute_edeletes( prob );	

	Gen_Lms_Fwd    gen_lms( search_prob );
	Landmarks_Graph graph( prob );

	gen_lms.set_only_goals( true );
	gen_lms.compute_lm_graph_set_additive( graph );
	
	std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	graph.print( std::cout );
	
	std::cout << "Starting search with IW (time budget is 60 secs)..." << std::endl;

	SIW_Fwd siw_engine( search_prob );
	siw_engine.set_goal_agenda( &graph );
	
	float iw_bound = vm["bound"].as<int>();

	float iw_t = do_search( siw_engine, prob, iw_bound, "iw.log" );
	
	std::cout << "IW search completed in " << iw_t << " secs, check 'iw.log' for details" << std::endl;


	return 0;
}
