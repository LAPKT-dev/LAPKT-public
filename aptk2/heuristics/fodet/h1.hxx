/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

Adapted for computing h1 heuristics for the all-outcomes determinization
Miquel Ramirez, 2013
*/

#pragma once

#include <vector>
#include <deque>
#include <fod_problem.hxx>
#include <gp_atoms.hxx>
#include <bit_set.hxx>
#include <ext_math.hxx>

namespace aptk {

namespace H1_detail {

	typedef		std::vector<float>	ValueTable;

}

class H_Max_Evaluation_Function {

public:

	H_Max_Evaluation_Function( H1_detail::ValueTable& value_table ) 
	: m_values( value_table ) {
	}

	float	operator()( const Clause& c, float v2 = 0.0f ) const {
		float v = v2;
		for ( Lit l : c ) {
			v = std::max( v, m_values[toInt(l)] );
			if ( v == infty ) return v;
		}
		return v;	
	}

private:

	const H1_detail::ValueTable&	m_values;

};

class H_Add_Evaluation_Function {

public:
	H_Add_Evaluation_Function( H1_detail::ValueTable& value_table ) 
	: m_values( value_table ) {
	}
	
	float	operator()( const Clause& c, float v2 = 0.0f ) const {
		float v = v2;
		for ( Lit l : c ) {
			if ( m_values[toInt(l)] == infty ) 
				return infty;
			v += m_values[toInt(l)];
		}
		return v;	
	}

private:

	const H1_detail::ValueTable&	m_values;

};

template <typename EvalFunc>
class	H1_Heuristic {
public:

	H1_Heuristic( const FOD_Problem& model )
	: m_model( model ), eval_func( m_values ) {

		m_values.resize( Clause::num_lits() );		
		m_already_updated.resize( Clause::num_lits() );
	}

	void	print( std::ostream& os ) const {
		for ( int i = 0; i < (int)m_values.size(); i++ ) {
			Lit p = toLit(i);
			Atom idx = atom( p );
			assert( idx < (int)m_model.n_atoms() );
			const FOD_Problem::Atom& a = *(m_model.atoms[idx]);
			if ( sign(p) )
				os << "(not " << a.name <<  ")";
			else
				os << a.name;
			os << " -> " << m_values[i] << std::endl;
		}
	}

	void	print( int i, std::ostream& os ) const {
		Lit p = toLit(i);
		Atom idx = atom( p );
		assert( idx < m_model.n_atoms() );
		const FOD_Problem::Atom& a = *(m_model.atoms[idx]);
		if ( sign(p) )
			os << "(not " << a.name <<  ")";
		else
			os << a.name;
		os << " -> " << m_values[i] << std::endl;
	}

	
	virtual ~H1_Heuristic() {
	}

	virtual	void	setup( ) {
		m_already_updated.reset();
		m_updated.clear();
		initialize( m_model.init );
		compute();
	}

	void	eval( const Clause& c, float& h_val ) {
		h_val = eval_func( c );
	}

	float	eval( const Clause& c ) {
		return eval_func( c );
	}

	float	full_eval( const Clause& s ) {
		m_already_updated.reset();
		m_updated.clear();
		initialize( s );
		compute();
		float h_G;
		eval( m_model.goal, h_G );
		return h_G;
	}
	
	float	full_eval( const Clause& I, const Clause& G ) {
		m_already_updated.reset();
		m_updated.clear();
		initialize( I );
		compute();
		float h_G;
		eval( G, h_G );
		return h_G;
	}

protected:

	void	update( int p, float v ) {
		assert( p >= 0 && p < (int)Clause::num_lits() );
		if ( aptk::dgeq(v, m_values[p]) ) return;
		m_values[p] = v;
		if (!m_already_updated.isset(p)) {
			m_updated.push_back( p );
			m_already_updated.set( p );
		}
	}

	void	set( int p, float v ) {
		assert( p >= 0 && p < (int)Clause::num_lits() );
		m_values[p] = v;
		if ( !m_already_updated.isset( p ) ) {
			m_updated.push_back( p );
			m_already_updated.set( p );
		}
	}

	void	initialize( const Clause& s ) {
		for ( int i = 0; i < (int)Clause::num_lits(); i++ )
			m_values[i] = infty;

		for ( auto act_ptr : m_model.actions ) {

			const FOD_Problem::Action& act = *act_ptr;

			if ( ! act.precondition.empty() ) continue;
			
			float v = act.cost;
		
			for ( auto eff : act.effects ) {
				if ( !eff.condition.empty() ) continue;
				for ( Lit l : eff.effect )
					update( toInt( l ), v );
			}
		}

		for ( Lit l : s )
			set( toInt( l ), 0.0f );
	}

	bool	relevant( Lit p, const FOD_Problem::Action& act ) {
		if ( act.precondition.entails(p) ) return true;
		for ( auto eff : act.effects )
			if( eff.condition.entails(p) ) return true;
		return false;
	}

	void	compute() {
		while ( !m_updated.empty() ) {
			int p = m_updated.front();
		
			m_updated.pop_front();
			m_already_updated.unset(p);

			for ( auto act_ptr : m_model.actions ) {

				const FOD_Problem::Action& act = *act_ptr;
				Lit lp = toLit( p );

				if ( !relevant( lp, act ) ) continue;
				
				//std::cout << "Action: " << *(act.name) << std::endl;
								
				float h_pre = eval_func( act.precondition );
				
				if ( h_pre == infty ) continue;	
			
				for ( auto eff : act.effects ) {
					float h_cond = eval_func( eff.condition, h_pre );
					if ( h_cond == infty ) continue;
					float v = h_cond + act.cost;
					for ( Lit l : eff.effect ) 
						update( toInt( l ), v );
				}	
			}
		}
	}

private:
	const FOD_Problem&	m_model;
	H1_detail::ValueTable	m_values;
	EvalFunc		eval_func;
	std::deque< int >	m_updated;
	Bit_Set			m_already_updated;
};

}
