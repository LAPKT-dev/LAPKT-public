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

#ifndef __H_UNSAT_MUTEX__
#define __H_UNSAT_MUTEX__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <h_2.hxx>

namespace aptk {

namespace agnostic {

template < typename Search_Model >
class	Unsat_Goals_Mutexes_Heuristic : public Heuristic<State> {
public:

	typedef		H2_Heuristic< Search_Model, H2_Cost_Function::Zero_Costs >	Mutex_Table;

	Unsat_Goals_Mutexes_Heuristic( const Search_Model& prob ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() ), m_mutexes( prob ) {
		State* init = prob.init();
		float dummy = 0.0f;
		m_mutexes.eval( *init, dummy) ;
		delete init;
	}	

	virtual ~Unsat_Goals_Mutexes_Heuristic() {
	}

	virtual void eval( const State& s, float& h_val ) {
		h_val = count_mutexes(s) + count_goals(s);
	}
	
	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		h_val = count_mutexes(s) + count_goals(s);
	}

protected:

	float 	count_mutexes( const State& s ) const {
		float count = 0.0f;
		for ( unsigned i = 0; i < s.fluent_vec().size(); i++ ) {
			for ( unsigned j = 0; j < s.fluent_vec().size(); j++ ) {
				if ( m_mutexes.is_mutex( s.fluent_vec()[i], s.fluent_vec()[j] ) )
					count += 1.0f;
			}
		}
		return count;
	}

	float	count_goals( const State& s ) const {
		float c = 0.0f;
		for ( 	auto g_it = m_strips_model.goal().begin(); 
			g_it != m_strips_model.goal().end(); g_it++ ) {
			if ( !s.entails( *g_it) ) c += 1.0f;
		}
		return c;
	}

protected:

	const STRIPS_Problem&	m_strips_model;
	Mutex_Table		m_mutexes;
};

}

}

#endif
