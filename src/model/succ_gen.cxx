
/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

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

#include <succ_gen.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <action.hxx>
#include <algorithm>
#include <iostream>

namespace aptk
{

	namespace agnostic
	{

		Successor_Generator::~Successor_Generator()
		{

			for (unsigned k = 0; k < m_nodes.size(); k++)
			{
				delete m_nodes[k];
			}
		}

		class Fluent_Cmp
		{
		public:
			Fluent_Cmp(const STRIPS_Problem &p)
					: m_problem(p)
			{
			}

			bool operator()(const unsigned &l, const unsigned &r) const
			{
				return m_problem.actions_requiring(l).size() < m_problem.actions_requiring(r).size();
			}

			const STRIPS_Problem &m_problem;
		};

		void Successor_Generator::build_fluent_ordering(std::vector<unsigned> &ord_fluents)
		{

			for (unsigned k = 0; k < m_problem.fluents().size(); k++)
			{
				unsigned op_count = m_problem.actions_requiring(k).size();
				if (op_count == 0)
					continue;
				ord_fluents.push_back(k);
			}

			// std::sort( ord_fluents.begin(), ord_fluents.end(), Fluent_Cmp( m_problem ) );
		}

		unsigned Successor_Generator::make_nodes(unsigned index, std::vector<unsigned> &F, const std::vector<const Action *> &acts)
		{
			if (acts.empty())
				return no_such_index;

			// Leaf Node
			if (index == F.size())
			{
				Node *n = new Node;
				unsigned node_index = m_nodes.size();
				m_nodes.push_back(n);
				for (unsigned k = 0; k < acts.size(); k++)
					n->actions().push_back(acts[k]);
				return node_index;
			}

			// Split action set
			std::vector<const Action *> true_set;
			std::vector<const Action *> dont_care_set;
			for (unsigned k = 0; k < acts.size(); k++)
			{
				if (acts[k]->prec_set().isset(F[index]))
					true_set.push_back(acts[k]);
				else
					dont_care_set.push_back(acts[k]);
			}

			Node *n = new Node(F[index]);
			unsigned node_index = m_nodes.size();
			m_nodes.push_back(n);
			n->set_true_num_actions(true_set.size());
			n->set_dont_care_num_actions(dont_care_set.size());

			if (!true_set.empty())
			{
				unsigned true_child = make_nodes(index + 1, F, true_set);
				n->set_true_child(true_child);
			}

			if (!dont_care_set.empty())
			{
				unsigned dont_care_child = make_nodes(index + 1, F, dont_care_set);
				n->set_dont_care_child(dont_care_child);
			}

			return node_index;
		}

		void Successor_Generator::build()
		{

			std::vector<unsigned> ordered_fluent_set;
			build_fluent_ordering(ordered_fluent_set);
			make_nodes(0, ordered_fluent_set, m_problem.actions());
			std::cout << "Successor generator built, with " << m_nodes.size() << " nodes" << std::endl;
		}

		void Successor_Generator::retrieve_applicable(const State &s, std::vector<int> &actions) const
		{
			std::deque<const Node *> open;
			open.push_back(m_nodes[0]);
			while (!open.empty())
			{
				const Node *n = open.front();
				open.pop_front();
				if (!n->selection_node())
				{
					for (unsigned k = 0; k < n->actions().size(); k++)
						actions.push_back(n->actions()[k]->index());
					continue;
				}
				if (s.entails(n->selection_fluent()))
				{
					if (n->true_child() != no_such_index)
					{
						open.push_back(m_nodes[n->true_child()]);
					}
				}
				if (n->dont_care_child() != no_such_index)
				{
					open.push_back(m_nodes[n->dont_care_child()]);
				}
			}
		}

		void Successor_Generator::retrieve_applicable(const State &s, std::vector<const Action *> &actions) const
		{

			std::deque<const Node *> open;
			open.push_back(m_nodes[0]);
			while (!open.empty())
			{
				const Node *n = open.front();
				open.pop_front();
				if (!n->selection_node())
				{
					for (unsigned k = 0; k < n->actions().size(); k++)
						actions.push_back(n->actions()[k]);
					continue;
				}
				if (s.entails(n->selection_fluent()))
				{
					if (n->true_child() != no_such_index)
						open.push_back(m_nodes[n->true_child()]);
				}
				if (n->dont_care_child() != no_such_index)
					open.push_back(m_nodes[n->dont_care_child()]);
			}
		}

		void Successor_Generator::retrieve_applicable(const std::vector<float> &v, std::vector<const Action *> &actions) const
		{

			std::deque<const Node *> open;
			open.push_back(m_nodes[0]);
			while (!open.empty())
			{
				const Node *n = open.front();
				open.pop_front();
				// std::cout << n->selection_fluent() << " " << n->true_num_actions()<< " " << n->dont_care_num_actions() << " " << n->true_child() << " " << n->dont_care_child() << std::endl;
				if (!n->selection_node())
				{
					for (unsigned k = 0; k < n->actions().size(); k++)
					{
						actions.push_back(n->actions()[k]);
						// std::cout << "Retrieved: " << n->actions()[k]->signature() << std::endl;
					}
					continue;
				}
				if (v[n->selection_fluent()] != infty)
				{
					if (n->true_child() != no_such_index)
					{
						open.push_back(m_nodes[n->true_child()]);
					}
				}
				if (n->dont_care_child() != no_such_index)
				{
					open.push_back(m_nodes[n->dont_care_child()]);
				}
			}
		}

		Successor_Generator::Iterator::Iterator(const State &s, const std::vector<Node *> &nodes)
				: m_state(s), m_nodes(nodes), m_current_node(NULL), m_index(no_such_index)
		{
			m_open.resize(m_nodes.size());
		}

		Successor_Generator::Iterator::~Iterator()
		{
		}

		int Successor_Generator::Iterator::first()
		{
			// m_open.push_back( m_nodes[0] );
			m_open_index = 0;
			m_open[m_open_index] = true;
			return advance();
		}

		int Successor_Generator::Iterator::advance()
		{
			// while ( !m_open.empty() ) {
			for (; m_open_index < m_open.size(); m_open_index++)
			{
				// const Node* n = m_open.front();
				// m_open.pop_front();
				if (!m_open[m_open_index])
					continue;
				const Node *n = m_nodes[m_open_index];
				if (!n->selection_node())
				{
					m_current_node = n;
					m_index = 0;
					m_open[m_open_index] = false;
					return n->actions()[m_index++]->index();
				}
				if (m_state.entails(n->selection_fluent()))
				{
					if (n->true_child() != no_such_index)
					{
						// m_open.push_back( m_nodes[n->true_child()] );
						m_open[n->true_child()] = true;
					}
				}
				if (n->dont_care_child() != no_such_index)
				{
					// m_open.push_back( m_nodes[n->dont_care_child()] );
					m_open[n->dont_care_child()] = true;
				}
				m_open[m_open_index] = false;
			}
			return -1;
		}

		int Successor_Generator::Iterator::next()
		{
			if (m_current_node != NULL && m_index < m_current_node->actions().size())
			{
				return m_current_node->actions()[m_index++]->index();
			}
			return advance();
		}

		Successor_Generator::Heuristic_Iterator::Heuristic_Iterator(const std::vector<float> &v, const std::vector<Node *> &nodes)
				: m_values(v), m_nodes(nodes), m_current_node(NULL), m_index(no_such_index)
		{
		}

		Successor_Generator::Heuristic_Iterator::~Heuristic_Iterator()
		{
		}

		int Successor_Generator::Heuristic_Iterator::first()
		{
			m_open.push_back(m_nodes[0]);
			return advance();
		}

		int Successor_Generator::Heuristic_Iterator::advance()
		{
			while (!m_open.empty())
			{
				const Node *n = m_open.front();
				m_open.pop_front();
				if (!n->selection_node())
				{
					m_current_node = n;
					m_index = 0;
					return n->actions()[m_index++]->index();
				}
				if (m_values[n->selection_fluent()] != infty)
				{
					if (n->true_child() != no_such_index)
					{
						m_open.push_back(m_nodes[n->true_child()]);
					}
				}
				if (n->dont_care_child() != no_such_index)
				{
					m_open.push_back(m_nodes[n->dont_care_child()]);
				}
			}
			return -1;
		}

		int Successor_Generator::Heuristic_Iterator::next()
		{
			if (m_current_node != NULL && m_index < m_current_node->actions().size())
			{
				return m_current_node->actions()[m_index++]->index();
			}
			return advance();
		}

	}

}
