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

#ifndef __FF_RP_HEURISTIC__
#define __FF_RP_HEURISTIC__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <types.hxx>
#include <action.hxx>
#include <fluent.hxx>
#include <queue>
#include <aptk/bit_array.hxx>
#include <vector>

namespace aptk {

namespace agnostic {

class Goal_Node {
public:
	
	Goal_Node( unsigned p, float h )
		: m_fluent(p), m_h(h) {
	}

	Goal_Node( Goal_Node&& other ) 
		: m_fluent( other.m_fluent ), m_h( other.m_h ) {
		
	}

	Goal_Node( const Goal_Node& other ) 
		: m_fluent( other.m_fluent ), m_h( other.m_h ) {
	}

	Goal_Node&	operator=( Goal_Node&& other ) {
		m_fluent = other.m_fluent;
		m_h = other.m_h;
		return *this;
	}

	bool	operator>( const Goal_Node& n ) const {
		return m_h > n.m_h;
	}

	bool	operator<( const Goal_Node& n ) const {
		return m_h < n.m_h;
	}

	unsigned 	m_fluent;
	float		m_h;

};

enum class FF_RP_Cost_Function { Ignore_Costs, Use_Costs};
template < typename Primary_Heuristic, RP_Cost_Function cost_opt = RP_Cost_Function::Use_Costs >
class FF_Relaxed_Plan_Extractor
{
	typedef std::priority_queue<Goal_Node>	Goal_Queue;
public:

	FF_Relaxed_Plan_Extractor( const STRIPS_Problem& prob, Primary_Heuristic& h )
		: m_base_heuristic(h), m_strips_model( prob ), m_ignore_rp_h_value(false), m_one_ha_per_fluent(false) {
		m_init_fluents.resize( m_strips_model.num_fluents() );
		m_po_set.resize( m_strips_model.num_actions() );
		m_rp_precs.resize( m_strips_model.num_fluents() );

	}

	virtual ~FF_Relaxed_Plan_Extractor() {}


  	virtual void compute( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>* copy_rel_plan = NULL, Fluent_Vec* goals = NULL ) {

		m_base_heuristic.eval( s, h_val );
		if ( h_val == infty )
			return;

		// 0. Initialize data structures
		init_fluents().reset();

		for ( unsigned k = 0; k < s.fluent_vec().size(); k++ )
			init_fluents().set( s.fluent_vec()[k] );
	
		std::vector<std::pair< const Action*, int> > relaxed_plan;
		const Fluent_Vec& G = goals ? *goals : m_strips_model.goal();

		m_rp_precs.reset();

		for ( auto g : G ) {
			if ( init_fluents().isset( g ) ) {
				#ifdef DEBUG_RP_HEURISTIC
				std::cout << "Goal: " << m_strips_model.fluents()[ g ]->signature() << std::endl;
				std::cout << "\th = " <<  m_base_heuristic.value( g ) << std::endl;
				std::cout << "Best supporter = (START)" << std::endl;
				#endif
				continue;
			}

			m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
		}

		if(!m_ignore_rp_h_value)
			h_val = 0.0f;

		while ( !m_goal_queue.empty() ) {
			Goal_Node n = m_goal_queue.top();
			m_goal_queue.pop();
			const Action* sup = m_base_heuristic.best_supporter( n.m_fluent );
			if ( sup == NULL ) // No best supporter for fluent
			{
				if(n.m_h > 0){
					std::cerr << "No best supporter found for goal fluent ";
					std::cerr << m_strips_model.fluents()[n.m_fluent]->signature() << std::endl;
				}
				return;
			}
			std::pair< const Action*, int > rp_entry;
			rp_entry.first = sup;
			if ( sup->asserts( n.m_fluent ) ) {
				rp_entry.second = -1;
			}		
			else {
				for ( unsigned k = 0; k < sup->ceff_vec().size(); k++ ) {
					if ( sup->ceff_vec()[k]->asserts( n.m_fluent ) ) {
						rp_entry.second = k;
						break;
					}
				}
			}	

			#ifdef DEBUG_RP_HEURISTIC
			std::cout << "Goal: " << m_strips_model.fluents()[n.m_fluent]->signature() << std::endl;
			std::cout << "\t h = " << m_base_heuristic.value( n.m_fluent ) << std::endl;
			std::cout << "\t Best supporter = " << sup->signature() << std::endl;
			std::cout << "\t Effect = " << rp_entry.second << std::endl;
			#endif

			if ( std::find( relaxed_plan.begin(), relaxed_plan.end(), rp_entry ) != relaxed_plan.end() ) continue;
			relaxed_plan.push_back( rp_entry );

			if(!m_ignore_rp_h_value)
				h_val += ( cost_opt == RP_Cost_Function::Ignore_Costs ? 1.0f : relaxed_plan.back().first->cost() );

			// Add preconditions to relaxed plan
			bool all_initially_true = true;
			for ( auto g : rp_entry.first->prec_vec() ) {
				if ( !init_fluents().isset( g ) ) {
					all_initially_true = false;
					m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
				}
				else {
					#ifdef DEBUG_RP_HEURISTIC
					std::cout << "Goal: " << m_strips_model.fluents()[ g ]->signature() << std::endl;
					std::cout << "\th = " <<  m_base_heuristic.value( g ) << std::endl;
					std::cout << "Best supporter = (START)" << std::endl;
					#endif
					continue;
				} 
			}
			if ( rp_entry.second >= 0 ) {
				for ( auto g : rp_entry.first->ceff_vec()[rp_entry.second]->prec_vec() ) {
					if ( !init_fluents().isset( g ) ) {
						all_initially_true = false;
						m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
					}
					else {
						#ifdef DEBUG_RP_HEURISTIC
						std::cout << "Goal: " << m_strips_model.fluents()[ g ]->signature() << std::endl;
						std::cout << "\th = " <<  m_base_heuristic.value( g ) << std::endl;
						std::cout << "Best supporter = (START)" << std::endl;
						#endif
						continue;
					} 
				}
			}
			if ( all_initially_true ) {
				m_rp_precs.set( n.m_fluent );
			}
		}

		if(copy_rel_plan) 
			for(unsigned i = 0; i < relaxed_plan.size(); i++)
				copy_rel_plan->push_back( relaxed_plan[i].first->index() );

		#ifdef DEBUG	
		std::cout << std::endl << "Rel Plan: " << std::endl;
		for ( unsigned k = 0; k < relaxed_plan.size(); k++ ) {
			std::cout << "\t "<< k <<": " << relaxed_plan[k].first->signature() << std::endl;
		}
		#endif
	
		std::vector< aptk::Action_Idx > app_set;
		m_strips_model.applicable_actions_v2( s, app_set );
		m_po_set.reset();	
	
		for (unsigned i = 0; i < app_set.size(); ++i) {
			const Action& act = *(m_strips_model.actions()[app_set[i]]);
	
			for ( auto a_p : act.add_vec() ) {
				if ( !m_rp_precs.isset( a_p ) ) continue;
				if ( m_po_set.isset( act.index() ) && one_HA_per_fluent() ) continue;
				if ( !m_po_set.isset( act.index() ) ) {
					pref_ops.push_back( act.index() );
					m_po_set.set( act.index() );
				}
				m_rp_precs.unset(a_p);
			}

			for ( unsigned k = 0; k < act.ceff_vec().size(); k++ ) {
				for ( auto a_p : act.ceff_vec()[k]->add_vec() ) {
					if ( !m_rp_precs.isset( a_p ) ) continue;
					if ( m_po_set.isset( act.index() ) && one_HA_per_fluent() ) continue;
					if ( !m_po_set.isset( act.index() ) ) {
						pref_ops.push_back( act.index() );
						m_po_set.set( act.index() );
					}

					pref_ops.push_back( act.index() );
					m_rp_precs.unset( a_p );
				}
			} 
		}
	
	}

	void ignore_rp_h_value(bool b) {m_ignore_rp_h_value = b;}
	void set_one_HA_per_fluent( ) { m_one_ha_per_fluent = true; }
	bool one_HA_per_fluent() const { return m_one_ha_per_fluent; }
	Primary_Heuristic& base_h() { return m_base_heuristic; }
protected:

	Bit_Array&		init_fluents() { return m_init_fluents; }


protected:

	
	Primary_Heuristic&		m_base_heuristic;
	Bit_Array			m_init_fluents;
	const STRIPS_Problem&		m_strips_model;
	Bit_Set				m_po_set;
	Bit_Set				m_rp_precs;
	bool                            m_ignore_rp_h_value;
	bool				m_one_ha_per_fluent;
	Goal_Queue			m_goal_queue;
};

template < typename Search_Model, typename Primary_Heuristic, RP_Cost_Function cost_opt = RP_Cost_Function::Use_Costs >
class FF_Relaxed_Plan_Heuristic : public Heuristic<State>
{
public:

	FF_Relaxed_Plan_Heuristic( const Search_Model& prob )
	: Heuristic<State>(prob), m_base_heuristic(prob), m_plan_extractor( prob.task(), m_base_heuristic ) {

	}

	virtual ~FF_Relaxed_Plan_Heuristic() {}
	
	virtual void eval( const Fluent_Vec& s, float& h_val ) {
		m_plan_extractor.base_h().eval( s, h_val );
	}

	virtual void eval( const State& s, float& h_val ) {
		std::vector<Action_Idx> po;
		eval( s, h_val, po );
	}
	
	virtual void eval( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops ) {
		m_plan_extractor.compute( s, h_val, pref_ops );
	}
  
	virtual void eval( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan ) {
		m_plan_extractor.compute( s, h_val, pref_ops, &rel_plan );
	}
		
	  virtual void eval( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops, Fluent_Vec* goals ) {
		  m_plan_extractor.compute( s, h_val, pref_ops, NULL, goals );
	}
  
	virtual void eval( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan, Fluent_Vec* goals ) {
		m_plan_extractor.compute( s, h_val, pref_ops, &rel_plan, goals );
	}
	
	void ignore_rp_h_value(bool b) {m_plan_extractor.ignore_rp_h_value(b);}

	void set_one_HA_per_fluent( bool b ) { m_plan_extractor.set_one_HA_per_fluent(b); }

protected:

	Primary_Heuristic						m_base_heuristic;
	FF_Relaxed_Plan_Extractor< Primary_Heuristic, cost_opt >	m_plan_extractor;
};

}

}

#endif // rp_heuristic.hxx
