#include <conj_comp_prob.hxx>
#include <cassert>
#include <iostream>

namespace aptk {

namespace agnostic {

	CC_Problem::CC_Action::CC_Action( const Action& a ) 
	: m_orig_act( a ) {
		m_pre = a.prec_vec();
		m_add = a.add_vec();
		for ( auto it = a.prec_vec().begin(); it != a.prec_vec().end(); it++ )
			if ( !a.del_set().isset( *it) ) 
				m_add.push_back( *it );
	}

	CC_Problem::CC_Action::~CC_Action() {
	}

	CC_Problem::CC_Problem(  const STRIPS_Problem& prob, const std::vector<Fluent_Vec>& conjs )
	: m_orig_prob( prob ) {
		import_fluents_from_original();
		for ( auto it = conjs.begin(); it != conjs.end(); it++ ) {
			m_fluents.push_back( new Fluent_Conjunction( m_fluents.size(), *it ) );
			m_cfluents.push_back( m_fluents.back() );
		}
		make_actions();
		compute_actions_closure();
		make_goal();
	}

	CC_Problem::CC_Problem( const STRIPS_Problem& prob, unsigned sz )
	: m_orig_prob( prob ) {
		import_fluents_from_original();
		if ( sz == 2 ) 
			enumerate_binary_conjunctions();
		make_actions();
		compute_actions_closure();
		make_goal();
	}

	CC_Problem::~CC_Problem() {
	}

	void	CC_Problem::import_fluents_from_original() {
		for ( unsigned p = 0; p < m_orig_prob.num_fluents(); p++ ) {
			m_fluents.push_back( new Fluent_Conjunction( p ) ); 
			m_cfluents.push_back( m_fluents.back() );
		}
	}

	void	CC_Problem::enumerate_binary_conjunctions() {
		Fluent_Vec pair;
		pair.resize(2);

		for ( unsigned p = 0; p < m_orig_prob.num_fluents(); p++ )
			for ( unsigned q = p+1; q < m_orig_prob.num_fluents(); q++ ) {
				pair[0] = p;
				pair[1] = q;
				m_fluents.push_back( new Fluent_Conjunction( m_fluents.size(), pair ) );
				m_cfluents.push_back( m_fluents.back() );
			}
	}
	
	void	CC_Problem::make_actions() {
		m_requiring.resize( num_fluents() );
		for ( unsigned a = 0; a < m_orig_prob.num_actions(); a++ ) {
			const Action& act = *(m_orig_prob.actions()[a]);
			m_actions.push_back( new CC_Action( act ) );
			m_cactions.push_back( m_actions.back() );
			for ( auto it = act.prec_vec().begin(); it != act.prec_vec().end(); it++ ) { 
				m_requiring[*it].push_back( a );
				assert( m_actions.back()->requires(*it) );
			}
		}
	}

	void	CC_Problem::compute_relevant_C_fluents( const Fluent_Vec& vec, std::vector<Fluent_Conjunction*>& rel ) {
		for ( unsigned c = m_orig_prob.num_fluents(); c < num_fluents(); c++ ) {
			Fluent_Conjunction* pc = m_fluents[c];
			if ( pc->in_set( vec ) ) rel.push_back( pc );
		}

	}

	void	CC_Problem::compute_actions_closure( ) {
		for ( unsigned c = m_orig_prob.num_fluents(); c < num_fluents(); c++ ) {
			Fluent_Conjunction& pc = *(m_fluents[c]);
			for ( unsigned a = 0; a < m_actions.size(); a++ ) {
				CC_Action& act = *(m_actions[a]);
				if ( pc.in_set( act.pre() ) ) {
					//std::cout << "Conjunction ";
					//print_fluent( c, std::cout );
					//std::cout << " added to precondition of " << act.signature() << std::endl;
					act.add_new_pre( c );
					m_requiring[c].push_back( a );
				}
				if ( pc.in_set( act.add() ) ) {
					//std::cout << "Conjunction ";
					//print_fluent( c, std::cout );
					//std::cout << " added to add(a) of " << act.signature() << std::endl;
					act.add_new_eff( c );
				}
				if ( pc.intersects( act.original().add_vec() ) && !pc.intersects( act.original().del_vec() ) ) {
					Fluent_Vec cond, eff;
					
					cond = act.original().prec_vec();
					for ( auto fl_it = pc.fluents().begin(); fl_it != pc.fluents().end(); fl_it++ )
						if ( std::find( act.original().add_vec().begin(), act.original().add_vec().end(), *fl_it ) == act.original().add_vec().end() )
							cond.push_back( *fl_it );

					for ( unsigned c2 = m_orig_prob.num_fluents(); c2 < num_fluents(); c2++ ) {
						Fluent_Conjunction& pc2 = *(m_fluents[c2]);
						if ( pc2.in_set(cond) )
							cond.push_back(c2);								
					}
					//std::cout << "Conjunction ";
					//print_fluent( c, std::cout );
					//std::cout << " added to conditional effect of " << act.signature() << std::endl;
					eff.push_back( c );
					act.add_new_cond_eff( cond, eff );
				}	
			}	
		}
		/*
		for ( unsigned a = 0; a < m_actions.size(); a++ ) {
			CC_Action& act = *(m_actions[a]);
			// Process precondition
			std::vector<Fluent_Conjunction*> pre_rel_conjs, add_rel_conjs;
			compute_relevant_C_fluents( act.pre(), pre_rel_conjs );
			for ( unsigned k = 0; k < pre_rel_conjs.size(); k++ ) {
				act.add_new_pre( pre_rel_conjs[k]->index() );
				m_requiring[ pre_rel_conjs[k]->index() ].push_back( a );
			}
			compute_relevant_C_fluents( act.add(), add_rel_conjs );
			for ( unsigned k = 0; k < add_rel_conjs.size(); k++ ) {
				act.add_new_eff( add_rel_conjs[k]->index() );
			}
			for ( unsigned c = m_orig_prob.num_fluents(); c < num_fluents(); c++ ) {
				Fluent_Conjunction* pc = m_fluents[c];
				if ( pc->intersects( act.original().del_vec() ) ) continue;
				if ( !pc->intersects( act.original().add_vec() ) ) continue;
				Fluent_Vec cond, eff;
				cond = act.original().prec_vec();
				for ( auto it = pc->fluents().begin();
					it != pc->fluents().end(); it++ )
					if ( !act.original().add_set().isset( *it) )
						cond.push_back( *it );
				std::vector< Fluent_Conjunction* > cond_rel_conjs;
				compute_relevant_C_fluents( cond, cond_rel_conjs );
				for ( unsigned k = 0; k < cond_rel_conjs.size(); k++ ) {
						cond.push_back( cond_rel_conjs[k]->index() );
				}
				eff.push_back( pc->index() );
				act.add_new_cond_eff( cond, eff );
			}
		}
		*/
	}

	void	CC_Problem::make_goal() {
		m_goal.clear();
		for ( auto it = fluents().begin(); it != fluents().end(); it++ )
			if ( (*it)->in_set( m_orig_prob.goal() ) ) {
				m_goal.push_back( (*it)->index() );
			}
		
	}

	void	CC_Problem::print_fluent( unsigned p, std::ostream& os ) const {
		const Fluent_Conjunction& C = *(fluents()[p]);
		if ( C.singleton() ) {
			os << "[" << m_orig_prob.fluents()[C.fluents()[0]]->signature() << "]";
			return;
		}
		os << "[";
		for ( unsigned i = 0; i < C.fluents().size(); i++ ) {
			print_fluent( C.fluents()[i], os );
			if ( i < C.fluents().size() - 1 )
				os << ", ";
		}
		os << "]";
		
	}
}

}

