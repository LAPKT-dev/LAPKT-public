
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

#ifndef __APTK_TYPES__
#define __APTK_TYPES__

#include <map>
#include <vector>
#include <limits>
#include <utility>
#include <bit_set.hxx>

namespace aptk
{

	class Action;
	class Fluent;
	class Conditional_Effect;

	typedef std::vector<bool> Bool_Vec;
	typedef std::vector<bool *> Bool_Vec_Ptr;
	typedef std::vector<unsigned> Fluent_Vec;
	typedef std::vector<unsigned> Index_Vec;
	typedef std::vector<float> Value_Vec;
	typedef std::pair<unsigned, unsigned> Fluent_Pair;
	typedef Bit_Set Fluent_Set;
	typedef std::vector<Action *> Action_Ptr_Vec;
	typedef std::vector<const Action *> Action_Ptr_Const_Vec;
	typedef std::vector<Fluent *> Fluent_Ptr_Vec;
	typedef std::vector<Conditional_Effect *> Conditional_Effect_Vec;
	typedef std::vector<std::vector<const Action *>> Fluent_Action_Table;
	typedef std::vector<Action_Ptr_Vec> PDDLop_Action_Table;
	typedef std::vector<Fluent_Ptr_Vec> Type_Fluent_Table;
	typedef std::vector<Fluent_Ptr_Vec> Object_Fluent_Table;
	typedef std::vector<std::pair<unsigned, unsigned>> VarVal_Vec;

// MRJ: April 2015: added this pre-processor guards while we transition to
// a definitive solution for the problem posed by the location of these
// macros
#ifndef no_such_index
#define no_such_index std::numeric_limits<unsigned>::max()
#endif

#ifndef infty
#define infty std::numeric_limits<float>::max()
#endif

	class Pair_Value_Table : public std::map<Fluent_Pair, unsigned>
	{
		typedef std::map<Fluent_Pair, unsigned>::iterator pv_iterator;

	public:
		unsigned get_value(unsigned p, unsigned q)
		{
			pv_iterator it = find(std::make_pair(p, q));
			if (it == end())
				return no_such_index;
			return it->second;
		}

		void update_value(unsigned p, unsigned q, unsigned value)
		{
			pv_iterator it = find(std::make_pair(p, q));
			if (it == end())
			{
				insert(std::make_pair(std::make_pair(p, q), value));
				return;
			}
			it->second = value;
		}
	};

}

#endif
