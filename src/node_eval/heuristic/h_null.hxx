
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

#ifndef __H_NULL__
#define __H_NULL__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>

namespace aptk
{

	namespace agnostic
	{

		template <typename Search_Model>
		class Null_Heuristic : public Heuristic<State>
		{
		public:
			Null_Heuristic(const Search_Model &prob)
					: Heuristic<State>(prob), m_strips_model(prob.task())
			{
			}

			virtual ~Null_Heuristic()
			{
			}

			virtual void eval(const State &s, float &h_val)
			{
				h_val = 0.0f;
			}

			virtual void eval(const State &s, float &h_val, std::vector<Action_Idx> &pref_ops)
			{
				h_val = 0.0f;
			}

		protected:
			const STRIPS_Problem &m_strips_model;
		};

	}

}

#endif // h_null.hxx
