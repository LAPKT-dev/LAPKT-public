#include <py_strips_interface.hxx>
#include <cstring>
#include <fstream>
#include <iostream>

STRIPS_Interface::STRIPS_Interface()
{
	m_parsing_time = 0.0f;
	m_ignore_action_costs = false;
	m_problem = new aptk::STRIPS_Problem;
}
STRIPS_Interface::STRIPS_Interface(std::string domain, std::string instance)
{
	m_parsing_time = 0.0f;
	m_ignore_action_costs = false;
	m_problem = new aptk::STRIPS_Problem(domain, instance);
}

STRIPS_Interface::~STRIPS_Interface() {}

void STRIPS_Interface::add_atom(std::string name)
{
	assert(m_negated.empty());
	aptk::STRIPS_Problem::add_fluent(*instance(), name);
}

void STRIPS_Interface::add_action(std::string name, bool flag_tarski)
{
	aptk::Fluent_Vec empty;
	aptk::Conditional_Effect_Vec dummy_ceffs;
	aptk::STRIPS_Problem::add_action(*instance(),
																	 name, empty, empty, empty, dummy_ceffs, 1.0f, flag_tarski);
}

// Anu - Updated for Tarski CPP integration
void STRIPS_Interface::notify_negated_atom(unsigned &fl_idx)
{
	assert(fl_idx < instance()->num_fluents());
	if (m_negated_conditions.find(fl_idx) == m_negated_conditions.end())
	{
		m_negated_conditions.insert(fl_idx);
		aptk::Fluent *fl = instance()->fluents()[fl_idx];
		assert(fl != nullptr);
		std::string negated_signature = "(not " + fl->signature() + ")";
		unsigned neg_fl_idx = aptk::STRIPS_Problem::add_fluent(
				*instance(), negated_signature);
		m_negated.at(fl_idx) = instance()->fluents()[neg_fl_idx];
	}
}

void STRIPS_Interface::notify_negated_conditions(py::list &fluents)
{
	for (int i = 0; i < py::len(fluents); i++)
	{
		unsigned fl_index = fluents[i].cast<unsigned>();
		assert(fl_index < instance()->num_fluents());
		m_negated_conditions.insert(fl_index);
	}
}

void STRIPS_Interface::create_negated_fluents()
{
	m_negated.resize(instance()->num_fluents());
	unsigned count = 0;
	for (auto fl_idx : m_negated_conditions)
	{
		aptk::Fluent *fl = instance()->fluents()[fl_idx];
		assert(fl != nullptr);
		std::string negated_signature = "(not " + fl->signature() + ")";
		unsigned neg_fl_idx = aptk::STRIPS_Problem::add_fluent(*instance(), negated_signature);
		m_negated.at(fl_idx) = instance()->fluents()[neg_fl_idx];
		count++;
	}
	std::cout << count << " negated fluents created" << std::endl;
}

// Anu - For Tarski CPP integration
void STRIPS_Interface::set_size_negated_fluents(size_t size)
{
	m_negated.resize(size, nullptr);
}
// For Py interface
void STRIPS_Interface::add_precondition(int index, py::list &lits)
{
	aptk::Action &action = *(m_problem->actions()[index]);
	for (int i = 0; i < py::len(lits); i++)
	{
		py::tuple li = lits[i];
		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();

		if (negated)
			fl_idx = m_negated[fl_idx]->index();
		action.prec_vec().push_back(fl_idx);
		action.prec_set().set(fl_idx);
		action.prec_varval().push_back(std::make_pair(fl_idx, 0));
	}
}

// For Tarski CPP
void STRIPS_Interface::add_precondition(int index,
																				std::vector<std::pair<int, bool>> &lits)
{
	aptk::Action &action = *(m_problem->actions()[index]);
	for (size_t i = 0; i < lits.size(); i++)
	{
		int fl_idx = lits[i].first;
		bool negated = lits[i].second;

		if (negated)
			fl_idx = m_negated[fl_idx]->index();

		action.prec_vec().push_back(fl_idx);
		// action.prec_set().set(fl_idx);
		action.prec_varval().push_back(std::make_pair(fl_idx, 0));
	}
}

void STRIPS_Interface::add_cond_effect(int index, py::list &cond_lits,
																			 py::list &eff_lits)
{
	aptk::Action &action = *(m_problem->actions()[index]);
	aptk::Fluent_Vec cond_fluents;
	aptk::Fluent_Vec add_fluents;
	aptk::Fluent_Vec del_fluents;
	for (int i = 0; i < py::len(cond_lits); i++)
	{
		py::tuple li = cond_lits[i];
		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();
		if (negated)
			fl_idx = m_negated[fl_idx]->index();

		cond_fluents.push_back(fl_idx);
	}

	for (int i = 0; i < py::len(eff_lits); i++)
	{
		py::tuple li = eff_lits[i];

		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();

		if (m_negated[fl_idx] == nullptr)
		{
			if (negated)
			{
				del_fluents.push_back(fl_idx);
			}
			else
			{
				add_fluents.push_back(fl_idx);
			}
			continue;
		}
		int neg_fl_idx = m_negated[fl_idx]->index();
		if (negated)
		{
			add_fluents.push_back(neg_fl_idx);
			del_fluents.push_back(fl_idx);
			continue;
		}
		del_fluents.push_back(neg_fl_idx);
		add_fluents.push_back(fl_idx);
	}
	aptk::Conditional_Effect *cond_eff =
			new aptk::Conditional_Effect(*instance());
	cond_eff->define(cond_fluents, add_fluents, del_fluents);
	action.ceff_vec().push_back(cond_eff);
	m_problem->notify_cond_eff_in_action();
}

// FOR TARSKI CPP ------------------------------------------------------------//
void STRIPS_Interface::add_cond_effect(int index,
																			 std::vector<std::pair<int, bool>> &cond_lits,
																			 std::vector<std::pair<int, bool>> &eff_lits)
{
	aptk::Action &action = *(m_problem->actions()[index]);

	aptk::Fluent_Vec cond_fluents;
	aptk::Fluent_Vec add_fluents;
	aptk::Fluent_Vec del_fluents;

	for (size_t i = 0; i < cond_lits.size(); i++)
	{
		int fl_idx = cond_lits[i].first;
		bool negated = cond_lits[i].second;

		if (negated)
			fl_idx = m_negated[fl_idx]->index();

		cond_fluents.push_back(fl_idx);
	}
	for (size_t i = 0; i < eff_lits.size(); i++)
	{
		int fl_idx = eff_lits[i].first;
		bool negated = eff_lits[i].second;
		if (negated)
		{
			del_fluents.push_back(fl_idx);
		}
		else
		{
			add_fluents.push_back(fl_idx);
		}
	}

	aptk::Conditional_Effect *cond_eff =
			new aptk::Conditional_Effect(*instance(), true);
	// cond_eff->define(cond_fluents, add_fluents, del_fluents);
	for (size_t k = 0; k < cond_fluents.size(); k++)
	{
		cond_eff->prec_vec().push_back(cond_fluents[k]);
	}
	for (size_t k = 0; k < add_fluents.size(); k++)
	{
		cond_eff->add_vec().push_back(add_fluents[k]);
	}
	for (size_t k = 0; k < del_fluents.size(); k++)
	{
		cond_eff->del_vec().push_back(del_fluents[k]);
	}

	action.ceff_vec().push_back(cond_eff);
	m_problem->notify_cond_eff_in_action();
}

void STRIPS_Interface::add_effect(int index, py::list &lits)
{
	aptk::Action &action = *(m_problem->actions()[index]);
	for (int i = 0; i < py::len(lits); i++)
	{
		py::tuple li = lits[i];
		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();
		if (m_negated[fl_idx] == nullptr)
		{
			if (negated)
			{
				action.del_vec().push_back(fl_idx);
				action.del_set().set(fl_idx);
				action.edel_vec().push_back(fl_idx);
				action.edel_set().set(fl_idx);
			}
			else
			{
				action.add_vec().push_back(fl_idx);
				action.add_set().set(fl_idx);
			}
			continue;
		}
		int neg_fl_idx = m_negated[fl_idx]->index();
		if (negated)
		{
			action.add_vec().push_back(neg_fl_idx);
			action.add_set().set(neg_fl_idx);
			action.del_vec().push_back(fl_idx);
			action.del_set().set(fl_idx);
			action.edel_vec().push_back(fl_idx);
			action.edel_set().set(fl_idx);
			continue;
		}
		action.del_vec().push_back(neg_fl_idx);
		action.del_set().set(neg_fl_idx);
		action.edel_vec().push_back(neg_fl_idx);
		action.edel_set().set(neg_fl_idx);
		action.add_vec().push_back(fl_idx);
		action.add_set().set(fl_idx);
	}
}

// FOR TARSKI CPP --------------------------------------------------------//
void STRIPS_Interface::add_effect(int index,
																	std::vector<std::pair<int, bool>> &lits)
{
	aptk::Action &action = *(m_problem->actions()[index]);
	for (size_t i = 0; i < lits.size(); i++)
	{
		int fl_idx = lits[i].first;
		bool negated = lits[i].second;
		if (negated)
		{
			action.del_vec().push_back(fl_idx);
			// action.del_set().set(fl_idx);
			action.edel_vec().push_back(fl_idx);
			// action.edel_set().set(fl_idx);
		}
		else
		{
			action.add_vec().push_back(fl_idx);
			// action.add_set().set(fl_idx);
		}
	}
}

// FOR TARSKI CPP -- FINALIZE ACTION
void STRIPS_Interface::finalize_actions()
{
	// for all actions
	size_t idx_max = m_negated.size();
	for (auto action : m_problem->actions())
	{
		// process negated in del
		action->prec_set().resize(instance()->num_fluents());
		action->add_set().resize(instance()->num_fluents());
		action->del_set().resize(instance()->num_fluents());
		action->edel_set().resize(instance()->num_fluents());
		for (auto f_idx : action->prec_vec())
		{
			action->prec_set().set(f_idx);
		}
		for (auto f_idx : action->del_vec())
		{
			action->del_set().set(f_idx);
			action->edel_set().set(f_idx);
			if (m_negated[f_idx] != nullptr && f_idx < idx_max)
			{
				int neg_f_idx = m_negated[f_idx]->index();
				action->add_vec().push_back(neg_f_idx);
				action->add_set().set(neg_f_idx);
			}
		} // del_vec
		// process negated in add
		for (auto f_idx : action->add_vec())
		{
			action->add_set().set(f_idx);
			if (m_negated[f_idx] != nullptr && f_idx < idx_max)
			{
				int neg_f_idx = m_negated[f_idx]->index();
				action->del_vec().push_back(neg_f_idx);
				action->del_set().set(neg_f_idx);
				action->edel_vec().push_back(neg_f_idx);
				action->edel_set().set(neg_f_idx);
			}
		} // add_vec
		// process negated in conditional effects
		for (auto ceff : action->ceff_vec())
		{
			ceff->prec_set().resize(instance()->num_fluents());
			ceff->add_set().resize(instance()->num_fluents());
			ceff->del_set().resize(instance()->num_fluents());
			for (auto f_idx : ceff->prec_vec())
			{
				ceff->prec_set().set(f_idx);
			}
			for (auto f_idx : ceff->del_vec())
			{
				ceff->del_set().set(f_idx);
				if (m_negated[f_idx] != nullptr && f_idx < idx_max)
				{
					int neg_f_idx = m_negated[f_idx]->index();
					ceff->add_vec().push_back(neg_f_idx);
					ceff->add_set().set(neg_f_idx);
				}
			} // ceff->del_vec
			for (auto f_idx : ceff->add_vec())
			{
				ceff->add_set().set(f_idx);
				if (m_negated[f_idx] != nullptr && f_idx < idx_max)
				{
					int neg_f_idx = m_negated[f_idx]->index();
					ceff->del_vec().push_back(neg_f_idx);
					ceff->del_set().set(neg_f_idx);
				}
			} // ceff->add_vec
		}		// ceff
	}			// actions
}

void STRIPS_Interface::add_mutex_group(py::list &lits)
{
	aptk::Fluent_Vec group;
	for (int i = 0; i < py::len(lits); i++)
	{
		py::tuple li = (lits[i]);
		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();
		if (negated)
			fl_idx = m_negated[fl_idx]->index();
		group.push_back(fl_idx);
	}
	m_problem->mutexes().add(group);
}

void STRIPS_Interface::set_cost(int index, float c)
{
	aptk::Action &action = *(m_problem->actions()[index]);
	if (m_ignore_action_costs)
	{
		action.set_cost(1.0f);
		return;
	}
	const float min_action_cost = 1e-3;
	if (c < min_action_cost)
		c = min_action_cost;
	action.set_cost(c);
}

void STRIPS_Interface::set_init(py::list &lits)
{
	aptk::Fluent_Vec I;
	for (int i = 0; i < py::len(lits); i++)
	{
		py::tuple li = (lits[i]);
		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();
		if (negated)
		{
			assert(m_negated[fl_idx]);
			I.push_back(m_negated[fl_idx]->index());
			continue;
		}
		I.push_back(fl_idx);
	}
	// complete initial state under negation
	for (unsigned p = 0; p < instance()->num_fluents(); p++)
	{
		if (p >= m_negated.size())
			continue; // p is a negated fluent!
		if (std::find(I.begin(), I.end(), p) != I.end())
			continue;
		assert(p < m_negated.size());
		if (m_negated.at(p))
			I.push_back(m_negated[p]->index());
	}
	aptk::STRIPS_Problem::set_init(*instance(), I);
}

// FOR TARSKI CPP
void STRIPS_Interface::set_init(std::vector<std::pair<int, bool>> &lits)
{

	aptk::Fluent_Vec I;

	for (size_t i = 0; i < lits.size(); i++)
	{
		int fl_idx = lits[i].first;
		bool negated = lits[i].second;
		if (negated)
		{
			assert(m_negated[fl_idx]);
			I.push_back(m_negated[fl_idx]->index());
			continue;
		}
		I.push_back(fl_idx);
	}
	// complete initial state under negation
	for (unsigned p = 0; p < instance()->num_fluents(); p++)
	{
		if (p >= m_negated.size())
			continue; // p is a negated fluent!
		if (std::find(I.begin(), I.end(), p) != I.end())
			continue;
		assert(p < m_negated.size());
		if (m_negated.at(p))
			I.push_back(m_negated[p]->index());
	}

	aptk::STRIPS_Problem::set_init(*instance(), I);
}
void STRIPS_Interface::set_goal(py::list &lits)
{
	aptk::Fluent_Vec G;

	for (int i = 0; i < py::len(lits); i++)
	{
		py::tuple li = (lits[i]);
		int fl_idx = li[0].cast<int>();
		bool negated = li[1].cast<bool>();
		if (negated)
		{
			assert(m_negated[fl_idx]);
			G.push_back(m_negated[fl_idx]->index());
			continue;
		}
		G.push_back(fl_idx);
	}
	aptk::STRIPS_Problem::set_goal(*instance(), G);
}
// FOR TARSKI CPP
void STRIPS_Interface::set_goal(std::vector<std::pair<int, bool>> &lits)
{
	aptk::Fluent_Vec G;

	for (size_t i = 0; i < lits.size(); i++)
	{
		int fl_idx = lits[i].first;
		bool negated = lits[i].second;
		if (negated)
		{
			assert(m_negated[fl_idx]);
			G.push_back(m_negated[fl_idx]->index());
			continue;
		}
		G.push_back(fl_idx);
	}
	aptk::STRIPS_Problem::set_goal(*instance(), G);
}

void STRIPS_Interface::set_domain_name(std::string name)
{
	instance()->set_domain_name(name);
}

void STRIPS_Interface::set_problem_name(std::string name)
{
	instance()->set_problem_name(name);
}

void STRIPS_Interface::print_action(int index)
{
	instance()->actions()[index]->print(*instance(), std::cout);
}

void STRIPS_Interface::write_ground_pddl(std::string domain, std::string problem)
{
	/*
	std::ofstream domain_stream(domain.c_str());
	m_inst->write_domain(domain_stream);
	std::ofstream problem_stream(problem.c_str());
	m_inst->write_problem(problem_stream);
	*/
}

void STRIPS_Interface::setup(bool gen_match_table)
{
	instance()->make_action_tables(gen_match_table);
	instance()->make_effect_tables();
}

void STRIPS_Interface::print_fluents()
{
	std::ofstream out("fluents.list");
	instance()->print_fluents(out);
	out.close();
}

void STRIPS_Interface::print_actions()
{
	std::ofstream out("actions.list");
	instance()->print_actions(out);
	out.close();
}
