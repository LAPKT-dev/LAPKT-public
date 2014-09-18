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

#ifndef __DFS_PLUS__
#define __DFS_PLUS__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <aptk/serialized_search.hxx>
#include <landmark_graph.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search {

namespace novelty_spaces{



template < typename Search_Model, typename Search_Strategy, typename Search_Node  >
class DFS_Plus {

public:


	typedef         aptk::agnostic::Landmarks_Graph                 Landmarks_Graph;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;


	DFS_Plus( const Search_Model& search_problem ) : m_problem( search_problem ), m_pruned_sum_B_count(0), m_sum_B_count(0), m_max_B_count(0), m_iw_calls(0), m_expanded(0), m_generated(0), m_goal_agenda(NULL), m_max_bound( std::numeric_limits<unsigned>::max() ), m_backtracks(0), m_root(NULL), m_iw_engine( search_problem ) {	   	
		m_goal_agenda = NULL;
	}

	virtual ~DFS_Plus() {
	}

	void            set_goal_agenda( Landmarks_Graph* lg ) { m_goal_agenda = lg; }

	bool            dfs_search( State* init, std::vector<Action_Idx>& plan, float& cost, Fluent_Vec goals_achieved ){

		static const unsigned gsize = this->problem().task().goal().size();
		Closed_List_Type   closed_goal_states;
		//bool use_relplan = false;
		unsigned bound = 1;
		Search_Node* end = NULL;
		State* new_init_state = NULL;

		m_iw_engine.set_closed_goal_states( &closed_goal_states );
		m_iw_engine.set_bound( bound );
		//m_iw_engine.set_use_relplan( use_relplan ); 

		new_init_state = NULL;
		if( init ){
			new_init_state = new State( this->problem().task() );
			new_init_state->set( init->fluent_vec() );
			new_init_state->update_hash();	
		}	
		m_iw_engine.start( new_init_state );


		if( m_goal_agenda ){

			m_iw_engine.goal_candidates().clear();

			m_goal_agenda->get_leafs( m_iw_engine.goal_candidates() );
			m_iw_engine.goals_achieved() = goals_achieved;			
			m_iw_engine.set_goals( &(m_iw_engine.goal_candidates()) );			
		}
		
								       

		do{
			
			std::cout << std::endl << "{" << gsize << "/" << m_iw_engine.goal_candidates().size() << "/" << m_iw_engine.goals_achieved().size() << "}:IW";
			//if(use_relplan)
			//	std::cout << "+";
			std::cout << "(" << m_iw_engine.bound() << ") -> " << std::flush;
		

			end = m_iw_engine.do_search();		
			m_pruned_sum_B_count += m_iw_engine.pruned_by_bound();
			
			m_expanded += m_iw_engine.expanded();
			m_generated += m_iw_engine.generated();

			if ( end == NULL ) {


				/**
				 * If no partial plan to achieve any goal is  found,
				 * throw IW(b+1) from same root node
				 *
				 * If no state has been pruned by bound, then IW is in a dead-end,
				 * return NO-PLAN
				 */
				if( m_iw_engine.pruned_by_bound() == 0){
					
					return false;
				}
				
				//				if( !use_relplan )
				//	m_iw_engine.set_use_relplan( true );
				//else
				{
					bound++;
					m_iw_engine.set_bound( bound );				
					//m_iw_engine.set_use_relplan( false );
					
					if(m_iw_engine.arity() == 1){ // couldn't reserve space in memory.
						return false;
					}
					
				}

				//use_relplan = use_relplan ? false : true;

				if ( bound > this->max_bound() ){ // Hard cap on width exceeded
					
					return false;
				}

				
				new_init_state = new State( this->problem().task() );
				new_init_state->set( m_iw_engine.root()->state()->fluent_vec() );
				new_init_state->update_hash();				

				m_iw_engine.set_closed_goal_states( &closed_goal_states );
				m_iw_engine.reset_closed_goal_states();
				m_iw_engine.start( new_init_state );				


				// Memory exceeded to reserve data structures for novelty
				if(m_iw_engine.arity() != m_iw_engine.bound() ){
					
					return false;
				}
			}
			else{


				m_max_B_count = m_max_B_count < m_iw_engine.bound() ? m_iw_engine.bound() : m_max_B_count; 
				m_sum_B_count += m_iw_engine.bound();
				m_iw_calls++;
				
				if( this->problem().goal( *(end->state()) ) ){
					std::vector<Action_Idx> partial_plan;
					float partial_cost = 0.0f;
					m_iw_engine.extract_plan( m_iw_engine.root(), end, partial_plan, partial_cost, false );	
					plan.insert( plan.end(), partial_plan.begin(), partial_plan.end() );			
					cost += partial_cost;				

					return true;
				}
				
				//closed_goal_states.put(end);

				new_init_state = new State( this->problem().task() );
				new_init_state->set( end->state()->fluent_vec() );
				new_init_state->update_hash();				

				if( m_goal_agenda ){					
					for(Fluent_Vec::iterator it = m_iw_engine.goals_achieved().begin(); 
					    it != m_iw_engine.goals_achieved().end(); it++){					
						m_goal_agenda->consume_node( *it );
					}

					///std::cout << std::endl << "<--{" << gsize << "/" << m_iw_engine.goal_candidates().size() << "/" << m_iw_engine.goals_achieved().size() << "}:IW(" << m_iw_engine.bound() << ") " << std::endl;

				}

				std::vector<Action_Idx> partial_plan;
				float partial_cost = 0.0f;
				m_iw_engine.extract_plan( m_iw_engine.root(), end, partial_plan, partial_cost, false );	

				
				// for ( typename Closed_List_Type::iterator i = m_iw_engine.closed_goal_states()->begin();
				//       i != m_iw_engine.closed_goal_states()->end(); i++ ) {
				// 	i->second->print(std::cout);
				// }

				if( dfs_search( new_init_state, plan, cost, m_iw_engine.goals_achieved() ) ){
					/**
					 * If a partial plan extending the achieved goals set is found,
					 * IW(1) is thrown from end_state
					 */
					
					
					plan.insert( plan.end(), partial_plan.begin(), partial_plan.end() );			
					cost += partial_cost;
					delete new_init_state;
					return true;
				}
				else
					delete new_init_state;

				if( m_goal_agenda ){					
					for(Fluent_Vec::iterator it = m_iw_engine.goals_achieved().begin(); 
					    it != m_iw_engine.goals_achieved().end(); it++){					
						m_goal_agenda->unconsume_node( *it );
					}

					for(Fluent_Vec::iterator it = goals_achieved.begin(); 
					    it != goals_achieved.end(); it++){					
						m_goal_agenda->consume_node( *it );
					}
					m_iw_engine.goal_candidates().clear();
					m_iw_engine.goals_achieved() = goals_achieved;;
					m_goal_agenda->get_leafs( m_iw_engine.goal_candidates() );

				}
				//this->debug_info( new_init_state, this->m_goal_candidates );

				if(m_iw_engine.search_exhausted() && bound < this->max_bound() ){
					//if( !use_relplan )
					//	m_iw_engine.set_use_relplan( true );
					//else
					{
						bound++;
						m_iw_engine.set_bound( bound );				
						//m_iw_engine.set_use_relplan( false );
						
					}
					
					//use_relplan = use_relplan ? false : true;

					new_init_state = NULL;
					if( init ){
						new_init_state = new State( this->problem().task() );
						new_init_state->set( init->fluent_vec() );
						new_init_state->update_hash();
					}

					m_iw_engine.set_closed_goal_states( &closed_goal_states );
					m_iw_engine.reset_closed_goal_states();
					m_iw_engine.start( new_init_state );	
				}
				else{
					new_init_state = NULL;
					if( init ){
						new_init_state = new State( this->problem().task() );
						new_init_state->set( init->fluent_vec() );
						new_init_state->update_hash();
					}
					m_iw_engine.set_closed_goal_states( &closed_goal_states );
					m_iw_engine.set_bound( bound );
					//m_iw_engine.set_use_relplan( use_relplan ); 
					m_iw_engine.start( new_init_state );	
					
				}
				
				if( ! m_iw_engine.search_exhausted() ){
					std::cout << "\t\tBactrack!" << std::endl;
					m_backtracks++;
				}
				

				// for ( typename Closed_List_Type::iterator i = m_iw_engine.closed_goal_states()->begin();
				//       i != m_iw_engine.closed_goal_states()->end(); i++ ) {
				// 	i->second->print(std::cout);
				// }
				
			}
			
		}while( ! m_iw_engine.search_exhausted()   );
		
		
		return false;
	}

	virtual bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		
		cost=0;
		Fluent_Vec goals_achieved;
		bool solved = dfs_search( NULL, plan, cost, goals_achieved );
		if(solved)
			std::reverse(plan.begin(), plan.end());		
		
		return solved;
		

	}

/**
 * DFS instantiating new IW each level, and keeping the state of the search. More memory intense.
 */	
// bool            dfs_search( State* init, std::vector<Action_Idx>& plan, float& cost, Fluent_Vec goals_achieved ){

// 		static const unsigned gsize = this->problem().task().goal().size();
// 		Serialized_Search<Search_Model, Search_Strategy, Search_Node> iw_engine( this->problem() );
		
// 		Search_Node* end = NULL;
// 		State* new_init_state = NULL;

// 		iw_engine.set_bound(1);
// 		iw_engine.set_use_relplan( false ); 
// 		iw_engine.start( init );


// 		if( m_goal_agenda ){
// 			m_goal_agenda->get_leafs( iw_engine.goal_candidates() );
// 			iw_engine.goals_achieved() = goals_achieved;			
// 			iw_engine.set_goals( &(iw_engine.goal_candidates()) );			
// 		}
		
								       

// 		do{
			
// 			std::cout << std::endl << "{" << gsize << "/" << iw_engine.goal_candidates().size() << "/" << iw_engine.goals_achieved().size() << "}:IW(" << iw_engine.bound() << ") -> " << std::flush;
		

// 			end = iw_engine.do_search();		
// 			m_pruned_sum_B_count += iw_engine.pruned_by_bound();
			
// 			m_expanded += iw_engine.expanded();
// 			m_generated += iw_engine.generated();

// 			if ( end == NULL ) {


// 				/**
// 				 * If no partial plan to achieve any goal is  found,
// 				 * throw IW(b+1) from same root node
// 				 *
// 				 * If no state has been pruned by bound, then IW is in a dead-end,
// 				 * return NO-PLAN
// 				 */
// 				if( iw_engine.pruned_by_bound() == 0){
					
// 					return false;
// 				}
				
// 				if( !iw_engine.use_relplan( ) )
// 					iw_engine.set_use_relplan( true );
// 				else{
// 					iw_engine.set_bound( iw_engine.bound()+1 );				
// 					iw_engine.set_use_relplan( false );

// 					if(iw_engine.arity() == 1){ // couldn't reserve space in memory.
// 						return false;
// 					}
					
// 				}

// 				if ( iw_engine.bound() > this->max_bound() ){ // Hard cap on width exceeded
					
// 					return false;
// 				}

				
// 				new_init_state = new State( this->problem().task() );
// 				new_init_state->set( iw_engine.root()->state()->fluent_vec() );
// 				new_init_state->update_hash();				


// 				iw_engine.start( new_init_state );				


// 				// Memory exceeded to reserve data structures for novelty
// 				if(iw_engine.arity() != iw_engine.bound() ){
					
// 					return false;
// 				}
// 			}
// 			else{


// 				m_max_B_count = m_max_B_count < iw_engine.bound() ? iw_engine.bound() : m_max_B_count; 
// 				m_sum_B_count += iw_engine.bound();
// 				m_iw_calls++;
				
// 				if( this->problem().goal( *(end->state()) ) ){
// 					std::vector<Action_Idx> partial_plan;
// 					float partial_cost = 0.0f;
// 					iw_engine.extract_plan( iw_engine.root(), end, partial_plan, partial_cost, false );	
// 					plan.insert( plan.end(), partial_plan.begin(), partial_plan.end() );			
// 					cost += partial_cost;				
					
// 					return true;
// 				}
				
				

// 				new_init_state = new State( this->problem().task() );
// 				new_init_state->set( end->state()->fluent_vec() );
// 				new_init_state->update_hash();				

// 				if( m_goal_agenda ){					
// 					for(Fluent_Vec::iterator it = iw_engine.goals_achieved().begin(); 
// 					    it != iw_engine.goals_achieved().end(); it++){					
// 						m_goal_agenda->consume_node( *it );
// 					}

// 					///std::cout << std::endl << "<--{" << gsize << "/" << iw_engine.goal_candidates().size() << "/" << iw_engine.goals_achieved().size() << "}:IW(" << iw_engine.bound() << ") " << std::endl;

// 				}

// 				if( dfs_search( new_init_state, plan, cost, iw_engine.goals_achieved() ) ){
// 					/**
// 					 * If a partial plan extending the achieved goals set is found,
// 					 * IW(1) is thrown from end_state
// 					 */
					
					
// 					std::vector<Action_Idx> partial_plan;
// 					float partial_cost = 0.0f;
// 					iw_engine.extract_plan( iw_engine.root(), end, partial_plan, partial_cost, false );	
// 					plan.insert( plan.end(), partial_plan.begin(), partial_plan.end() );			
// 					cost += partial_cost;				
// 					return true;
// 				}
				
// 				if( m_goal_agenda ){					
// 					for(Fluent_Vec::iterator it = iw_engine.goals_achieved().begin(); 
// 					    it != iw_engine.goals_achieved().end(); it++){					
// 						m_goal_agenda->unconsume_node( *it );
// 					}

// 					for(Fluent_Vec::iterator it = goals_achieved.begin(); 
// 					    it != goals_achieved.end(); it++){					
// 						m_goal_agenda->consume_node( *it );
// 					}
// 					iw_engine.goal_candidates().clear();
// 					iw_engine.goals_achieved() = goals_achieved;;
// 					m_goal_agenda->get_leafs( iw_engine.goal_candidates() );

// 				}
// 				//this->debug_info( new_init_state, this->m_goal_candidates );

// 				if(iw_engine.search_exhausted() && iw_engine.bound() <= this->max_bound() ){
// 					if( !iw_engine.use_relplan( ) )
// 						iw_engine.set_use_relplan( true );
// 					else{
// 						iw_engine.set_bound( iw_engine.bound()+1 );				
// 						iw_engine.set_use_relplan( false );
						
// 					}

// 					new_init_state = new State( this->problem().task() );
// 					new_init_state->set( iw_engine.root()->state()->fluent_vec() );
// 					new_init_state->update_hash();

// 					iw_engine.start( new_init_state );	
// 				}
				
// 				if( ! iw_engine.search_exhausted() ){
// 					std::cout << "\t\tBactrack!" << std::endl;
// 					m_backtracks++;
// 				}
				
				
// 			}
			
// 		}while( ! iw_engine.search_exhausted()   );
		
// 		return false;
// 	}
	
	// virtual bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		
	// 	cost=0;
	// 	Fluent_Vec goals_achieved;
	// 	bool solved = dfs_search( NULL, plan, cost, goals_achieved );
	// 	if(solved)
	// 		std::reverse(plan.begin(), plan.end());		
		
	// 	return solved;
		

	// }


	void	start(State*s = NULL) {


		if(!s)
			this->m_root = new Search_Node( this->problem().init(), no_op, NULL );	
		else
			this->m_root = new Search_Node( s, no_op, NULL );
	}

	void                    set_bound( float b ) {m_max_bound  = b;}
 
	unsigned                expanded(){ return m_expanded; }
	unsigned                generated(){ return m_generated; }
	unsigned		sum_pruned_by_bound() const		{ return m_pruned_sum_B_count; }
	float                   avg_B() const { return (float)(m_sum_B_count) / m_iw_calls; }
	unsigned                max_B() const { return m_max_B_count; }
	unsigned		max_bound( ) { return m_max_bound; }
	unsigned                backtracks() { return m_backtracks; }
	const Search_Model&	problem() const	{ return m_problem; }
	
	
protected:	       
	const Search_Model&	m_problem;
	unsigned		m_pruned_sum_B_count;
	unsigned		m_sum_B_count;
	unsigned		m_max_B_count;
	unsigned		m_iw_calls;
	unsigned                m_expanded;
	unsigned                m_generated;
	Landmarks_Graph*        m_goal_agenda;
	float   		m_max_bound;
	unsigned                m_backtracks;
	Search_Node*		m_root;
	Serialized_Search<Search_Model, Search_Strategy, Search_Node> m_iw_engine;


};

}

}
		
}



#endif // siw.hxx
