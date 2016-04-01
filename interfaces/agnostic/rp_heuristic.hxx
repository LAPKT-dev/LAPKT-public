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

#ifndef __RP_HEURISTIC__
#define __RP_HEURISTIC__

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

enum class RP_Cost_Function { Ignore_Costs, Use_Costs};
template < typename Primary_Heuristic, RP_Cost_Function cost_opt = RP_Cost_Function::Use_Costs >
class Relaxed_Plan_Extractor
{
	typedef std::queue<const Action* >	Action_Queue;
	typedef std::queue< const Fluent* >	Fluent_Queue;
public:

	Relaxed_Plan_Extractor( const STRIPS_Problem& prob, Primary_Heuristic& h )
		: m_base_heuristic(h), m_strips_model( prob ), m_ignore_rp_h_value(false), m_one_ha_per_fluent(false) {
		m_act_seen.resize( m_strips_model.num_actions() );
		m_init_fluents.resize( m_strips_model.num_fluents() );
		m_po_set.resize( m_strips_model.num_actions() );
		m_rp_precs.resize( m_strips_model.num_fluents() );

	}

	virtual ~Relaxed_Plan_Extractor() {}

	
	void	set_one_HA_per_fluent( bool v) { m_one_ha_per_fluent = v; }
	bool	one_HA_per_fluent() const { return m_one_ha_per_fluent; }

	bool	is_relaxed_plan_relevant( unsigned p ) const {
		return m_rp_precs.isset(p);
	}

  	virtual void 
	compute( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>* copy_rel_plan = NULL, Fluent_Vec* goals = NULL ) {

		m_base_heuristic.eval( s, h_val );
		if ( h_val == infty )
			return;

		// 0. Initialize data structures
		actions_seen().reset();
		init_fluents().reset();

		for ( unsigned k = 0; k < s.fluent_vec().size(); k++ )
			init_fluents().set( s.fluent_vec()[k] );
	
		while ( !actions_pending().empty() )
			actions_pending().pop();
	
		std::vector<const Action*> relaxed_plan;
		const Fluent_Vec& G = goals ? *goals : m_strips_model.goal();
	
		// 1. Add to the pending queue best supporters for goal fluents
		for ( unsigned k = 0; k < G.size(); k++ ) {
	
			if ( init_fluents().isset( G[k] ) ) continue;
			const unsigned act_idx = m_base_heuristic.get_best_supporter( G[k] ).act_idx;
			if ( act_idx == no_such_index ) // No best supporter for fluent
			{
				std::cerr << "No best supporter found for goal fluent ";
				std::cerr << m_strips_model.fluents()[G[k]]->signature() << std::endl;
				return;
			}
			const Action* sup = m_strips_model.actions()[ act_idx ];
			#ifdef DEBUG_RP_HEURISTIC
			std::cout << "Goal: " << m_strips_model.fluents()[G[k]]->signature() << std::endl;
			std::cout << "Value = " << m_base_heuristic.value( G[k] ) << std::endl;
			std::cout << "Best supporter: " << sup->signature() << std::endl;
			#endif
			fluents_pending().push( m_strips_model.fluents()[G[k]] );
			actions_pending().push( sup );
			actions_seen().set( sup->index() );
			relaxed_plan.push_back( sup );

		}	
	
		m_rp_precs.reset();
		while ( !actions_pending().empty() ) {
			const Action* a = actions_pending().front();
			const Fluent* p = fluents_pending().front();
			actions_pending().pop();
			fluents_pending().pop();
			#ifdef DEBUG_RP_HEURISTIC
			std::cout << "Getting action: " << std::endl;
			a->print( m_strips_model, std::cout );
			std::cout << "into the relaxed plan" << std::endl;
			#endif
			if ( a->asserts( p->index() ) ) { // fluent asserted by action main effect
				for ( auto q : a->prec_vec() )
					m_rp_precs.set(q);
				if ( !extract_best_supporters_for( a->prec_vec(), relaxed_plan ) ) {
					h_val = infty;
					assert( false );
					return;
				}
				continue;
			}
			float min_cond_h = infty;
			//unsigned best_eff_index = no_such_index;
			Fluent_Vec tmp_cond;
			for ( unsigned k = 0; k < a->ceff_vec().size(); k++ ) {
				if ( !a->ceff_vec()[k]->asserts( p->index() ) ) continue;	
				float h_cond;
				m_base_heuristic.eval( a->ceff_vec()[k]->prec_vec(), h_cond );
				if ( h_cond < min_cond_h ) {
					min_cond_h = h_cond;
					//best_eff_index = k;
					tmp_cond = a->ceff_vec()[k]->prec_vec();
					for ( auto p : a->prec_vec() )
						tmp_cond.push_back( p );
				}
			}
			//assert( best_eff_index != no_such_index );
			for ( auto q : tmp_cond )
				m_rp_precs.set(q);
			if ( !extract_best_supporters_for( tmp_cond, relaxed_plan ) )
			{
				h_val = infty;
				assert( false );
				return;
			}			
		}

		if(copy_rel_plan) 
			for(unsigned i = 0; i < relaxed_plan.size(); i++)
				copy_rel_plan->push_back( relaxed_plan[i]->index() );

		if(!m_ignore_rp_h_value)
			h_val = 0.0f;
	
		
		for ( unsigned k = 0; k < G.size(); k++ ) 
			//if ( !init_fluents().isset( G[k] ) )
				m_rp_precs.set(G[k]);
	
		#ifdef DEBUG_RP_HEURISTIC	
		std::cout << "\nRel Plan: ";
		#endif
		for ( unsigned k = 0; k < relaxed_plan.size(); k++ ) {
			if(!m_ignore_rp_h_value)
				h_val += ( cost_opt == RP_Cost_Function::Ignore_Costs ? 1.0f : relaxed_plan[k]->cost() );
			//const Fluent_Vec& precs = relaxed_plan[k]->prec_vec();
			#ifdef DEBUG_RP_HEURISTIC
			std::cout << "\t "<< k <<": " << relaxed_plan[k]->signature() << std::endl;
			#endif
		}
	
		std::vector< aptk::Action_Idx > app_set;
		m_strips_model.applicable_actions_v2( s, app_set );
		
		for (unsigned i = 0; i < app_set.size(); ++i) {
		//Successor_Generator::Iterator it( s, m_strips_model.successor_generator().nodes() );
		//int a = it.first();
		//while ( a != -1 ) {
			bool is_helpful = false;
			const Action& act = *(m_strips_model.actions()[app_set[i]]);
			for ( Fluent_Vec::const_iterator it2 = act.add_vec().begin();
				it2 != act.add_vec().end(); it2++ )
				if ( m_rp_precs.isset( *it2 ) ) {
					pref_ops.push_back( act.index() );
					is_helpful = true;
					//std::cout << "\t PO: " << m_strips_model.actions()[ act.index() ]->signature() << std::endl;
					//Uncomment if just 1 pref op is preferred
					if ( one_HA_per_fluent() ) 
						m_rp_precs.unset(*it2);
					break;
				}
			if ( is_helpful ) continue;	
			// Check conditional effects
			for ( auto ceff : act.ceff_vec() ) {
				if ( !s.entails( ceff->prec_vec() ) ) continue;
				for ( auto p : ceff->add_vec() ) {
					if ( m_rp_precs.isset( p ) ) {
						pref_ops.push_back( act.index() );
						is_helpful = true;
						if ( one_HA_per_fluent() )
							m_rp_precs.unset( p );
						break;
					}
				}
				if ( is_helpful ) break;
			}

			//a = it.next();
		}
	
	}

	void ignore_rp_h_value(bool b) {m_ignore_rp_h_value = b;}

protected:

	Bit_Array&		actions_seen() { return m_act_seen; }
	Action_Queue&		actions_pending() { return m_pending; }
	Fluent_Queue&		fluents_pending() { return m_pending_fluents; }
	Bit_Array&		init_fluents() { return m_init_fluents; }

	bool	extract_best_supporters_for( const Fluent_Vec& C, std::vector<const Action*>& relaxed_plan ) {
		for ( unsigned k = 0; k < C.size(); k++ ) {
	
			if ( init_fluents().isset( C[k] ) ) continue;
			const unsigned act_idx = m_base_heuristic.get_best_supporter( C[k] ).act_idx;
			
			if ( act_idx == no_such_index )
			{
				std::cerr << "No best supporter found for fluent ";
				std::cerr << m_strips_model.fluents()[C[k]]->signature() << std::endl;
				std::cerr << "Value = " << m_base_heuristic.value( C[k] ) << std::endl;
				exit(1);
				return false;
			}
			const Action* sup = m_strips_model.actions()[ act_idx ];
			if ( actions_seen().isset( sup->index() ) ) continue;
			fluents_pending().push( m_strips_model.fluents()[C[k]] );
			actions_pending().push( sup );
			actions_seen().set( sup->index() );
			relaxed_plan.push_back( sup );
		} 
		return true;
	}


protected:

	
	Primary_Heuristic&		m_base_heuristic;
	Bit_Array			m_act_seen;
	Bit_Array			m_init_fluents;
	Action_Queue			m_pending;
	Fluent_Queue			m_pending_fluents;
	const STRIPS_Problem&		m_strips_model;
	Bit_Set				m_po_set;
	Bit_Set				m_rp_precs;
	bool                            m_ignore_rp_h_value;
	bool				m_one_ha_per_fluent;
};

template < typename Search_Model, typename Primary_Heuristic, RP_Cost_Function cost_opt = RP_Cost_Function::Use_Costs >
class Relaxed_Plan_Heuristic : public Heuristic<State>
{
public:

	Relaxed_Plan_Heuristic( const Search_Model& prob )
	: Heuristic<State>(prob), m_base_heuristic(prob), m_plan_extractor( prob.task(), m_base_heuristic ) {

	}

	virtual ~Relaxed_Plan_Heuristic() {}

	template <typename Search_Node, typename Cost_Type>
        void eval( const Search_Node* n, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops) {
		eval(n->state(), h_val, pref_ops);				
	}

	
	template <typename Search_Node, typename Cost_Type>
        void eval( const Search_Node* n, Cost_Type& h_val ) {
		
		eval(n->state(),h_val);
	}
	
	template <typename Cost_Type>
	void eval( const State& s, Cost_Type& h_out ) {
		float h;
		std::vector<Action_Idx> po;
		eval( s, h, po);
		h_out = h == infty ? std::numeric_limits<Cost_Type>::max() : (Cost_Type)h;
		
	}

	
	template <typename Cost_Type>
	void eval( const State& s, Cost_Type& h_out, std::vector<Action_Idx>& pref_ops ) {
		float h;
		m_plan_extractor.compute( s, h, pref_ops );
		h_out = h == infty ? std::numeric_limits<Cost_Type>::max() : (Cost_Type)h;
	}

	template <typename Cost_Type>
	void eval( const State& s, Cost_Type& h_out, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan ) {
		float h;
		m_plan_extractor.compute( s, h, pref_ops, &rel_plan );		
		h_out = h == infty ? std::numeric_limits<Cost_Type>::max() : (Cost_Type)h;
	}

  	template <typename Cost_Type>
	void eval( const State& s, Cost_Type& h_out, std::vector<Action_Idx>& pref_ops, Fluent_Vec* goals ) {
		float h;
		m_plan_extractor.compute( s, h, pref_ops, NULL, goals );		
		h_out = h == infty ? std::numeric_limits<Cost_Type>::max() : (Cost_Type)h;
	}		

    	template <typename Cost_Type>
	void eval( const State& s, Cost_Type& h_out, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan, Fluent_Vec* goals ) {
		float h;
		m_plan_extractor.compute( s, h, pref_ops, &rel_plan, goals );		
		h_out = h == infty ? std::numeric_limits<Cost_Type>::max() : (Cost_Type)h;
	}		
	
	void ignore_rp_h_value(bool b) {m_plan_extractor.ignore_rp_h_value(b);}

	void set_one_HA_per_fluent( bool b ) { m_plan_extractor.set_one_HA_per_fluent(b); }
	
	bool is_relaxed_plan_relevant( unsigned p ) { return m_plan_extractor.is_relaxed_plan_relevant(p); }

protected:

	Primary_Heuristic					m_base_heuristic;
	Relaxed_Plan_Extractor< Primary_Heuristic, cost_opt >	m_plan_extractor;
};

}

}

#endif // rp_heuristic.hxx
