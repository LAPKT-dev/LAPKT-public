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

#ifndef __HEURISTIC__
#define __HEURISTIC__

#include <aptk/search_prob.hxx>
#include <vector>

namespace aptk {

template <typename State>
class Heuristic {

public:

	Heuristic( const Search_Problem<State>& prob ) 
	: m_problem( prob ) {
	}

	virtual ~Heuristic() {
	}

	virtual void init() 	{ }
	virtual void reset() 	{ }

	const Search_Problem<State>&	problem() const { return m_problem; }


private:
	const Search_Problem<State>& m_problem; 

};

}

#endif // heuristic.hxx
