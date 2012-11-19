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
#include <boost/program_options.hpp>
#include <aptk/time.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <ff_to_aptk.hxx>
#include <fwd_search_prob.hxx>
#include <h_2.hxx>
#include <conj_comp_prob.hxx>
#include <h_C.hxx>
#include <rp_heuristic.hxx>
#include <bs_graph.hxx>

#include <iostream>
#include <fstream>

namespace po = boost::program_options;

using   aptk::STRIPS_Problem;
using	aptk::agnostic::Fwd_Search_Problem;
using   aptk::agnostic::H2_Heuristic;
using	aptk::agnostic::CC_Problem;
using	aptk::agnostic::HC_Heuristic;
using	aptk::agnostic::Relaxed_Plan_Extractor;
using	aptk::agnostic::Best_Supports_Graph;

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

void compute_best_supports_graph( const CC_Problem& task, const aptk::State& s, HC_Heuristic<>& h ) {

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
	aptk::State 		s0( prob );
	s0.set( prob.init() );

	float t0 = aptk::time_used();
	H2_Heuristic< Fwd_Search_Problem >  h2( search_prob );
	float tf = aptk::time_used();
	std::cout << "Time to initialize h^2: " << tf - t0 << " secs" << std::endl;
	
	float h;
	t0 = aptk::time_used();
	h2.eval( s0, h );
	tf = aptk::time_used();
	std::cout << "Time to evaluate h^2: " << tf - t0 << " secs" << std::endl;
	std::cout << "h^2 value = " << h << std::endl;

	std::ofstream	h2_values("h2.values");
	h2.print_values( h2_values );
	h2_values.close();

	t0 = aptk::time_used();
	CC_Problem	pi_2_ce_task( prob, 2 );
	HC_Heuristic<>	h2_ce( pi_2_ce_task );
	tf = aptk::time_used();
	std::cout << "Time to initialize h^{2}_{ce}: " << tf - t0 << " secs" << std::endl;
	std::cout << "# Fluents in \\Pi^{2}_{ce} task: " << pi_2_ce_task.num_fluents() << std::endl;
	
	t0 = aptk::time_used();
	h2_ce.eval( s0, h );
	tf = aptk::time_used();
	std::cout << "Time to evaluate h^{2}_{ce}: " << tf - t0 << " secs" << std::endl;
	std::cout << "h^{2}_{ce} value = " << h << std::endl;
	
	std::ofstream	h2_ce_values("h2_ce.values");
	h2_ce.print_values( h2_ce_values );
	h2_ce_values.close();

	t0 = aptk::time_used();
	std::vector<aptk::Fluent_Vec> conjunctions;
	
	CC_Problem	pi_1_ce_task( prob, conjunctions );
	HC_Heuristic<>	h1_ce( pi_1_ce_task );
	tf = aptk::time_used();
	std::cout << "Time to initialize h^{1}_{ce}: " << tf - t0 << " secs" << std::endl;
	std::cout << "# Fluents in \\Pi^{1}_{ce} task: " << pi_1_ce_task.num_fluents() << std::endl;
	
	t0 = aptk::time_used();
	h1_ce.eval( s0, h );
	tf = aptk::time_used();
	std::cout << "Time to evaluate h^{1}_{ce}: " << tf - t0 << " secs" << std::endl;
	std::cout << "h^{1}_{ce} value = " << h << std::endl;
	
	std::ofstream	h1_ce_values("h1_ce.values");
	h1_ce.print_values( h1_ce_values );
	h1_ce_values.close();

	Relaxed_Plan_Extractor< HC_Heuristic<> >	rp_h2_ce( prob, h2_ce );
	std::vector<aptk::Action_Idx> pref_ops;
	rp_h2_ce.compute( s0, h, pref_ops );

	std::cout << "Relaxed plan h^2_ce heuristic = " << h << std::endl;
	std::cout << "Preferred operators: " << std::endl;
	for ( auto it = pref_ops.begin(); it != pref_ops.end(); it++ )
		std::cout << "\t" << prob.actions()[*it]->signature() << std::endl;	

	Relaxed_Plan_Extractor< HC_Heuristic<> >	rp_h1_ce( prob, h1_ce );
	pref_ops.clear();
	rp_h1_ce.compute( s0, h, pref_ops );

	std::cout << "Relaxed plan h^1_ce heuristic = " << h << std::endl;
	std::cout << "Preferred operators: " << std::endl;
	for ( auto it = pref_ops.begin(); it != pref_ops.end(); it++ )
		std::cout << "\t" << prob.actions()[*it]->signature() << std::endl;	

	Best_Supports_Graph< HC_Heuristic<> > bs_graph( pi_2_ce_task );
	bs_graph.build( h2_ce );

	std::cout << "Actions in best supports graph = " << bs_graph.num_actions() << std::endl;
	std::cout << "Cost of actions in best supports graph = " << bs_graph.cost() << std::endl;

	std::cout << "Preferred operators: " << std::endl;
	for ( auto it = bs_graph.pref_ops().begin(); it != bs_graph.pref_ops().end(); it++ )
		std::cout << "\t" << prob.actions()[*it]->signature() << std::endl;	

	std::ofstream	bs_graph_dot_file( "bs_graph_h2_ce.dot" );
	bs_graph.print( bs_graph_dot_file );
	bs_graph_dot_file.close();
	system( "dot -Tpdf -o bs_graph_h2_ce.pdf bs_graph_h2_ce.dot" );

	Best_Supports_Graph< HC_Heuristic<> > bs_graph_h1( pi_1_ce_task );
	bs_graph_h1.build( h1_ce );

	std::cout << "Actions in best supports graph = " << bs_graph_h1.num_actions() << std::endl;
	std::cout << "Cost of actions in best supports graph = " << bs_graph_h1.cost() << std::endl;

	std::cout << "Preferred operators: " << std::endl;
	for ( auto it = bs_graph_h1.pref_ops().begin(); it != bs_graph_h1.pref_ops().end(); it++ )
		std::cout << "\t" << prob.actions()[*it]->signature() << std::endl;	

	std::ofstream	bs_graph_h1_dot_file( "bs_graph_h1_ce.dot" );
	bs_graph_h1.print( bs_graph_h1_dot_file );
	bs_graph_h1_dot_file.close();
	system( "dot -Tpdf -o bs_graph_h1_ce.pdf bs_graph_h1_ce.dot" );	

	bs_graph_h1.find_conflicts( conjunctions );
	std::cout << "Conflicts suggest the following conjunctions (" << conjunctions.size() << "): " << std::endl;
	for ( unsigned k = 0; k < conjunctions.size(); k++ ) {
		std::cout << k+1 << ". ";
		for ( unsigned l = 0; l < conjunctions[k].size(); l++ ) {
			pi_1_ce_task.print_fluent( conjunctions[k][l], std::cout );
			if ( l < conjunctions[k].size() - 1 ) 
				std::cout << " & ";
		}
		std::cout << std::endl;
	}

	t0 = aptk::time_used();
	CC_Problem	pi_1_ce_task_1( prob, conjunctions );
	HC_Heuristic<>	h1_ce_1( pi_1_ce_task_1 );
	tf = aptk::time_used();
	std::cout << "Time to initialize h^{C}_{ce}, |C| = " << conjunctions.size() << " : " << tf - t0 << " secs" << std::endl;
	std::cout << "# Fluents in \\Pi^{C}_{ce} task: " << pi_1_ce_task_1.num_fluents() << std::endl;

	t0 = aptk::time_used();
	h1_ce_1.eval( s0, h );
	tf = aptk::time_used();
	std::cout << "Time to evaluate h^{C}_{ce} (1): " << tf - t0 << " secs" << std::endl;
	std::cout << "h^{C}_{ce} (1) value = " << h << std::endl;
	
	std::ofstream	h1_ce_1_values("hC_ce_1.values");
	h1_ce_1.print_values( h1_ce_1_values );
	h1_ce_1_values.close();

	Best_Supports_Graph< HC_Heuristic<> > bs_graph_hC_1( pi_1_ce_task_1 );
	bs_graph_hC_1.build( h1_ce_1 );

	std::cout << "Actions in best supports graph = " << bs_graph_hC_1.num_actions() << std::endl;
	std::cout << "Cost of actions in best supports graph = " << bs_graph_hC_1.cost() << std::endl;

	std::cout << "Preferred operators: " << std::endl;
	for ( auto it = bs_graph_hC_1.pref_ops().begin(); it != bs_graph_hC_1.pref_ops().end(); it++ )
		std::cout << "\t" << prob.actions()[*it]->signature() << std::endl;	

	std::ofstream	bs_graph_hC_1_dot_file( "bs_graph_hC_1_ce.dot" );
	bs_graph_hC_1.print( bs_graph_hC_1_dot_file );
	bs_graph_hC_1_dot_file.close();
	system( "dot -Tpdf -o bs_graph_hC_1_ce.pdf bs_graph_hC_1_ce.dot" );

	bs_graph_hC_1.find_conflicts( conjunctions );

	std::cout << "Conflicts suggest the following conjunctions: " << std::endl;
	for ( unsigned k = 0; k < conjunctions.size(); k++ ) {
		std::cout << k+1 << ". ";
		for ( unsigned l = 0; l < conjunctions[k].size(); l++ ) {
			pi_1_ce_task_1.print_fluent( conjunctions[k][l], std::cout );
			if ( l < conjunctions[k].size() - 1 ) 
				std::cout << " & ";
		}

		std::cout << std::endl;
	}

	return 0;
}
