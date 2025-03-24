/**
 * @file py_strips_interface.hxx
 * @author Anubhav Singh (anubhav.singh.er@pm.me)
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

#ifndef __PY_FOD_PROBLEM__
#define __PY_FOD_PROBLEM__
#define BOOST_BIND_GLOBAL_PLACEHOLDERS

#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <pybind11/pybind11.h>
#include <string>
#include <set>

namespace py = pybind11;

// shorthand
using namespace py::literals;

// class PYBIND11_EXPORT STRIPS_Interface {
class PYBIND11_EXPORT STRIPS_Interface
{
public:
	STRIPS_Interface();
	STRIPS_Interface(std::string, std::string);
	virtual ~STRIPS_Interface();

	aptk::STRIPS_Problem *instance()
	{
		return m_problem;
	}
	// aptk::STRIPS_Problem&	_instance(){
	// 	return *m_problem;
	// }
	aptk::Fluent_Vec &get_init() { return m_problem->init(); }
	aptk::Fluent_Vec &get_goal() { return m_problem->goal(); }
	void add_atom(std::string name);
	void add_action(std::string name, bool flag_tarski = false);
	void add_precondition(int index,
												std::vector<std::pair<int, bool>> &lits);
	void add_precondition(int index, py::list &lits);
	// For Tarski
	void add_cond_effect(int index, std::vector<std::pair<int, bool>> &cond_lits, std::vector<std::pair<int, bool>> &eff_lits);
	// For FD
	void add_cond_effect(int index, py::list &cond_lits,
											 py::list &eff_lits);
	// For Tarski
	void add_effect(int index, std::vector<std::pair<int, bool>> &list);
	// For FD
	void add_effect(int index, py::list &list);
	void set_cost(int index, float v);
	void finalize_actions();

	virtual void add_mutex_group(py::list &list);
	// For FD
	void notify_negated_conditions(py::list &list);
	// For Tarski
	void notify_negated_atom(unsigned &fl_idx);
	void create_negated_fluents();
	void set_size_negated_fluents(size_t size);

	// For Tarski
	void set_init(std::vector<std::pair<int, bool>> &list);
	// For FD
	void set_init(py::list &list);
	// For Tarski
	void set_goal(std::vector<std::pair<int, bool>> &list);
	void set_goal(py::list &list);
	void set_domain_name(std::string name);
	void set_problem_name(std::string name);

	virtual void setup(bool gen_match_tree = true);

	void print_action(int index);

	void print_fluents();
	void print_actions();

	std::string get_atom_name(int idx) const
	{
		return m_problem->fluents()[idx]->signature();
	}
	std::string get_domain_name() const { return m_problem->domain_name(); }
	std::string get_problem_name() const { return m_problem->problem_name(); }

	size_t n_atoms() const { return m_problem->num_fluents(); }
	size_t n_actions() const { return m_problem->num_actions(); }

	void write_ground_pddl(std::string domain, std::string instance);

	float m_parsing_time;
	bool m_ignore_action_costs;

protected:
	aptk::STRIPS_Problem *m_problem;
	std::set<int> m_negated_conditions;
	aptk::Fluent_Ptr_Vec m_negated;
};

#endif // py_strips_problem.hxx
