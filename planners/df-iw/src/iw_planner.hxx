#ifndef __IW_PLANNER__
#define __IW_PLANNER__

#include <py_strips_prob.hxx>
#include <fwd_search_prob.hxx>
#include <novelty.hxx>
#include <aptk/iw.hxx>

typedef	aptk::search::brfs::Node< aptk::State >	          	                                IW_Node;
typedef aptk::agnostic::Novelty<aptk::agnostic::Fwd_Search_Problem, IW_Node>                   	H_Novel_Fwd;
typedef	aptk::search::brfs::IW< aptk::agnostic::Fwd_Search_Problem, H_Novel_Fwd >	        IW_Fwd;

class	IW_Planner : public STRIPS_Problem
{
public:

	IW_Planner( );
	IW_Planner( std::string, std::string );
	virtual ~IW_Planner();

	
	virtual void setup();
	void	solve();

	int		m_iw_bound;
	std::string	m_log_filename;
	std::string	m_plan_filename;

protected:
	
	float	do_search( IW_Fwd& engine);

protected:

	aptk::STRIPS_Problem	m_df_relaxation;

};

#endif
