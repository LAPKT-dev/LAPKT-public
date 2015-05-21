#include <gp_atoms.hxx>
#include <fod_problem.hxx>
#include <iostream>

namespace aptk {

	unsigned Clause::m_num_lits = 0;

	class Lit_Comparer {
	public:
		bool operator()( const Lit& a, const Lit& b ) const {
			return toInt(b) > toInt(a);
		}
	};

	Clause::~Clause() {
	}

	void
	Clause::set_num_lits( unsigned sz ) {
		m_num_lits = sz;
	}

	unsigned
	Clause::num_lits( ) {
		return m_num_lits;
	}

	void	Clause::sort() {
		std::sort( m_lits.begin(), m_lits.end(), Lit_Comparer() );
	}

	void	Clause::write( std::ostream& os ) const {
		os << "Clause( ";
		for ( unsigned i = 0; i < m_lits.size(); i++ ) {
			os << ( sign(m_lits[i]) ? "~" : "" ) << atom(m_lits[i]);
			if ( i < m_lits.size()-1 )
				os << ", ";
		}
			
		os << ")";
	}

	void	Clause::write( std::ostream& os, const FOD_Problem& task, bool write_negated ) const {
		os << "Clause( ";
		for ( unsigned i = 0; i < (unsigned)m_lits.size(); i++ ) {
			Atom idx = atom(m_lits[i]);
			assert( idx < (int)task.n_atoms() );
			const FOD_Problem::Atom& a = *(task.atoms[idx]);
			if ( sign(m_lits[i]) ) {
				if ( !write_negated ) continue;
				os << "(not (" << a.name <<  "))";
			}
			else
				os << "(" << a.name << ")";
			if ( i < m_lits.size()-1 )
				os << ", ";
		}
			
		os << ")";

	}

	void	Clause::write_pddl( std::ostream& os, const FOD_Problem& task ) const {
		if ( m_lits.size() > 1 )
			os << "(and ";
		for ( unsigned i = 0; i < (unsigned)m_lits.size(); i++ ) {
			Atom idx = atom(m_lits[i]);
			assert( idx < (int)task.n_atoms() );
			const FOD_Problem::Atom& a = *(task.atoms[idx]);
			if ( sign(m_lits[i]) ) {
				os << "(not (" << a.name <<  "))";
			}
			else
				os << "(" << a.name << ")";
			if ( i < m_lits.size()-1 )
				os << " ";
		}
		if ( m_lits.size() > 1 )
			os << ")";

	}

	bool	Clause::inconsistent() const { 

		for ( unsigned i = 0; i < size(); i++ ) {

			Lit l_i = ~m_lits[i];
			if ( m_lits_bits.isset( toInt(l_i) ) )
				return true;
		}
		
		return false;
	}

	bool	Clause::satisfies( const Clause& other ) const {
		for ( auto it = other.begin(); it != other.end(); it++ )
			if ( !entails( *it ) )
				return false;
		return true;
	}

	bool	Clause::satisfies2( const Clause& other ) const {
		for ( auto it = other.begin(); it != other.end(); it++ )
			if ( entails( ~(*it) ) )
				return false;
		return true;
	}

	bool	Clause::implies( const Clause& other ) const {
		bool at_least_one = false;
		for ( auto it = other.begin(); it != other.end(); it++ ) {
			if ( entails( ~(*it) )  )
				return false;
			if ( entails( *it ) ) {
				at_least_one = true;
			}
		}
	
		for ( auto it = begin(); it != end(); it++ )
			if ( !other.entails(*it) ) return false;

		return at_least_one;
	}

	bool	Clause::implies( const Clause& other, Clause& missing ) const {
		bool at_least_one = false;
		for ( auto it = other.begin(); it != other.end(); it++ ) {
			if ( entails( ~(*it) )  )
				return false;
			if ( entails( *it ) ) {
				at_least_one = true;
			}
		}
	
		for ( auto it = begin(); it != end(); it++ )
			if ( !other.entails(*it) ) 
				missing.add( *it );

		return at_least_one;
	}

	void	
	Clause::add( const Clause& c ) {
		for ( auto it = c.begin(); it != c.end(); it++ )
			add(*it);
	}

	void
	Clause::set_union( const Clause& c ) {
		for ( auto it = c.begin(); it != c.end(); it++ )
			if (!entails(*it)) add(*it);
	}

}
