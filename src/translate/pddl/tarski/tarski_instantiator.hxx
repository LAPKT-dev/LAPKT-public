/**
 * @file tarski_instantiator.hxx
 * @author Anubhav Singh (anubhav.singh.er@protonmail.com)
 * @brief
 * @version 0.1
 * @date 2019-10-10
 *
 * @copyright Copyright (c) 2019
 *
 * Info:   Instantiate Objects from Tarski and transform them to
 * LAPKT STRIPS_Problem Class compatible objects. The transformed init,
 * goal and actions can be pushed to planner which uses STRIPS_Problem
 * to represent domain and problem.
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

#ifndef __TARSKI_INSTANTIATE__
#define __TARSKI_INSTANTIATE__

#include <py_strips_interface.hxx>
#include <pybind11/pybind11.h>

namespace py = pybind11;

using namespace py::literals;

// Define Constants

// Created a namespace for tarski specific classes
namespace tarski
{
    // Define Classes

    class Identifier
    {
    public:
        Identifier();
        Identifier(char type, std::string name);
        Identifier(const Identifier &other);
        void inplace_copy(const Identifier &other);
        friend bool operator<(const tarski::Identifier &lhs,
                              const tarski::Identifier &rhs)
        {
            return std::tie(lhs.get_type(), lhs.get_name()) <
                   std::tie(rhs.get_type(), rhs.get_name());
        }
        const std::string &get_name() const;
        const char &get_type() const;

    private:
        char m_type;        // - 'v' => variable, 'c' => constant
        std::string m_name; // - string representing the identifier
    };

    class Atom
    {
    public:
        Atom();
        Atom(std::string symbol, py::list &subterms);
        Atom(std::string symbol, std::vector<Identifier> &subterms);
        std::string instantiate(std::map<Identifier,
                                         std::string> &var_map);
        std::pair<int, bool> compile(std::map<Identifier,
                                              std::string> &var_map,
                                     std::vector<std::string> &init,
                                     std::map<std::string, int> &fluent);
        /*
        bool operator == (const Atom &R){
            return ( (this->m_symbol==R.m_symbol)&&
                     (this->m_term==R.m_term));
        };
        */
        std::string get_symbol();
        std::string publish();

    private:
        std::string m_symbol;
        std::vector<Identifier> m_term;
    };

    class Formula
    {
    public:
        Formula();
        Formula(std::string symbol, py::list &atom,
                py::list &formula, bool dnf_check);
        // Anu - To make a hash map of AND, OR and NOT processing
        // Typedef function Pointer for compilation methods
        typedef std::pair<std::vector<std::vector<
                              std::pair<int, bool>>>,
                          bool> (Formula::*functionpointer)(
            std::map<Identifier, std::string> &, std::vector<std::string> &,
            std::map<std::string, int> &, STRIPS_Interface *);
        // Typedef function for compilation methods
        typedef std::pair<std::vector<std::vector<
                              std::pair<int, bool>>>,
                          bool>(func)(
            std::map<Identifier, std::string> &, std::vector<std::string> &,
            std::map<std::string, int> &, STRIPS_Interface *);
        // Compilation methods for each fo the connectives
        func process_not;
        func process_and;
        func process_or;
        func process_tautology;
        func process_contradiction;

        // Anu - Pass task object to notify neg_atoms on the fly
        std::pair<std::vector<std::vector<
                      std::pair<int, bool>>>,
                  bool>
        instantiate(
            std::map<Identifier, std::string> &var_map,
            std::vector<std::string> &init,
            std::map<std::string, int> &fluent,
            STRIPS_Interface *out_task);
        std::string publish();
        // Anu - TODO - Figure out the root cause of error in this.
        /*
        bool operator == (const Formula &R) const{
            return((this->m_symbol==R.m_symbol) &&
                    (this->m_subformula==R.m_subformula) &&
                    (this->m_subatom==R.m_subatom));
        };
        */
    private:
        std::map<std::string, Formula::functionpointer> m_connective_map;
        bool m_dnf_check;
        std::string m_symbol;
        std::vector<Atom> m_subatom;
        std::vector<Formula> m_subformula;
    };

    class Action
    {
    public:
        Action();
        Action(std::string name, py::list &var, Formula *pre,
               py::list &effect, py::tuple &cost);
        // Anu- no need to return anything - send everything to out_task
        void instantiate(STRIPS_Interface *out_task, py::tuple &params, long &next_action_id, std::map<std::string, int> &fluent, std::vector<std::string> &init,
                         std::map<std::string, float> &fval);
        std::string m_name;
        std::string publish();

    private:
        std::vector<std::pair<Atom, float>> m_cost;
        Formula *m_pre;
        std::vector<Identifier> m_var;
        std::vector<std::pair<Formula,
                              std::vector<
                                  std::pair<Atom, bool>>>>
            m_effect;
    };

    class Tarski_Instantiator
    {
    public:
        // public variables
        long m_next_action_id;
        // Constructors
        Tarski_Instantiator();
        Tarski_Instantiator(STRIPS_Interface *strips_problem);
        Tarski_Instantiator(STRIPS_Interface *task,
                            py::list &init, Formula &goal,
                            py::list &fluent, py::list &f_value);
        // Methods
        void add_init(py::list &init);
        void set_init(); // Anu- Call after setting negated atoms
        void add_goal(Formula &goal);
        void set_goal();
        void add_fluents(py::list &fluent);
        void add_functions(py::list &func);
        void instantiate_action(tarski::Action &action,
                                py::list &reachable_params);
        void finalize_actions();

    private:
        STRIPS_Interface *m_task;            // STRIPS problem instance
        std::vector<std::string> m_init;     // init state atoms
        std::map<std::string, int> m_fluent; // grounded state vars
        std::map<std::string, float> m_fval; // function vals
        std::pair<std::vector<
                      std::vector<std::pair<
                          int, bool>>>,
                  bool>
            m_goal;
    };
}
#endif
