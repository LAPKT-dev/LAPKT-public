
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

#include <open_list.hxx>
#include <ff_ehc.hxx>
#include <ff_gbfs.hxx>
#include <string_conversions.hxx>

#include <boost/program_options.hpp>

namespace po = boost::program_options;

using aptk::Action;
using aptk::STRIPS_Problem;
using aptk::agnostic::Fwd_Search_Problem;

using aptk::agnostic::Landmarks_Graph;
using aptk::agnostic::Landmarks_Graph_Generator;

using aptk::agnostic::H1_Heuristic;
using aptk::agnostic::Layered_H_Max;

using aptk::agnostic::FF_Relaxed_Plan_Heuristic;
using aptk::agnostic::H_Add_Evaluation_Function;
using aptk::agnostic::H_Max_Evaluation_Function;

using aptk::search::FF_EHC;
using aptk::search::FF_GBFS;
using aptk::search::Node_Comparer_HA;
using aptk::search::Open_List;

// MRJ: Search node
typedef aptk::search::FF_GBFS_Node<aptk::State> FF_Search_Node;

// MRJ: Tie breaking and best-node selection function
typedef Node_Comparer_HA<FF_Search_Node> FF_Tie_Breaking;

// MRJ: Open List
typedef Open_List<FF_Tie_Breaking, FF_Search_Node> FF_Open_List;

// MRJ: Goal ordering
typedef Landmarks_Graph_Generator<Fwd_Search_Problem> Gen_Lms_Fwd;

// MRJ: Heuristics
// typedef H1_CL_Heuristic< Fwd_Search_Problem, H_Add_Evaluation_Function >	H_Add_Fwd_2;
// typedef H1_CL_Heuristic< Fwd_Search_Problem, H_Max_Evaluation_Function >	H_Max_Fwd_2;
// typedef FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd_2 > 		FF_H_Add_Rp_Fwd_2;
// typedef FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd_2 >		FF_H_Max_Rp_Fwd_2;
typedef Layered_H_Max<Fwd_Search_Problem> Alt_H_Max;
typedef FF_Relaxed_Plan_Heuristic<Fwd_Search_Problem, Alt_H_Max, unsigned> Classic_FF_H_Max;

// MRJ: Search engines
// typedef FF_GBFS< Fwd_Search_Problem, FF_H_Add_Rp_Fwd_2, FF_Open_List >	FF_GBFS_H_Add;
// typedef FF_GBFS< Fwd_Search_Problem, FF_H_Max_Rp_Fwd_2, FF_Open_List >	FF_GBFS_H_Max;
// typedef FF_EHC< Fwd_Search_Problem, FF_H_Add_Rp_Fwd_2 >			FF_EHC_H_Add;
// typedef FF_EHC< Fwd_Search_Problem, FF_H_Max_Rp_Fwd_2 >			FF_EHC_H_Max;
typedef FF_GBFS<Fwd_Search_Problem, Classic_FF_H_Max, FF_Open_List> Classic_FF_GBFS;
typedef FF_EHC<Fwd_Search_Problem, Classic_FF_H_Max> Classic_FF_EHC;

void do_search(Fwd_Search_Problem &search_prob, std::ofstream &plan_stream)
{

	std::ofstream details("execution.details");
	std::vector<aptk::Action_Idx> plan;
	float cost;
	float t0 = aptk::time_used();
	float gbfs_t;
	float total_time;

	std::cout << std::endl
						<< "Starting search with EHC..." << std::endl;

	Classic_FF_EHC ehc_engine(search_prob);
	ehc_engine.start();

	float ref = aptk::time_used();

	bool solved = ehc_engine.find_solution(cost, plan);

	float ehc_t = aptk::time_used() - ref;

	std::cout << "\tEHC search completed in " << ehc_t << " secs" << std::endl;

	Classic_FF_GBFS bfs_engine(search_prob);

	if (!solved)
	{
		std::cout << "\tEHC FAILED!" << std::endl;

		std::cout << std::endl
							<< "Starting search with GBFS..." << std::endl;

		bfs_engine.start();

		ref = aptk::time_used();

		solved = bfs_engine.find_solution(cost, plan);

		gbfs_t = aptk::time_used() - ref;

		std::cout << "\tGBFS search completed in " << gbfs_t << " secs" << std::endl;
	}

	if (solved)
	{
		details << "Plan found with cost: " << cost << std::endl;
		for (unsigned k = 0; k < plan.size(); k++)
		{
			details << k + 1 << ". ";
			const aptk::Action &a = *(search_prob.task().actions()[plan[k]]);
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
		std::cout << std::endl
							<< "Total time: " << total_time << std::endl;
		std::cout << "Nodes generated during search: " << ehc_engine.generated() + bfs_engine.generated() << std::endl;
		std::cout << "Nodes expanded during search: " << ehc_engine.expanded() + bfs_engine.expanded() << std::endl;
		std::cout << "\tNodes generated during EHC search: " << ehc_engine.generated() << std::endl;
		std::cout << "\tNodes expanded during EHC search: " << ehc_engine.expanded() << std::endl;
		std::cout << "\tNodes generated during GBFS search: " << bfs_engine.generated() << std::endl;
		std::cout << "\tNodes expanded during GBFS search: " << bfs_engine.expanded() << std::endl;
		std::cout << "Plan found with cost: " << cost << std::endl;
	}
	else
	{
		details << ";; UNSOLVABLE ;;" << std::endl;
		std::cout << ";; UNSOLVABLE ;;" << std::endl;
	}

	details.close();
	plan_stream.close();
}

void process_command_line_options(int ac, char **av, po::variables_map &vars)
{
	po::options_description desc("Options:");

	desc.add_options()("help", "Show help message")("domain", po::value<std::string>(), "Input PDDL domain description")("problem", po::value<std::string>(), "Input PDDL problem description")("output", po::value<std::string>(), "Output file for plan");

	try
	{
		po::store(po::parse_command_line(ac, av, desc), vars);
		po::notify(vars);
	}
	catch (std::exception &e)
	{
		std::cerr << "Error: " << e.what() << std::endl;
		std::exit(1);
	}
	catch (...)
	{
		std::cerr << "Exception of unknown type!" << std::endl;
		std::exit(1);
	}

	if (vars.count("help"))
	{
		std::cout << desc << std::endl;
		std::exit(0);
	}
}

void report_no_solution(std::string reason, std::ofstream &plan_stream)
{
	plan_stream << ";; No solution found" << std::endl;
	plan_stream << ";; " << reason << std::endl;
	plan_stream.close();
}

int main(int argc, char **argv)
{

	po::variables_map vm;

	process_command_line_options(argc, argv, vm);

	if (!vm.count("domain"))
	{
		std::cerr << "No PDDL domain was specified!" << std::endl;
		std::exit(1);
	}

	if (!vm.count("problem"))
	{
		std::cerr << "No PDDL problem was specified!" << std::endl;
		std::exit(1);
	}

	std::ofstream plan_stream;

	if (!vm.count("output"))
	{
		std::cerr << "No output plan file specified, defaulting to 'plan.ipc'" << std::endl;
		plan_stream.open("plan.ipc");
	}
	else
		plan_stream.open(vm["output"].as<std::string>());

	STRIPS_Problem prob;
	bool ignore_costs = true;

	aptk::FF_Parser::get_problem_description(vm["domain"].as<std::string>(), vm["problem"].as<std::string>(), prob, ignore_costs);
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << prob.domain_name() << std::endl;
	std::cout << "\tProblem: " << prob.problem_name() << std::endl;
	std::cout << "\t#Actions: " << prob.num_actions() << std::endl;
	std::cout << "\t#Fluents: " << prob.num_fluents() << std::endl;

	Fwd_Search_Problem search_prob(&prob);

	// Gen_Lms_Fwd    gen_lms( search_prob );
	// Landmarks_Graph graph( prob );

	// //gen_lms.set_only_goals( true );

	// gen_lms.compute_lm_graph_set_additive( graph );

	// std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	// //graph.print( std::cout );

	do_search(search_prob, plan_stream);

	return 0;
}
