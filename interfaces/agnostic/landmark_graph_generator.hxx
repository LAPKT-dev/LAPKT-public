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
		Bit_Set reach_actions;
		m_reachability->get_reachable_actions( m_strips_model.init() , m_strips_model.goal() , reach_actions  );

		for(unsigned p = 1; p <  m_strips_model.num_fluents(); p++){
			
			if( ! graph.is_landmark(p) ) continue;
			const std::vector<const Action*>& add_acts = m_strips_model.actions_adding( p );

			lm_set.reset();

			for ( unsigned k = 0; k < add_acts.size(); k++ ){
				const Action* a = add_acts[k];
				/**
				 * if action is reachable
				 */
				if( !reach_actions.isset(a->index()) ) continue;

				Bit_Set lands_a( m_strips_model.num_fluents() );

				getPCFluentLandmarks( a->index(), lands_a, graph );

				/**
				 * if action do contain p as landmark
				 */
				if( lands_a.isset(p) ) continue;				

				
				if(k==0)
					lm_set.add( a->prec_set() ); 
				else
					lm_set.set_intersection( a->prec_set() ); 
				

			}

			lm_set.compute_first();

			unsigned q = lm_set.first();
			while ( q != lm_set.end() ) {

				/**
				 * Do not add gn of lands in intial state
				 */
				if ( ! m_strips_model.is_in_init(q) ){
					std::cout << m_strips_model.fluents()[q]->signature() << "gn land for " << m_strips_model.fluents()[p]->signature() << std::endl; 
					graph.node(p)->add_precedent_gn( graph.node(q) );
				}
				q = lm_set.next(q);
			}	

		}
	

		
	

		#ifdef DEBUG
		std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
		graph.print( std::cout );
		#endif

	}

protected:

	void getFluentLandmarks( unsigned p, Bit_Set& landmarks, Landmarks_Graph& graph ){
		
		if( ! graph.is_landmark( p ) ) return;

		for(std::vector<Landmarks_Graph::Node*>::const_iterator it = graph.node( p )->preceded_by().begin(); 
		    it != graph.node( p )->preceded_by().end(); it++ ){
			unsigned fl = (*it)->fluent();

			if( landmarks.isset( fl ) ) continue;

			landmarks.set( fl );
			getFluentLandmarks( fl, landmarks, graph);
		}
		
	}
	
	void getPCFluentLandmarks(unsigned act_idx,
				  Bit_Set &landmarks, Landmarks_Graph& graph ) {

		const Fluent_Vec& prec = m_strips_model.actions()[act_idx]->prec_vec();
                for(unsigned i = 0; i < prec.size(); i++) {
                        landmarks.set( prec[i] );
			getFluentLandmarks( prec[i], landmarks, graph);
                }


        }


protected:

	const STRIPS_Problem&			m_strips_model;
	bool                                    m_only_goals;
	Reachability_Test*                      m_reachability;	
};

}

}

#endif // landmark_graph_generator.hxx
