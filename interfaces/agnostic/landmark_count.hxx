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

#ifndef __LANDMARK_COUNT__
#define __LANDMARK_COUNT__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <landmark_graph.hxx>
#include <landmark_graph_manager.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <action.hxx>

#include <stack>
#include <vector>
#include <deque>
#include <iosfwd>

namespace aptk {

namespace agnostic {

template <typename Search_Model >
class Landmarks_Count_Heuristic : public Heuristic<State> {
public:
	typedef         aptk::agnostic::Landmarks_Graph_Manager<Search_Model>   Landmarks_Graph_Manager;

	Landmarks_Count_Heuristic( const Search_Model& prob ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() ), m_max_value(0)
	{
		m_graph = NULL;
		m_lgm = NULL;
		m_in_leafs.resize( m_strips_model.num_fluents() );
	}

	Landmarks_Count_Heuristic( const Search_Model& prob, Landmarks_Graph* lg ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() )
	{
		m_graph = lg;
		m_in_leafs.resize( m_strips_model.num_fluents() );
	}

	virtual ~Landmarks_Count_Heuristic() {
		
	}


	void set_graph( Landmarks_Graph* lg ){ m_graph = lg; }

    /**
     * If manager is defined, landmark graph is recomputed at every node. 
     * If it's undefined, a land manager has to be used externally by the search algorithm to update
     * the state of the graph before counting
     */
	void set_graph_manager( Landmarks_Graph_Manager* lg ){ 
		m_lgm = lg;
		set_graph( m_lgm->graph() );
	}

	template <typename Search_Node>
	void update_graph( const Search_Node* n ){

		static std::stack<const Search_Node*> path;
		
		//NIR: recover path
		const Search_Node* tmp = n;
		while( tmp ){
			path.push( tmp );
			tmp = tmp->m_parent;
		}
		
		//NIR: reset graph
		m_lgm->reset_graph();
		
		while(!path.empty()){
			tmp = path.top();
			path.pop();
			
			//NIR: In the root state initialize the graph with the state information, otherwise use action
			if( ! tmp->m_parent )
				m_lgm->apply_state( tmp->state().fluent_vec() );
			else
				m_lgm->apply_action( &(tmp->state()), tmp->action() );
		}

	}
	
	
        template <typename Search_Node>
        void eval( const Search_Node* n, float& h_val, std::vector<Action_Idx>& pref_ops) {
		update_graph(n);
		unsigned h;
		eval(n->state(), h, pref_ops);
		h_val = h;
		
	}

	
        template <typename Search_Node>
        void eval( const Search_Node* n, float& h_val ) {
		
		update_graph(n);
		unsigned h;
		eval(n->state(),h);
		h_val = h;
	}
	
	void eval( const State& s, float& h_val ) {
		unsigned h;
		eval(s,h);
		h_val = h;
	}

	virtual void eval( const State& s, unsigned& h_val ) {
		if (!m_graph) return;
		h_val = 0;
		for ( std::vector< Landmarks_Graph::Node* >::const_iterator it = m_graph->nodes().begin(); it != m_graph->nodes().end(); it++ ) {
			Landmarks_Graph::Node*n = *it;
			if( ! n->is_consumed() ) {
					h_val++;
				
			}
	
			if( !n->required_by_gn().empty() ){
				for( std::vector< Landmarks_Graph::Node* >::const_iterator it_r = n->required_by_gn().begin(); it_r != n->required_by_gn().end(); it_r++ )
					if( ! (*it_r)->is_consumed_once() ){
						//std::cout << " "<< m_strips_model.fluents()[ n->fluent() ]->signature() << std::endl;							
						h_val++;			
					}
			}
								
		
			if( ! n->required_by().empty() ){
				for( std::vector< Landmarks_Graph::Node* >::const_iterator it_r = n->required_by().begin(); it_r != n->required_by().end(); it_r++ )
					if( ! (*it_r)->is_consumed() ){
						//std::cout << " "<< m_strips_model.fluents()[ n->fluent() ]->signature() << std::endl;							
						h_val++;
						//	break;
					}
			}



		}
	}


	void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		unsigned h;
		eval(s,h,pref_ops);
		h_val = h;
	}
	
	/**
	 * Graph should be updated already, otherwise use eval(Node,...)
	 */
	virtual void eval( const State& s, unsigned& h_val,  std::vector<Action_Idx>& pref_ops ) {		
		if (!m_graph) return;
		m_in_leafs.reset();

		h_val = 0;
		for ( std::vector< Landmarks_Graph::Node* >::const_iterator it = m_graph->nodes().begin(); it != m_graph->nodes().end(); it++ ) {
			
			Landmarks_Graph::Node*n = *it;
			if( ! n->is_consumed() ) {
				if( n->required_by().empty() ){
					//std::cout << " "<< m_strips_model.fluents()[ n->fluent() ]->signature() << std::endl;
					h_val++;
				}
				else
					//for( std::vector< Landmarks_Graph::Node* >::const_iterator it_r = n->required_by().begin(); it_r != n->required_by().end(); it_r++ )
					//if( ! (*it_r)->is_consumed() )
							h_val++;

				if(  n->are_precedences_consumed() )
					m_in_leafs.set( n->fluent() );
					
			}
		}

		std::vector< aptk::Action_Idx >	app_set;
		this->problem().applicable_set_v2( s, app_set );

		for ( unsigned i = 0; i < app_set.size(); i++ ) {
			int a = app_set[i];

			const Action& act = *(m_strips_model.actions()[a]);
			for ( Fluent_Vec::const_iterator it2 = act.add_vec().begin();
				it2 != act.add_vec().end(); it2++ )
				if ( m_in_leafs.isset( *it2 ) ) {
					pref_ops.push_back( act.index() );
					//m_in_leafs.unset(*it2); // Just one supporter for leaf landmark
					break;
				}
			
		}
	}
	
	unsigned max_value() const { return m_max_value; }
protected:

	void update_max_value(){
		m_max_value=0;
		for ( std::vector< Landmarks_Graph::Node* >::const_iterator it = m_graph->nodes().begin(); 
		      it != m_graph->nodes().end(); it++ ) {
			
			Landmarks_Graph::Node*n = *it;			
			m_max_value++;
			

			if( !n->required_by_gn().empty() )
				for( std::vector< Landmarks_Graph::Node* >::const_iterator it_r = n->required_by_gn().begin(); it_r != n->required_by_gn().end(); it_r++ )
					m_max_value++;
					
			

			if( ! n->required_by().empty() )
				for( std::vector< Landmarks_Graph::Node* >::const_iterator it_r = n->required_by().begin(); it_r != n->required_by().end(); it_r++ )
						m_max_value++;						
				

		}	
	}
	
protected:

	const STRIPS_Problem&			m_strips_model;
	Landmarks_Graph*			m_graph;
	Landmarks_Graph_Manager*                m_lgm;
	Bit_Set					m_in_leafs;
	unsigned                                m_max_value;
};

}

}

#endif // landmark_count.hxx
