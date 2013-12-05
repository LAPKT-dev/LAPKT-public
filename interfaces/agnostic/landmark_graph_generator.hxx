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

#ifndef __LANDMARK_GRAPH_GENERATOR__
#define __LANDMARK_GRAPH_GENERATOR__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <reachability.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <landmark_graph.hxx>
#include <action.hxx>
#include <vector>
#include <deque>
#include <iosfwd>

namespace aptk {

namespace agnostic {



template <typename Search_Model >
class Landmarks_Graph_Generator  {
public:

	Landmarks_Graph_Generator( const Search_Model& prob ) 
	:  m_strips_model( prob.task() ), m_only_goals( false )
	{
		m_reachability = new aptk::agnostic::Reachability_Test( prob.task() );
	}

	virtual ~Landmarks_Graph_Generator() {
		delete m_reachability;
	}
	
public:
	void   set_only_goals( bool b ){ m_only_goals = b; }
	
	void	compute_lm_graph_set_additive( Landmarks_Graph& graph ) {
			
		std::deque<unsigned> updated;
		
		// 1. Insert goal atoms as landmarks
		for ( Fluent_Vec::const_iterator it = m_strips_model.goal().begin();
			it != m_strips_model.goal().end(); it++ ) {
			graph.add_landmark( *it );
			updated.push_back( *it );
		}

		for ( unsigned i = 0; i < m_strips_model.goal().size(); i++ ) {
			unsigned p = m_strips_model.goal()[i];
			for ( unsigned j = i+1; j < m_strips_model.goal().size(); j++ ) {
				unsigned q = m_strips_model.goal()[j];				

				/**
				 * If all actions adding p edel q, then p must precede q
				 */
				const std::vector<const Action*>& add_acts_p = m_strips_model.actions_adding( p );
				
				bool all_actions_edel_q = true;
				for ( unsigned k = 0; k < add_acts_p.size(); k++ ) {
					//add_acts_p[k]->print( m_strips_model, std::cout );
					//std::cout << m_strips_model.fluents().at(p)->signature() << " edel " << m_strips_model.fluents().at(q)->signature() << "? " <<std::endl;
					if( ! add_acts_p[k]->edel_set().isset( q ) ){					
						all_actions_edel_q = false;
						break;
					}      

				}
				/**
				 * If all actions adding q edel p, then q must precede p
				 */
				
				const std::vector<const Action*>& add_acts_q = m_strips_model.actions_adding( q );
				bool all_actions_edel_p = true;
				for ( unsigned k = 0; k < add_acts_q.size(); k++ ) {
					//add_acts_q[k]->print( m_strips_model, std::cout );
					//std::cout << m_strips_model.fluents().at(q)->signature() << " edel " << m_strips_model.fluents().at(p)->signature() << "? " <<std::endl;
					if( ! add_acts_q[k]->edel_set().isset( p ) ){				       
						all_actions_edel_p = false;
						break;
					}      
				}
				/**
				 * Avoid loops in the graph
				 */
				if(all_actions_edel_q &&  all_actions_edel_p)continue;

				if(all_actions_edel_q){
					graph.add_landmark_for( q, p );
				}
				if(all_actions_edel_p){
					graph.add_landmark_for( p, q );
				}


			}
				
	
		}

		if( m_only_goals ) return;
		
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

				if ( ! m_strips_model.is_in_init(q) ) {

					if ( !graph.is_landmark(q) )
						graph.add_landmark( q );
					graph.add_landmark_for( p, q );
					updated.push_back( q );
				}
				q = lm_set.next(q);
			}	
		}

		
		/**
		 * Compute Greedy Necessary Orderings
		 */
		// std::vector< Bit_Set > lm_set_in_actions( m_strips_model.num_actions() );
		// m_fl_in_graph.resize( m_strips_model.num_fluents() );
		
		// Bit_Set reach_actions;
		// m_reachability->get_reachable_actions( s->fluent_vec() , this->problem().task().goal() , reach_actions  );

		// for(unsigned p = 1; p <  m_strips_model.num_fluents(); p++){

		// 	const std::vector<const Action*>& add_acts = m_strips_model.actions_adding( p );
						

		// 	bool first_supp = true;

		// 	for ( unsigned k = 0; k < add_acts.size(); k++ ){
		// 		const Action* a = add_acts[k];
		// 		/**
		// 		 * if action is reachable
		// 		 */
		// 		if( !reach_action[ a->index() ] ) ) continue;

		// 		std::set<unsigned> land_supp;

		// 		getPCFluentLandmarks( supporters[k], land_supp );

		// 		/**
		// 		 * if action do contain p as landmark
		// 		 */
		// 		if(land_supp.find(p) != land_supp.end()) continue;

		// 		Atom_Vec& prec = task.useful_ops()[ supporters[k] ]->prec_vec();

		// 		ListSet list_prec;

		// 		for(Atom_Vec::iterator it_prec = prec.begin(); it_prec != prec.end(); it_prec++){
		// 			/**
		// 			 * discard initial state gn_land
		// 			 */
		// 			if(fluent_level[*it_prec] == 0)  continue;

		// 			list_prec.insert(*it_prec);
		// 			for(unsigned j = 0; j < task.fluent2star_fluent(*it_prec).size(); j++)
		// 				list_prec.insert(task.fluent2star_fluent(*it_prec)[j]);

		// 		}
		// 		if(first_supp){
		// 			gn_landmarks[p] = list_prec;
		// 			first_supp = false;
		// 		}
		// 		else
		// 			gn_landmarks[p].intersect(list_prec);

		// 	}

		// }
		

		
	

		#ifdef DEBUG
		std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
		graph.print( std::cout );
		#endif

	}

protected:

	const STRIPS_Problem&			m_strips_model;
	bool                                    m_only_goals;
	Reachability_Test*                      m_reachability;	
};

}

}

#endif // landmark_graph_generator.hxx
