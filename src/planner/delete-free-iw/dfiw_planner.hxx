#ifndef __DFIW_PLANNER__
#define __DFIW_PLANNER__

#include <py_strips_interface.hxx>
#include <fwd_search_prob.hxx>
#include <novelty.hxx>
#include <iw.hxx>

class DFIW_Planner : public STRIPS_Interface
{
public:
	typedef aptk::search::brfs::Node<
			aptk::State>
			IW_Node;
	typedef aptk::agnostic::Novelty<
			aptk::agnostic::Fwd_Search_Problem, IW_Node>
			H_Novel_Fwd;
	typedef aptk::search::brfs::IW<
			aptk::agnostic::Fwd_Search_Problem, H_Novel_Fwd>
			IW_Fwd;

	DFIW_Planner();
	DFIW_Planner(std::string, std::string);
	virtual ~DFIW_Planner();

	virtual void setup(bool gen_match_tree = true);
	void solve();

	int m_iw_bound;
	std::string m_log_filename;
	std::string m_plan_filename;

protected:
	float do_search(IW_Fwd &engine);

protected:
	aptk::STRIPS_Problem m_df_relaxation;
};

#endif
