
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

#ifndef __LANDMARK_GRAPH_MANAGER__
#define __LANDMARK_GRAPH_MANAGER__

#include <search_prob.hxx>
#include <heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <landmark_graph.hxx>
#include <action.hxx>
#include <vector>
#include <deque>
#include <iosfwd>

namespace aptk
{

	namespace agnostic
	{

		template <typename Search_Model>
		class Landmarks_Graph_Manager
		{
		public:
			Landmarks_Graph_Manager(const Search_Model &prob, Landmarks_Graph *lg)
					: m_strips_model(prob.task())
			{
				m_graph = lg;
			}

			virtual ~Landmarks_Graph_Manager()
			{
			}

			void reset_graph()
			{
				m_graph->unconsume_all();
			}

			void update_graph(Bool_Vec_Ptr *&keep_consumed, Bool_Vec_Ptr *&keep_unconsumed)
			{
				if (keep_consumed)
					for (Bool_Vec_Ptr::iterator it = keep_consumed->begin(); it != keep_consumed->end(); it++)
						**it = true;
				if (keep_unconsumed)
					for (Bool_Vec_Ptr::iterator it = keep_unconsumed->begin(); it != keep_unconsumed->end(); it++)
						**it = false;
			}

			void undo_graph(Bool_Vec_Ptr *&undo_consumed, Bool_Vec_Ptr *&undo_unconsumed)
			{
				if (undo_consumed)
					for (Bool_Vec_Ptr::iterator it = undo_consumed->begin(); it != undo_consumed->end(); it++)
						**it = false;
				if (undo_unconsumed)
					for (Bool_Vec_Ptr::iterator it = undo_unconsumed->begin(); it != undo_unconsumed->end(); it++)
						**it = true;
			}

			void apply_action(State *s, Action_Idx a_idx, Bool_Vec_Ptr *&keep_consumed, Bool_Vec_Ptr *&keep_unconsumed)
			{
				const Action *a = m_strips_model.actions()[a_idx];
				const Fluent_Vec &add = a->add_vec();
				const Fluent_Vec &del = a->del_vec();

				for (Fluent_Vec::const_iterator it_add = add.begin(); it_add != add.end(); it_add++)
				{
					unsigned p = *it_add;

					if (m_graph->is_landmark(p))
					{
						Landmarks_Graph::Node *n = m_graph->node(p);
						if (!n->is_consumed())
							if (n->are_precedences_consumed() && n->are_gn_precedences_consumed())
							{
								if (!keep_consumed)
									keep_consumed = new Bool_Vec_Ptr;
								// std::cout << "\t -- "<<p <<" - " << m_strips_model.fluents()[ p ]->signature() << std::endl;
								n->consume();
								keep_consumed->push_back(n->is_consumed_ptr());
							}
					}
				}

				for (Fluent_Vec::const_iterator it_del = del.begin(); it_del != del.end(); it_del++)
				{
					unsigned p = *it_del;

					if (m_graph->is_landmark(p))
					{
						bool unconsume = false;
						Landmarks_Graph::Node *n = m_graph->node(p);

						if (n->is_consumed())
							if (m_strips_model.is_in_goal(p) || (!n->are_requirements_consumed()) || (!n->are_gn_requirements_consumed()))
								unconsume = true;

						if (unconsume)
						{
							// std::cout << "\t ++ "<<p <<" - " << m_strips_model.fluents()[ p ]->signature() << std::endl;
							if (!keep_unconsumed)
								keep_unconsumed = new Bool_Vec_Ptr;

							n->unconsume();
							keep_unconsumed->push_back(n->is_consumed_ptr());
						}
					}
				}

				if (!a->ceff_vec().empty())
				{
					for (unsigned i = 0; i < a->ceff_vec().size(); i++)
					{
						Conditional_Effect *ce = a->ceff_vec()[i];
						if (ce->can_be_applied_on(*s))
							apply_cond_eff(s, ce, keep_consumed, keep_unconsumed);
					}
				}
			}

			void apply_cond_eff(State *s, Conditional_Effect *ce, Bool_Vec_Ptr *&keep_consumed, Bool_Vec_Ptr *&keep_unconsumed)
			{

				const Fluent_Vec &add = ce->add_vec();
				const Fluent_Vec &del = ce->del_vec();

				for (Fluent_Vec::const_iterator it_add = add.begin(); it_add != add.end(); it_add++)
				{
					unsigned p = *it_add;

					if (m_graph->is_landmark(p))
					{
						Landmarks_Graph::Node *n = m_graph->node(p);
						if (!n->is_consumed())
							if (n->are_precedences_consumed() && n->are_gn_precedences_consumed())
							{
								if (!keep_consumed)
									keep_consumed = new Bool_Vec_Ptr;
								// std::cout << "\t -- "<<p <<" - " << m_strips_model.fluents()[ p ]->signature() << std::endl;
								n->consume();
								keep_consumed->push_back(n->is_consumed_ptr());
							}
					}
				}

				for (Fluent_Vec::const_iterator it_del = del.begin(); it_del != del.end(); it_del++)
				{
					unsigned p = *it_del;

					if (m_graph->is_landmark(p))
					{
						bool unconsume = false;
						Landmarks_Graph::Node *n = m_graph->node(p);

						if (n->is_consumed())
							if (m_strips_model.is_in_goal(p) || (!n->are_requirements_consumed()) || (!n->are_gn_requirements_consumed()))
								unconsume = true;

						if (unconsume)
						{
							// std::cout << "\t ++ "<<p <<" - " << m_strips_model.fluents()[ p ]->signature() << std::endl;
							if (!keep_unconsumed)
								keep_unconsumed = new Bool_Vec_Ptr;

							n->unconsume();
							keep_unconsumed->push_back(n->is_consumed_ptr());
						}
					}
				}
			}

			void apply_action(const State *s, Action_Idx a_idx)
			{
				const Action *a = m_strips_model.actions()[a_idx];
				const Fluent_Vec &add = a->add_vec();
				const Fluent_Vec &del = a->del_vec();

				for (Fluent_Vec::const_iterator it_add = add.begin(); it_add != add.end(); it_add++)
				{
					unsigned p = *it_add;

					if (m_graph->is_landmark(p))
					{
						Landmarks_Graph::Node *n = m_graph->node(p);
						if (!n->is_consumed())
							if (n->are_precedences_consumed() && n->are_gn_precedences_consumed())
							{
								n->consume();
							}
					}
				}

				for (Fluent_Vec::const_iterator it_del = del.begin(); it_del != del.end(); it_del++)
				{
					unsigned p = *it_del;

					if (m_graph->is_landmark(p))
					{
						bool unconsume = false;
						Landmarks_Graph::Node *n = m_graph->node(p);

						if (n->is_consumed())
							if (m_strips_model.is_in_goal(p) || (!n->are_requirements_consumed()) || (!n->are_gn_requirements_consumed()))
								unconsume = true;

						if (unconsume)
						{
							n->unconsume();
						}
					}
				}

				if (!a->ceff_vec().empty())
				{
					for (unsigned i = 0; i < a->ceff_vec().size(); i++)
					{
						Conditional_Effect *ce = a->ceff_vec()[i];
						if (ce->can_be_applied_on(*s))
							apply_cond_eff(s, ce);
					}
				}
			}

			void apply_cond_eff(const State *s, Conditional_Effect *ce)
			{

				const Fluent_Vec &add = ce->add_vec();
				const Fluent_Vec &del = ce->del_vec();

				for (Fluent_Vec::const_iterator it_add = add.begin(); it_add != add.end(); it_add++)
				{
					unsigned p = *it_add;

					if (m_graph->is_landmark(p))
					{
						Landmarks_Graph::Node *n = m_graph->node(p);
						if (!n->is_consumed())
							if (n->are_precedences_consumed() && n->are_gn_precedences_consumed())
							{
								n->consume();
							}
					}
				}

				for (Fluent_Vec::const_iterator it_del = del.begin(); it_del != del.end(); it_del++)
				{
					unsigned p = *it_del;

					if (m_graph->is_landmark(p))
					{
						bool unconsume = false;
						Landmarks_Graph::Node *n = m_graph->node(p);

						if (n->is_consumed())
							if (m_strips_model.is_in_goal(p) || (!n->are_requirements_consumed()) || (!n->are_gn_requirements_consumed()))
								unconsume = true;

						if (unconsume)
						{
							n->unconsume();
						}
					}
				}
			}

			void apply_state(const Fluent_Vec &fl, Bool_Vec_Ptr *&keep_consumed, Bool_Vec_Ptr *&keep_unconsumed)
			{

				for (Fluent_Vec::const_iterator it_fl = fl.begin(); it_fl != fl.end(); it_fl++)
				{
					unsigned p = *it_fl;

					if (m_graph->is_landmark(p))
					{

						Landmarks_Graph::Node *n = m_graph->node(p);
						if ((!n->is_consumed()) && n->are_precedences_consumed() && n->are_gn_precedences_consumed())
						{
							if (!keep_consumed)
								keep_consumed = new Bool_Vec_Ptr;
							n->consume();
							keep_consumed->push_back(n->is_consumed_ptr());
						}
					}
				}
			}

			void apply_state(const Fluent_Vec &fl)
			{

				for (Fluent_Vec::const_iterator it_fl = fl.begin(); it_fl != fl.end(); it_fl++)
				{
					unsigned p = *it_fl;

					if (m_graph->is_landmark(p))
					{

						Landmarks_Graph::Node *n = m_graph->node(p);
						if ((!n->is_consumed()) && n->are_precedences_consumed() && n->are_gn_precedences_consumed())
						{
							n->consume();
						}
					}
				}
			}

		public:
			Landmarks_Graph *graph() { return m_graph; }
			const STRIPS_Problem &problem() const { return m_strips_model; }

		protected:
			const STRIPS_Problem &m_strips_model;
			Landmarks_Graph *m_graph;
		};

	}

}

#endif // landmark_graph_manager.hxx
