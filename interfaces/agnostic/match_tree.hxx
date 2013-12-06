/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>
Christian Muise <christian.muise@gmail.com>

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

#ifndef __MATCH_TREE__
#define __MATCH_TREE__

#include <types.hxx>
#include <deque>
#include <vector>

namespace aptk {

class STRIPS_Problem;
class State;
class Action;

namespace agnostic {

// Fast-Downward ("The Fast-Downward Planning System", Helmert, M., 2006) successor generator data structure
	
class Match_Tree {

public:

	Match_Tree ( const STRIPS_Problem& prob ) : m_problem( prob ) {}

	~Match_Tree() {};

	void build();
    void retrieve_applicable( const State& s, std::vector<int>& actions ) const;

private:

	const STRIPS_Problem& m_problem;

};

}

}

#endif // match_tree.hxx
