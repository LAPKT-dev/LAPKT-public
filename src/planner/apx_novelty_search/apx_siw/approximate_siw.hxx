/**
 * @file approximate_siw.hxx
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

#ifndef __APPROXIMATE_SIW__
#define __APPROXIMATE_SIW__

#include <py_strips_interface.hxx>
#include <fwd_search_prob.hxx>
#include "approximate_novelty.hxx"
#include "approx_novelty_siw.hxx"

typedef aptk::search::Approximate_SIW_Search<aptk::agnostic::Fwd_Search_Problem> SIW_Fwd;

class Approximate_SIW : public STRIPS_Interface
{
public:
	Approximate_SIW();
	Approximate_SIW(std::string, std::string);
	Approximate_SIW(std::string, std::string, unsigned, std::string, std::string,
									float, std::string);
	virtual ~Approximate_SIW();

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
	float do_search(SIW_Fwd &engine);
};

#endif
