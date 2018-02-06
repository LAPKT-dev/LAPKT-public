#ifndef REPLAN_G
#define REPLAN_G

#include <list>
#include <ff_to_aptk.hxx>
#include <fwd_search_prob.hxx>
#include <boost/optional.hpp>





std::list<aptk::Action_Idx> string_to_action(const std::list<std::string>  &  ordered_plan,
                                             const aptk::STRIPS_Problem & search_prob);


std::shared_ptr<aptk::State> apply_all(aptk::State & state, std::list<aptk::Action_Idx> actions,
                                       aptk::STRIPS_Problem & prob);

boost::optional<aptk::Action_Idx> get_applicable(aptk::agnostic::Fwd_Search_Problem & prob,
                            aptk::State & s,
                            std::list<aptk::Action_Idx> & actions);

std::map<int, std::list<aptk::Action_Idx>> partial_reordering(
        aptk::agnostic::Fwd_Search_Problem & prob,
        aptk::STRIPS_Problem & sprob,
        std::list<aptk::Action_Idx> ordered_actions);

#endif
