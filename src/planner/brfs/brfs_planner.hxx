#ifndef __BRFS_PLANNER__
#define __BRFS_PLANNER__

#include <py_strips_interface.hxx>
#include <fwd_search_prob.hxx>
#include <brfs.hxx>

using aptk::Action;
using aptk::agnostic::Fwd_Search_Problem;

using aptk::search::brfs::BRFS;

class BRFS_Planner : public STRIPS_Interface
{
public:
	// NIR: Now we're ready to define the BRFS algorithm
	typedef BRFS<Fwd_Search_Problem> BRFS_Fwd;

	BRFS_Planner();
	BRFS_Planner(std::string, std::string);
	virtual ~BRFS_Planner();

	virtual void setup(bool gen_match_tree = true);
	void solve();

	std::string m_log_filename;
	std::string m_plan_filename;

protected:
	float do_search(BRFS_Fwd &engine);
};

#endif
