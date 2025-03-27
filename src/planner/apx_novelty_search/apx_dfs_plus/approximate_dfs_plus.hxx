/**
 * @file approximate_dfs_plus.hxx
 * @author Anubhav Singh (anubhav.singh.er@pm.me)
 * @author Miquel Ramirez (miquel.ramirez@unimelb.edu.au)
 * @author Nir Lipovetzky (nirlipo@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files
  (the "Software"), to deal in the Software without restriction,
  including without limitation the rights to use, copy, modify, merge,
  publish, distribute, sublicense, and/or sell copies of the Software,
  and to permit persons to whom the Software is furnished to do so, subject
  to the following conditions:

  The above copyright notice and this permission notice shall be included
  in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#ifndef __APPROXIMATE_DFS_PLUS__
#define __APPROXIMATE_DFS_PLUS__

#include <py_strips_interface.hxx>
#include <fwd_search_prob.hxx>
#include <approximate_novelty_partition_1.hxx>
#include <h_1.hxx>
#include <rp_heuristic.hxx>

#include "approx_novelty_rp_iw.hxx"
#include "approx_novelty_serialized_search.hxx"
#include "approx_novelty_dfs_plus.hxx"

// #include <aptk/rp_iw.hxx>
// #include <aptk/dfs_plus.hxx>
// #include <aptk/serialized_search.hxx>

using aptk::agnostic::Fwd_Search_Problem;
using aptk::agnostic::H1_Heuristic;
using aptk::agnostic::H_Add_Evaluation_Function;
using aptk::agnostic::Relaxed_Plan_Heuristic;

using aptk::agnostic::Approximate_Novelty_Partition;
using aptk::search::Approximate_Serialized_Search;
using aptk::search::novelty_spaces::Approximate_DFS_Plus_Search;
using aptk::search::novelty_spaces::Approximate_RP_IW_Search;

class Approximate_DFS_Plus : public STRIPS_Interface
{
public:
	typedef aptk::search::novelty_spaces::Node<aptk::State> IW_Node;
	typedef Approximate_Novelty_Partition<Fwd_Search_Problem, IW_Node> H_Novel_Fwd;

	typedef H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function> H_Add_Fwd;
	typedef Relaxed_Plan_Heuristic<Fwd_Search_Problem, H_Add_Fwd> H_Add_Rp_Fwd;

	typedef Approximate_RP_IW_Search<Fwd_Search_Problem, H_Novel_Fwd, H_Add_Rp_Fwd> RP_IW_Fwd;
	typedef Approximate_DFS_Plus_Search<Fwd_Search_Problem, RP_IW_Fwd, IW_Node> DFS_Plus_Fwd;

	Approximate_DFS_Plus();
	Approximate_DFS_Plus(std::string, std::string);

	virtual ~Approximate_DFS_Plus();

	virtual void setup(bool gen_match_tree = true);
	void solve();

	int m_iw_bound;
	std::string m_log_filename;
	std::string m_plan_filename;
	float m_sampling_factor;
	std::string m_sampling_strategy;
	unsigned m_rand_seed;
	unsigned m_min_k4sample;

protected:
	float do_search(DFS_Plus_Fwd &engine);
};

#endif
