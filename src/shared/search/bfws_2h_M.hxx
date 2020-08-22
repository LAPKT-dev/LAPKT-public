/*
Lightweight Automated Planning Toolkit
Copyright (C) 2013
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

#ifndef __SINGLE_QUEUE_DOUBLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH_EXP_M__
#define __SINGLE_QUEUE_DOUBLE_HEURISTIC_GREEDY_BEST_FIRST_SEARCH_EXP_M__

#include <search_prob.hxx>
#include <resources_control.hxx>
#include <closed_list.hxx>
#include <landmark_graph_manager.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <hash_table.hxx>

#include "bfws_2h.hxx"

namespace aptk {

namespace search {

namespace bfws_2h{



template <typename Search_Model, typename First_Heuristic, typename Second_Heuristic, typename Relevant_Fluents_Heuristic, typename Open_List_Type >
class BFWS_2H_M : public BFWS_2H<Search_Model, First_Heuristic, Second_Heuristic, Relevant_Fluents_Heuristic, Open_List_Type >  {

public:

	typedef	        typename Search_Model::State_Type		        State;
	typedef  	typename Open_List_Type::Node_Type		        Search_Node;
	typedef 	Closed_List< Search_Node >			        Closed_List_Type;
	typedef         aptk::agnostic::Landmarks_Graph_Manager<Search_Model>   Landmarks_Graph_Manager;

	BFWS_2H_M( 	const Search_Model& search_problem, bool verbose ) 
		: BFWS_2H<Search_Model, First_Heuristic, Second_Heuristic, Relevant_Fluents_Heuristic, Open_List_Type >(search_problem, verbose), m_M(0) {	
	}

	virtual ~BFWS_2H_M() {
	}


	void    set_M( unsigned m ) { m_M = m;}
	
	virtual void 			process(  Search_Node *head ) {

		
#ifdef DEBUG
		if ( m_verbose ) {
			std::cout << "Expanding:" << std::endl;
			head->print(std::cout);
			std::cout << std::endl;
			head->state()->print( std::cout );
			std::cout << std::endl;
		}
#endif
	
		if(this->m_lgm)
			head->update_land_graph( this->m_lgm );
		
		std::vector< aptk::Action_Idx > app_set;
		this->problem().applicable_set_v2( *(head->state()), app_set );

		//Eval RP if needed for the expanded node
		this->eval_rp( head );

		for (unsigned i = 0; i < app_set.size(); ++i ) {
			int a = app_set[i];

			float a_cost = this->problem().cost( *(head->state()), a );

			if( head->gn() + a_cost > this->m_max_depth ) continue;

			State *succ = nullptr; 
						
			Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), a ), a, head, this->problem().num_actions()  );			
			
			#ifdef DEBUG
			if ( m_verbose ) {
				std::cout << "Successor:" << std::endl;
				n->print(std::cout);
				std::cout << std::endl;
				if(n->has_state())
				n->state()->print( std::cout );
				std::cout << std::endl;
			}
			#endif

			this->eval( n );
			if( n->relaxed_deadend() ){ //rel_plan infty
#ifdef DEBUG
				if ( m_verbose ) {
					std::cout << "h_add is infinite" << std::endl;
				}
#endif
				this->inc_dead_end();					
				delete n;
				continue;
			}
			if(this->m_use_rp)
				this->eval_relevant_fluents(n);
			
			if(this->m_use_novelty){
				this->eval_novel(n);
				if(this->m_use_novelty_pruning){					
					if( n->h1n() > this->m_max_novelty ){
						
						n->M()++;
						
						Search_Node* np = n;					    
						while( np->action()!= no_op){
							np->M()++;
							if( np->h1n() > this->m_max_novelty )
								np = np->parent();
							else
								break;
						}
						
						/**
						 * Allow M pruned nodes below a node with novelty < m_max_novelty
						 */
						if( np->M() > m_M ){
							
#ifdef DEBUG
							if ( m_verbose ) {
								std::cout << "h_add is infinite" << std::endl;
							}
#endif
							this->inc_dead_end();					
							delete n;
							continue;
						}
					}
				}
				
			}
								       
#ifdef DEBUG
			if ( m_verbose )
				std::cout << "Inserted into OPEN" << std::endl;
#endif
			this->open_node(n);	
				

		} 
		this->inc_eval();
	}

	unsigned      m_M;
};

}

}

}

#endif // bfws_2h_M.hxx
