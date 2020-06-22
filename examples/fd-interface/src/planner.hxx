#ifndef __PLANNER__
#define __PLANNER__

#include <py_strips_prob.hxx>
#include <fwd_search_prob.hxx>



class	Planner : public STRIPS_Problem
{
public:

	Planner( );
	Planner( std::string, std::string );
	virtual ~Planner();

	
	virtual void setup();
	void	solve();
	void    dump_pddl();
	
	std::string	m_log_filename;
	std::string	m_plan_filename;

protected:
	
	float	do_search( );

};

#endif
