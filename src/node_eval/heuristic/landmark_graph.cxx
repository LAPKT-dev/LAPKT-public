
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

#include <landmark_graph.hxx>
#include <cassert>

namespace aptk
{

	namespace agnostic
	{

		Landmarks_Graph::Landmarks_Graph(const STRIPS_Problem &p)
				: m_strips_model(p)
		{
			m_fl_to_node.resize(m_strips_model.num_fluents());
			for (unsigned k = 0; k < m_fl_to_node.size(); k++)
				m_fl_to_node[k] = NULL;

			m_fl_in_graph.resize(m_strips_model.num_fluents());
		}

		Landmarks_Graph::~Landmarks_Graph()
		{
			for (unsigned k = 0; k < m_lm_graph.size(); k++)
			{
				delete m_lm_graph[k];
			}
		}

		void Landmarks_Graph::preceding(unsigned p, Fluent_Vec &preceding) const
		{
			Node *n = m_fl_to_node[p];
			if (n == NULL)
				return;
			for (unsigned k = 0; k < n->preceded_by().size(); k++)
				preceding.push_back(n->preceded_by()[k]->fluent());
		}

		void Landmarks_Graph::greedy_preceding(unsigned p, Fluent_Vec &preceding) const
		{
			Node *n = m_fl_to_node[p];
			if (n == NULL)
				return;
			for (unsigned k = 0; k < n->preceded_by_gn().size(); k++)
				preceding.push_back(n->preceded_by_gn()[k]->fluent());
		}

		void Landmarks_Graph::following(unsigned p, Fluent_Vec &following) const
		{
			Node *n = m_fl_to_node[p];
			if (n == NULL)
				return;
			for (unsigned k = 0; k < n->required_by().size(); k++)
				following.push_back(n->required_by()[k]->fluent());
		}

		void Landmarks_Graph::add_landmark(unsigned p)
		{
			Node *n = new Node(p);
			m_lm_graph.push_back(n);
			m_fl_in_graph.set(p);
			m_fl_to_node[p] = n;
		}

		void Landmarks_Graph::add_landmark_for(unsigned p, unsigned q)
		{
			Node *p_node = m_fl_to_node[p];
			assert(p_node != NULL);
			Node *q_node = m_fl_to_node[q];
			assert(q_node != NULL);
			p_node->add_precedent(q_node);
			q_node->add_requiring(p_node);
		}

		void Landmarks_Graph::print(std::ostream &os) const
		{
			for (unsigned k = 0; k < m_lm_graph.size(); k++)
			{
				Node *n = m_lm_graph[k];
				std::cout << k + 1 << ". " << m_strips_model.fluents()[n->fluent()]->signature();
				if (n->is_consumed())
					std::cout << "*";
				std::cout << std::endl;
				std::cout << "\tPreceded by: ";
				for (unsigned i = 0; i < n->preceded_by().size(); i++)
				{
					Node *pred = n->preceded_by()[i];
					std::cout << m_strips_model.fluents()[pred->fluent()]->signature();
					if (i < n->preceded_by().size() - 1)
						std::cout << ", ";
				}
				std::cout << "\n\tGN Preceded by: ";
				for (unsigned i = 0; i < n->preceded_by_gn().size(); i++)
				{
					Node *pred = n->preceded_by_gn()[i];
					std::cout << m_strips_model.fluents()[pred->fluent()]->signature();
					if (i < n->preceded_by_gn().size() - 1)
						std::cout << ", ";
				}
				std::cout << "\n\tRequired by: ";
				for (unsigned i = 0; i < n->required_by().size(); i++)
				{
					Node *pred = n->required_by()[i];
					std::cout << m_strips_model.fluents()[pred->fluent()]->signature();
					if (i < n->required_by().size() - 1)
						std::cout << ", ";
				}
				std::cout << "\n\tGN Required by: ";
				for (unsigned i = 0; i < n->required_by_gn().size(); i++)
				{
					Node *pred = n->required_by_gn()[i];
					std::cout << m_strips_model.fluents()[pred->fluent()]->signature();
					if (i < n->required_by_gn().size() - 1)
						std::cout << ", ";
				}

				std::cout << std::endl;
			}
		}

		void Landmarks_Graph::print_dot(std::ostream &os) const
		{

			os << "digraph L {" << std::endl;

			for (unsigned k = 0; k < m_lm_graph.size(); k++)
			{
				Node *n = m_lm_graph[k];
				os << n->fluent() << " [label=\"" << m_strips_model.fluents()[n->fluent()]->signature() << "\"];" << std::endl;
			}

			for (unsigned k = 0; k < m_lm_graph.size(); k++)
			{
				Node *n = m_lm_graph[k];
				for (unsigned i = 0; i < n->preceded_by().size(); i++)
				{
					Node *pred = n->preceded_by()[i];
					os << pred->fluent() << " -> " << n->fluent() << " [label=\"n\"];" << std::endl;
				}
				for (unsigned i = 0; i < n->preceded_by_gn().size(); i++)
				{
					Node *pred = n->preceded_by_gn()[i];
					os << pred->fluent() << " -> " << n->fluent() << " [label=\"gn\"];" << std::endl;
				}
			}

			os << "}" << std::endl;
		}

	}

}
