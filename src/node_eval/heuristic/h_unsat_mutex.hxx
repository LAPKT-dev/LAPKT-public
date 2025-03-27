
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

#ifndef __H_UNSAT_MUTEX__
#define __H_UNSAT_MUTEX__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <h_2.hxx>

namespace aptk
{

	namespace agnostic
	{

		template <typename Search_Model>
		class Unsat_Goals_Mutexes_Heuristic : public Heuristic<State>
		{
		public:
			typedef H2_Heuristic<Search_Model, H2_Cost_Function::Zero_Costs> Mutex_Table;

			Unsat_Goals_Mutexes_Heuristic(const Search_Model &prob)
					: Heuristic<State>(prob), m_strips_model(prob.task()), m_mutexes(prob)
			{
				State *init = prob.init();
				float dummy = 0.0f;
				m_mutexes.eval(*init, dummy);
				delete init;
			}

			virtual ~Unsat_Goals_Mutexes_Heuristic()
			{
			}

			virtual void eval(const State &s, float &h_val)
			{
				h_val = count_mutexes(s) + count_goals(s);
			}

			virtual void eval(const State &s, float &h_val, std::vector<Action_Idx> &pref_ops)
			{
				h_val = count_mutexes(s) + count_goals(s);
			}

		protected:
			float count_mutexes(const State &s) const
			{
				float count = 0.0f;
				for (unsigned i = 0; i < s.fluent_vec().size(); i++)
				{
					for (unsigned j = 0; j < s.fluent_vec().size(); j++)
					{
						if (m_mutexes.is_mutex(s.fluent_vec()[i], s.fluent_vec()[j]))
							count += 1.0f;
					}
				}
				return count;
			}

			float count_goals(const State &s) const
			{
				float c = 0.0f;
				for (auto g_it = m_strips_model.goal().begin();
						 g_it != m_strips_model.goal().end(); g_it++)
				{
					if (!s.entails(*g_it))
						c += 1.0f;
				}
				return c;
			}

		protected:
			const STRIPS_Problem &m_strips_model;
			Mutex_Table m_mutexes;
		};

	}

}

#endif
