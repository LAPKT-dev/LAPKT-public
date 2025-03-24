
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

#ifndef __LANDMARK_GRAPH__
#define __LANDMARK_GRAPH__

#include <search_prob.hxx>
#include <heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <action.hxx>
#include <vector>
#include <deque>
#include <iosfwd>

namespace aptk
{

	namespace agnostic
	{

		class Landmarks_Graph
		{
		public:
			class Node
			{

			public:
				Node(unsigned p)
						: m_fluent(p), m_consumed(false), m_consumed_once(false)
				{
				}

				~Node()
				{
				}

				void add_precedent(Node *n)
				{
					m_preceded_by.push_back(n);
				}

				void add_precedent_gn(Node *n)
				{
					m_preceded_by_gn.push_back(n);
				}

				void add_requiring(Node *n)
				{
					m_required_by.push_back(n);
				}

				void add_requiring_gn(Node *n)
				{
					m_required_by_gn.push_back(n);
				}

				unsigned fluent() const { return m_fluent; }
				bool is_consumed() const { return m_consumed; }
				bool is_consumed_once() const { return m_consumed_once; }
				bool *is_consumed_ptr() { return &m_consumed; }
				void consume()
				{
					m_consumed = true;
					m_consumed_once = true;
				}
				void unconsume() { m_consumed = false; }
				bool are_precedences_consumed() const
				{
					if (m_preceded_by.empty())
						return true;
					for (std::vector<Node *>::const_iterator it = m_preceded_by.begin(); it != m_preceded_by.end(); it++)
						if (!(*it)->is_consumed())
							return false;
					return true;
				}

				bool are_gn_precedences_consumed() const
				{
					if (m_preceded_by.empty())
						return true;
					for (std::vector<Node *>::const_iterator it = m_preceded_by_gn.begin(); it != m_preceded_by_gn.end(); it++)
						if (!(*it)->is_consumed())
							return false;
					return true;
				}

				bool are_requirements_consumed() const
				{
					if (m_required_by.empty())
						return true;
					for (std::vector<Node *>::const_iterator it = m_required_by.begin(); it != m_required_by.end(); it++)
						if (!(*it)->is_consumed())
							return false;
					return true;
				}

				bool are_gn_requirements_consumed() const
				{
					if (m_required_by_gn.empty())
						return true;
					for (std::vector<Node *>::const_iterator it = m_required_by_gn.begin(); it != m_required_by_gn.end(); it++)
						if (!(*it)->is_consumed_once())
							return false;
					return true;
				}

				const std::vector<Node *> &
				preceded_by() const
				{
					return m_preceded_by;
				}

				bool is_preceded_by(Node *nq) const
				{
					if (m_preceded_by.empty())
						return false;
					for (std::vector<Node *>::const_iterator it = m_preceded_by.begin(); it != m_preceded_by.end(); it++)
						if (*it == nq)
							return true;
					return false;
				}
				bool is_preceded_by_gn(Node *nq) const
				{
					if (m_preceded_by_gn.empty())
						return false;
					for (std::vector<Node *>::const_iterator it = m_preceded_by_gn.begin(); it != m_preceded_by_gn.end(); it++)
						if (*it == nq)
							return true;
					return false;
				}

				bool is_required_by(Node *nq) const
				{
					if (m_required_by.empty())
						return false;
					for (std::vector<Node *>::const_iterator it = m_required_by.begin(); it != m_required_by.end(); it++)
						if (*it == nq)
							return true;
					return false;
				}

				bool is_required_by_gn(Node *nq) const
				{
					if (m_required_by_gn.empty())
						return false;
					for (std::vector<Node *>::const_iterator it = m_required_by_gn.begin(); it != m_required_by_gn.end(); it++)
						if (*it == nq)
							return true;
					return false;
				}
				const std::vector<Node *> &
				preceded_by_gn() const
				{
					return m_preceded_by_gn;
				}

				const std::vector<Node *> &
				required_by() const
				{
					return m_required_by;
				}

				const std::vector<Node *> &
				required_by_gn() const
				{
					return m_required_by_gn;
				}

			private:
				unsigned m_fluent;
				bool m_consumed;
				bool m_consumed_once;
				std::vector<Node *> m_preceded_by;
				std::vector<Node *> m_preceded_by_gn;
				std::vector<Node *> m_required_by;
				std::vector<Node *> m_required_by_gn;
			};

			Landmarks_Graph(const STRIPS_Problem &p);
			~Landmarks_Graph();

			bool is_landmark(unsigned p) const { return m_fl_in_graph.isset(p); }
			const Node *node(unsigned p) const { return m_fl_to_node[p]; }
			Node *node(unsigned p) { return m_fl_to_node[p]; }
			const std::vector<Node *> &nodes() { return m_lm_graph; }
			void preceding(unsigned p, Fluent_Vec &preceding) const;
			void greedy_preceding(unsigned p, Fluent_Vec &greedy_preceding) const;
			void following(unsigned p, Fluent_Vec &following) const;

			void add_landmark(unsigned p);
			void add_landmark_for(unsigned p, unsigned q);

			void consume_node(unsigned p) { m_fl_to_node[p]->consume(); }
			void unconsume_node(unsigned p) { m_fl_to_node[p]->unconsume(); }

			void unconsume_all()
			{
				for (std::vector<Node *>::const_iterator it = m_lm_graph.begin(); it != m_lm_graph.end(); it++)
					(*it)->unconsume();
			}

			void get_leafs(Fluent_Vec &leafs)
			{

				for (std::vector<Node *>::const_iterator it = m_lm_graph.begin(); it != m_lm_graph.end(); it++)
				{
					if ((*it)->is_consumed())
						continue;
					if ((*it)->are_precedences_consumed())
						leafs.push_back((*it)->fluent());
				}
			}

			unsigned num_landmarks() const { return m_lm_graph.size(); }
			unsigned num_landmarks_and_edges() const
			{
				unsigned val = 0;
				for (std::vector<Node *>::const_iterator it = m_lm_graph.begin();
						 it != m_lm_graph.end(); it++)
				{
					Node *n = *it;
					val++;

					if (!n->required_by_gn().empty())
						for (std::vector<Node *>::const_iterator it_r = n->required_by_gn().begin(); it_r != n->required_by_gn().end(); it_r++)
							val++;

					if (!n->required_by().empty())
						for (std::vector<Node *>::const_iterator it_r = n->required_by().begin(); it_r != n->required_by().end(); it_r++)
							val++;
				}
				return val;
			}

			void print(std::ostream &os) const;

			void print_dot(std::ostream &os) const;

		protected:
			const STRIPS_Problem &m_strips_model;
			std::vector<Node *> m_lm_graph;
			std::vector<Node *> m_fl_to_node;
			Bit_Set m_fl_in_graph;
		};

	}

}

#endif // landmark_graph.hxx
