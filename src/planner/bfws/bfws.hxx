#ifndef __BFWS__
#define __BFWS__

/**
 * LAPKT includes
 */
#include <py_strips_interface.hxx>

#include <iostream>
#include <fstream>

#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>
#include <fwd_search_prob.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <landmark_graph_manager.hxx>
#include "landmark_count.hxx"
#include <h_2.hxx>
#include <h_1.hxx>
#include <layered_h_max.hxx>

#include <open_list.hxx>
#include <string_conversions.hxx>

#include <boost/program_options.hpp>

/**
 * Local includes
 */

// NIR: Files adapted from LAPKT
#include "novelty_partition_1.hxx"
#include "novelty_partition_2.hxx"
#include "ff_rp_heuristic.hxx"
#include "rp_heuristic.hxx"

#include "bfws_4h.hxx"
#include "bfws_2h.hxx"
#include "bfws_2h_M.hxx"
#include "bfws_2h_consistency.hxx"
#include "bfws_2h_consistency_M.hxx"

#include "ipc2014_rwa.hxx"

#include "new_node_comparer.hxx"

namespace po = boost::program_options;

/**
 * NAMESPACES
 */

// NIR: Model
using aptk::Action;
using aptk::agnostic::Fwd_Search_Problem;
// NIR: Heuristics
using aptk::agnostic::Landmarks_Count_Heuristic;
using aptk::agnostic::Landmarks_Graph;
using aptk::agnostic::Landmarks_Graph_Generator;
using aptk::agnostic::Landmarks_Graph_Manager;

using aptk::agnostic::H1_Cost_Function;
using aptk::agnostic::H1_Heuristic;
using aptk::agnostic::H2_Heuristic;
using aptk::agnostic::Layered_H_Max;
using aptk::agnostic::RP_Cost_Function;

using aptk::agnostic::FF_Relaxed_Plan_Heuristic;
using aptk::agnostic::H_Add_Evaluation_Function;
using aptk::agnostic::H_Max_Evaluation_Function;
using aptk::agnostic::Relaxed_Plan_Heuristic;

// NIR: Novelties
using aptk::agnostic::Novelty_Partition;
using aptk::agnostic::Novelty_Partition_2;

// NIR: Open List and evaluation functions
using aptk::search::Node_Comparer_2H;
using aptk::search::Node_Comparer_2H_gn_unit;
using aptk::search::Node_Comparer_4H;
using aptk::search::Open_List;

// NIR: Search Engines
using aptk::search::bfs_dq_mh::IPC2014_RWA;
using aptk::search::bfws_2h::BFWS_2H;
using aptk::search::bfws_2h::BFWS_2H_Consistency;
using aptk::search::bfws_2h::BFWS_2H_Consistency_M;
using aptk::search::bfws_2h::BFWS_2H_M;
using aptk::search::bfws_4h::BFWS_4H;

/**
 * DEFINITIONS
 */

// NIR: Heuristics
typedef H2_Heuristic<Fwd_Search_Problem> H2_Fwd;
typedef Landmarks_Graph_Generator<Fwd_Search_Problem> Gen_Lms_Fwd;
typedef Landmarks_Count_Heuristic<Fwd_Search_Problem> H_Lmcount_Fwd;
typedef Landmarks_Graph_Manager<Fwd_Search_Problem> Land_Graph_Man;

// NIR: Node representations for each search algorithm
typedef aptk::search::bfws_4h::Node<Fwd_Search_Problem, aptk::State> Search_Node_4h;
typedef aptk::search::bfws_2h::Node<Fwd_Search_Problem, aptk::State> Search_Node_2h;
typedef aptk::search::ipc2014::Node<aptk::State> AT_Search_Node;

// NIR: Novelty functions for each node type. Novelty partition expects class
// node to define partition() function. '_2' version expects partition2() function.
typedef Novelty_Partition<Fwd_Search_Problem, Search_Node_4h> H_Novel_Fwd_4h;
typedef Novelty_Partition_2<Fwd_Search_Problem, Search_Node_4h> H_Novel_2_Fwd_4h;

typedef Novelty_Partition<Fwd_Search_Problem, Search_Node_2h> H_Novel_Fwd_2h;

// NIR: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef Node_Comparer_4H<Search_Node_4h> Tie_Breaking_Algorithm_4h;
typedef Node_Comparer_2H_gn_unit<Search_Node_2h> Tie_Breaking_Algorithm_2h_ignore_costs;

// NIR: use this node comparer if you want BFWS to use gn with real costs
////////typedef		Node_Comparer_2H< Search_Node_2h >	        		Tie_Breaking_Algorithm_2h;

// NIR: Now we define the Open List type by combining the types we have defined before
typedef Open_List<Tie_Breaking_Algorithm_4h, Search_Node_4h> BFS_Open_List_4h;
typedef Open_List<Tie_Breaking_Algorithm_2h_ignore_costs, Search_Node_2h> BFS_Open_List_2h;
typedef AT_Search_Node::Open_List AT_BFS_Open_List;

// NIR: Now we define the heuristics
typedef H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function, H1_Cost_Function::Ignore_Costs> H_Add_Fwd;
typedef Relaxed_Plan_Heuristic<Fwd_Search_Problem, H_Add_Fwd, RP_Cost_Function::Ignore_Costs> H_Add_Rp_Fwd;

typedef H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function, H1_Cost_Function::Use_Costs> H_Add_Fwd_use_costs;
typedef Relaxed_Plan_Heuristic<Fwd_Search_Problem, H_Add_Fwd, RP_Cost_Function::Use_Costs> H_Add_Rp_Fwd_use_costs;

typedef Layered_H_Max<Fwd_Search_Problem> Alt_H_Max;
typedef FF_Relaxed_Plan_Heuristic<Fwd_Search_Problem, Alt_H_Max, unsigned> Classic_FF_H_Max;

// NIR: Now we're ready to define the BFS algorithm we're going to use, H_Lmcount can be used only with goals,
// or with landmarks computed from s0
typedef BFWS_2H<Fwd_Search_Problem, H_Novel_Fwd_2h, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List_2h> k_BFWS;
typedef BFWS_2H_M<Fwd_Search_Problem, H_Novel_Fwd_2h, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List_2h> k_BFWS_M;
typedef BFWS_4H<Fwd_Search_Problem, H_Novel_Fwd_4h, H_Lmcount_Fwd, H_Novel_2_Fwd_4h, H_Add_Rp_Fwd, BFS_Open_List_4h> BFWS_w_hlm_hadd;

// NIR: Consistency Search variants
typedef BFWS_2H_Consistency<Fwd_Search_Problem, H_Novel_Fwd_2h, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List_2h> k_BFWS_Consistency;
typedef BFWS_2H_Consistency_M<Fwd_Search_Problem, H_Novel_Fwd_2h, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List_2h> k_BFWS_Consistency_M;

// NIR: Anytime RWA*
typedef IPC2014_RWA<Fwd_Search_Problem, H_Add_Rp_Fwd_use_costs, H_Lmcount_Fwd, AT_BFS_Open_List> Anytime_RWA;

class BFWS : public STRIPS_Interface
{
public:
	BFWS();
	BFWS(std::string, std::string);
	virtual ~BFWS();

	virtual void setup(bool gen_match_tree = true);
	void solve();

	std::string m_log_filename;
	std::string m_plan_filename;
	std::string m_search_alg;
	unsigned m_M;
	unsigned m_max_novelty;
	bool m_anytime;
	bool m_found_plan;
	float m_cost;
	float m_cost_bound;
	bool m_verbose = false;

protected:
	template <typename Search_Engine>
	void bfws_options(Fwd_Search_Problem &search_prob, Search_Engine &bfs_engine, unsigned max_novelty, Landmarks_Graph &graph);

	template <typename Search_Engine>
	float do_search(Search_Engine &engine, aptk::STRIPS_Problem &plan_prob, std::ofstream &plan_stream);

	float do_anytime(Anytime_RWA &engine);
};

#endif
