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
#include <layered_h_max.hxx>

#include <fstream>

#include <boost/program_options.hpp>
#include <aptk/resources_control.hxx>


namespace po = boost::program_options;

using	aptk::STRIPS_Problem;

using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Max_Evaluation_Function;
using	aptk::agnostic::Layered_H_Max;

// MRJ: Now we define the heuristics
typedef 	H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function>	H_Max_Fwd;
typedef 	Layered_H_Max< Fwd_Search_Problem >				Alt_H_Max;

void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
	po::options_description desc( "Options:" );
	
	desc.add_options()
		( "help", "Show help message" )
		( "domain", po::value<std::string>(), "Input PDDL domain description" )
		( "problem", po::value<std::string>(), "Input PDDL problem description" )
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

	prob.make_effect_tables();

	std::cout << "\tDomain: " << prob.domain_name() << std::endl;
	std::cout << "\tProblem: " << prob.problem_name() << std::endl;
	std::cout << "\t#Actions: " << prob.num_actions() << std::endl;
	std::cout << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem	search_prob( &prob );

	H_Max_Fwd	dijkstra_h1( search_prob );
	Alt_H_Max	layered_h1( search_prob );
	float		dijkstra_h_val;
	unsigned	layered_h_val;
	float t0, tf, dijkstra_t, layered_t;
		
	t0 = aptk::time_used();
	dijkstra_h1.eval( *(search_prob.init()), dijkstra_h_val );
	tf = aptk::time_used();
	dijkstra_t = tf - t0;
	
	t0 = aptk::time_used();
	layered_h1.eval( *(search_prob.init()), layered_h_val );
	tf = aptk::time_used();
	layered_t = tf - t0;	

	std::cout << "Dijkstra h_{max} = " << dijkstra_h_val << " Layered h_{max} = " << layered_h_val << std::endl;
	std::cout << "Dijkstra t = " << dijkstra_t << " secs Layered t = " << layered_t << " secs" << std::endl;	

	std::ofstream	dijkstra_out( "dijkstra.values" );
	dijkstra_h1.print_values( dijkstra_out );
	dijkstra_out.close();

	std::ofstream layered_out( "layered.values" );
	layered_h1.print_values( layered_out );
	layered_out.close();

	return 0;
}
