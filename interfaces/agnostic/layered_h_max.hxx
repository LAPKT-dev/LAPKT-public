/*
Lightweight Automated Planning Toolkit
Copyright (C) 2014
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

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <aptk/ext_math.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <vector>
#include <list>

#ifndef __LAYERED_H_MAX__
#define __LAYERED_H_MAX__

namespace aptk {

namespace agnostic {

template <typename Search_Model >
class Layered_H_Max : public Heuristic<State> {

	public:

	typedef STRIPS_Problem::Best_Supporter 	Best_Supporter;

	static unsigned infinity() { return std::numeric_limits<unsigned>::max(); }

	Layered_H_Max( const Search_Model& prob ) 
	: Heuristic<State>(prob), m_strips_model( prob.task() ) {
		m_values.resize( m_strips_model.num_fluents() );
		m_difficulties.resize( m_strips_model.num_fluents() );
		m_best_supporters.resize( m_strips_model.num_fluents() );
		m_reached.resize( m_strips_model.num_fluents() );
	}

	virtual ~Layered_H_Max() {
	}

	unsigned	value( unsigned p ) const { return m_values[p]; }
	
	bool		reachable( unsigned p ) const { return m_reached.isset(p); }

	virtual	void	eval( const Fluent_Vec& s, unsigned& h ) const {
		h = 0;
		for ( auto p : s ) {
			h = std::max( h, m_values[p] );
		}
	}

        virtual void	eval( const Fluent_Vec& s, float & h_out ) {
		unsigned h;
		eval( s, h );
		h_out = (h == infinity()) ? std::numeric_limits<float>::max() : (float)h;		
	}

	virtual void	eval( const State& s, unsigned & h ) {
		m_reached.reset();
		compute(s);
		eval( m_strips_model.goal(), h );
	}


	virtual void	eval( const State& s, float & h_out ) {
		unsigned h;
		eval( s, h );
		h_out = (h == infinity()) ? std::numeric_limits<float>::max() : (float)h;
		
	}

	void print_values( std::ostream& os ) const {
		for ( unsigned p = 0; p < m_strips_model.fluents().size(); p++ ){
				os << "h1/add({ ";
				os << m_strips_model.fluents()[p]->signature();
				os << "}) = " << m_values[p] << std::endl;
			}		
	}

	Best_Supporter	get_best_supporter( unsigned p ) const {
		return m_best_supporters[p];
	}

protected:

	void	update( unsigned p, unsigned v, Best_Supporter bs ) {
		update( p, v, bs.act_idx, bs.eff_idx );
	}

	unsigned eval_diff( const Best_Supporter& bs ) const {
		unsigned min_val = infinity();
		if ( bs.act_idx == no_such_index )
			return 0;
		const Action* a =  m_strips_model.actions()[bs.act_idx];
		for ( auto p : a->prec_vec() )
			min_val = std::min( min_val, m_values[p] );
		if ( bs.eff_idx == no_such_index ) return min_val;
		for ( auto p : a->ceff_vec()[bs.eff_idx]->prec_vec() )
			min_val = std::min( min_val, m_values[p] );
		return min_val;
	}

	void	update( unsigned p, unsigned v, unsigned act_idx, unsigned eff_idx ) {
		#ifdef DEBUG_LAYERED_H_MAX
		std::cout << "Updating: " << m_strips_model.fluents()[p]->signature() << std::endl;
		#endif
		if ( m_reached.isset(p) ) {
			if ( v > m_values[p] ) return;
			// difficulty
			Best_Supporter candidate( act_idx, eff_idx );
			unsigned candidate_diff = eval_diff( candidate );
			if ( candidate_diff < m_difficulties[p] ) {
				m_best_supporters[p] = candidate;
				m_difficulties[p] = candidate_diff;
			}
			return;
		}
		m_changed = true;
		m_reached.set(p);
		m_values[p] = v;
		m_best_supporters[p].act_idx = act_idx;
		m_best_supporters[p].eff_idx = eff_idx;
		m_difficulties[p] = eval_diff( m_best_supporters[p] );
		#ifdef DEBUG_LAYERED_H_MAX
		std::cout << "\t v = " << v << std::endl;
		std::cout << "\t bs: action = " << ( act_idx == no_such_index ? "(init)" : m_strips_model.actions()[act_idx]->signature() );
		std::cout << "effect = " << ( eff_idx == no_such_index ? -1 : eff_idx) << std::endl;
		#endif
		for ( unsigned eff_idx : m_strips_model.relevant_effects( p ) ) {
			#ifdef DEBUG_LAYERED_H_MAX
			std::cout << "\t Notifying effect: ";
			std::cout << "action = " << ( m_strips_model.effects()[eff_idx].act_idx == no_such_index ? 
							"(init)" : m_strips_model.actions()[m_strips_model.effects()[eff_idx].act_idx]->signature() );
			std::cout << "effect = " << ( m_strips_model.effects()[eff_idx].eff_idx == no_such_index ? -1 : m_strips_model.effects()[eff_idx].eff_idx ) << std::endl;
			#endif
			STRIPS_Problem::Trigger& t = m_strips_model.triggers()[eff_idx];
			t.update( p );
			if ( t.satisfied() ) {
				#ifdef DEBUG_LAYERED_H_MAX
				std::cout << "\t\tActivated!" << std::endl;
				#endif
				m_triggered_effects.push_back( eff_idx );
			}
		}	
	}

	void	compute(const State& s) {
		unsigned current_level = 0;

		m_reached.reset();
		for ( unsigned k = 0; k < m_strips_model.num_fluents(); k++ ) {
			m_values[k] = m_difficulties[k] = infinity();
			m_best_supporters[k] = Best_Supporter( no_such_index, no_such_index );
		}

		for ( unsigned k = 0; k < m_strips_model.effects().size(); k++ ) {
			STRIPS_Problem::Trigger& t = m_strips_model.triggers()[k];
			t.reset(); 
		}

		m_triggered_effects.clear();

		for ( unsigned p : s.fluent_vec() )
			update( p, current_level, no_such_index, no_such_index  );

		do {
			m_changed = false;

			if ( current_level == 0 ) {
				// 1. process all actions with empty preconditions (and/or conditional effects)
				for ( const Action* a : m_strips_model.empty_prec_actions() ) {
						
					for ( unsigned a_p : a->add_vec() )
						update( a_p, current_level + 1, a->index(), no_such_index );
					
					for ( unsigned j = 0; j < a->ceff_vec().size(); j++ ) {
						const Conditional_Effect& ceff = *(a->ceff_vec()[j]);
						if ( !ceff.prec_vec().empty() ) continue;
						for ( unsigned a_p : ceff.add_vec() )
							update( a_p, current_level + 1, a->index(), j );
					}
				}
				
			}

			m_current_effects.clear();
			std::swap( m_triggered_effects, m_current_effects );
			for ( auto eff_index : m_current_effects ) {
				#ifdef DEBUG_LAYERED_H_MAX
				std::cout << "Processing effect: ";
				std::cout << "action = " << ( m_strips_model.effects()[eff_index].act_idx == no_such_index ? 
								"(init)" : m_strips_model.actions()[m_strips_model.effects()[eff_index].act_idx]->signature() );
				std::cout << "effect = " << ( m_strips_model.effects()[eff_index].eff_idx == no_such_index ? -1 : m_strips_model.effects()[eff_index].eff_idx ) << std::endl;
				#endif
				const Best_Supporter& bs = m_strips_model.effects()[eff_index];
				/*
				const Action* a = m_strips_model.actions()[ bs.act_idx ];
				for ( unsigned a_p : a->add_vec() ) 
					update( a_p, current_level + 1, bs );
				if ( bs.eff_idx == no_such_index ) continue;
				for ( unsigned a_p : a->ceff_vec()[bs.eff_idx]->add_vec() )
					update( a_p, current_level + 1, bs );	
				*/
				for ( unsigned a_p : m_strips_model.triggers()[eff_index].effect() )
					update( a_p, current_level + 1, bs );
			}
			#ifdef DEBUG_LAYERED_H_MAX
			std::cout << "Triggered effects: " << m_triggered_effects.size() << std::endl;
			#endif
			current_level++;	
		} while ( m_changed && !goal_reached() );

	}	

	bool	goal_reached() const {
		for ( unsigned g : m_strips_model.goal() )
			if (!m_reached.isset(g)) return false;
		return true;
	}

protected:

	const STRIPS_Problem&				m_strips_model;
	std::vector<unsigned>				m_values;
	std::vector<unsigned>				m_difficulties;
	Bit_Set						m_reached;
	std::vector< Best_Supporter >			m_best_supporters;
	bool						m_changed = false;
	std::list< unsigned >				m_triggered_effects;
	std::list< unsigned >				m_current_effects;	
};

}

}

#endif
