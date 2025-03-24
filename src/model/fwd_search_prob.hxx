
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

#ifndef __FWD_SEARCH_PROB__
#define __FWD_SEARCH_PROB__

#include <strips_prob.hxx>
#include <search_prob.hxx>
#include <action.hxx>

#include <strips_state.hxx>

namespace aptk
{

	class State;

	namespace agnostic
	{

		class Fwd_Search_Problem : public Search_Problem<State>
		{
		public:
			Fwd_Search_Problem(STRIPS_Problem *);
			virtual ~Fwd_Search_Problem();

			virtual int num_actions() const;
			virtual State *make_state(const Fluent_Vec &s) const;
			virtual State *init() const;
			virtual bool goal(const State &s) const;
			bool lazy_goal(const State &s, Action_Idx a) const;
			virtual bool is_applicable(const State &s, Action_Idx a) const;
			virtual void applicable_set(const State &s, std::vector<Action_Idx> &app_set) const;
			virtual void applicable_set_v2(const State &s, std::vector<Action_Idx> &app_set) const;
			virtual float cost(const State &s, Action_Idx a) const;
			virtual State *next(const State &s, Action_Idx a, Fluent_Vec *added, Fluent_Vec *deleted) const;
			virtual State *next(const State &s, Action_Idx a) const;
			virtual void print(std::ostream &os) const;

			STRIPS_Problem &task() { return *m_task; }
			const STRIPS_Problem &task() const { return *m_task; }

			class Action_Iterator
			{
			public:
				Action_Iterator(const Fwd_Search_Problem &p)
						: m_problem(p)
				{
				}

				~Action_Iterator()
				{
				}

				int start(const State &s)
				{
					m_app_set.clear();
					m_problem.applicable_set_v2(s, m_app_set);
					m_it = m_app_set.begin();
					if (m_it == m_app_set.end())
						return no_op;
					return *m_it;
				}

				int next()
				{
					m_it++;
					if (m_it == m_app_set.end())
						return no_op;
					return *m_it;
				}

			private:
				const Fwd_Search_Problem &m_problem;
				std::vector<Action_Idx> m_app_set;
				std::vector<Action_Idx>::iterator m_it;
			};

		private:
			STRIPS_Problem *m_task;
		};

	}

}

#endif // fwd_search_prob.hxx
