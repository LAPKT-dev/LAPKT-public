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
#include <h_2.hxx>
#include <h_1.hxx>

#include <aptk/iw.hxx>
#include <aptk/string_conversions.hxx>

#include <boost/program_options.hpp>

namespace po = boost::program_options;

using	aptk::STRIPS_Problem;
using	aptk::agnostic::Fwd_Search_Problem;

using 	aptk::agnostic::H2_Heuristic;
using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Max_Evaluation_Function;

using 	aptk::agnostic::Novelty;
using	aptk::search::brfs::IW;

typedef		aptk::search::brfs::Node< aptk::State >	          IW_Node;
typedef         Novelty<Fwd_Search_Problem, IW_Node>              H_Novel_Fwd;
typedef         H2_Heuristic<Fwd_Search_Problem>                  H2_Fwd;
typedef		H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function> H1_Fwd;
typedef		IW< Fwd_Search_Problem, H_Novel_Fwd >	          IW_Fwd;


template <typename Search_Engine>
bool do_search( Search_Engine& engine, STRIPS_Problem& plan_prob, float bound, std::ofstream& plan_stream, std::ofstream& details ) {


	
	
	engine.set_bound(bound);
	engine.start();

	std::vector< aptk::Action_Idx > plan;
	float				cost;

	float ref = aptk::time_used();

	if ( engine.find_solution( cost, plan ) ) {
	
	    float total_time = aptk::time_used() - ref;

	
	    details << "Total time: " << total_time << std::endl;
	    details << "Nodes generated during search: " << engine.generated() << std::endl;
	    details << "Nodes expanded during search: " << engine.expanded() << std::endl;
	    details << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	    details << "Effective width: " << engine.bound() << std::endl;
	    details << "Plan found with cost: " << cost << std::endl;
	    

	
	    std::cout << "\nTotal time: " << total_time << std::endl;
	    std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	    std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	    std::cout << "Nodes pruned by bound: " << engine.pruned_by_bound() << std::endl;
	    std::cout << "Effective width: " << engine.bound() << std::endl;
	    std::cout << "Plan found with cost: " << cost << std::endl;
	
	    details << "plan: ";
	    std::cout << "plan: ";
	    for ( unsigned k = 0; k < plan.size(); k++ ) {
		
		const aptk::Action& a = *(plan_prob.actions()[ plan[k] ]);
		details << a.signature() << " ";
		std::cout << a.signature() << " ";
		plan_stream << a.signature() << std::endl;
	    }
	    std::cout << std::endl;

	} else
	    return false;
	

 	return true;
}



void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
	po::options_description desc( "Options:" );
	
	desc.add_options()
		( "help", "Show help message" )
		( "domain", po::value<std::string>(), "Input PDDL domain description" )
		( "problem", po::value<std::string>(), "Input PDDL problem description" )
		( "bound", po::value<int>()->default_value(1), "Max width w for IW(w)")
	        ( "atomic", po::value<bool>()->default_value(1), "Runs IW(w) over atomic goals (bool)")
		( "output", po::value<std::string>(), "Output plan file" )
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

	std::ofstream plan_stream;

	if ( !vm.count( "output" ) ) {	
		std::cerr << "No plan output file specified, defaulting to 'plan.ipc'" << std::endl;
		plan_stream.open( "plan.ipc" );
	}
	else
		plan_stream.open( vm["output"].as<std::string>().c_str() );
		

	STRIPS_Problem	prob;

	aptk::FF_Parser::get_problem_description( vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob, true );
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << prob.domain_name() << std::endl;
	std::cout << "\tProblem: " << prob.problem_name() << std::endl;
	std::cout << "\t#Actions: " << prob.num_actions() << std::endl;
	std::cout << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );

	if ( !prob.has_conditional_effects() ) {
		H2_Fwd    h2( search_prob );
		h2.compute_edeletes( prob );	
	}
	else
		prob.compute_edeletes();

	
	
	std::cout << "Starting search with IW (time budget is 60 secs)..." << std::endl;

	IW_Fwd iw_engine( search_prob );
	
	float iw_bound = vm["bound"].as<int>();

	std::ofstream	details( "execution.details" );

	if(vm["atomic"].as<bool>()){
	    H2_Fwd    h2( search_prob );
	    H1_Fwd    h1( search_prob );
	    
	    float h2_val;
	    float h1_val;
	    h2.eval( *(search_prob.init()), h2_val );
	    h1.eval( *(search_prob.init()), h1_val );
	    
		
	    aptk::Fluent_Vec original_goal;
	    for( auto g : prob.goal() )
		original_goal.push_back(g);
	    
	    for( auto g : original_goal ){
		float ref = aptk::time_used();
		aptk::Fluent_Vec atomic_goal;
		atomic_goal.push_back(g);
		STRIPS_Problem::set_goal( prob, atomic_goal );
		
		details << "Goal: " << prob.fluents()[g]->signature() << std::endl;
		std::cout << "\nGoal: " << prob.fluents()[g]->signature() << std::endl;

		bool solved = false;
		int b=0;

		do{
		    b++;
		    solved = do_search( iw_engine, prob, b, plan_stream, details );
		    if(b==iw_bound) break;
		}while(!solved);
		h1_val = h1.value(g);
		h2_val = h2.value(g,g);
		details << "h1: "<< h1_val << std::endl;
		details << "h2: "<< h2_val << std::endl;

		std::cout << "h1: "<< h1_val << std::endl;
		std::cout << "h2: "<< h2_val << std::endl;
		if(!solved){
		    float total_time = aptk::time_used() - ref;
		    details << "Total time: " << total_time << std::endl;
		    details << "Nodes generated during search: " << iw_engine.generated() << std::endl;
		    details << "Nodes expanded during search: " << iw_engine.expanded() << std::endl;
		    details << "Nodes pruned by bound: " << iw_engine.pruned_by_bound() << std::endl;
		    details << "Effective width: "<<iw_bound+1 << std::endl;
		    details << ";; NOT "<< iw_bound <<"-REACHABLE ;;" << std::endl;

		    std::cout << "\nTotal time: " << total_time << std::endl;
		    std::cout << "Nodes generated during search: " << iw_engine.generated() << std::endl;
		    std::cout << "Nodes expanded during search: " << iw_engine.expanded() << std::endl;
		    std::cout << "Nodes pruned by bound: " << iw_engine.pruned_by_bound() << std::endl;
		    std::cout << "Effective width: "<<iw_bound+1 << std::endl;
		    std::cout << ";; NOT "<< iw_bound <<"-REACHABLE ;;" << std::endl;
		}
		std::cout << "\n****\n";
	    }

	}
	else{
	    bool solved = do_search( iw_engine, prob, iw_bound, plan_stream, details );   
	    if(!solved){
		details << ";; NOT "<< iw_bound <<"-REACHABLE ;;" << std::endl;
	    }
	}
	plan_stream.close();
	details.close();

	return 0;
}
