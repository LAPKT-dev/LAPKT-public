#include <fod_search_model.hxx>
#include <cassert>

namespace aptk {

	FOD_Search_Model::FOD_Search_Model( const FOD_Problem& the_task ) 
		: m_task( the_task ) {
	}

	FOD_Search_Model::~FOD_Search_Model() {
		
	}	

	int
	FOD_Search_Model::num_actions() const {
		return m_task.actions.size();
	}

	FOD_Search_Model::State
	FOD_Search_Model::init() const {
		return State( m_task.init );
	}

	bool
	FOD_Search_Model::goal( const State& s ) const {
		return s.satisfies( m_task.goal );	
	}

	unsigned
	FOD_Search_Model::num_goals_achieved( const State& s ) const {
		unsigned count = 0;
		for ( Lit l : s ) {
			if ( m_task.goal.entails(l) )
				count++;
		}
		return count;
	}

	bool
	FOD_Search_Model::is_applicable( const State& s, Action_Idx a ) const {
		assert( a >= 0 );
		assert( a < m_task.actions.size() );
		auto action = m_task.actions[a];
		return s.satisfies( action->precondition );
	}

	void
	FOD_Search_Model::applicable_set( const State& s, std::vector<Action_Idx>& app_set ) const {
		assert( app_set.empty() );
		for ( auto a : m_task.actions ) {
			if ( s.satisfies( a->precondition ) )
				app_set.push_back( a->index );
		}
	}

	// MRJ: TODO: Still needs to be actually implemented	
	void
	FOD_Search_Model::applicable_set_v2( const State& s, std::vector<Action_Idx>& app_set ) const {
		applicable_set( s, app_set );
	}

	float
	FOD_Search_Model::cost( const State& s, Action_Idx a ) const {
		assert( a >= 0 );
		assert( a < m_task.actions.size() );
		return m_task.actions[a]->cost;
	}

	FOD_Search_Model::State
	FOD_Search_Model::goals_achieved( const State& s ) const {
		State G;		

		for ( Lit l : s ) {
			if ( m_task.goal.entails(l) )
				G.add(l);
		}

		return G;

	}

	FOD_Search_Model::State
	FOD_Search_Model::next( const State& s, Action_Idx a ) const {
		assert( a >= 0 );
		assert( a < m_task.actions.size() );
		auto action = m_task.actions[a];

		assert( s.satisfies( action->precondition ) );

		State succ;
		for ( auto cond_effect : action->effects ) {
			if ( !s.satisfies( cond_effect.condition ) ) continue;
			succ.add( cond_effect.effect );
		}

		for ( auto l : s ) {
			if ( succ.entails(l) || succ.entails( ~l ) ) continue;
			succ.add( l );
		}

		return succ;
	}

	void
	FOD_Search_Model::print( const State& s, std::ostream& os ) const {
		s.write( os, m_task, false );	
	}

	void
	FOD_Search_Model::print_action( Action_Idx a, std::ostream& os ) const {
		m_task.actions[a]->print( os, m_task );
	}

	void
	FOD_Search_Model::print( std::ostream& os ) const {
		os << "Fluents (" << m_task.atoms.size() << ")" << std::endl;
		for ( auto f : m_task.atoms ) {
			os << "\t";
			f->print( os, m_task );
			os << std::endl;
		}
		os << "Actions (" << m_task.actions.size() << ")" << std::endl;	
		for ( auto a : m_task.actions ) {
			os << "\t";
			a->print( os, m_task );
			os << std::endl;
		}
	}
}
