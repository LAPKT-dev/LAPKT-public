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
#include <h_1.hxx>
#include <action.hxx>
#include <vector>
#include <deque>
#include <iosfwd>

namespace aptk {

namespace agnostic {



template <typename Search_Model >
class Landmarks_Graph_Generator  {

typedef		H1_Heuristic<Search_Model, H_Max_Evaluation_Function>	H_Max;

public:

	Landmarks_Graph_Generator( const Search_Model& prob ) 
	:  m_strips_model( prob.task() ), m_only_goals( false ), m_goal_ordering(true), m_h1( prob ), m_verbose( false ), m_collect_lm_in_init(false)
	{
		m_reachability = new aptk::agnostic::Reachability_Test( prob.task() );
	}

	virtual ~Landmarks_Graph_Generator() {
		delete m_reachability;
	}

	void	set_verbose( bool v ) { m_verbose = v; }
	
public:

	void	allow_lm_in_init() { m_collect_lm_in_init = true; }
	void	disallow_lm_in_init() { m_collect_lm_in_init = false; }

	void   set_only_goals( bool b ){ m_only_goals = b; }

	void   set_goal_ordering( bool b ){ m_goal_ordering = b; }
  
        void    build_goal_ordering( Landmarks_Graph& graph ){

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
					//continue;
				}
				if(all_actions_edel_p){
					graph.add_landmark_for( p, q );
				}


			}
				
	
		}

	}
  
	void	compute_lm_graph_set_additive( Landmarks_Graph& graph ) {
			
		std::deque<unsigned> updated;
		
		// 1. Insert goal atoms as landmarks
		for ( Fluent_Vec::const_iterator it = m_strips_model.goal().begin();
		      it != m_strips_model.goal().end(); it++ ) {
			graph.add_landmark( *it );
			if ( ! m_strips_model.is_in_init( *it ) ) {
				updated.push_back( *it );
			}
		}


		if( m_only_goals ){
			if(m_goal_ordering)
				build_goal_ordering( graph );
			return;
		}
		
		Bit_Set lm_set( m_strips_model.num_fluents() );
		Bit_Set processed( m_strips_model.num_fluents() );
		
		while ( !updated.empty() ) {
			unsigned p = updated.front();
			updated.pop_front(); 

			if ( processed.isset(p) ) continue; 
			processed.set(p);

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
			for (unsigned q : lm_set ) {
				if ( !m_collect_lm_in_init && m_strips_model.is_in_init(q) ) {
					continue;
				}

				if ( !graph.is_landmark(q) )
					graph.add_landmark( q );
				//				if ( ! m_strips_model.is_in_goal(p) )
				graph.add_landmark_for( p, q );
				// else{
				// 	graph.add_landmark_for( p, q );
				// 	//graph.node(p)->add_precedent_gn( graph.node(q) );
				// 	//graph.node(q)->add_requiring_gn( graph.node(p) );
				// }
				updated.push_back( q );
			}	
		}

		
		/**
		 * Compute Greedy Necessary Orderings
		 */		
		Bit_Set reach_actions;
		m_reachability->get_reachable_actions( m_strips_model.init() , m_strips_model.goal() , reach_actions  );
		float h_goal;
		State init_s( m_strips_model );
		init_s.set( m_strips_model.init() );
		m_h1.eval( init_s, h_goal );

		for(unsigned p = 1; p <  m_strips_model.num_fluents(); p++){
			
			if( ! graph.is_landmark(p) ) continue;
			Action_Ptr_Const_Vec best_supp;
				
			m_h1.get_best_supporters( p, best_supp );
			
			//const std::vector<const Action*>& add_acts = m_strips_model.actions_adding( p );

			lm_set.reset();

			for ( unsigned k = 0; k < best_supp.size(); k++ ){
				const Action* a = best_supp[k];
				/**
				 * if action is reachable
				 */
				if( !reach_actions.isset(a->index()) ) continue;

				Bit_Set lands_a( m_strips_model.num_fluents() );

				getPCFluentLandmarks( a->index(), lands_a, graph );

				/**
				 * if action do contain p as landmark
				 */

				if( lands_a.isset(p) ){ 
					//				  std::cout << m_strips_model.actions()[a->index()]->signature() << "NOT first sup of " << m_strips_model.fluents()[p]->signature() << std::endl; 
				  
					continue;				
				}
				//std::cout << m_strips_model.actions()[a->index()]->signature() << "first sup of " << m_strips_model.fluents()[p]->signature() << std::endl; 
				
				if(k==0)
					lm_set.add( a->prec_set() ); 
				else
					lm_set.set_intersection( a->prec_set() ); 
				

			}

			for (unsigned q : lm_set ) {
				/**
				 * Do not add gn of lands in intial state
				 */
				if ( !m_collect_lm_in_init && m_strips_model.is_in_init(q) ) {
					continue;
				}

				if ( m_verbose )
					std::cout << m_strips_model.fluents()[q]->signature() << "gn land for " << m_strips_model.fluents()[p]->signature() << std::endl; 
				Landmarks_Graph::Node* nq = graph.node(q);
				if( nq ){
					Landmarks_Graph::Node* np = graph.node(p);
					if( ! np->is_preceded_by(nq) ) 
						graph.node(p)->add_precedent_gn( graph.node(q) );
					if( ! nq->is_required_by(np) ) 
						graph.node(q)->add_requiring_gn( graph.node(p) );
				}
			}	

		}
	

		if(m_goal_ordering)
			build_goal_ordering( graph );
	

#ifdef DEBUG
		std::cout << "Landmarks found: " << graph.num_landmarks() << std::endl;
		if ( m_verbose )
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
			//std::cout << m_strips_model.fluents()[fl]->signature() << " " <<std::endl; 
			landmarks.set( fl );
			getFluentLandmarks( fl, landmarks, graph);
		}
		
	}
	
	void getPCFluentLandmarks(unsigned act_idx,
				  Bit_Set &landmarks, Landmarks_Graph& graph ) {

	  // std::cout << "Action " << m_strips_model.actions()[act_idx]->signature() << " Land: ";
		const Fluent_Vec& prec = m_strips_model.actions()[act_idx]->prec_vec();
                for(unsigned i = 0; i < prec.size(); i++) {
                        landmarks.set( prec[i] );
			//	std::cout << m_strips_model.fluents()[prec[i]]->signature() << " " <<std::endl; 
			getFluentLandmarks( prec[i], landmarks, graph);
                }
		//	std::cout << std::endl;


        }


protected:

	const STRIPS_Problem&			m_strips_model;
	bool                                    m_only_goals;
	bool                                    m_goal_ordering;
	Reachability_Test*                      m_reachability;	
        H_Max                                   m_h1;
	bool					m_verbose;
	bool					m_collect_lm_in_init;
};

}

}

#endif // landmark_graph_generator.hxx
