/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __FF_PDDL_TO_STRIPS__
#define __FF_PDDL_TO_STRIPS__

#include <string>
#include <strips_prob.hxx>
#include <libff/libff.h>

namespace aptk
{

namespace FF_Parser
{
	void get_problem_description( 	std::string pddl_domain_path,
					std::string pddl_problem_path,
					STRIPS_Problem& strips_problem,
					bool ignore_action_costs = false,
					bool get_detailed_fluent_names = false );
}

}

#endif // FF_PDDL_To_STRIPS.hxx
