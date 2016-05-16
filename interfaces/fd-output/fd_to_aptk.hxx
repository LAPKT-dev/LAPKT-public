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

struct TransID {
	int src, dst;
	bool operator<(const TransID& other) const {
		return src < other.src || (src == other.src && dst < other.dst);
	}
};

struct DTG {

	std::vector<unsigned> values;
	std::multimap< TransID, unsigned > edges;
	std::multimap< unsigned, TransID > ops;

	typedef std::multimap< TransID, unsigned>::const_iterator edge_it;
	typedef std::multimap< unsigned, TransID>::const_iterator op_it;

	int init_idx, goal_idx;
	bool unsafe;

	template<class iter>
	struct range {
		iter _begin, _end;
		iter begin(){ return _begin; }
		iter end(){ return _end; }
	};

	range<edge_it> adjacent(int node){
		TransID min = {node, 0};
		TransID max = {node, (int)values.size()};
		range<edge_it> ret = { edges.lower_bound(min), edges.upper_bound(max) };
		return ret;
	}
	range<op_it> transitions(unsigned op){
		range<op_it> ret = { ops.lower_bound(op), ops.upper_bound(op) };
		return ret;
	}


};


void get_problem_description(std::string fd_output, STRIPS_Problem& prob, std::vector<DTG>& dtgs);

void get_problem_description(std::string fd_output, STRIPS_Problem& prob);
				     
}
}

#endif
