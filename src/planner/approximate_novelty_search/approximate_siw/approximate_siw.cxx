#include <approximate_siw.hxx>
#include <strips_state.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <h_2.hxx>

#include <string_conversions.hxx>
#include <memory.hxx>

#include <iostream>
#include <fstream>

using aptk::agnostic::Fwd_Search_Problem;
using aptk::agnostic::H2_Heuristic;
using aptk::agnostic::Landmarks_Graph;
using aptk::agnostic::Landmarks_Graph_Generator;

using aptk::agnostic::Approximate_Novelty;
using aptk::search::Approximate_Serialized_Search;
using aptk::search::brfs::Approximate_IW_Search;

typedef aptk::search::brfs::Node<aptk::State> IW_Node;
typedef Approximate_Novelty<Fwd_Search_Problem, IW_Node> H_Novel_Fwd;
typedef H2_Heuristic<Fwd_Search_Problem> H2_Fwd;
typedef Landmarks_Graph_Generator<Fwd_Search_Problem> Gen_Lms_Fwd;
// typedef	Approximate_IW< Fwd_Search_Problem, H_Novel_Fwd >    IW_Fwd;

// typedef		Serialized_Search< Fwd_Search_Problem, IW_Fwd, IW_Node >        SIW_Fwd;

Approximate_SIW::Approximate_SIW()
		: STRIPS_Interface(), m_iw_bound(2), m_log_filename("iw.log"), m_plan_filename("plan.ipc"), m_sampling_factor(1.0), m_sampling_strategy("rand")
{
}

Approximate_SIW::Approximate_SIW(std::string domain_file, std::string instance_file)
		: STRIPS_Interface(domain_file, instance_file), m_iw_bound(2), m_log_filename("iw.log"), m_plan_filename("plan.ipc"), m_sampling_factor(1.0), m_sampling_strategy("rand")
{
}

Approximate_SIW::Approximate_SIW(std::string domain_file, std::string instance_file,
																 unsigned iw_bound, std::string log_file, std::string plan_file,
																 float sampling_factor, std::string sampling_strategy)
		: STRIPS_Interface(domain_file, instance_file), m_iw_bound(iw_bound), m_log_filename(log_file), m_plan_filename(plan_file), m_sampling_factor(sampling_factor), m_sampling_strategy(sampling_strategy)
{
}

Approximate_SIW::~Approximate_SIW()
{
}

void Approximate_SIW::setup(bool gen_match_tree)
{
	STRIPS_Interface::setup(gen_match_tree);
	std::cout << "PDDL problem description loaded: " << std::endl;
	std::cout << "\tDomain: " << instance()->domain_name() << std::endl;
	std::cout << "\tProblem: " << instance()->problem_name() << std::endl;
	std::cout << "\t#Actions: " << instance()->num_actions() << std::endl;
	std::cout << "\t#Fluents: " << instance()->num_fluents() << std::endl;
}

float Approximate_SIW::do_search(SIW_Fwd &engine)
{

	engine.set_bound(1);
	engine.set_max_bound(m_iw_bound - 1);
	engine.start();

	std::vector<aptk::Action_Idx> plan;
	float cost;

	float ref = aptk::time_used();
	float t0 = aptk::time_used();

	unsigned expanded_0 = engine.expanded();
	unsigned generated_0 = engine.generated();

	std::ofstream plan_stream(m_plan_filename.c_str());

	if (engine.find_solution(cost, plan))
	{
		std::cout << "Plan found with cost: " << cost << std::endl;
		for (unsigned k = 0; k < plan.size(); k++)
		{
			std::cout << k + 1 << ". ";
			const aptk::Action &a = *(instance()->actions()[plan[k]]);
			std::cout << a.signature();
			std::cout << std::endl;
			plan_stream << a.signature() << std::endl;
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
	else
	{
		std::cout << ";; NOT I-REACHABLE ;;" << std::endl;
	}
	float total_time = aptk::time_used() - ref;
	std::cout << "Total time: " << total_time << std::endl;
	std::cout << "Nodes generated during search: " << engine.generated() << std::endl;
	std::cout << "Nodes expanded during search: " << engine.expanded() << std::endl;
	std::cout << "Nodes pruned by bound: " << engine.sum_pruned_by_bound() << std::endl;
	std::cout << "Average ef. width: " << engine.avg_B() << std::endl;
	std::cout << "Max novelty expanded: " << engine.max_B() << std::endl;
	/*
	std::cout << "Bloom Fillratio: " << engine.bloom_fillratio() <<std::endl;
	std::cout << "Novelty-Num_nodes Map: { ";
	for (std::pair<unsigned, unsigned> nov_count : engine.novelty_numbers()){
			std::cout << nov_count.first << ": " << nov_count.second << ", ";
	}
	std::cout << "}"<< std::endl;
	*/
#ifdef __linux__
	aptk::report_memory_usage();
#endif
	plan_stream.close();
	return total_time;
}

void Approximate_SIW::solve()
{

	Fwd_Search_Problem search_prob(instance());

	// if ( !instance()->has_conditional_effects() ) {
	// 	H2_Fwd    h2( search_prob );
	// 	h2.compute_edeletes( *instance() );
	// }
	// else
	instance()->compute_edeletes();

	Gen_Lms_Fwd gen_lms(search_prob);
	Landmarks_Graph graph(*instance());

	gen_lms.set_only_goals(true);
	gen_lms.compute_lm_graph_set_additive(graph);

	std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
	// graph.print( std::cout );

	std::cout << "Starting search with IW (time budget is 60 secs)..." << std::endl;

	SIW_Fwd siw_engine(search_prob, m_sampling_factor, m_sampling_strategy,
										 m_rand_seed, m_min_k4sample);
	siw_engine.set_goal_agenda(&graph);

	float iw_t = do_search(siw_engine);

	std::cout << "IW search completed in " << iw_t << " secs, check '" << m_log_filename << "' for details" << std::endl;
}
