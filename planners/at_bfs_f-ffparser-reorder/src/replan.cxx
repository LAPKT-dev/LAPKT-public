#include <iostream>
#include <fstream>
#include <boost/optional.hpp>

#include <boost/program_options.hpp>

#include <replan.hxx>

namespace po = boost::program_options;
using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::STRIPS_Problem;

void process_command_line(int ac, char * argv[], po::variables_map & vm){
    po::options_description desc( "Options:" );
    desc.add_options()
            ("help", "shows help message")
            ("domain", po::value<std::string>(), "input domain pddl file")
            ("problem", po::value<std::string>(), "input problem pddl file")
            ("output", po::value<std::string>(), "Output file for plan" )
            ("plan", po::value<std::string>(), "input ordered plan" )
            ("stdout", po::value<bool>()->default_value(false), "print result to stdout as s-expression");
    try {
        po::store( po::parse_command_line( ac, argv, desc ), vm );
        po::notify( vm );
        }
    catch ( std::exception& e ) {
        std::cerr << "Error: " << e.what() << std::endl;
        std::exit(1);
    }
    catch ( ... ) {
        std::cerr << "Exception of unknown type!" << std::endl;
        std::exit(1);
    }

    if ( vm.count("help") ) {
        std::cout << desc << std::endl;
        std::exit(0);
    }
}


std::list<aptk::Action_Idx> string_to_action(const std::list<std::string>  &  ordered_plan,
                                             const STRIPS_Problem & search_prob) {

    std::list<aptk::Action_Idx> result;
    for(std::string const & s: ordered_plan) {
        for ( uint i = 0; i < search_prob.num_actions(); i++ ) {
            if (search_prob.actions()[i]->signature() == s ) {
                result.push_back(i);
                break;
            }
        }
    }
    return result;
}


std::shared_ptr<aptk::State> apply_all(aptk::State & state, std::list<aptk::Action_Idx> actions,
                                       STRIPS_Problem & prob){
         if (actions.empty())
             return nullptr;
         std::shared_ptr<aptk::State> new_state = std::shared_ptr<aptk::State>(state.progress_through(*prob.actions()[actions.front()]));
         STRIPS_Problem::set_init( prob, new_state->fluent_vec() );
         actions.pop_front();
         for(auto i: actions){
                 new_state = std::shared_ptr<aptk::State>(new_state->progress_through(*prob.actions()[i]));
                 STRIPS_Problem::set_init( prob, new_state->fluent_vec() );
         }
         return new_state;
}


boost::optional<aptk::Action_Idx> get_applicable(Fwd_Search_Problem & prob,
                            aptk::State & s,
                            std::list<aptk::Action_Idx> & actions){
      if (prob.is_applicable(s, actions.front())){
            boost::optional<aptk::Action_Idx> result = actions.front();
            actions.pop_front();
            return result;
      }
      return boost::none;
}


std::map<int, std::list<aptk::Action_Idx>> partial_reordering(Fwd_Search_Problem & prob, STRIPS_Problem & sprob, std::list<aptk::Action_Idx> ordered_actions){

    if (ordered_actions.empty()){
        std::cerr << "Error: empty plan" << std::endl;
        std::exit(5);
    }
    //ассоциативный массив {0: пустой лист  }
    std::map<int, std::list<aptk::Action_Idx>> partially_ordered_plan;
    partially_ordered_plan[0] = std::list<aptk::Action_Idx>{};

    std::shared_ptr<aptk::State> state = std::shared_ptr<aptk::State>(prob.init());   //initial state
    int current_level  = 0;   // длинна цепочки действий, нужной для действия.
    while (!ordered_actions.empty()) {
              boost::optional<aptk::Action_Idx> action = get_applicable(prob, *state, ordered_actions);
              if (action.is_initialized()) {
                      partially_ordered_plan[current_level].push_back(action.get());
               }
              else {
                     if (partially_ordered_plan[current_level].empty()){
                         std::cerr << "can't reorder plan" << std::endl;
                         std::exit(-2);
                     }
                     state = apply_all(*state, partially_ordered_plan[current_level], sprob);
                     current_level += 1;
                     partially_ordered_plan[current_level] = std::list<aptk::Action_Idx>{};
             }
        }
    return   partially_ordered_plan;
}


std::list<std::string> read_plan(const std::string & path) {
     std::ifstream input_plan;
     input_plan.open(path, std::ifstream::in);
     std::list<std::string> result;
     while(input_plan.good()){
         std::string tmp;
         std::getline(input_plan, tmp);
         result.push_back(tmp);
     }
     return result;
}

