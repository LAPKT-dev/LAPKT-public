#ifndef __REACHABILITY__
#define __REACHABILITY__

#include <strips_prob.hxx>
#include <types.hxx>
#include <aptk/bit_set.hxx>
#include <vector>

namespace aptk {

namespace agnostic {

	class	Reachability_Test {
	public:

		Reachability_Test( const STRIPS_Problem& p );
		~Reachability_Test();

		// Returns true if atom set g is reachable from state s 
		bool	is_reachable( const Fluent_Vec& s, const Fluent_Vec& g );
		// Returns true if atom set g is reachable from s, when removing action
		bool	is_reachable( const Fluent_Vec& s, const Fluent_Vec& g, unsigned action );
		bool 	is_reachable( const Fluent_Vec& s, const Fluent_Vec& g, const Bit_Set& excluded );
	protected:

		bool	apply_actions();
		void	initialize( const Fluent_Vec& s );
		bool	check( const Fluent_Vec& set );

		void	print_reachable_atoms();
	protected:

		const STRIPS_Problem&		m_problem;
		std::vector<bool>	m_reachable_atoms;
		std::vector<bool>	m_reach_next;
		Bit_Set			m_action_mask;		
	};

}

}

#endif // reachability.hxx
