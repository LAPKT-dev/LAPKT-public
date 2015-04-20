#ifndef __SIW_PLUS_BFS_F_PLANNER__
#define __SIW_PLUS_BFS_F_PLANNER__

#include <py_strips_prob.hxx>
#include <fwd_search_prob.hxx>
#include <novelty.hxx>
#include <novelty_partition.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_generator.hxx>
#include <landmark_graph_manager.hxx>
#include <landmark_count.hxx>
#include <h_2.hxx>
#include <h_1.hxx>
#include <rp_heuristic.hxx>
#include <h_unsat.hxx>

#include <aptk/open_list.hxx>
#include <aptk/at_gbfs_3h.hxx>

#include <aptk/rp_iw.hxx>
#include <aptk/serialized_search.hxx>
#include <aptk/siw_plus.hxx>

#include <fstream>

using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using 	aptk::agnostic::Landmarks_Graph;
using 	aptk::agnostic::Landmarks_Graph_Generator;
using   aptk::agnostic::Landmarks_Graph_Manager;
using 	aptk::agnostic::Landmarks_Count_Heuristic;

using 	aptk::agnostic::H2_Heuristic;
using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::Unsat_Goals_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using 	aptk::agnostic::Novelty_Partition;

using 	aptk::agnostic::Novelty;
using 	aptk::agnostic::Novelty_Partition;
using	aptk::search::novelty_spaces::RP_IW;
using	aptk::search::novelty_spaces::SIW_Plus;
using	aptk::search::Serialized_Search;

using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer_DH;
using	aptk::search::Node_Comparer_3H;
using	aptk::search::gbfs_3h::AT_GBFS_3H;
//using	aptk::search::gbfs_mh::Node;


typedef         H2_Heuristic<Fwd_Search_Problem>                  H2_Fwd;
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     Gen_Lms_Fwd;
typedef         Landmarks_Count_Heuristic<Fwd_Search_Problem>     H_Lmcount_Fwd;
typedef         Landmarks_Graph_Manager<Fwd_Search_Problem>       Land_Graph_Man;
typedef		Unsat_Goals_Heuristic<Fwd_Search_Problem>	  H_Unsat;

// MRJ: We start defining the type of nodes for our planner
typedef		aptk::search::gbfs_3h::Node< Fwd_Search_Problem, aptk::State >	Search_Node;
typedef         Novelty_Partition<Fwd_Search_Problem, Search_Node>              H_Novel_Fwd;

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use
typedef		Node_Comparer_3H< Search_Node >					Tie_Breaking_Algorithm;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >		BFS_Open_List;


// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd; //, aptk::agnostic::H1_Cost_Function::Ignore_Costs
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		H_Add_Rp_Fwd;

// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_GBFS_3H< Fwd_Search_Problem, H_Novel_Fwd, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List >    	Anytime_GBFS_H_Add_Rp_Fwd;


// MRJ: SIW Plus definitions
typedef		aptk::search::novelty_spaces::Node< aptk::State >	        IW_Node;
typedef		RP_IW< Fwd_Search_Problem, H_Novel_Fwd, H_Add_Rp_Fwd >	        RP_IW_Fwd;
typedef		SIW_Plus< Fwd_Search_Problem >                                  SIW_Plus_Fwd;


class	SIW_PLUS_BFS_F_Planner : public STRIPS_Problem
{
public:

	SIW_PLUS_BFS_F_Planner( );
	SIW_PLUS_BFS_F_Planner( std::string, std::string );
	explicit SIW_PLUS_BFS_F_Planner( const SIW_PLUS_BFS_F_Planner& );
	virtual ~SIW_PLUS_BFS_F_Planner();

	
	virtual void setup();
	void	solve();

	int		m_iw_bound;
	int		m_max_novelty;
	std::string	m_log_filename;
	std::string	m_plan_filename;
	bool		m_enable_siw_plus;
	bool		m_enable_bfs_f;

protected:

	float	do_stage_1( SIW_Plus_Fwd& engine, float& cost );	
	float	do_stage_2( Anytime_GBFS_H_Add_Rp_Fwd& engine, float B, float& cost);
	
	void	report_no_solution(std::string reason);

	std::ofstream	m_details;

};

#endif
