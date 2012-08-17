#ifndef __H_ADD__
#define __H_ADD__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <vector>
#include <deque>

namespace aptk {

namespace agnostic {

class H_Max_Evaluation_Function {

public:

	H_Max_Evaluation_Function( std::vector<float>& value_table ) 
	: m_values( value_table ) {
	}	

	float	operator()( Fluent_Vec::const_iterator begin, Fluent_Vec::const_iterator end ) const {
		float v = 0.0f;
		for ( Fluent_Vec::const_iterator it = begin; it != end; it++ ) {
			if ( m_values[*it] == infty ) {
				v = infty;
				break;
			}
			v = ( v < m_values[*it] ? m_values[*it] : v );
		}
		return v;	
	}

private:

	const std::vector<float>&	m_values;

};

class H_Add_Evaluation_Function {

public:
	H_Add_Evaluation_Function( std::vector<float>& value_table ) 
	: m_values( value_table ) {
	}	

	float	operator()( Fluent_Vec::const_iterator begin, Fluent_Vec::const_iterator end ) const {
		float v = 0.0f;
		for ( Fluent_Vec::const_iterator it = begin; it != end; it++ ) {
			if ( m_values[*it] == infty ) {
				v = infty;
				break;
			}
			v += m_values[*it];
		}
		return v;	
	}

private:

	const std::vector<float>&	m_values;

};


template <typename Search_Model, typename Fluent_Set_Eval_Func >
class H1_Heuristic : public Heuristic<State> {
public:

	H1_Heuristic( const Search_Model& prob ) 
	: Heuristic<State>( prob ), m_strips_model( prob.task() ), eval_func(m_values) {
		m_values.resize( m_strips_model.num_fluents() );
		m_best_supporters.resize(  m_strips_model.num_fluents() );
	}

	virtual ~H1_Heuristic() {
	}

	virtual void eval( const State& s, float& h_val ) {

		std::deque<unsigned> updated;
		initialize(s, updated);
		compute(updated);
		h_val = eval_func( m_strips_model.goal().begin(), m_strips_model.goal().end() );

	}

	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		eval( s, h_val );
	}

	const Action*	best_supporter( unsigned f ) const {
		return m_best_supporters[f];
	}

protected:

	void	initialize( const State& s, std::deque<unsigned>& updated ) 
	{
		for ( unsigned k = 0; k < m_strips_model.num_fluents(); k++ )
			m_values[k] = infty;

		for ( unsigned k = 0; k < m_strips_model.num_actions(); k++ ) {
			if ( !m_strips_model.actions()[k]->prec_vec().empty()  ) continue;
			const Action& a = *(m_strips_model.actions()[k]);
			float v = (float)a.cost();
			for ( Fluent_Vec::const_iterator it = a.add_vec().begin();
				it != a.add_vec().end(); it++ )
			{
				if ( v >= m_values[*it] ) continue;
				m_values[*it] = v;
				updated.push_back(*it);
			}
			// Conditional effects
			for ( unsigned j = 0; j < a.ceff_vec().size(); j++ )
			{
				const Conditional_Effect& ceff = *(a.ceff_vec()[j]);
				if ( !ceff.prec_vec().empty() ) continue;
				float v_eff = v;
				for ( Fluent_Vec::const_iterator it = ceff.add_vec().begin();
					it != ceff.add_vec().end(); it++ )
				{
					if ( v_eff >= m_values[*it] ) continue;
					m_values[*it] = v_eff;
					updated.push_back( *it );
				}
			}
		}
	
		for ( Fluent_Vec::const_iterator it = s.fluent_vec().begin(); 
			it != s.fluent_vec().end(); it++ )
		{
			m_values[*it] = 0.0f;
			updated.push_back( *it );
		}
	}

	void	compute( std::deque<unsigned>& updated ) 
	{
		while ( !updated.empty() ) {

			unsigned p = updated.front();
			//std::cout << p << ". " << m_strips_model.atoms[p]->name << " " << m_values[p] << std::endl;
			updated.pop_front();

			for ( unsigned i = 0; i < m_strips_model.num_actions(); i++ ) {
				const Action& a = *(m_strips_model.actions()[i]);
			
				bool relevant =  m_strips_model.actions()[i]->prec_set().isset(p);
				
				for ( unsigned j = 0; j < a.ceff_vec().size() && !relevant; j++ ) {
					const Conditional_Effect& ceff = *(a.ceff_vec()[j]);
					relevant = relevant || ceff.prec_set().isset(p);
				}
				
				if ( !relevant ) continue;

				float h_pre = eval_func( a.prec_vec().begin(), a.prec_vec().end() );

				if ( h_pre == infty ) continue;

				//std::cout << "Action " << i << ". " << m_strips_model.actions[i]->name << " relevant" << std::endl;

				float v = (float)a.cost() + h_pre;

				for ( Fluent_Vec::const_iterator it = a.add_vec().begin();
					it != a.add_vec().end(); it++ )
				{
					if ( v >= m_values[*it] ) continue;
					m_values[*it] = v;
					updated.push_back(*it);
					m_best_supporters[ *it ] = m_strips_model.actions()[i];
				}
				// Conditional effects
				for ( unsigned j = 0; j < a.ceff_vec().size(); j++ )
				{
					const Conditional_Effect& ceff = *(a.ceff_vec()[j]);
					float h_cond = eval_func( ceff.prec_vec().begin(), ceff.prec_vec().end() );
					if ( h_cond == infty ) continue;
					float v_eff = v + h_cond;
					for ( Fluent_Vec::const_iterator it = ceff.add_vec().begin();
						it != ceff.add_vec().end(); it++ )
					{
						if ( v_eff >= m_values[*it] ) continue;
						m_values[*it] = v_eff;
						updated.push_back( *it );
						m_best_supporters[ *it ] = m_strips_model.actions()[i];
					}
				}
			}
		}
	}
		
protected:

	const STRIPS_Problem&			m_strips_model;
	std::vector<float>			m_values;
	Fluent_Set_Eval_Func			eval_func;
	std::vector<const Action*>		m_best_supporters;
};

}

}

#endif // h_add.hxx
