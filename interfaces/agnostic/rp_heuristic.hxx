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

template < typename Search_Model, typename Primary_Heuristic >
class Relaxed_Plan_Heuristic : public Heuristic<State>
{
	typedef std::queue<const Action* >	Action_Queue;
public:

	Relaxed_Plan_Heuristic( const Search_Model& prob )
	: Heuristic<State>(prob), m_base_heuristic(prob), m_strips_model( prob.task() ) {
		m_act_seen.resize( m_strips_model.num_actions() );
		m_init_fluents.resize( m_strips_model.num_fluents() );
		m_po_set.resize( m_strips_model.num_actions() );
		m_rp_precs.resize( m_strips_model.num_fluents() );

	}

	virtual ~Relaxed_Plan_Heuristic() {}

	virtual void eval( const State& s, float& h_val ) {
		std::vector<Action_Idx> po;
		eval( s, h_val, po );
	}
	
	virtual void eval( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops );

protected:

	Bit_Array&		actions_seen() { return m_act_seen; }
	Action_Queue&		actions_pending() { return m_pending; }
	Bit_Array&		init_fluents() { return m_init_fluents; }

	bool			extract_best_supporters_for( const Fluent_Vec& C, std::vector<const Action*>& relaxed_plan );

protected:

	
	Primary_Heuristic		m_base_heuristic;
	Bit_Array			m_act_seen;
	Bit_Array			m_init_fluents;
	Action_Queue			m_pending;
	const STRIPS_Problem&		m_strips_model;
	Bit_Set				m_po_set;
	Bit_Set				m_rp_precs;

};

template <typename Search_Model, typename Primary_Heuristic>
bool	Relaxed_Plan_Heuristic<Search_Model, Primary_Heuristic>::extract_best_supporters_for( const Fluent_Vec& C, std::vector<const Action*>& relaxed_plan )
{
	for ( unsigned k = 0; k < C.size(); k++ ) {

		if ( init_fluents().isset( C[k] ) ) continue;
		const Action* sup = m_base_heuristic.best_supporter( C[k] );
		if ( sup == NULL )
		{
			std::cerr << "No best supporter found for fluent ";
			std::cerr << m_strips_model.fluents()[C[k]]->signature() << std::endl;
			return false;
		}
		if ( actions_seen().isset( sup->index() ) ) continue;
		actions_pending().push( sup );
		actions_seen().set( sup->index() );
		relaxed_plan.push_back( sup );
	} 
	return true;
}

template <typename Search_Model, typename Primary_Heuristic>
void Relaxed_Plan_Heuristic<Search_Model,Primary_Heuristic>::eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {

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
	const Fluent_Vec& G = m_strips_model.goal();

	// 1. Add to the pending queue best supporters for goal fluents
	for ( unsigned k = 0; k < G.size(); k++ ) {

		if ( init_fluents().isset( G[k] ) ) continue;
		const Action* sup = m_base_heuristic.best_supporter( G[k] );
		if ( sup == NULL ) // No best supporter for fluent
		{
			std::cerr << "No best supporter found for goal fluent ";
			std::cerr << m_strips_model.fluents()[G[k]]->signature() << std::endl;
			return;
		}
		actions_pending().push( sup );
		actions_seen().set( sup->index() );
		relaxed_plan.push_back( sup );
	}	

	while ( !actions_pending().empty() ) {
		const Action* a = actions_pending().front();
		actions_pending().pop();
		if ( !extract_best_supporters_for( a->prec_vec(), relaxed_plan ) ) {
			assert( false );
			return;
		}
		for ( unsigned k = 0; k < a->ceff_vec().size(); k++ ) {
			if ( !extract_best_supporters_for( a->ceff_vec()[ k ]->prec_vec(), relaxed_plan ) )
			{
				assert( false );
				return;
			}
		}
	}
	
	h_val = 0.0f;

	m_po_set.reset();
	m_rp_precs.reset();
	for ( unsigned k = 0; k < relaxed_plan.size(); k++ ) {
		h_val += relaxed_plan[k]->cost();
		if ( relaxed_plan[k]->can_be_applied_on( s ) ) {
			pref_ops.push_back( relaxed_plan[k]->index() );
			m_po_set.set( relaxed_plan[k]->index() );
			const Fluent_Vec& precs = relaxed_plan[k]->prec_vec();
			for ( Fluent_Vec::const_iterator it = precs.begin();
				it != precs.end(); it++ ) {
				m_rp_precs.set( *it );
			}
		}
		else {
			const Fluent_Vec& precs = relaxed_plan[k]->prec_vec();
			for ( Fluent_Vec::const_iterator it = precs.begin();
				it != precs.end(); it++ ) {
				if ( m_rp_precs.isset( *it ) ) continue;
				const std::vector<const Action*>& adding_acts = m_strips_model.actions_adding( *it );
				for ( unsigned i = 0; i < adding_acts.size(); i++ ) {
					const Action* act = adding_acts[i];
					if ( m_po_set.isset( act->index() ) ) continue;
					if ( !act->can_be_applied_on( s ) ) continue;
					m_po_set.set( act->index() );
				}
				m_rp_precs.set(*it);
			}
		}
	}	
	
}

}

}

#endif // rp_heuristic.hxx
