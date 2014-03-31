#include <judy_set.hxx>

namespace aptk {

	Judy_Set::Judy_Set()
	: m_array ( (Pvoid_t)nullptr ) {
	}

	Judy_Set::~Judy_Set() {
		if ( m_array != nullptr ) {
			int res;
			J1FA( res, m_array );
		}
			
	}

}
