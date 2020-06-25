#ifndef __DFSIW_PLANNER__
#define __DFSIW_PLANNER__

#include <py_strips_interface.hxx>
#include <fwd_search_prob.hxx>
#include <novelty.hxx>
#include <siw.hxx>

class	DFSIW_Planner : public STRIPS_Interface
{
public:

    typedef	aptk::search::SIW< aptk::agnostic::Fwd_Search_Problem >  SIW_Fwd;

	DFSIW_Planner( );
	DFSIW_Planner( std::string, std::string );
	virtual ~DFSIW_Planner();

	
	virtual	void	setup(bool gen_match_tree=true);
	void	solve();

	int		m_iw_bound;
	std::string	m_log_filename;
	std::string	m_plan_filename;

protected:
	
	float	do_search( SIW_Fwd& engine);

protected:

	aptk::STRIPS_Problem	m_df_relaxation;

};

#endif
