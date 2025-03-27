
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

#ifndef __FLUENT__
#define __FLUENT__

#include <types.hxx>
#include <strips_prob.hxx>

namespace aptk
{

	class Fluent
	{
	public:
		Fluent(STRIPS_Problem &p);
		~Fluent();

		unsigned index() const;
		std::string signature() const;
		Index_Vec &pddl_objs_idx();
		Index_Vec &pddl_types_idx();

		void set_index(unsigned idx);
		void set_signature(std::string signature);

		STRIPS_Problem &problem();

	protected:
		STRIPS_Problem &m_problem;
		unsigned m_index;
		std::string m_signature;
	};

	inline unsigned Fluent::index() const
	{
		return m_index;
	}

	inline std::string Fluent::signature() const
	{
		return m_signature;
	}

	inline void Fluent::set_index(unsigned idx)
	{
		m_index = idx;
	}

	inline void Fluent::set_signature(std::string sig)
	{
		m_signature = sig;
	}

}

#endif // Fluent.hxx
