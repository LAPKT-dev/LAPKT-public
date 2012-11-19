#include <fl_conj.hxx>

namespace aptk {

namespace agnostic {

	Fluent_Conjunction::Fluent_Conjunction( unsigned index ) 
	: m_index( index ) {
		m_fluents.push_back( index );
	}

	Fluent_Conjunction::Fluent_Conjunction( unsigned index, const Fluent_Vec& fv ) 
	: m_index( index ) {
		for ( auto it = fv.begin(); it != fv.end(); it++ ) {
			if ( std::find( m_fluents.begin(), m_fluents.end(), *it ) == m_fluents.end() )
				m_fluents.push_back( *it );
		}
	}

	Fluent_Conjunction::~Fluent_Conjunction() {
	}
}

}
