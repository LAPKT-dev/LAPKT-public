#ifndef __MUTEX_SET__
#define __MUTEX_SET__

#include <aptk/bit_array.hxx>
#include <types.hxx>
#include <vector>
#include <iosfwd>

namespace aptk {

class STRIPS_Problem;

namespace agnostic {

	// A simple container for mutexes
	class Mutex_Set {
	public:


		Mutex_Set( const STRIPS_Problem& prob );
		~Mutex_Set();

		bool	are_mutex( unsigned p, unsigned q ) const;
		bool	action_edeletes( const Action* a, unsigned p ) const;
		bool  	cond_eff_edeletes( const Action* a, unsigned eff, unsigned p ) const;

		void	add( const Fluent_Vec& group );

		unsigned num_groups() const { return m_mutex_groups.size(); }

		void	print( std::ostream& os ) const;

	protected:

		const STRIPS_Problem&		m_model;
		std::vector< Fluent_Vec >	m_mutex_groups;
		std::vector< Bit_Array >	m_mutex_groups_bitmap;
	};

}

}

#endif // mutex_set.hxx
