#ifndef __BRFS_PLANNER__
#define __BRFS_PLANNER__

#include <py_strips_prob.hxx>
#include <fwd_search_prob.hxx>
#include <aptk/brfs.hxx>

using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::Action;

using	aptk::search::brfs::BRFS;

// NIR: Now we're ready to define the BRFS algorithm
typedef		BRFS< Fwd_Search_Problem > BRFS_Fwd;



class	BRFS_Planner : public STRIPS_Problem
{
public:

	BRFS_Planner( );
	BRFS_Planner( std::string, std::string );
	virtual ~BRFS_Planner();

	
	virtual void setup();
	void	solve();


	std::string	m_log_filename;
	std::string	m_plan_filename;


protected:
	
	float	do_search( BRFS_Fwd& engine);

};

#endif
