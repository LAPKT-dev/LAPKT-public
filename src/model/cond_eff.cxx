
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

#include <cond_eff.hxx>

namespace aptk
{

	Conditional_Effect::Conditional_Effect(STRIPS_Problem &p, bool flag_tarski)
			: m_active(true)
	{
		if (!flag_tarski)
		{
			prec_set().resize(p.num_fluents());
			add_set().resize(p.num_fluents());
			del_set().resize(p.num_fluents());
		}
	}

	Conditional_Effect::~Conditional_Effect()
	{
	}

	void Conditional_Effect::define(Fluent_Vec &precs, Fluent_Vec &adds, Fluent_Vec &dels, bool flag_tarski)
	{
		// define the precondition, adds and deletes
		define_fluent_list(precs, prec_vec(), prec_set());
		define_fluent_list(adds, add_vec(), add_set());
		define_fluent_list(dels, del_vec(), del_set());
	}

	void Conditional_Effect::define_fluent_list(Fluent_Vec &in, Fluent_Vec &fluent_list, Fluent_Set &fluent_set, bool flag_tarski)
	{
		for (unsigned k = 0; k < in.size(); k++)
		{
			fluent_list.push_back(in[k]);
			if (!flag_tarski)
				fluent_set.set(in[k]);
		}
	}

}
