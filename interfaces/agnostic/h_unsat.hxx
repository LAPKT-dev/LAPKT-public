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

#ifndef __H_UNSAT__
#define __H_UNSAT__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>

namespace aptk {

namespace agnostic {

template < typename Search_Model >
class	Unsat_Goals_Heuristic : public Heuristic<State> {
public:

	Unsat_Goals_Heuristic( const Search_Model& prob ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() ) {
	}	

	virtual ~Unsat_Goals_Heuristic() {
	}


	template <typename Search_Node>
        void eval( const Search_Node* n, float& h_val, std::vector<Action_Idx>& pref_ops) {
		eval(n->state(), h_val, pref_ops);				
	}

	
        template <typename Search_Node>
        void eval( const Search_Node* n, float& h_val ) {
		
		eval(n->state(),h_val);
	}
	
	virtual void eval( const State& s, float& h_val ) {
		h_val = count_goals( s );
	}
	
	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		h_val = count_goals( s );
		std::vector< aptk::Action_Idx >	app_set;
		this->problem().applicable_set_v2( s, app_set );
		for ( unsigned i = 0; i < app_set.size(); i++ ) {
			int a = app_set[i];
			const Action& act = *(m_strips_model.actions()[a]);
			for ( 	auto g_it = m_strips_model.goal().begin(); 
				g_it != m_strips_model.goal().end(); g_it++ ) {
				if ( !s.entails( *g_it) && act.asserts( *g_it ) ) {
					pref_ops.push_back( a );
					break;
				} 
			}
		}
	}

protected:

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

};

}

}

#endif // h_unsat.hxx
