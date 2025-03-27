#ifndef __H_1__INTERACTIVE__
#define __H_1__INTERACTIVE__

#include <h_1.hxx>
#include <sstream>
#include <pybind11/pybind11.h>
// #include <pybind11/embed.h> // everything needed for embedding

namespace py = pybind11;

namespace aptk
{

	namespace agnostic
	{

		template <typename Interface, typename Search_Model,
							typename Fluent_Set_Eval_Func,
							H1_Cost_Function cost_opt = H1_Cost_Function::Use_Costs>
		class H1_Callback : public H1_Heuristic<Search_Model, Fluent_Set_Eval_Func>
		{
		public:
			typedef H1_Heuristic<Search_Model, Fluent_Set_Eval_Func> H1;
			typedef STRIPS_Problem::Best_Supporter Best_Supporter;
			H1_Callback(Interface &interface)
					: m_interface(interface),
						H1(
								Search_Model(interface.instance())) {}

			void print_values() const
			{
				H1::print_values(std::cout);
			}

			std::string compute_init_h()
			{
				float h;
				H1::m_already_updated.reset();
				H1::m_updated.clear();
				// STRIPS_Problem* prob = m_interface.instance();
				// Search_Model model(m_interface.instance());
				// State& init = Search_Model(m_interface.instance()).init();
				H1::initialize(*Search_Model(m_interface.instance()).init());
				H1::compute();
				h = H1::eval_func(H1::m_strips_model.goal().begin(),
													H1::m_strips_model.goal().end());

				std::ostringstream ss;
				if (h == infty)
					ss << "inf";
				else
					ss << h;
				return std::string(ss.str());
			}

			std::string compute_init_h(py::list &hval, py::list &best_supp)
			{
				float h;
				H1::m_already_updated.reset();
				H1::m_updated.clear();
				// STRIPS_Problem* prob = m_interface.instance();
				// Search_Model model(m_interface.instance());
				// State& init = Search_Model(m_interface.instance()).init();
				H1::initialize(*Search_Model(m_interface.instance()).init());
				compute(hval, best_supp);
				h = H1::eval_func(H1::m_strips_model.goal().begin(),
													H1::m_strips_model.goal().end());

				std::ostringstream ss;
				if (h == infty)
					ss << "inf";
				else
					ss << h;
				return std::string(ss.str());
			}

			void fetch_best_supporters(py::dict &best_supp)
			{
				const STRIPS_Problem &m_strips_model = H1::m_strips_model;
				std::vector<Best_Supporter> &m_best_supporters = H1::m_best_supporters;

				for (unsigned p = 0; p < m_strips_model.num_fluents(); p++)
				{
					best_supp[py::handle(py::str(
							m_strips_model.fluents()[p]->signature()))] =
							m_best_supporters[p].act_idx > m_strips_model.num_actions() - 1 ? "NA" : m_strips_model.actions()[m_best_supporters[p].act_idx]->signature();
				}
			}

			void fetch_hval_fluents(py::dict &hval)
			{
				const STRIPS_Problem &m_strips_model = H1::m_strips_model;
				std::vector<float> &m_values = H1::m_values;

				for (unsigned p = 0; p < m_strips_model.num_fluents(); p++)
				{
					std::ostringstream ss;
					if (m_values[p] == infty)
						ss << "inf";
					else
						ss << m_values[p];
					hval[py::handle(py::str(
							m_strips_model.fluents()[p]->signature()))] = std::string(ss.str());
				}
			}

			void fetch_relevant_actions(py::dict &relevant_actions)
			{
				const STRIPS_Problem &m_strips_model = H1::m_strips_model;
				std::vector<
						std::set<unsigned>> &m_relevant_actions = H1::m_relevant_actions;

				for (unsigned p = 0; p < m_strips_model.num_fluents(); p++)
				{
					relevant_actions[py::handle(
							py::str(m_strips_model.fluents()[p]->signature()))] = py::list();
					for (std::set<unsigned>::iterator action_it = m_relevant_actions[p].begin();
							 action_it != m_relevant_actions[p].end(); ++action_it)
					{
						py::list list = relevant_actions[py::handle(py::str(
								m_strips_model.fluents()[p]->signature()))];
						list.append(m_strips_model.actions()[*action_it]->signature());
					}
				}
			}

			void fetch_supporting_actions(py::dict &supp_actions)
			{
				const STRIPS_Problem &m_strips_model = H1::m_strips_model;
				for (unsigned p = 0; p < m_strips_model.num_fluents(); p++)
				{
					supp_actions[py::handle(
							py::str(m_strips_model.fluents()[p]->signature()))] = py::list();
				}
				for (unsigned i = 0; i < m_strips_model.num_actions(); i++)
				{
					const Action &a = *(m_strips_model.actions()[i]);
					// Relevant if the fluent is in the precondition
					for (unsigned j = 0; j < a.add_vec().size(); ++j)
					{
						py::list list = supp_actions[py::handle(py::str(
								m_strips_model.fluents()[a.add_vec()[j]]->signature()))];
						list.append(m_strips_model.actions()[i]->signature());
					}

					for (unsigned j = 0; j < a.ceff_vec().size(); ++j)
					{

						const Conditional_Effect &ceff = *(a.ceff_vec()[j]);

						for (unsigned k = 0; k < ceff.add_vec().size(); ++k)
						{
							py::list list = supp_actions[py::handle(py::str(
									m_strips_model.fluents()[ceff.add_vec()[k]]->signature()))];
							list.append(m_strips_model.actions()[i]->signature());
						}
					}
				}
			}
			void compute(py::list &hval, py::list &best_supp)
			{
				boost::circular_buffer<int> &m_updated = H1::m_updated;
				Bit_Set &m_already_updated = H1::m_already_updated;
				std::vector<
						std::set<unsigned>> &m_relevant_actions = H1::m_relevant_actions;
				const STRIPS_Problem &m_strips_model = H1::m_strips_model;
				std::vector<float> &m_values = H1::m_values;

				while (!m_updated.empty())
				{

					unsigned p = m_updated.front();
					// std::cout << p << ". " << m_strips_model.fluents()[p]->signature() << " " << m_values[p] << std::endl;
					m_updated.pop_front();
					m_already_updated.unset(p);

					// Successor_Generator::Heuristic_Iterator it( m_values, m_strips_model.successor_generator().nodes() );
					// int i = it.first();
					// std::cout << "First action: " << i << std::endl;
					// while ( i != -1 ) {
					for (std::set<unsigned>::iterator action_it = m_relevant_actions[p].begin();
							 action_it != m_relevant_actions[p].end(); ++action_it)
					{

						const Action &a = *(m_strips_model.actions()[*action_it]);

						float h_pre = H1::eval_func(
								a.prec_vec().begin(), a.prec_vec().end());

						if (h_pre == infty)
							continue;
						// assert( h_pre != infty );

						// std::cout << "Action " << *action_it << ". " << a.signature() << " relevant cost " << a.cost() << std::endl;

						float v = (cost_opt == H1_Cost_Function::Ignore_Costs ? 1.0f + h_pre : (cost_opt == H1_Cost_Function::Use_Costs ? (float)a.cost() + h_pre : 1.0f + (float)a.cost() + h_pre));

						for (Fluent_Vec::const_iterator it = a.add_vec().begin();
								 it != a.add_vec().end(); it++)
							H1::update(*it, v, a.index(), no_such_index);
						// Conditional effects
						for (unsigned j = 0; j < a.ceff_vec().size(); j++)
						{
							const Conditional_Effect &ceff = *(a.ceff_vec()[j]);
							float h_cond = H1::eval_func(
									ceff.prec_vec().begin(), ceff.prec_vec().end(), h_pre);
							if (h_cond == infty)
								continue;
							float v_eff = (cost_opt == H1_Cost_Function::Ignore_Costs ? 1.0f + h_cond : (cost_opt == H1_Cost_Function::Use_Costs ? (float)a.cost() + h_cond : 1.0f + (float)a.cost() + h_cond));
							for (Fluent_Vec::const_iterator it = ceff.add_vec().begin();
									 it != ceff.add_vec().end(); it++)
								H1::update(*it, v_eff, a.index(), j);
						}

						// i = it.next();
					}
				}
			}

			Interface &m_interface;
		};

	};
};

#endif
