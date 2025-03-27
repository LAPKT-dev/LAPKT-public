
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

#ifndef __REACHABILITY__
#define __REACHABILITY__

#include <strips_prob.hxx>
#include <types.hxx>
#include <bit_set.hxx>
#include <vector>

namespace aptk
{

	namespace agnostic
	{

		class Reachability_Test
		{
		public:
			Reachability_Test(const STRIPS_Problem &p);
			~Reachability_Test();

			// Returns true if atom set g is reachable from state s
			bool is_reachable(const Fluent_Vec &s, const Fluent_Vec &g);
			// Returns true if atom set g is reachable from s, when removing action
			bool is_reachable(const Fluent_Vec &s, const Fluent_Vec &g, unsigned action);
			bool is_reachable(const Fluent_Vec &s, const Fluent_Vec &g, const Bit_Set &excluded);
			void get_reachable_actions(const Fluent_Vec &s, const Fluent_Vec &g, Bit_Set &reach_actions);

		protected:
			bool apply_actions();
			void initialize(const Fluent_Vec &s);
			bool check(const Fluent_Vec &set);

			void print_reachable_atoms();

		protected:
			const STRIPS_Problem &m_problem;
			std::vector<bool> m_reachable_atoms;
			std::vector<bool> m_reach_next;
			Bit_Set m_action_mask;
		};

	}

}

#endif // reachability.hxx
