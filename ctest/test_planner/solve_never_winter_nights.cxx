/**
 * @file solve_never_winter_nights.cxx
 * @author Anubhav Singh a.k.a. Anu (anubhav.singh.er@protonmail.com)
 * and Miquel Ramirez <miquel.ramirez@unimelb.edu.au>
 * and Nir Lipovetzky <nirlipo@gmail.com>
 * @brief build a STRIPS model for never winter night
 *
 * @note this is adaptation for CTest of MRJ's original work on C++ examples
 *
 * @version 1.0
 * @date 2022-08-16
 *
 * @copyright Copyright (c) 2023
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge,
 * publish, distribute, sublicense, and/or sell copies of the Software,
 * and to permit persons to whom the Software is furnished to do so, subject
 * to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 */

#include <model/strips_prob.hxx>
#include <model/fluent.hxx>
#include <model/action.hxx>
#include <model/cond_eff.hxx>
// #include <sstream>
#include <iostream>
#include <fstream>
#include <nwn.hxx>
#include <catch2/catch_test_macros.hpp>

#include <planner/apx_novelty_search/apx_bfws/approximate_bfws.hxx>
#include <planner/anytime_lapkt/anytime_lapkt.hxx>

/**
 * @brief A functional test of the interface to generate a STRIP_Problem
 * instance using a graph. We reuse the code from the example -
 * https://github.com/LAPKT-dev/LAPKT-public/blob/d54b68fcc67d5d75ea40b3921220c29f49c71814/examples/agnostic-examples/bfs/main.cxx
 *
 */
TEST_CASE("Solving Never Winter Nights!")
{

  std::cout << "BEGIN TEST_CASE(Assembling Never Winter Nights)" << std::endl;

  int dim = 5;
  float block_prob = 0.1f;
  int n_items = 4;
  int n_goal_items = 2;
  int n_goal_locs = 1;
  float W_0 = 5.0f;
  float decay = 0.75f;

  NWN_Mockup fake_nwn_situation;

  auto *test_planner = new Approximate_BFWS();

  aptk::STRIPS_Problem& plan_prob = *test_planner->instance();

  fake_nwn_situation.setup_nav_graph(dim, dim, block_prob);
  fake_nwn_situation.add_items(n_items);
  fake_nwn_situation.build_strips_problem(n_goal_items, n_goal_locs, plan_prob);

  std::cout << "Dumping STRIPS problem on file 'problem.strips'" << std::endl;
  std::ofstream outstream("problem.strips");
  plan_prob.print(outstream);
  outstream.close();
  std::cout << "Problem statistics:" << std::endl;
  std::cout << "\t# Fluents: " << plan_prob.num_fluents() << std::endl;
  std::cout << "\t# Actions: " << plan_prob.num_actions() << std::endl;
  std::cout << "Initial state: " << std::endl;
  plan_prob.print_fluent_vec(std::cout, plan_prob.init());
  std::cout << std::endl;
  std::cout << "Goal state: " << std::endl;
  plan_prob.print_fluent_vec(std::cout, plan_prob.goal());
  std::cout << std::endl;

  std::cout << "END TEST_CASE(Assembling Never Winter Nights)" << std::endl;

  std::cout << "BEGIN TEST_CASE(Solving Never Winter Nights)" << std::endl;

  test_planner->solve();


  delete test_planner;

  std::cout << "END TEST_CASE(Solving Never Winter Nights)" << std::endl;
}
