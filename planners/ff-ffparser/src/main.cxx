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

#include <iostream>
#include <fstream>

#include <ff_to_aptk.hxx>
#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>
#include <fwd_search_prob.hxx>

#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>

#include <h_1.hxx>
#include <layered_h_max.hxx>
#include <ff_rp_heuristic.hxx>

#include <aptk/open_list.hxx>
#include <aptk/ff_ehc.hxx>
#include <aptk/ff_gbfs.hxx>
#include <aptk/string_conversions.hxx>

#include <boost/program_options.hpp>

namespace po = boost::program_options;

using	aptk::STRIPS_Problem;
using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using 	aptk::agnostic::Landmarks_Graph;
using 	aptk::agnostic::Landmarks_Graph_Generator;

using 	aptk::agnostic::H1_Heuristic;
using   aptk::agnostic::Layered_H_Max;

using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::H_Max_Evaluation_Function;
using   aptk::agnostic::FF_Relaxed_Plan_Heuristic;


using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer_HA;
using	aptk::search::FF_GBFS;
using	aptk::search::FF_EHC;



// MRJ: Search node
typedef aptk::search::FF_GBFS_Node< aptk::State >	FF_Search_Node;

// MRJ: Tie breaking and best-node selection function
typedef Node_Comparer_HA< FF_Search_Node >		FF_Tie_Breaking;

// MRJ: Open List
typedef Open_List< FF_Tie_Breaking, FF_Search_Node >	FF_Open_List;

// MRJ: Goal ordering
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     Gen_Lms_Fwd;

// MRJ: Heuristics
//typedef H1_CL_Heuristic< Fwd_Search_Problem, H_Add_Evaluation_Function >	H_Add_Fwd_2;
//typedef H1_CL_Heuristic< Fwd_Search_Problem, H_Max_Evaluation_Function >	H_Max_Fwd_2;
//typedef FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd_2 > 		FF_H_Add_Rp_Fwd_2;
//typedef FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd_2 >		FF_H_Max_Rp_Fwd_2;
typedef Layered_H_Max< Fwd_Search_Problem >					Alt_H_Max;
typedef FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, Alt_H_Max, unsigned >	Classic_FF_H_Max;


// MRJ: Search engines
//typedef FF_GBFS< Fwd_Search_Problem, FF_H_Add_Rp_Fwd_2, FF_Open_List >	FF_GBFS_H_Add;
//typedef FF_GBFS< Fwd_Search_Problem, FF_H_Max_Rp_Fwd_2, FF_Open_List >	FF_GBFS_H_Max;
//typedef FF_EHC< Fwd_Search_Problem, FF_H_Add_Rp_Fwd_2 >			FF_EHC_H_Add;
//typedef FF_EHC< Fwd_Search_Problem, FF_H_Max_Rp_Fwd_2 >			FF_EHC_H_Max;
typedef FF_GBFS< Fwd_Search_Problem, Classic_FF_H_Max, FF_Open_List >		Classic_FF_GBFS;
typedef FF_EHC< Fwd_Search_Problem, Classic_FF_H_Max >				Classic_FF_EHC;


void do_search( Fwd_Search_Problem& search_prob, std::ofstream& plan_stream ) {

	std::ofstream	                details( "execution.details" );	
	std::vector< aptk::Action_Idx > plan;
	float				cost;
	float                           t0 = aptk::time_used();
	float                           gbfs_t;
	float                           total_time;


	std::cout << std::endl << "Starting search with EHC..." << std::endl;

	Classic_FF_EHC ehc_engine( search_prob );
	ehc_engine.start();

	float ref = aptk::time_used();
	
	bool solved = ehc_engine.find_solution( cost, plan );
	
	float ehc_t = aptk::time_used() - ref;
	
	std::cout << "\tEHC search completed in " << ehc_t << " secs" << std::endl;

	Classic_FF_GBFS		bfs_engine( search_prob );

	if( !solved ){
	    std::cout << "\tEHC FAILED!" << std::endl;

	    std::cout << std::endl << "Starting search with GBFS..." << std::endl;	    
	    
	    bfs_engine.start();
	    
	    ref = aptk::time_used();
	    
	    solved = bfs_engine.find_solution( cost, plan );
	    
	    gbfs_t = aptk::time_used() - ref;
	    
	    std::cout << "\tGBFS search completed in " << gbfs_t << " secs" << std::endl;
	
	}

	if(solved){
		details << "Plan found with cost: " << cost << std::endl;
		for ( unsigned k = 0; k < plan.size(); k++ ) {
			details << k+1 << ". ";
			const aptk::Action& a = *(search_prob.task().actions()[ plan[k] ]);
			details << a.signature();
			details << std::endl;
			plan_stream << a.signature() << std::endl;
		}
		float tf = aptk::time_used();
		total_time = tf - t0;

		details << "Time: " << total_time << std::endl;
		details << "Generated: " << ehc_engine.generated() + bfs_engine.generated() << std::endl;
		details << "Expanded: " << ehc_engine.expanded() + bfs_engine.expanded() << std::endl;
		details << "\tGenerated EHC: " << ehc_engine.generated() << std::endl;
		details << "\tExpanded EHC: " << ehc_engine.expanded() << std::endl;
		details << "\tGenerated GBFS: " << bfs_engine.generated() << std::endl;
		details << "\tExpanded GBFS: " << bfs_engine.expanded() << std::endl;
		
		plan.clear();
		std::cout << "\tSOLVED!" << std::endl;
		std::cout << std::endl << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << ehc_engine.generated() + bfs_engine.generated()<< std::endl;
		std::cout << "Nodes expanded during search: " <<  ehc_engine.expanded() + bfs_engine.expanded() << std::endl;
		std::cout << "\tNodes generated during EHC search: " << ehc_engine.generated() << std::endl;
		std::cout << "\tNodes expanded during EHC search: " <<  ehc_engine.expanded() << std::endl;
		std::cout << "\tNodes generated during GBFS search: " << bfs_engine.generated()<< std::endl;
		std::cout << "\tNodes expanded during GBFS search: " <<  bfs_engine.expanded() << std::endl;
		std::cout << "Plan found with cost: " << cost << std::endl;
	
	}
	else{
	    details << ";; UNSOLVABLE ;;" << std::endl;
	    std::cout << ";; UNSOLVABLE ;;" << std::endl;
	}

	details.close();
	plan_stream.close();
		
}


void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
	po::options_description desc( "Options:" );
	
	desc.add_options()
		( "help", "Show help message" )
		( "domain", po::value<std::string>(), "Input PDDL domain description" )
		( "problem", po::value<std::string>(), "Input PDDL problem description" )
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


	// Gen_Lms_Fwd    gen_lms( search_prob );
	// Landmarks_Graph graph( prob );

	// //gen_lms.set_only_goals( true );
	
	// gen_lms.compute_lm_graph_set_additive( graph );
	
	// std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	// //graph.print( std::cout );       


	do_search( search_prob, plan_stream ); 
		

	return 0;
}
