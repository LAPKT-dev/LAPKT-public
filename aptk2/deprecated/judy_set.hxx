
#pragma once

#include <cassert>
#include <Judy.h>

namespace aptk {
	
	class Judy_Set {
	public:
		Judy_Set();
		~Judy_Set();

		Judy_Set( const Judy_Set& other ) {
			copy(other);
		}

		Judy_Set( Judy_Set&& other ) {
			m_array = other.m_array;
			other.m_array = (Pvoid_t)nullptr;
		}

		const 	Judy_Set&	operator=( const Judy_Set& other ) {
			copy(other);
			return *this;
		}

		const 	Judy_Set& operator=( Judy_Set&& other ) {
			m_array = other.m_array;
			other.m_array = (Pvoid_t)nullptr;
			return *this;		
		}

		void 	
		reset() {
			if ( m_array == (Pvoid_t)nullptr ) return;
			int	res;
			J1FA( res, m_array );
			m_array = (Pvoid_t)nullptr;
		}
	
		void
		set( Word_t index ) {
			int res;
			J1S( res, m_array, (Word_t)index );
		}

		void
		unset( Word_t index ) {
			int res;
			J1U( res, m_array, (Word_t)index );
		}

		bool
		isset( Word_t var ) const {
			int res;
			J1T( res, m_array, (Word_t)var );
			return res == 1;
		}
	
		bool
		first( Word_t& index ) const {
			int res;
			index = 0;
			J1N( res, m_array, index );
			if ( res == 0 ) return false;
			return true;
		}

		bool 
		next( Word_t& index ) const {
			int res;
			J1N( res, m_array, index );
			if ( res == 0 ) return false;
			return true;
		}
		
		int
		size( ) const {
			int res;
			J1C(res, m_array, 0, -1);	
			return res;
		}	

		int
		nbytes() const {
			int res;
			J1MU( res, m_array );
			return res;
		}
	
	protected:

		void 
		copy( const Judy_Set& s )
		{
			int res;
			J1FA( res, m_array );
			Word_t i = 0;
			J1N( res, m_array, i );
			while ( res != 0 )
			{
				J1S( res, m_array, i );
				J1N( res, s.m_array, i );
			}	
		}

	protected:
		Pvoid_t		m_array;
	};
}
