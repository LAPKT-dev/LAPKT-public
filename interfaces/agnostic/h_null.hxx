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

#ifndef __H_NULL__
#define __H_NULL__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>

namespace aptk {

namespace agnostic {

template < typename Search_Model >
class	Null_Heuristic : public Heuristic<State> {
public:

	Null_Heuristic( const Search_Model& prob ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() ) {
	}	

	virtual ~Null_Heuristic() {
	}

	virtual void eval( const State& s, float& h_val ) {
		h_val = 0.0f;
	}
	
	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		h_val = 0.0f;
	}

protected:

	const STRIPS_Problem&	m_strips_model;

};

}

}

#endif // h_null.hxx
