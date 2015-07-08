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

// MRJ: In this example, I'll try to show how can one assemble a simple
// STRIPS planning problem from objects and data structures through the embedded FF
// parser.
#include <strips_prob.hxx>
#include <fd_to_aptk.hxx>
#include <iostream>
#include <iterator>
#include <boost/program_options.hpp>
#include <vector>
#include <string>

namespace po = boost::program_options;

using aptk::STRIPS_Problem;

void process_command_line_options( int ac, char** av, po::variables_map& vars ) {
	po::options_description desc( "Options:" );
	
	desc.add_options()
		( "help", "Show help message" )
		( "sas-file", po::value<std::string>(), "FD preprocessor output file" )
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

	if ( !vm.count( "sas-file" ) ) {
		std::cerr << "No FD preprocessor output file was specified!" << std::endl;
		std::exit(1);
	}

	STRIPS_Problem	prob;
	std::vector<aptk::FD_Parser::DTG> dtgs;
	aptk::FD_Parser::get_problem_description( vm["sas-file"].as<std::string>(), prob, dtgs );
	// for(int i=0; i<gnum_ft_conn; i++){
	// 	std::vector<std::string> al;
	// 	FF::get_ft_pred_arg_list(i, al);
	// 	std::cout << i << ": ";
	// 	for(auto s : al){
	// 		std::cout << s << " ";
	// 	}
	// 	std::cout << std::endl;
	// }
	
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << prob.domain_name() << std::endl;
	std::cout << "\tProblem: " << prob.problem_name() << std::endl;
	std::cout << "\t#Actions: " << prob.num_actions() << std::endl;
	std::cout << "\t#Fluents: " << prob.num_fluents() << std::endl;
	std::cout << "\t#Mutexes: " << prob.mutexes().num_groups() << std::endl;
	std::cout << "\t#DTGs: " << dtgs.size() << std::endl;

	return 0;
}
