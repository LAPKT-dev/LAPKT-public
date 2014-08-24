#include <mutex_set.hxx>
#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <ostream>

namespace aptk {

namespace agnostic {

	Mutex_Set::Mutex_Set( const STRIPS_Problem& prob ) 
		: m_model( prob ) {

	}

	Mutex_Set::~Mutex_Set() {

	}

	bool
	Mutex_Set::are_mutex( unsigned p, unsigned q ) const {
		for ( auto group : m_mutex_groups_bitmap ) {
			if ( group.isset(p) && group.isset(q) ) return true;
		}
		return false;
	}

	bool
	Mutex_Set::action_edeletes( const Action* a, unsigned p ) const {
		// 1. Action deletes p

		if ( a->retracts(p) ) return true;
		
		// 2. Action precondition q mutex with p, and p not added
		if ( !a->asserts(p) ) {
			for ( auto q : a->prec_vec() ) {
				if ( p != q && are_mutex( p, q ) ) return true;
			}
		}

		// 3. Action pos. effect q mutex with p		
		for ( auto q : a->add_vec() ) 
			if ( p != q && are_mutex( p, q ) ) return true;
		return false;
	}

	void
	Mutex_Set::add( const Fluent_Vec& group ) {
		m_mutex_groups.push_back( group );

		Bit_Array	group_bm( m_model.num_fluents() );

		for ( auto p : group ) 
			group_bm.set( p );	

		m_mutex_groups_bitmap.push_back( group_bm );
	}

	void
	Mutex_Set::print( std::ostream& os ) const {

		for ( auto group : m_mutex_groups ) {

			os << "{";
			for ( unsigned i = 0; i < group.size(); i++ ) {
				os << m_model.fluents()[group[i]]->signature();
				if ( i < group.size()-1 )
					os << ", ";
			}
			os << "}" << std::endl;

		}

	}

}

}
