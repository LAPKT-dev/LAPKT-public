/*
Lightweight Automated Planning Toolkit
Copyright (C) 2015
Toby Davies <tobyodavies@gmail.com>
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

#ifndef __FD_TO_APTK__
#define __FD_TO_APTK__

#include <map>
#include <string>
#include <strips_prob.hxx>

namespace aptk {
namespace FD_Parser {

struct VarVal {
	int var, val;
};

struct DTG {
        std::vector<unsigned> values;
        struct Edge {
                int target_val;
                int op;
                std::vector<VarVal> precs;
                std::vector<unsigned> strips_precs;
        };
        std::vector< std::vector<Edge> > edges;
        typedef std::vector<Edge>::const_iterator edge_it;

        DTG(unsigned n_values):values(n_values){}
        DTG(std::vector<unsigned> values):values(values){}
};


void get_problem_description(std::string fd_output, STRIPS_Problem& prob, std::vector<DTG>& dtgs);

void get_problem_description(std::string fd_output, STRIPS_Problem& prob);
				     
}
}

#endif
