#include <py_strips_problem.hxx>
#include <cstring>
#include <fstream>
#include <iostream>

using namespace boost::python;

	STRIPS_Problem::STRIPS_Problem( ) {
		m_parsing_time = 0.0f;
		m_problem = new aptk::STRIPS_Problem;

	}

	STRIPS_Problem::STRIPS_Problem( std::string domain, std::string instance ) {
		m_parsing_time = 0.0f;
		m_problem = new aptk::STRIPS_Problem( domain, instance );

	}

	STRIPS_Problem::~STRIPS_Problem() {
	}

	void
	STRIPS_Problem::add_atom( std::string name ) {
		STRIPS_Problem::add_fluent( *instance(), name );
	}

	void
	STRIPS_Problem::add_action( std::string name ) {
		aptk::Fluent_Vec empty;
		aptk::Conditional_Effect_Vec dummy_ceffs;
		STRIPS_Problem::add_action( *instance(), name, empty, empty, dummy_ceffs ); 
	}	

	void
	STRIPS_Problem::add_precondition( int index, boost::python::list& lits ) {
		/*
		aptk::STRIPS_Problem::Action& action = *(const_cast<aptk::STRIPS_Problem::Action*>(m_problem->actions[index]));
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			action.precondition.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		instance()->max_precondition_size = std::max( instance()->max_precondition_size, action.precondition.size() );
		*/
	}

	void
	STRIPS_Problem::add_cond_effect( int index, boost::python::list& cond_lits, boost::python::list& eff_lits ) {
		/*
		aptk::STRIPS_Problem::Action& action = *(const_cast<aptk::STRIPS_Problem::Action*>(m_problem->actions[index]));
		aptk::STRIPS_Problem::Effect eff;
		for ( int i = 0; i < len(cond_lits); i++ ) {
			boost::python::tuple li = extract< tuple >( cond_lits[i] );
			eff.condition.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		for ( int i = 0; i < len(eff_lits); i++ ) {
			boost::python::tuple li = extract< tuple >( eff_lits[i] );
			eff.effect.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		action.effects.push_back( eff );
		*/
	}

	void
	STRIPS_Problem::add_effect( int index, boost::python::list& lits ) {
		/*
		aptk::STRIPS_Problem::Action& action = *(const_cast<aptk::STRIPS_Problem::Action*>(m_problem->actions[index]));
		aptk::STRIPS_Problem::Effect eff;
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			eff.effect.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}	
		action.effects.push_back( eff );
		*/

	}

	void
	STRIPS_Problem::add_invariant( boost::python::list& lits ) {
		/*
		aptk::Clause invariant;
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			invariant.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
			instance()->add_invariant( invariant );
		}
		*/
	}

	void
	STRIPS_Problem::set_init( boost::python::list& lits ) {
		/*
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			instance()->init.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}
		// Complete negation
		for ( aptk::Atom p = 0; p < (int)instance()->n_atoms(); p++ ) {
			aptk::Lit l = aptk::mkLit( p, false );
			if ( !instance()->init.entails( l ) )
				instance()->init.add( ~l );
			l = aptk::mkLit( p, true );
			if ( !instance()->init.entails(~l) )
				instance()->init.add( l );
		}
		*/
	}

	void
	STRIPS_Problem::set_goal( boost::python::list& lits ) {
		/*
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			instance()->goal.add( aptk::mkLit( extract<int>(li[0]), extract<bool>(li[1]) ) );
		}
		*/
	}

	void
	STRIPS_Problem::set_domain_name( std::string name ) {
		instance()->set_domain_name( name ); 
	}

	void
	STRIPS_Problem::set_problem_name( std::string name ) {
		instance()->set_problem_name( name );
	}

	void
	STRIPS_Problem::print_action( int index ) {
		instance()->actions()[index]->print( *instance(), std::cout );
	}
	
	void
	STRIPS_Problem::write_ground_pddl( std::string domain, std::string problem ) {
		/*
		std::ofstream domain_stream( domain.c_str() );
		m_inst->write_domain( domain_stream );
		std::ofstream problem_stream( problem.c_str() );
		m_inst->write_problem( problem_stream );
		*/
	}

	void
	STRIPS_Problem::setup() {
		instance()->make_action_tables();
	}
