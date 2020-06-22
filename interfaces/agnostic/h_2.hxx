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

#ifndef __H_2__
#define __H_2__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <aptk/bit_set.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <boost/circular_buffer.hpp>
#include <vector>
#include <list>
#include <iosfwd>

namespace aptk {

namespace agnostic {

namespace H2_Helper {
	
	inline int	pair_index( unsigned p, unsigned q ) {
		return ( p >= q ? p*(p+1)/2 + q : q*(q+1)/2 + p);
	}

}

enum class H2_Cost_Function { Zero_Costs, Unit_Costs, Use_Costs };

template <typename Search_Model, H2_Cost_Function cost_opt = H2_Cost_Function::Use_Costs >
class H2_Heuristic : public Heuristic<State> {

public:
	H2_Heuristic( const Search_Model& prob )
	: Heuristic<State>( prob ), m_strips_model( prob.task() ) {
		unsigned F = m_strips_model.num_fluents();
		m_values.resize( (F*F + F)/2 );
		m_op_values.resize( m_strips_model.num_actions() );
		m_interfering_ops.resize( F );
		for ( unsigned p = 0; p < m_interfering_ops.size(); p++ ) {
			m_interfering_ops[p] = new Bit_Set( m_strips_model.num_actions() );
			for ( unsigned op = 0; op < m_strips_model.num_actions(); op++ ) 	{
				const Action* op_ptr = m_strips_model.actions()[op];
				if ( op_ptr->add_set().isset( p ) || op_ptr->del_set().isset( p ) )
					m_interfering_ops[p]->set(op);
			}
		}	
		// NIR: Set up the relevant actions once here so we don't need
		//      to iterate through all of them when evaluating, similar to h1
		m_already_updated.resize( (F*F + F)/2 );
		m_updated.resize( (F*F + F)/2 );
		m_relevant_actions.resize( (F*F + F)/2 );

		for ( unsigned i = 0; i < m_strips_model.num_actions(); i++ ) {

			const Action& a = *(m_strips_model.actions()[i]);

			// Relevant if the fluent is in the precondition
			for ( unsigned p = 0; p < a.prec_vec().size(); ++p ) {
				for ( unsigned q = p; q < a.prec_vec().size(); ++q ) {
					
					m_relevant_actions[ H2_Helper::pair_index( a.prec_vec()[p], a.prec_vec()[q] ) ].insert(i);
				}
			}

			// Relevant if the fluent is in the head of a conditional effect
			for ( unsigned j = 0; j < a.ceff_vec().size(); ++j ) {

				const Conditional_Effect& ceff = *(a.ceff_vec()[j]);
				for ( unsigned p = 0; p < ceff.prec_vec().size(); ++p) {
					for ( unsigned q = p; q < ceff.prec_vec().size(); ++q) {
						m_relevant_actions[ H2_Helper::pair_index( ceff.prec_vec()[p], ceff.prec_vec()[q] ) ].insert(i);
					}
				}
			}
		}

	}

	virtual ~H2_Heuristic() {
	}
	
	template <typename Search_Node>
        void eval( const Search_Node* n, float& h_val, std::vector<Action_Idx>& pref_ops) {
		eval(n->state(), h_val, pref_ops);				
	}

	
        template <typename Search_Node>
        void eval( const Search_Node* n, float& h_val ) {
		
		eval(n->state(),h_val);
	}
	
	virtual	void	eval( const State& s, float& h_val ) {
		m_already_updated.reset();
		m_updated.clear();
		initialize( s );
		compute();
		h_val = eval( m_strips_model.goal() ); 
	}

	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		eval( s, h_val );
	}

	float&	op_value( unsigned a ) 		{ return m_op_values.at(a); }
	float   op_value( unsigned a ) const 	{ return m_op_values.at(a); }

	float& value( unsigned p, unsigned q ) 	{
		assert( H2_Helper::pair_index(p,q) < (int)m_values.size() );
		return m_values[H2_Helper::pair_index(p,q)];
	}

	float value( unsigned p, unsigned q ) const 	{
		assert( H2_Helper::pair_index(p,q) < (int)m_values.size() );
		return m_values[H2_Helper::pair_index(p,q)];
	}

	float& value( unsigned p ) 	{
		assert( H2_Helper::pair_index(p,p) < (int)m_values.size() );
		return m_values[H2_Helper::pair_index(p,p)];
	}

	float value( unsigned p ) const 	{
		assert( H2_Helper::pair_index(p,p) < (int)m_values.size() );
		return m_values[H2_Helper::pair_index(p,p)];
	}

	float eval( const Fluent_Vec& s ) const {
		float v = 0;
		for ( unsigned i = 0; i < s.size(); i++ )
			for ( unsigned j = i; j < s.size(); j++ ){			
				v = std::max( v, value( s[i], s[j] ) );		
				if(v == infty ) return infty;
			}

		return v;
	}

	bool  is_mutex( const Fluent_Vec& s ) const {
		return eval(s) == infty;
	}

	bool	is_mutex( unsigned p, unsigned q ) const {
		return value( p, q ) == infty;
	}

	float eval( const Fluent_Vec& s, unsigned p ) const {
		float v = 0;
		for ( unsigned k = 0; k < s.size(); k++ )
			v = std::max( v, value( s[k], p ) );
		float v2 = 0;
		for ( unsigned i = 0; i < s.size(); i++ )
			for ( unsigned j = i; j < s.size(); j++ )
				v2 = std::max( v2, value( s[i], s[j] ) );
		return std::max( v, v2 );
	}

	bool interferes( unsigned a, unsigned p ) const {
		return m_interfering_ops[p]->isset(a);
	}

	void print_values( std::ostream& os ) const {
		for ( unsigned p = 0; p < m_strips_model.fluents().size(); p++ )
			for ( unsigned q = p; q < m_strips_model.fluents().size(); q++ ) {
				os << "h²({ ";
				os << m_strips_model.fluents()[p]->signature();
				os << ", ";
				os << m_strips_model.fluents()[q]->signature();
				os << "}) = " << value(p,q) << std::endl;
			}		
	}

	void compute_mutexes_only( const State& s ){
		initialize( s );
		compute_mutexes_only();
		
#ifdef DEBUG
		print_values(std::cout);
#endif
	}

	void compute_edeletes( STRIPS_Problem& prob ){
		m_already_updated.reset();
		m_updated.clear();
		initialize( prob.init() );
		compute_mutexes_only();
		extract_edeletes( prob );

		
#ifdef DEBUG
		print_values(std::cout);
		prob.print_actions(std::cout);
#endif
	}

	void compute_edeletes_aij( STRIPS_Problem& prob ){
		compute_mutexes_only_aij();
		extract_edeletes( prob );

		
#ifdef DEBUG
		print_values(std::cout);
		prob.print_actions(std::cout);
#endif
	}


	void 	goal_mutex_closure( STRIPS_Problem& prob ){
		unsigned fsize = prob.num_fluents();
		Fluent_Vec new_goal;
		for( auto g : prob.goal()  )
			new_goal.push_back(g);

		for( unsigned f_idx = 0; f_idx != fsize; f_idx++ ){
			Fluent* p =  prob.fluents()[f_idx];

			if( ! prob.is_in_init( p->index() ) ) continue;

			for( auto g : prob.goal()  ){
				if( is_mutex(p->index(),g) ){ 
					unsigned notp_idx = STRIPS_Problem::add_fluent( prob,"not-"+p->signature());
					new_goal.push_back(notp_idx);

					for( auto const_a : prob.actions_adding( p->index() ) ){
						Action* a = prob.actions()[const_a->index()];
						a->del_vec().push_back(notp_idx);
						a->del_set().set( notp_idx );
						//prob.actions_deleting( notp_idx ).push_back( a );
					}
					for( auto const_a : prob.actions_deleting( p->index() ) ){
						Action* a = prob.actions()[const_a->index()];
						a->add_vec().push_back(notp_idx);
						a->add_set().set( notp_idx );
						//prob.actions_adding( notp_idx ).push_back( a );
					}
					
					
					break;
				}			       
			}
		}
		//STRIPS_Problem::set_goal( prob, new_goal );
		prob.make_action_tables(false);
		
	}

	void
	compute_mutexes_only_aij() {
		for ( unsigned k = 0; k < m_values.size(); k++ )
			m_values[k] = 0.0f;
		typedef std::pair< unsigned, unsigned > Fluent_Pair;
		typedef std::list< Fluent_Pair > Pair_List;
		Pair_List M;

		// M_A set: pairs p,q s.t. there is at least one a where Add(a) = p and Del(a) = q

		for ( auto a : m_strips_model.actions() ) 
			for ( auto p : a->add_vec() )
				for ( auto q : a->del_vec() ) {
					if ( value(p,q) == infty ) continue;
					M.push_back( Fluent_Pair(p,q) );
					value(p,q) = infty;
				}
		
		Pair_List M_B;
		// M_B set: 
		
		for ( auto P : M ) {
			for ( auto a : m_strips_model.actions() ) {
				unsigned p = P.first;
				unsigned q = P.second;
				if ( !a->asserts(p) ) continue;
				for ( auto r : a->prec_vec() ) {
					if ( value(r,q) == infty ) continue;
					M_B.push_back( Fluent_Pair(r,q) );
					value(r, q) = infty;
				}
			}
		}

		for ( auto P : M_B )
			M.push_back( P );


		bool changed;
	
		do {
			changed = false;
			
			Pair_List M2;

			for ( auto P : M ) {
				unsigned p = P.first;
				unsigned q = P.second;
				if ( m_strips_model.is_in_init( p ) && m_strips_model.is_in_init(q) ) {
					value(p,q) = 0.0f;
					changed = true;
					continue;
				} 

				bool needs_to_be_removed = false;
				for ( auto adding : m_strips_model.actions_adding( p ) ) {
					bool is_deleting = adding->retracts(q);
					bool is_not_adding = !adding->asserts(q);
					if ( !is_deleting && !is_not_adding ) {
						needs_to_be_removed = true;
						break;
					}
					bool r_q_in_M = false;
					for ( auto r : adding->prec_vec() ) {
						if ( value(r,q) == infty ) {
							r_q_in_M = true;
							break;
						}
					}
					if ( !r_q_in_M ) {
						needs_to_be_removed = true;
						break;
					}
				}
				if ( needs_to_be_removed ) {
					value(p,q) = 0.0f;
					changed = true;
				}
				else {
					M2.push_back( P );
				}
			}
			M = M2;
 
		} while (changed);

	}

protected:

	void extract_edeletes( STRIPS_Problem& prob ){
		for ( unsigned p = 0 ; p < m_strips_model.num_fluents(); p++ ){
			for ( unsigned a = 0; a < m_strips_model.num_actions(); a++ ){
				bool is_edelete = false;
				Action& action = *(prob.actions()[a]);

				for ( unsigned i = 0; i < action.add_vec().size(); i++ ){
					unsigned q = action.add_vec()[i];
					if ( value(p,q) == infty ){
						is_edelete = true;
						prob.actions()[a]->edel_vec().push_back( p );					
						prob.actions()[a]->edel_set().set( p );
						prob.actions_edeleting( p ).push_back( (const Action*) &action );
						break;
					}
				}

				if ( is_edelete ) continue;

				for ( unsigned i = 0; i < action.prec_vec().size(); i++ ){
					unsigned r = action.prec_vec()[i];
					if ( !action.add_set().isset(p) && value( p, r ) == infty ){
						prob.actions()[a]->edel_vec().push_back( p );
						prob.actions()[a]->edel_set().set( p );
						prob.actions_edeleting( p ).push_back( (const Action*) &action );
						break;
					}
				}

				if ( !action.edel_set().isset(p) && action.del_set().isset(p) ){
					prob.actions()[a]->edel_vec().push_back( p );
					prob.actions()[a]->edel_set().set( p );
					prob.actions_edeleting( p ).push_back( (const Action*) &action );
				}

			}
		}
	
	}

	void initialize_ceffs_and_emtpy_precs(){
		//conditional effects and empty precs
		for ( unsigned k = 0; k < m_strips_model.empty_prec_actions().size(); k++ ) {
			const Action& a = *(m_strips_model.empty_prec_actions()[k]);
			float v =  ( cost_opt == H2_Cost_Function::Unit_Costs ? 1.0f : 
					( cost_opt == H2_Cost_Function::Use_Costs ? (float)a.cost()  : 1.0f + (float)a.cost()) );
			
			for ( unsigned i = 0; i< a.add_vec().size(); i++ ){
				for ( unsigned j = i; i < a.add_vec().size(); j++ ){
					unsigned p = a.add_vec()[i];
					unsigned q = a.add_vec()[j];
					value(p,q) = v;
					
					int curr_idx = H2_Helper::pair_index(p,q);
					if ( !m_already_updated.isset( curr_idx ) ) {
						m_updated.push_back( curr_idx );
						m_already_updated.set( curr_idx );
					}
				}
			}

			// Conditional effects
			for ( unsigned j = 0; j < a.ceff_vec().size(); j++ )
			{
				const Conditional_Effect& ceff = *(a.ceff_vec()[j]);
				if ( !ceff.prec_vec().empty() ) continue;
				float v_eff = v;
				
				
				for ( unsigned i = 0; i< ceff.add_vec().size(); i++ ){
					for ( unsigned j = i; i < ceff.add_vec().size(); j++ ){
						unsigned p = ceff.add_vec()[i];
						unsigned q = ceff.add_vec()[j];
						value(p,q) = v_eff;
						
						int curr_idx = H2_Helper::pair_index(p,q);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}
					}
				}	
				
			}
		}
	}
	void initialize( const State& s ) {
		for ( unsigned k = 0; k < m_values.size(); k++ )
			m_values[k] = infty;
		for ( unsigned k = 0; k < m_op_values.size(); k++ )
			m_op_values[k] = infty;

		initialize_ceffs_and_emtpy_precs();

		for ( unsigned i = 0; i < s.fluent_vec().size(); i++ )
		{
			unsigned p = s.fluent_vec()[i];
			value(p,p) = 0.0f;

			int curr_idx = H2_Helper::pair_index(p,p);
			if ( !m_already_updated.isset( curr_idx ) ) {
				m_updated.push_back( curr_idx );
				m_already_updated.set( curr_idx );
			}

			for ( unsigned j = i+1; j < s.fluent_vec().size(); j++ )
			{
				unsigned q = s.fluent_vec()[j];
				value(p,q) = 0.0f;

				int curr_idx = H2_Helper::pair_index(p,q);
				if ( !m_already_updated.isset( curr_idx ) ) {
					m_updated.push_back( curr_idx );
					m_already_updated.set( curr_idx );
				}
			}
		}
	}

	void initialize( const Fluent_Vec& f ) {
		for ( unsigned k = 0; k < m_values.size(); k++ )
			m_values[k] = infty;
		for ( unsigned k = 0; k < m_op_values.size(); k++ )
			m_op_values[k] = infty;

		initialize_ceffs_and_emtpy_precs();

		for ( unsigned i = 0; i < f.size(); i++ )
		{
			unsigned p = f[i];
			value(p,p) = 0.0f;

			int curr_idx = H2_Helper::pair_index(p,p);
			if ( !m_already_updated.isset( curr_idx ) ) {
				m_updated.push_back( curr_idx );
				m_already_updated.set( curr_idx );
			}

			for ( unsigned j = i+1; j < f.size(); j++ )
			{
				unsigned q = f[j];
				value(p,q) = 0.0f;

				int curr_idx = H2_Helper::pair_index(p,q);
				if ( !m_already_updated.isset( curr_idx ) ) {
					m_updated.push_back( curr_idx );
					m_already_updated.set( curr_idx );
				}
			}
		}
	}

	void compute() {
		while ( !m_updated.empty() ) {

			unsigned p = m_updated.front();
			
			m_updated.pop_front();
			m_already_updated.unset(p);
	
			for ( std::set<unsigned>::iterator action_it = m_relevant_actions[p].begin(); action_it != m_relevant_actions[p].end(); ++action_it) {	

				const Action& action = *(m_strips_model.actions()[*action_it]);
				unsigned a = action.index();

				op_value(a) = eval( action.prec_vec() );
				if ( op_value(a) == infty ) continue;
				
				for ( unsigned i = 0; i < action.add_vec().size(); i++ ) {
					unsigned p = action.add_vec()[i];
					for ( unsigned j = i; j < action.add_vec().size(); j++ ) {
						unsigned q = action.add_vec()[j];
						float curr_value = value(p,q);
						if ( curr_value == 0.0f ) continue;
						float v = op_value(a);
						if ( cost_opt == H2_Cost_Function::Unit_Costs ) v += 1.0f;
						if ( cost_opt == H2_Cost_Function::Use_Costs ) v += action.cost();
						if ( v < curr_value ) {
							value(p,q) = v;
							int curr_idx = H2_Helper::pair_index(p,q);
							if ( !m_already_updated.isset( curr_idx ) ) {
								m_updated.push_back( curr_idx );
								m_already_updated.set( curr_idx );
							}
							curr_idx = H2_Helper::pair_index(p,p);
							if ( !m_already_updated.isset( curr_idx ) ) {
								m_updated.push_back( curr_idx );
								m_already_updated.set( curr_idx );
							}
							curr_idx = H2_Helper::pair_index(q,q);
							if ( !m_already_updated.isset( curr_idx ) ) {
								m_updated.push_back( curr_idx );
								m_already_updated.set( curr_idx );
							}
						}
					}

					for ( unsigned r = 0; r < m_strips_model.num_fluents(); r++ ) {
						if ( interferes( a, r ) || value( p, r ) == 0.0f ) continue;
						float h2_pre_noop = std::max( op_value(a), value(r,r) );
						if ( h2_pre_noop == infty ) continue;
						for ( unsigned j = 0; j < action.prec_vec().size(); j++ ) {
							unsigned s = action.prec_vec()[j];
							h2_pre_noop = std::max( h2_pre_noop, value(r,s) );
						}
						float v = h2_pre_noop;
						if ( cost_opt == H2_Cost_Function::Unit_Costs ) v += 1.0f;
						if ( cost_opt == H2_Cost_Function::Use_Costs ) v += action.cost();
						if ( v < value(p,r) )
						{
							value(p,r) = v;
							int curr_idx = H2_Helper::pair_index(p,r);
							if ( !m_already_updated.isset( curr_idx ) ) {
								m_updated.push_back( curr_idx );
								m_already_updated.set( curr_idx );
							}
							curr_idx = H2_Helper::pair_index(r,r);
							if ( !m_already_updated.isset( curr_idx ) ) {
								m_updated.push_back( curr_idx );
								m_already_updated.set( curr_idx );
							}
							curr_idx = H2_Helper::pair_index(p,p);
							if ( !m_already_updated.isset( curr_idx ) ) {
								m_updated.push_back( curr_idx );
								m_already_updated.set( curr_idx );
							}
						}													
					}

				}
			}
			
		}
		
	}


	void compute_mutexes_only() {
		while ( !m_updated.empty() ) {
				
			unsigned p = m_updated.front();
			
			m_updated.pop_front();
			m_already_updated.unset(p);
	
			for ( std::set<unsigned>::iterator action_it = m_relevant_actions[p].begin(); action_it != m_relevant_actions[p].end(); ++action_it) {	

				const Action& action = *(m_strips_model.actions()[*action_it]);
				unsigned a = action.index();

				op_value(a) = eval( action.prec_vec() );
				if ( op_value(a) == infty ) continue;
				
				for ( unsigned i = 0; i < action.add_vec().size(); i++ ) {
					unsigned p = action.add_vec()[i];
					for ( unsigned j = i; j < action.add_vec().size(); j++ ) {
						unsigned q = action.add_vec()[j];
						float curr_value = value(p,q);
						if ( curr_value == 0.0f ) continue;
						value(p,q) = 0.0f;
						int curr_idx = H2_Helper::pair_index(p,q);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}
						curr_idx = H2_Helper::pair_index(p,p);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}
						curr_idx = H2_Helper::pair_index(q,q);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}
							
					}

					for ( unsigned r = 0; r < m_strips_model.num_fluents(); r++ ) {
						if ( interferes( a, r ) || value( p, r ) == 0.0f ) continue;
						float h2_pre_noop = std::max( op_value(a), value(r,r) );
						if ( h2_pre_noop == infty ) continue;
						
						for ( unsigned j = 0; j < action.prec_vec().size(); j++ ) {
							unsigned s = action.prec_vec()[j];
							h2_pre_noop = std::max( h2_pre_noop, value(r,s) );
							if ( h2_pre_noop == infty ) break;
						}
						
						if ( h2_pre_noop == infty ) continue;
						value(p,r) = 0.0f;
						int curr_idx = H2_Helper::pair_index(p,r);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}
						curr_idx = H2_Helper::pair_index(r,r);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}							
						curr_idx = H2_Helper::pair_index(p,p);
						if ( !m_already_updated.isset( curr_idx ) ) {
							m_updated.push_back( curr_idx );
							m_already_updated.set( curr_idx );
						}												
					}

				}
			}
			
		} 
		
	}
		


protected:
	
	const STRIPS_Problem&			m_strips_model;
	std::vector<float>			m_values;
	std::vector<float>			m_op_values;
	std::vector< Bit_Set* >			m_interfering_ops;

	std::vector< std::set<unsigned> >       m_relevant_actions;
	boost::circular_buffer<int>		m_updated;
	Bit_Set					m_already_updated;
};

}

}
#endif // h_2.hxx
