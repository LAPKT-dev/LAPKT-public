
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

#include <action.hxx>
#include <iostream>
namespace aptk
{

	Action::Action(STRIPS_Problem &p, bool flag_tarski)
			: m_cost(1), m_active(true)
	{
		if (!flag_tarski)
		{
			prec_set().resize(p.num_fluents());
			add_set().resize(p.num_fluents());
			del_set().resize(p.num_fluents());
			edel_set().resize(p.num_fluents());
		}
	}

	Action::~Action()
	{
	}

	void Action::define(const Fluent_Vec &precs, const Fluent_Vec &adds, const Fluent_Vec &dels, bool flag_tarski)
	{
		// define the precondition, adds and deletes
		define_fluent_list(precs, prec_vec(), prec_set(), flag_tarski);
		define_fluent_list(adds, add_vec(), add_set(), flag_tarski);
		define_fluent_list(dels, del_vec(), del_set(), flag_tarski);
		define_fluent_list(dels, edel_vec(), edel_set(), flag_tarski);

		// TODO: This should be made far more complex when mutex's are properly computed
		for (unsigned i = 0; i < precs.size(); ++i)
			m_prec_varval.push_back(std::make_pair(precs[i], 0));
	}

	void Action::define(const Fluent_Vec &precs, const Fluent_Vec &adds, const Fluent_Vec &dels, const Conditional_Effect_Vec &ceffs, bool flag_tarski)
	{
		// define the precondition, adds, deletes and conditional effects
		define(precs, adds, dels);
		m_cond_effects = ceffs;
	}

	void Action::define_fluent_list(const Fluent_Vec &in, Fluent_Vec &fluent_list, Fluent_Set &fluent_set, bool flag_tarski)
	{
		for (unsigned k = 0; k < in.size(); k++)
		{
			fluent_list.push_back(in[k]);
			if (!flag_tarski)
				fluent_set.set(in[k]);
		}
	}

	void Action::print(const STRIPS_Problem &prob, std::ostream &os) const
	{

		os << "Action " << signature() << std::endl;
		os << "\tPre(a) = {";
		prob.print_fluent_vec(os, prec_vec());
		os << "}" << std::endl;
		os << "\tAdd(a) = {";
		prob.print_fluent_vec(os, add_vec());
		os << "}" << std::endl;
		os << "\tDel(a) = {";
		prob.print_fluent_vec(os, del_vec());
		os << "}" << std::endl;
		if (!edel_vec().empty())
		{
			os << "\teDel(a) = {";
			prob.print_fluent_vec(os, edel_vec());
			os << "}" << std::endl;
		}
		os << "\tConditional Effects:" << std::endl;
		for (unsigned l = 0; l < ceff_vec().size(); l++)
		{
			os << "\t\tcond_eff " << l + 1 << ":" << std::endl;
			os << "\t\tPre(cond_eff) = {";
			prob.print_fluent_vec(os, ceff_vec()[l]->prec_vec());
			os << "}" << std::endl;
			os << "\t\tAdd(cond_eff) = {";
			prob.print_fluent_vec(os, ceff_vec()[l]->add_vec());
			os << "}" << std::endl;
			os << "\t\tDel(cond_eff) = {";
			prob.print_fluent_vec(os, ceff_vec()[l]->del_vec());
			os << "}" << std::endl;
		}
		os << "Cost = " << cost() << std::endl;
	}

}
