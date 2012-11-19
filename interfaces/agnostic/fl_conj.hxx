#ifndef __FLUENT_CONJUNCTION__
#define __FLUENT_CONJUNCTION__

#include <algorithm>
#include <iostream>
#include <types.hxx>
#include <strips_prob.hxx>

namespace aptk {

namespace agnostic {

	class Fluent_Conjunction {
	public:
		Fluent_Conjunction( unsigned index );
		Fluent_Conjunction( unsigned index, const Fluent_Vec& fv );
		~Fluent_Conjunction();

		unsigned index() const { return m_index; }

		bool	in_set( unsigned p ) const {
			return std::find( m_fluents.begin(), m_fluents.end(), p ) != m_fluents.end();
		}

		bool	in_set( const Fluent_Vec& fv ) const {
			for ( auto p = m_fluents.begin(); p != m_fluents.end(); p++ ) {
				if ( std::find( fv.begin(), fv.end(), *p ) == fv.end() )
					return false;
			}
			return true;	
		}		

		bool	intersects( const Fluent_Vec& fv ) const {
			for ( auto p = m_fluents.begin(); p != m_fluents.end(); p++ ) {
				if ( std::find( fv.begin(), fv.end(), *p ) != fv.end() )
					return true;
			}
			return false;				
		}

		bool 			singleton() const { return m_fluents.size() == 1; }

		const	Fluent_Vec& 	fluents() const {  return m_fluents; }
	protected:

		unsigned 	m_index;
		Fluent_Vec	m_fluents;
	};


}

}

 
#endif // fl_conj.hxx
