#include <iostream>
#include <fstream>

#include <fstream>

#include <ipc2014_rwa.hxx>


#include <ff_to_aptk.hxx>
#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>
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

#include <aptk/open_list.hxx>
#include <aptk/at_gbfs_3h.hxx>
#include <aptk/string_conversions.hxx>
#include <ipc2014_rwa.hxx>
#include <aptk/iw.hxx>
#include <aptk/serialized_search.hxx>
#include <aptk/siw.hxx>
#include <boost/program_options.hpp>
#include <aptk/ext_math.hxx>

//using	aptk::STRIPS_Problem;

namespace po = boost::program_options;

using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using 	aptk::agnostic::Landmarks_Graph;
using 	aptk::agnostic::Landmarks_Graph_Generator;
using   aptk::agnostic::Landmarks_Graph_Manager;
using 	aptk::agnostic::Landmarks_Count_Heuristic;

using 	aptk::agnostic::H2_Heuristic;
using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using   aptk::agnostic::H_Max_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;
using 	aptk::agnostic::Novelty_Partition;

using 	aptk::agnostic::Novelty;
using	aptk::search::brfs::IW;
using	aptk::search::Serialized_Search;

using 	aptk::search::Open_List;
using	aptk::search::Node_Comparer_DH;
using	aptk::search::Node_Comparer_3H;
using	aptk::search::gbfs_3h::AT_GBFS_3H;
//using	aptk::search::gbfs_mh::Node;

using	aptk::search::bfs_dq_mh::IPC2014_RWA;

typedef         H2_Heuristic<Fwd_Search_Problem>                  H2_Fwd;
typedef         Landmarks_Graph_Generator<Fwd_Search_Problem>     Gen_Lms_Fwd;
typedef         Landmarks_Count_Heuristic<Fwd_Search_Problem>     H_Lmcount_Fwd;
typedef         Landmarks_Graph_Manager<Fwd_Search_Problem>       Land_Graph_Man;

// MRJ: We start defining the type of nodes for our planner
typedef		aptk::search::gbfs_3h::Node< Fwd_Search_Problem, aptk::State >	Search_Node;
typedef         Novelty_Partition<Fwd_Search_Problem, Search_Node>              H_Novel_Fwd;

typedef		aptk::search::ipc2014::Node< aptk::State >		AT_Search_Node;


template <typename Node>
class Node_Comparer_3H_Metric
{

public:
    bool operator()( Node* a, Node* b ) const {
        using aptk::dless;
        using aptk::dequal;

        if ( dless( b->h1n(), a->h1n() ) ) return true;
        if ( dless( b->metric(), a->metric() )) return true;
        if( dequal( b->h1n(), a->h1n() ) ){
            if ( dless( b->h2n(), a->h2n() ) ) return true;
            if( dequal( b->h2n(), a->h2n() ) ){
                if ( dless( b->h3n(), a->h3n() ) )  return true;
            }
        }
        return false;


    }
};

// MRJ: Then we define the type of the tie-breaking algorithm
// for the open list we are going to use

typedef		Node_Comparer_3H< Search_Node >					Tie_Breaking_Algorithm;

// MRJ: Now we define the Open List type by combining the types we have defined before
typedef		Open_List< Tie_Breaking_Algorithm, Search_Node >		BFS_Open_List;
typedef		AT_Search_Node::Open_List					AT_BFS_Open_List;


// MRJ: Now we define the heuristics
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd; //, aptk::agnostic::H1_Cost_Function::Ignore_Costs
typedef		H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function>	H_Max_Fwd; //, aptk::agnostic::H1_Cost_Function::Ignore_Costs
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd >		H_Add_Rp_Fwd;

// MRJ: Now we're ready to define the BFS algorithm we're going to use
typedef		AT_GBFS_3H< Fwd_Search_Problem, H_Novel_Fwd, H_Lmcount_Fwd, H_Add_Rp_Fwd, BFS_Open_List, aptk::search::ClosedSet<BFS_Open_List::Node_Type> >    	Anytime_GBFS_H_Add_Rp_Fwd;
//typedef		AT_RWBFS_DQ_MH< Fwd_Search_Problem, H_Add_Rp_Fwd, H_Unsat /*H_Lmcount_Fwd*/, AT_BFS_Open_List >		Anytime_RWA;
typedef		IPC2014_RWA< Fwd_Search_Problem, H_Add_Fwd, H_Lmcount_Fwd, AT_BFS_Open_List >		Anytime_RWA;


// MRJ: SIW definitions
typedef		aptk::search::brfs::Node< aptk::State >	          	IW_Node;
typedef     Novelty<Fwd_Search_Problem, IW_Node>                    H_Simple_Novel_Fwd;
typedef		aptk::search::SIW< aptk::agnostic::Fwd_Search_Problem >  SIW_Fwd;
typedef		IW< Fwd_Search_Problem, H_Simple_Novel_Fwd, aptk::search::ClosedSet >	        IW_Fwd;


float do_stage_1( aptk::STRIPS_Problem& prob, SIW_Fwd& engine,
                  float& cost, int iw_bound,
                  std::ofstream& details, std::string plan_filename );

std::pair<float, std::vector< aptk::Action_Idx > >  do_stage_3(  aptk::STRIPS_Problem& prob, Anytime_RWA& engine, float B, float& cost,
                                                                 std::ofstream& details, std::string plan_filename  );

std::pair<float, std::vector< aptk::Action_Idx > > do_stage_2(  aptk::STRIPS_Problem& prob, Anytime_GBFS_H_Add_Rp_Fwd& engine,
                                                                float B, float& cost,std::ofstream& details, std::string plan_filename  );
void
process_command_line_options( int ac, char** av, po::variables_map& vars );

void
report_no_solution( std::string reason, std::string plan_filename );

void write_reordered_plan(std::string reordered_plan_filename, aptk::STRIPS_Problem & plan_prob, std::map<int, std::list<aptk::Action_Idx>>& p_plan, float metric=0.0f, float cost=0.0f);

void
process_plan(aptk::State & goal,
             Fwd_Search_Problem & search_prob,
             aptk::State & root,
             aptk::STRIPS_Problem & prob,
             std::string & plan_filename,
             std::pair<float, std::vector< aptk::Action_Idx > > & result,
             float cost=0.0);

int
run_planners(aptk::STRIPS_Problem & prob, bool enable_siw, bool enable_bfs_f, std::string & plan_filename, int max_novelty, int iw_bound);
