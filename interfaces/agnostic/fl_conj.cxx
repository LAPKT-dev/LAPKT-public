#include <fl_conj.hxx>

namespace aptk {

namespace agnostic {

	Fluent_Conjunction::Fluent_Conjunction( unsigned index ) 
	: m_index( index ) {
		m_fluents.push_back( index );
	}

	Fluent_Conjunction::Fluent_Conjunction( unsigned index, const Fluent_Vec& fv ) 
	: m_index( index ), m_fluents(fv) {	
	}

	Fluent_Conjunction::~Fluent_Conjunction() {
	}
}

}
