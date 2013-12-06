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

#ifndef __LM_CUT_HEURISTIC__
#define __LM_CUT_HEURISTIC__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <action.hxx>
#include <landmark_graph.hxx>
#include <vector>
#include <deque>
#include <iosfwd>

namespace aptk {

namespace agnostic {



template <typename Search_Model >
class LM_Cut_Heuristic : public Heuristic<State> {
public:

	LM_Cut_Heuristic( const Search_Model& prob ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() ), m_graph( m_strips_model )
	{
		compute_lm_graph();
		m_in_lm_cut.resize( m_strips_model.num_fluents() );
	}

	virtual ~LM_Cut_Heuristic() {
	}

	virtual void eval( const State& s, float& h_val ) {
		m_lm_cut.clear();
		m_in_lm_cut.reset();

		for ( Fluent_Vec::const_iterator it = m_strips_model.goal().begin();
			it != m_strips_model.goal().end(); it++ )
			m_processed.push_back( *it );
		
		std::vector<unsigned>	tmp;
		while ( ! m_processed.empty() ) {
			unsigned p = m_processed.front();
			m_processed.pop_front();
			const Landmarks_Graph::Node* n_p = m_graph.node( p );
			if ( !s.entails(p) ) {
				//std::cout << "Landmark: " << m_strips_model.fluents()[ p ]->signature() << " not true in s" << std::endl;
				// Put preceding landmarks into queue
				if ( n_p->preceded_by().empty() ) {
					if ( m_in_lm_cut.isset( p ) ) continue;
					m_lm_cut.push_back( p );
					m_in_lm_cut.set( p );		
					continue;
				}
				for ( unsigned i = 0; i < n_p->preceded_by().size(); i++ ) {
					unsigned q = n_p->preceded_by()[i]->fluent();
					//std::cout << "\tAdding to queue landmark: " << m_strips_model.fluents()[ q ]->signature() << std::endl;
					m_processed.push_back( q );
				}
				continue;
			}
			for ( unsigned i = 0; i < n_p->required_by().size(); i++ ) {
				unsigned q = n_p->required_by()[i]->fluent();
				if ( m_in_lm_cut.isset( q ) || s.entails(q) ) continue;
				m_lm_cut.push_back( q );
				m_in_lm_cut.set( q );
			}
		}	
		h_val = m_lm_cut.size();
		/*
		std::cout << "Fluents in LM cut:" << std::endl;
		for ( unsigned k = 0; k < m_lm_cut.size(); k++ )
			 std::cout << m_strips_model.fluents()[ m_lm_cut[k] ]->signature() << std::endl;
		*/
	}

	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		eval( s, h_val );
		Successor_Generator::Iterator it( s, m_strips_model.successor_generator().nodes() );
		int a = it.first();
		while ( a != -1 ) {
			const Action& act = *(m_strips_model.actions()[a]);
			for ( Fluent_Vec::const_iterator it2 = act.add_vec().begin();
				it2 != act.add_vec().end(); it2++ )
				if ( m_in_lm_cut.isset( *it2 ) ) {
					pref_ops.push_back( act.index() );
					m_in_lm_cut.unset(*it2);
					break;
				}
			
			a = it.next();
		}
	}
	

protected:

	void	compute_lm_graph() {
		std::deque<unsigned> updated;
		
		// 1. Insert goal atoms as landmarks
		for ( Fluent_Vec::const_iterator it = m_strips_model.goal().begin();
			it != m_strips_model.goal().end(); it++ ) {
			m_graph.add_landmark( *it );
			updated.push_back( *it );
		}

		Bit_Set lm_set( m_strips_model.num_fluents() );
		Bit_Set processed( m_strips_model.num_fluents() );
		while ( !updated.empty() ) {
			unsigned p = updated.front();
			updated.pop_front(); 

			//if ( processed.isset(p) ) continue; 
			//processed.set(p);

			//std::cout << "Processing landmark: " << m_strips_model.fluents()[ p ]->signature() << std::endl;
			const std::vector<const Action*>& add_acts = m_strips_model.actions_adding( p );
			//std::cout << "Added by " << add_acts.size() << " actions" << std::endl;
			if ( !add_acts.empty() ) {
				lm_set.reset();
				lm_set.add( add_acts[0]->prec_set() );
	
				for ( unsigned k = 1; k < add_acts.size(); k++ ) 
					lm_set.set_intersection( add_acts[k]->prec_set() ); 
			}
			
			const std::vector< std::pair< unsigned, const Action*> >& add_acts_ce = 
				 m_strips_model.ceffs_adding( p );
			
			if ( !add_acts_ce.empty() ) {

				for ( unsigned k = 0; k < add_acts_ce.size(); k++ ) {
					lm_set.set_intersection( add_acts_ce[k].second->prec_set() );
					lm_set.set_intersection( add_acts_ce[k].second->ceff_vec()[ add_acts_ce[k].first ]->prec_set() );
				}

			}

			//std::cout << "LM set size: " << lm_set.bits().count_elements() << std::endl;
			lm_set.compute_first();

			unsigned q = lm_set.first();
			while ( q != lm_set.end() ) {
				if ( !m_graph.is_landmark(q) )
					m_graph.add_landmark( q );
				m_graph.add_landmark_for( p, q );
				updated.push_back( q );
				q = lm_set.next(q);
			}	
		}
		#ifdef DEBUG
		std::cout << "Landmarks found: " << m_graph.num_landmarks() << std::endl;
		m_graph.print( std::cout );
		#endif
	}

protected:

	const STRIPS_Problem&			m_strips_model;
	Landmarks_Graph				m_graph;
	std::vector<unsigned>			m_lm_cut;
	Bit_Set					m_in_lm_cut;
	std::deque<unsigned>			m_processed;
};

}

}

#endif // lm_cut_heuristic.hxx
