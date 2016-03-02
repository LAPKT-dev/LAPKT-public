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
#include <aptk/resources_control.hxx>
#include <strips_state.hxx>
#include <types.hxx>
#include <action.hxx>
#include <fluent.hxx>
#include <queue>
#include <aptk/bit_array.hxx>
#include <vector>

namespace aptk {

namespace agnostic {


enum class FF_RP_Cost_Function { Ignore_Costs, Use_Costs};
template < typename Primary_Heuristic, typename Cost_Type = float, FF_RP_Cost_Function cost_opt = FF_RP_Cost_Function::Use_Costs >
class FF_Relaxed_Plan_Extractor
{
	class Goal_Node {
	public:
		
		Goal_Node( unsigned p, Cost_Type h )
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
		Cost_Type	m_h;
	
	};

	typedef std::priority_queue<Goal_Node>				Goal_Queue;
	typedef typename STRIPS_Problem::Best_Supporter  		Best_Supporter;
public:

	FF_Relaxed_Plan_Extractor( const STRIPS_Problem& prob, Primary_Heuristic& h )
		: m_base_heuristic(h), m_strips_model( prob ), m_ignore_rp_h_value(false), m_one_ha_per_fluent(false) {
		m_init_fluents.resize( m_strips_model.num_fluents() );
		m_po_set.resize( m_strips_model.num_actions() );
		m_rp_precs.resize( m_strips_model.num_fluents() );
		m_rp_goals.resize( m_strips_model.num_fluents() );
	}

	virtual ~FF_Relaxed_Plan_Extractor() {}


  	virtual void compute( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>* copy_rel_plan = NULL, Fluent_Vec* goals = NULL ) {
		m_deletes_goal = false;
		//float t0 = time_used();
		m_base_heuristic.eval( s, h_val );		
		//float tf = time_used();
		//std::cout << tf - t0 << std::endl;
		if ( h_val == std::numeric_limits<Cost_Type>::max() )
			return;

		// 0. Initialize data structures
		init_fluents().reset();

		for ( unsigned k = 0; k < s.fluent_vec().size(); k++ )
			init_fluents().set( s.fluent_vec()[k] );
	
		std::vector< Best_Supporter > 	relaxed_plan;
		std::vector< Cost_Type >		rp_level;
		const Fluent_Vec& G = goals ? *goals : m_strips_model.goal();

		m_rp_precs.reset();
		m_rp_goals.reset();

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
			m_rp_goals.set(g);
		}

		if(!m_ignore_rp_h_value)
			h_val = 0.0f;

		while ( !m_goal_queue.empty() ) {
			Goal_Node n = m_goal_queue.top();
			m_goal_queue.pop();
			auto rp_entry = m_base_heuristic.get_best_supporter( n.m_fluent );
			if ( rp_entry.act_idx == no_such_index ) // No best supporter for fluent
			{
				if(n.m_h > 0){
					std::cerr << "No best supporter (neither START) found for goal fluent ";
					std::cerr << m_strips_model.fluents()[n.m_fluent]->signature() << std::endl;
				}
				
				return;
			}
			const Action* sup = m_strips_model.actions()[ rp_entry.act_idx ];
			#ifdef DEBUG_RP_HEURISTIC
			std::cout << "Goal: " << m_strips_model.fluents()[n.m_fluent]->signature() << std::endl;
			std::cout << "\t h = " << m_base_heuristic.value( n.m_fluent ) << std::endl;
			std::cout << "\t Best supporter = " << sup->signature() << std::endl;
			std::cout << "\t Effect = " << rp_entry.eff_idx << std::endl;
			#endif

			//if ( std::find( relaxed_plan.begin(), relaxed_plan.end(), rp_entry ) != relaxed_plan.end() ) continue;
			bool duplicate = false;
			if ( rp_entry.eff_idx == no_such_index ) {
				for ( unsigned k = 0 ; k < relaxed_plan.size(); k++ ) {
					if ( relaxed_plan[k].act_idx == rp_entry.act_idx ) {
						duplicate = true;
						break;
					}
				}
			} else {
				for ( unsigned k = 0 ; k < relaxed_plan.size(); k++ ) {
					if ( relaxed_plan[k].act_idx == rp_entry.act_idx ) {
						if ( rp_level[k] == n.m_h ) {
							duplicate = true;
							break;
						}
					}
				}
			}
			if ( duplicate )
				continue;
			// Check goal deletion
			for ( auto g : G ) {
				if ( rp_entry.eff_idx == no_such_index ) {
					if ( sup->del_set().isset( g ) ) {
						m_deletes_goal = true;
						break;
					}
				}
				else {
					if ( sup->ceff_vec()[rp_entry.eff_idx]->del_set().isset( g ) 
						|| sup->del_set().isset(g) ) {
						m_deletes_goal = true;
						break;
					}
				}
			}

			relaxed_plan.push_back( rp_entry );
			rp_level.push_back( n.m_h );
			

			if(!m_ignore_rp_h_value)
				h_val += ( cost_opt == FF_RP_Cost_Function::Ignore_Costs ? 1.0f : sup->cost() );

			// Add preconditions to relaxed plan
			bool all_initially_true = true;
			for ( auto g : sup->prec_vec() ) {
				if ( !init_fluents().isset( g ) ) {
					all_initially_true = false;
					m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
					m_rp_goals.set(g);
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
			if ( rp_entry.eff_idx != no_such_index ) {
				for ( auto g : sup->ceff_vec()[rp_entry.eff_idx]->prec_vec() ) {
					if ( !init_fluents().isset( g ) ) {
						all_initially_true = false;
						m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
						m_rp_goals.set(g);
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
				copy_rel_plan->push_back( relaxed_plan[i].act_idx );

		#ifdef DEBUG	
		std::cout << std::endl << "Rel Plan: " << std::endl;
		for ( unsigned k = 0; k < relaxed_plan.size(); k++ ) {
			std::cout << "\t "<< k <<": " << m_strips_model.actions()[relaxed_plan[k].act_idx]->signature() << std::endl;
		}
		#endif
	
		std::vector< aptk::Action_Idx > app_set;
		m_strips_model.applicable_actions_v2( s, app_set );
		m_po_set.reset();	
		
		std::vector<unsigned> unordered_pref_ops;
		std::vector<unsigned> po_dels;
	
		for (unsigned i = 0; i < app_set.size(); ++i) {
			const Action& act = *(m_strips_model.actions()[app_set[i]]);
	
			for ( auto a_p : act.add_vec() ) {
				if ( !m_rp_precs.isset( a_p ) ) continue;
				if ( m_po_set.isset( act.index() ) && one_HA_per_fluent() ) continue;
				if ( !m_po_set.isset( act.index() ) ) {
					unordered_pref_ops.push_back( act.index() );
					po_dels.push_back(0);
					m_po_set.set( act.index() );
				}
				m_rp_precs.unset(a_p);
			}

			for ( unsigned k = 0; k < act.ceff_vec().size(); k++ ) {
				if ( !s.entails( act.ceff_vec()[k]->prec_vec() ) ) continue;
				for ( auto a_p : act.ceff_vec()[k]->add_vec() ) {
					if ( !m_rp_precs.isset( a_p ) ) continue;
					if ( m_po_set.isset( act.index() ) && one_HA_per_fluent() ) continue;
					if ( !m_po_set.isset( act.index() ) ) {
						unordered_pref_ops.push_back( act.index() );
						po_dels.push_back(0);
						m_po_set.set( act.index() );
					}
					m_rp_precs.unset( a_p );
				}
			} 
		}

		unsigned processed_index = 0;
		pref_ops.resize( unordered_pref_ops.size() );

		for ( int i = unordered_pref_ops.size() - 1; i >= 0; i-- ) {

			unsigned d = 0;
			
			const Action* a = m_strips_model.actions()[pref_ops[i]];
			
			for ( auto p : a->del_vec() )
				if ( m_rp_goals.isset(p) ) d++;

			for ( unsigned k = 0; k < a->ceff_vec().size(); k++ ) {
				if ( !s.entails( a->ceff_vec()[k]->prec_vec() ) ) continue;
				for ( auto p : a->ceff_vec()[k]->del_vec() )
					if ( m_rp_goals.isset(p) ) d++;
			}
			
			unsigned j;
			for (j = 0; j < processed_index; j++ )
				if ( po_dels[j] > d ) break;
			for ( unsigned k = processed_index; k > j; k-- ) {
				pref_ops[k] = pref_ops[k-1];
				po_dels[k] = po_dels[k-1];	
			}
			
			pref_ops[j] = unordered_pref_ops[i];
			po_dels[j] = d;
			processed_index++;
		}
	}

	void ignore_rp_h_value(bool b) {m_ignore_rp_h_value = b;}
	void set_one_HA_per_fluent( bool b ) { m_one_ha_per_fluent = b; }
	bool one_HA_per_fluent() const { return m_one_ha_per_fluent; }
	Primary_Heuristic& base_h() { return m_base_heuristic; }

	bool deletes_goal() const { return m_deletes_goal; }

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
	bool				m_deletes_goal;
	Bit_Set				m_rp_goals;
};

template < typename Search_Model, typename Primary_Heuristic, typename Cost_Type = float, FF_RP_Cost_Function cost_opt = FF_RP_Cost_Function::Use_Costs >
class FF_Relaxed_Plan_Heuristic : public Heuristic<State>
{
public:

	FF_Relaxed_Plan_Heuristic( const Search_Model& prob )
	: Heuristic<State>(prob), m_base_heuristic(prob), m_plan_extractor( prob.task(), m_base_heuristic ) {

	}

	virtual ~FF_Relaxed_Plan_Heuristic() {}
	
	template <typename Search_Node>
        void eval( const Search_Node* n, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops) {
		eval(n->state(), h_val, pref_ops);				
	}

	
	template <typename Search_Node>
        void eval( const Search_Node* n, Cost_Type& h_val ) {
		
		eval(n->state(),h_val);
	}

	virtual void eval( const Fluent_Vec& s, Cost_Type& h_val ) {
		m_plan_extractor.base_h().eval( s, h_val );
	}

	virtual void eval( const State& s, Cost_Type& h_val ) {
		std::vector<Action_Idx> po;
		eval( s, h_val, po );
	}
	
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops ) {
		m_plan_extractor.compute( s, h_val, pref_ops );
	}
  
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan ) {
		m_plan_extractor.compute( s, h_val, pref_ops, &rel_plan );
	}
		
	  virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, Fluent_Vec* goals ) {
		  m_plan_extractor.compute( s, h_val, pref_ops, NULL, goals );
	}
  
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan, Fluent_Vec* goals ) {
		m_plan_extractor.compute( s, h_val, pref_ops, &rel_plan, goals );
	}
	
	void ignore_rp_h_value(bool b) {m_plan_extractor.ignore_rp_h_value(b);}

	void set_one_HA_per_fluent( bool b ) { m_plan_extractor.set_one_HA_per_fluent(b); }

	bool deletes_goal( ) const	{ return m_plan_extractor.deletes_goal(); }

protected:

	Primary_Heuristic							m_base_heuristic;
	FF_Relaxed_Plan_Extractor< Primary_Heuristic, Cost_Type, cost_opt >	m_plan_extractor;
};

}

}

#endif // rp_heuristic.hxx
