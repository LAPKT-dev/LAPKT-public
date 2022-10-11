
/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files 
(the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, 
publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject
 to the following conditions:

The above copyright notice and this permission notice shall be included 
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
