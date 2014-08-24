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

#include <h_1.hxx>
#include <rp_heuristic.hxx>

#include <aptk/open_list.hxx>
#include <aptk/string_conversions.hxx>
#include <aptk/at_bfs.hxx>

#include <fstream>

#include <boost/program_options.hpp>

#include <ff_gbfs.hxx>
#include <ff_rp_heuristic.hxx>
#include <layered_h_max.hxx>

namespace po = boost::program_options;

using	aptk::STRIPS_Problem;

using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::H_Max_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using	aptk::agnostic::FF_Relaxed_Plan_Heuristic;
using   aptk::agnostic::Layered_H_Max;

using 	aptk::search::Open_List;

using	aptk::search::bfs::AT_BFS_SQ_SH;
using	aptk::search::FF_GBFS;
using	aptk::search::Node_Comparer;
using	aptk::search::Node_Comparer_HA;
//using	aptk::search::gbfs_mh::Node;



// MRJ: We start defining the type of nodes for our planner
typedef		aptk::search::bfs::Node< aptk::State >	Search_Node;
typedef		aptk::search::FF_GBFS_Node< aptk::State >	FF_Search_Node;

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer< Search_Node >					Tie_Breaking_Algorithm;
typedef		Node_Comparer_HA< FF_Search_Node >				FF_Tie_Breaking;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >		BFS_Open_List;
typedef		Open_List< FF_Tie_Breaking, FF_Search_Node >			FF_Open_List;

// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd; //, aptk::agnostic::H1_Cost_Function::Ignore_Costs
typedef 	H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function>	H_Max_Fwd;
typedef         Layered_H_Max< Fwd_Search_Problem >				Alt_H_Max;
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		H_Add_Rp_Fwd;
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd >		H_Max_Rp_Fwd;
typedef		FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >	FF_H_Add_Rp_Fwd;
typedef		FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd >	FF_H_Max_Rp_Fwd;
typedef         FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, Alt_H_Max >      Classic_FF_H_Max_Rp_Fwd;


// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_BFS_SQ_SH< Fwd_Search_Problem, H_Max_Rp_Fwd, BFS_Open_List >		GBFS_H_Max_Rp_Fwd;
typedef		AT_BFS_SQ_SH< Fwd_Search_Problem, H_Add_Rp_Fwd, BFS_Open_List >    	GBFS_H_Add_Rp_Fwd;
typedef		AT_BFS_SQ_SH< Fwd_Search_Problem, H_Add_Fwd, BFS_Open_List >    	GBFS_H_Add_Fwd;
typedef		FF_GBFS< Fwd_Search_Problem, FF_H_Add_Rp_Fwd, FF_Open_List >	    	FF_GBFS_H_Add;
typedef		FF_GBFS< Fwd_Search_Problem, FF_H_Max_Rp_Fwd, FF_Open_List >   		FF_GBFS_H_Max;
typedef		FF_GBFS< Fwd_Search_Problem, Classic_FF_H_Max_Rp_Fwd, FF_Open_List >   	FF_GBFS_Classic_H_Max;



float do_search(  Fwd_Search_Problem& search_prob, float& cost,std::ofstream& details, std::string plan_filename, int heuristic, bool anytime  ) {



	std::vector< aptk::Action_Idx > plan;
	cost = infty;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();


	if(heuristic == 1){
		GBFS_H_Add_Fwd engine( search_prob );	
		engine.set_greedy( true );
		engine.set_delay_eval( false );
		engine.start();	

		unsigned expanded_0 = engine.expanded();
		unsigned generated_0 = engine.generated();

		while ( engine.find_solution( cost, plan ) ) {
			if ( !plan.empty() ) {
				details << "Plan found with cost: " << cost << std::endl;
				if(anytime) std::cout << "Plan found with cost: " << cost << std::endl;
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
			plan.clear();

			if(!anytime) break;
		}

		float total_time = aptk::time_used() - ref;
		std::cout << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << " speed: " << engine.generated()/total_time << " nodes/sec" << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
		std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;
		
		return total_time;
		
	
	}
	else if ( heuristic == 2 ) {
		GBFS_H_Add_Rp_Fwd engine( search_prob );
		engine.set_greedy( true );
		engine.set_delay_eval( false );
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
			plan.clear();

			if(!anytime) break;
		}

		float total_time = aptk::time_used() - ref;
		std::cout << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
		std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;

		return total_time;
	
	}
	else if ( heuristic == 3 ) {
		GBFS_H_Max_Rp_Fwd engine( search_prob );
		engine.set_greedy( true );
		engine.set_delay_eval( false );
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
			plan.clear();

			if(!anytime) break;
		}

		float total_time = aptk::time_used() - ref;
		std::cout << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
		std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;

		return total_time;
	
	}
	else if ( heuristic == 4 ) {
		FF_GBFS_H_Add engine( search_prob );
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
			plan.clear();

			if(!anytime) break;
		}
		float total_time = aptk::time_used() - ref;
		std::cout << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
		std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;

		return total_time;

	}
	else if ( heuristic == 5 ) {
		FF_GBFS_H_Max engine( search_prob );
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
			plan.clear();

			if(!anytime) break;
		}
		float total_time = aptk::time_used() - ref;
		std::cout << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
		std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;

		return total_time;
	}
	else if ( heuristic == 6 ) {
		FF_GBFS_Classic_H_Max engine( search_prob );
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
			plan.clear();

			if(!anytime) break;
		}
		float total_time = aptk::time_used() - ref;
		std::cout << "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
		std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
		std::cout  << "Dead-end nodes: " << engine.dead_ends() << std::endl;

		return total_time;
	}
	return 0;


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
		( "heuristic", po::value<int>()->default_value(1), "1: H_add (default 1)\n2: H_add_Rp\n3: H_max_Rp\n4: H_add_FF_Rp\n5: H_max_FF_Rp\n6: H_layered_FF_Rp ( FF_*, as in Journal Paper)" )
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


	int heuristic = vm["heuristic"].as<int>();
	bool anytime = vm["anytime"].as<bool>();

	std::ofstream details( "execution.details" );

	STRIPS_Problem	prob;

	aptk::FF_Parser::get_problem_description( vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob );
	details << "PDDL problem description loaded: " << std::endl;
	details << "\tHeuristic: ";

	if(heuristic == 1)
		details << " H_add: ";
	else if (heuristic == 2)
		details << " H_add_Rp: ";
	else if ( heuristic == 3 )
		details << " H_max_Rp: ";
	else if (heuristic == 4 )
		details << " FF's GBFS with H_add_rp: ";
	else if ( heuristic == 5 )
		details << " FF's GBFS with H_max_rp: "; 
	details << std::endl;

	details << "\tDomain: " << prob.domain_name() << std::endl;
	details << "\tProblem: " << prob.problem_name() << std::endl;
	details << "\t#Actions: " << prob.num_actions() << std::endl;
	details << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );

	float cost = 0;
	float at_search_t = do_search(search_prob, cost, details, plan_filename, heuristic, anytime );		
	
	if( heuristic == 1 ){
		details << "Best First H_add search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
		std::cout << "Best First H_add search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
	}
	else if ( heuristic == 2 ) {
		details << "Best First H_add_RP search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
		std::cout << "Best First H_add_RP search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
	}
	else if ( heuristic == 3 ) {
		details << "Best First H_max_RP search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
		std::cout << "Best First H_max_RP search completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;

	}
	else if ( heuristic == 4 ) {
		details << "FF's Greedy Best First search with H_add_RP completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
		std::cout << "FF's Greedy Best First search with H_add_RP completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;

	}
	else if ( heuristic == 5 ) {
		details << "FF's Greedy Best First search with H_max_RP completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;
		std::cout << "FF's Greedy Best First search with H_max_RP completed in " << at_search_t << " secs, found plan cost = " << cost << std::endl;

	}



	
	details.close();

	return 0;
}
