#include <py_strips_prob.hxx>
#include <cstring>
#include <fstream>
#include <iostream>

using namespace boost::python;

	STRIPS_Problem::STRIPS_Problem( ) {
		m_parsing_time = 0.0f;
		m_ignore_action_costs = false;
		m_problem = new aptk::STRIPS_Problem;

	}

	STRIPS_Problem::STRIPS_Problem( std::string domain, std::string instance ) {
		m_parsing_time = 0.0f;
		m_ignore_action_costs = false;
		m_problem = new aptk::STRIPS_Problem( domain, instance );

	}

	STRIPS_Problem::~STRIPS_Problem() {
	}

	void
	STRIPS_Problem::add_atom( std::string name ) {
		assert( m_negated.empty() );
		aptk::STRIPS_Problem::add_fluent( *instance(), name );
	}

	void
	STRIPS_Problem::add_action( std::string name ) {
		aptk::Fluent_Vec empty;
		aptk::Conditional_Effect_Vec dummy_ceffs;
		aptk::STRIPS_Problem::add_action( *instance(), name, empty, empty, empty, dummy_ceffs ); 
	}	

	void
	STRIPS_Problem::notify_negated_conditions( boost::python::list& fluents ) {
		for ( int i = 0; i < len(fluents); i++ ) {
			unsigned fl_index = extract<int>( fluents[i] );
			assert( fl_index < instance()->num_fluents() );
			m_negated_conditions.insert( fl_index );	
		}
	}

	void
	STRIPS_Problem::create_negated_fluents() {
		m_negated.resize( instance()->num_fluents() );
		unsigned count = 0;
		for ( auto fl_idx : m_negated_conditions ) {
			aptk::Fluent* fl = instance()->fluents()[fl_idx];
			assert( fl != nullptr );
			std::string negated_signature = "(not " + fl->signature() + ")";
			unsigned neg_fl_idx = aptk::STRIPS_Problem::add_fluent( *instance(), negated_signature );
			m_negated.at( fl_idx ) = instance()->fluents()[neg_fl_idx];
			count++;
		} 
		std::cout << count << " negated fluents created" << std::endl;
	}

	void
	STRIPS_Problem::add_precondition( int index, boost::python::list& lits ) {
		aptk::Action& action = *(m_problem->actions()[index]);
		for ( int i = 0; i < len(lits); i++ ) {

			boost::python::tuple li = extract< tuple >( lits[i] );
			int 	fl_idx 		= extract<int>(li[0]);
			bool	negated 	= extract<bool>(li[1]);

			if ( negated)
				fl_idx = m_negated[ fl_idx ]->index();

			action.prec_vec().push_back( fl_idx );
			action.prec_set().set( fl_idx );
			action.prec_varval().push_back( std::make_pair(fl_idx, 0) );

		}	
	}

	void
	STRIPS_Problem::add_cond_effect( int index, boost::python::list& cond_lits, boost::python::list& eff_lits ) {
		aptk::Action&		action = *(m_problem->actions()[index]);

		aptk::Fluent_Vec	cond_fluents;
		aptk::Fluent_Vec	add_fluents;
		aptk::Fluent_Vec	del_fluents;

		for ( int i = 0; i < len(cond_lits); i++ ){
			boost::python::tuple li = extract< tuple >( cond_lits[i] );
			int 	fl_idx 		= extract<int>(li[0]);
			bool	negated 	= extract<bool>(li[1]);

			if ( negated)
				fl_idx = m_negated[ fl_idx ]->index();

			cond_fluents.push_back( fl_idx );
		}
		
		for ( int i = 0; i < len(eff_lits); i++ ) {
			boost::python::tuple li = extract< tuple >( eff_lits[i] );

			int 	fl_idx 		= extract<int>(li[0]);
			bool	negated 	= extract<bool>(li[1]);

			if ( m_negated[ fl_idx ] == nullptr ) {
				if ( negated ) {
					del_fluents.push_back( fl_idx );
				}
				else {
					add_fluents.push_back( fl_idx );
				}	
				continue;
			}
			int neg_fl_idx = m_negated[ fl_idx ]->index();
			
			if ( negated ) {
				add_fluents.push_back( neg_fl_idx );
				del_fluents.push_back( fl_idx );
				continue; 
			}

			del_fluents.push_back( neg_fl_idx );
			add_fluents.push_back( fl_idx );
		}	

		aptk::Conditional_Effect* cond_eff = new aptk::Conditional_Effect( *instance() );
		cond_eff->define( cond_fluents, add_fluents, del_fluents );
		action.ceff_vec().push_back( cond_eff );
		m_problem->notify_cond_eff_in_action();	
	}

	void
	STRIPS_Problem::add_effect( int index, boost::python::list& lits ) {
		aptk::Action& action = *(m_problem->actions()[index]);
		for ( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );

			int 	fl_idx 		= extract<int>(li[0]);
			bool	negated 	= extract<bool>(li[1]);

			if ( m_negated[ fl_idx ] == nullptr ) {
				if ( negated ) {
					action.del_vec().push_back( fl_idx );
					action.del_set().set( fl_idx );
					action.edel_vec().push_back( fl_idx );
					action.edel_set().set( fl_idx );
				}
				else {
					action.add_vec().push_back( fl_idx );
					action.add_set().set( fl_idx );
				}	
				continue;
			}
			int neg_fl_idx = m_negated[ fl_idx ]->index();
			
			if ( negated ) {
				action.add_vec().push_back( neg_fl_idx );
				action.add_set().set( neg_fl_idx );
				action.del_vec().push_back( fl_idx );
				action.del_set().set( fl_idx );
				action.edel_vec().push_back( fl_idx );
				action.edel_set().set( fl_idx );
				continue; 
			}

			action.del_vec().push_back( neg_fl_idx );
			action.del_set().set( neg_fl_idx );
			action.edel_vec().push_back( neg_fl_idx );
			action.edel_set().set( neg_fl_idx );
			action.add_vec().push_back( fl_idx );
			action.add_set().set( fl_idx );
		}	
	}

	void
	STRIPS_Problem::add_mutex_group( boost::python::list& lits ) {
	    aptk::Fluent_Vec	group;
	    for ( int i = 0; i < len(lits); i++ ) {
		boost::python::tuple li = extract< tuple >( lits[i] );
		int 	fl_idx 		= extract<int>(li[0]);
		bool	negated 	= extract<bool>(li[1]);
		
		if ( negated)
		    fl_idx = m_negated[ fl_idx ]->index();
		group.push_back( fl_idx );	
	    }
	    	    
	    m_problem->mutexes().add( group );
	}

	void
	STRIPS_Problem::set_cost( int index, float c ) {
		aptk::Action& action = *(m_problem->actions()[index]);
		if ( m_ignore_action_costs ) {
			action.set_cost( 1.0f );
			return;
		}
		const float min_action_cost = 1e-3;
		if ( c < min_action_cost )
			c = min_action_cost;
		action.set_cost( c );
	}

	void
	STRIPS_Problem::set_init( boost::python::list& lits ) {

		aptk::Fluent_Vec I;

		for( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			int 	fl_idx 		= extract<int>(li[0]);
			bool	negated 	= extract<bool>(li[1]);
			if ( negated ) {
				assert( m_negated[fl_idx] );
				I.push_back( m_negated[fl_idx]->index() );
				continue;
			}
			I.push_back( fl_idx );
		}

		// complete initial state under negation
		for ( unsigned p = 0; p < instance()->num_fluents(); p++ ) {
			if ( p >= m_negated.size() ) continue; // p is a negated fluent!
			if ( std::find( I.begin(), I.end(), p ) != I.end() ) 
				continue;
			assert( p < m_negated.size() );
			if ( m_negated.at(p) ) 
				I.push_back( m_negated[ p ]->index() );
		} 	

		aptk::STRIPS_Problem::set_init( *instance(), I );

	}

	void
	STRIPS_Problem::set_goal( boost::python::list& lits ) {
		aptk::Fluent_Vec G;

		for( int i = 0; i < len(lits); i++ ) {
			boost::python::tuple li = extract< tuple >( lits[i] );
			int 	fl_idx 		= extract<int>(li[0]);
			bool	negated 	= extract<bool>(li[1]);
			if ( negated ) {
				assert( m_negated[fl_idx] );
				G.push_back( m_negated[fl_idx]->index() );
				continue;
			}
			G.push_back( fl_idx );
		}

		aptk::STRIPS_Problem::set_goal( *instance(), G );
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
		instance()->make_effect_tables();
	}

	void
	STRIPS_Problem::print_fluents() {
		std::ofstream out( "fluents.list" );
		instance()->print_fluents(out);
		out.close();
	}

	void
	STRIPS_Problem::print_actions() {
		std::ofstream out( "actions.list" );
		instance()->print_actions(out);
		out.close();
	}
