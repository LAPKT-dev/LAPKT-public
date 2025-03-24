
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

#ifndef __CONDITIONAL_EFFECT__
#define __CONDITIONAL_EFFECT__

#include <types.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>

namespace aptk
{

	class Conditional_Effect
	{
	public:
		Conditional_Effect(STRIPS_Problem &p, bool flag_tarski = false);
		~Conditional_Effect();

		void define(Fluent_Vec &precs, Fluent_Vec &adds, Fluent_Vec &dels, bool flag_tarski = false);
		void define_fluent_list(Fluent_Vec &in, Fluent_Vec &list, Fluent_Set &set, bool flag_tarski = false);

		Fluent_Vec &prec_vec() { return m_prec_vec; }
		Fluent_Set &prec_set() { return m_prec_set; }
		Fluent_Vec &add_vec() { return m_add_vec; }
		Fluent_Set &add_set() { return m_add_set; }
		Fluent_Vec &del_vec() { return m_del_vec; }
		Fluent_Set &del_set() { return m_del_set; }

		const Fluent_Vec &prec_vec() const { return m_prec_vec; }
		const Fluent_Set &prec_set() const { return m_prec_set; }
		const Fluent_Vec &add_vec() const { return m_add_vec; }
		const Fluent_Set &add_set() const { return m_add_set; }
		const Fluent_Vec &del_vec() const { return m_del_vec; }
		const Fluent_Set &del_set() const { return m_del_set; }

		bool
			requires(unsigned f)
		const;
		bool asserts(unsigned f) const;
		bool retracts(unsigned f) const;
		bool consumes(unsigned f) const;

		bool can_be_applied_on(const State &s, bool regress = false) const;

		bool active() const { return m_active; }
		void activate() { m_active = true; }
		void deactivate() { m_active = false; }

	protected:
		Fluent_Vec m_prec_vec;
		Fluent_Set m_prec_set;
		Fluent_Vec m_add_vec;
		Fluent_Set m_add_set;
		Fluent_Vec m_del_vec;
		Fluent_Set m_del_set;
		bool m_active;
	};

	inline bool Conditional_Effect::requires(unsigned f) const
	{
		return prec_set().isset(f);
	}

	inline bool Conditional_Effect::asserts(unsigned f) const
	{
		return add_set().isset(f);
	}

	inline bool Conditional_Effect::retracts(unsigned f) const
	{
		return del_set().isset(f);
	}

	inline bool Conditional_Effect::can_be_applied_on(const State &s, bool regress) const
	{
		if (regress)
		{
			// Relevance testing
			bool relevant = false;
			for (unsigned k = 0; k < add_vec().size() && !relevant; k++)
				if (s.entails(add_vec()[k]))
					relevant = true;
			if (!relevant)
				return false;
			// Now test if no deletes from a are entailed by s
			for (unsigned k = 0; k < del_vec().size(); k++)
				if (s.entails(del_vec()[k]))
					return false;
			return true;
		}

		return s.entails(prec_vec());
	}

	inline bool Conditional_Effect::consumes(unsigned f) const
	{
		return requires(f) && retracts(f);
	}

}

#endif // Conditional_Effect.hxx
