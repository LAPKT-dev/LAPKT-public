#ifndef __IW_PLANNER__
#define __IW_PLANNER__

//---- CONSTANTS
#define IW_BOUND 2
#define LOG_FILE "planner.log"
#define PLAN_FILE "plan.ipc"

// Standard library
#include <iostream>
#include <fstream>

// LAPKT specific
#include <py_strips_interface.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <fwd_search_prob.hxx>
#include <novelty.hxx>
#include <h_2.hxx>
#include <h_1.hxx>
#include <iw.hxx>

using aptk::agnostic::Fwd_Search_Problem;

using aptk::agnostic::H1_Heuristic;
using aptk::agnostic::H2_Heuristic;
using aptk::agnostic::H_Max_Evaluation_Function;

using aptk::agnostic::Novelty;
using aptk::search::brfs::IW;

//---- IW_Planner Class -----------------------------------------------------//
class IW_Planner : public STRIPS_Interface
{
public:
        typedef aptk::search::brfs::Node<aptk::State> IW_Node;
        typedef Novelty<Fwd_Search_Problem, IW_Node> H_Novel_Fwd;
        typedef H2_Heuristic<Fwd_Search_Problem> H2_Fwd;
        typedef H1_Heuristic<Fwd_Search_Problem,
                             H_Max_Evaluation_Function>
            H1_Fwd;
        typedef IW<Fwd_Search_Problem, H_Novel_Fwd> IW_Fwd;

        IW_Planner();
        IW_Planner(std::string, std::string);
        IW_Planner(std::string, std::string, unsigned,
                   std::string, std::string);
        virtual ~IW_Planner();

        virtual void setup(bool gen_match_tree = true);
        void solve();

        unsigned m_iw_bound;
        std::string m_log_filename;
        std::string m_plan_filename;
        bool m_atomic = false;

protected:
        template <typename Search_Engine>
        float do_search(Search_Engine &engine,
                        aptk::STRIPS_Problem &plan_prob,
                        std::ofstream &plan_stream);
        template <typename Search_Engine>
        float do_inc_bound_search(Search_Engine &engine,
                                  aptk::STRIPS_Problem &plan_prob,
                                  std::ofstream &plan_stream);
        template <typename Search_Engine>
        float do_search_single_goal(
            Search_Engine &engine, aptk::STRIPS_Problem &plan_prob,
            std::ofstream &plan_stream);
};
// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//
#endif
