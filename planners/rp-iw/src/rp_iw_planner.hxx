#ifndef __RP_IW_PLANNER__
#define __RP_IW_PLANNER__

#include <py_strips_prob.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <fwd_search_prob.hxx>
#include <novelty_partition.hxx>
#include <aptk/rp_iw.hxx>
#include <h_1.hxx>
#include <rp_heuristic.hxx>

using	aptk::agnostic::Fwd_Search_Problem;

using 	aptk::agnostic::H1_Heuristic;
using	aptk::agnostic::H_Add_Evaluation_Function;
using	aptk::agnostic::Relaxed_Plan_Heuristic;

using 	aptk::agnostic::Novelty_Partition;
using	aptk::search::novelty_spaces::RP_IW;


typedef	        aptk::search::novelty_spaces::Node< aptk::State >	                                        IW_Node;
typedef         Novelty_Partition<Fwd_Search_Problem, IW_Node>                                                  H_Novel_Fwd;
typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	                                H_Add_Fwd; 
typedef		Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >		                                H_Add_Rp_Fwd;
typedef		RP_IW< Fwd_Search_Problem, H_Novel_Fwd, H_Add_Rp_Fwd >	                                        RP_IW_Fwd;

class	RPIW_Planner : public STRIPS_Problem
{
public:

	RPIW_Planner( );
	RPIW_Planner( std::string, std::string );
	virtual ~RPIW_Planner();

	
	virtual void setup();
	void	solve();

	int		m_iw_bound;
	std::string	m_log_filename;
	std::string	m_plan_filename;

protected:
	float   do_search_single_goal( RP_IW_Fwd& engine, aptk::STRIPS_Problem& plan_prob, std::ofstream& plan_stream );
	float	do_search( RP_IW_Fwd& engine, aptk::STRIPS_Problem& plan_prob, std::ofstream& plan_stream );

};

#endif
