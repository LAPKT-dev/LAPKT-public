#include <py_fod_problem.hxx>
#include <gp_atoms.hxx>
#include <cstring>
#include <fstream>
#include <iostream>

using namespace boost::python;

	FOD_Problem::FOD_Problem( ) {
		m_parsing_time = 0.0f;
		m_ignore_action_costs = false;
		m_problem = new aptk::FOD_Problem;

	}

	FOD_Problem::FOD_Problem( std::string domain, std::string instance ) {
		m_parsing_time = 0.0f;
		m_ignore_action_costs = false;
		m_problem = new aptk::FOD_Problem( domain, instance );

	}

	FOD_Problem::~FOD_Problem() {
	}

	void
	FOD_Problem::add_atom( std::string name ) {
		m_problem->new_atom( name );
	}

	void
	FOD_Problem::add_action( std::string name ) {
		m_problem->new_action( name );
	}	

	void
	FOD_Problem::add_precondition( int index, boost::python::list& lits ) {
		aptk::FOD_Problem::Action& action = *(const_cast<aptk::FOD_Problem::Action*>(m_problem->actions[index]));
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			action.precondition.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		instance()->max_precondition_size = std::max( instance()->max_precondition_size, action.precondition.size() );
	}

	void
	FOD_Problem::add_cond_effect( int index, boost::python::list& cond_lits, boost::python::list& eff_lits ) {
		aptk::FOD_Problem::Action& action = *(const_cast<aptk::FOD_Problem::Action*>(m_problem->actions[index]));
		aptk::FOD_Problem::Effect eff;
		for ( int i = 0; i < len(cond_lits); i++ ) {
			boost::python::tuple li = extract< tuple >( cond_lits[i] );
			eff.condition.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		for ( int i = 0; i < len(eff_lits); i++ ) {
			boost::python::tuple li = extract< tuple >( eff_lits[i] );
			eff.effect.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		action.effects.push_back( eff );
	}

	void
	FOD_Problem::add_effect( int index, boost::python::list& lits ) {
		aptk::FOD_Problem::Action& action = *(const_cast<aptk::FOD_Problem::Action*>(m_problem->actions[index]));
		aptk::FOD_Problem::Effect eff;
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			eff.effect.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		action.effects.push_back( eff );

	}

	void
	FOD_Problem::add_invariant( boost::python::list& lits ) {
		aptk::Clause invariant;
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			invariant.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
			instance()->add_invariant( invariant );
		}
	}

	void
        FOD_Problem::add_axiom( boost::python::list& condition, boost::python::list& effect ) {
		aptk::Clause axiom_body;
		aptk::Clause axiom_head;
		for ( int i = 0; i < len(condition); i++ ) {
			boost::python::tuple li = extract< tuple >( condition[i] );
			axiom_body.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}
		
		for ( int i = 0; i < len(effect); i++ ) {
			boost::python::tuple li = extract< tuple >( effect[i] );
			axiom_head.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		instance()->add_axiom( axiom_body, axiom_head );
	}

	void
	FOD_Problem::set_cost( int index, float c ) {
		aptk::FOD_Problem::Action& action = *(const_cast<aptk::FOD_Problem::Action*>(m_problem->actions[index]));
		if ( m_ignore_action_costs ) {
			action.cost = 1.0f ;
			return;
		}
		const float min_action_cost = 1e-3;
		if ( c < min_action_cost )
			c = min_action_cost;
		action.cost = c;
	}

	void
	FOD_Problem::set_init( boost::python::list& lits ) {
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			instance()->init.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}
		// Complete negation
		for ( aptk::Atom p = 0; p < (int)instance()->n_atoms(); p++ ) {
			aptk::Lit l = aptk::mkLit( p, false );
			if ( !instance()->init.entails( l ) )
				instance()->init.add( ~l );
			//l = aptk::mkLit( p, true );
			//if ( !instance()->init.entails(~l) )
			//	instance()->init.add( l );
		}
		// Check undefined vars in initial state
		unsigned count_undefined = 0;
		std::cout << "Undefined vars in initial state:" << std::endl;
		for ( aptk::Atom p = 0; p  < (int)instance()->n_atoms(); p++ ) {
			if ( instance()->init.value(p) == aptk::l_Undef ) {
				std::cout << "\t" << instance()->atoms[p]->name << std::endl;
				count_undefined++;
			}
		}
		assert( count_undefined == 0 );
	}

	void
	FOD_Problem::set_goal( boost::python::list& lits ) {
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			instance()->goal.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}
	}

	void
	FOD_Problem::set_domain_name( std::string name ) {
		instance()->domain_name = name; 
	}

	void
	FOD_Problem::set_problem_name( std::string name ) {
		instance()->problem_name = name;
	}

	void
	FOD_Problem::print_action( int index ) {
		instance()->actions[index]->print( std::cout, *instance() );
	}
	
	void
	FOD_Problem::write_ground_pddl( std::string domain, std::string problem ) {
		/*
		std::ofstream domain_stream( domain.c_str() );
		m_inst->write_domain( domain_stream );
		std::ofstream problem_stream( problem.c_str() );
		m_inst->write_problem( problem_stream );
		*/
	}

	void
	FOD_Problem::setup() {
		instance()->setup();
	}
