
#pragma once

#include <cassert>
#include <limits>
#include <vector>
#include <iosfwd>
#include <algorithm>
#include <bit_array.hxx>
#include <utility>

namespace aptk {
// Code borrowed from MiniSAT 2.2.1

//=================================================================================================
// Atoms, literals, lifted booleans, clauses:


// NOTE! Atoms are just integers. No abstraction here. They should be chosen from 0..N,
// so that they can be used as array indices.

typedef int Atom;
#define atom_Undef (-1)


struct Lit {
    	int     x;
	
	// Use this as a constructor:
	friend Lit mkLit(Atom atom, bool sign = false);
	friend Lit mkLit3( int x );
	
	bool operator == (Lit p) const { return x == p.x; }
	bool operator != (Lit p) const { return x != p.x; }
	bool operator <  (Lit p) const { return x < p.x;  } // '<' makes p, ~p adjacent in the ordering.
};


inline  Lit  mkLit     (Atom atom, bool sign) { Lit p; p.x = atom + atom + (int)sign; return p; }

inline	Lit  mkLit2    (int f )		    { 
	return f < 0 ? mkLit( -f - 1, true ) : mkLit( f-1, false );
}

inline 	Lit mkLit3	(int x) {
	Lit p; p.x = x; return p;
}

inline  Lit  operator ~(Lit p)              { Lit q; q.x = p.x ^ 1; return q; }
inline  Lit  operator ^(Lit p, bool b)      { Lit q; q.x = p.x ^ (unsigned int)b; return q; }
inline  bool sign      (Lit p)              { return p.x & 1; }
inline  int  atom       (Lit p)              { return p.x >> 1; }


inline int   effect( Lit p ) { return sign(p) ? -(atom(p) + 1) : atom(p) + 1; }


// Mapping Literals to and from compact integers suitable for array indexing:
inline  int  toInt     (Atom v)              { return v; } 
inline  int  toInt     (Lit p)              { return p.x; } 
inline  Lit  toLit     (int i)              { Lit p; p.x = i; return p; } 

//const Lit lit_Undef = mkLit(atom_Undef, false);  // }- Useful special constants.
//const Lit lit_Error = mkLit(atom_Undef, true );  // }

const Lit lit_Undef = { -2 };  // }- Useful special constants.
const Lit lit_Error = { -1 };  // }

typedef std::vector<Lit>	LitVec;

//=================================================================================================
// Lifted booleans:
//
// NOTE: this implementation is optimized for the case when comparisons between values are mostly
//       between one atomiable and one constant. Some care had to be taken to make sure that gcc 
//       does enough constant propagation to produce sensible code, and this appears to be somewhat
//       fragile unfortunately.

//#define l_True  (lbool((uint8_t)0)) // gcc does not do constant propagation if these are real constants.
//#define l_False (lbool((uint8_t)1))
//#define l_Undef (lbool((uint8_t)2))


class lbool {
    uint8_t value;

public:
    explicit lbool(uint8_t v) : value(v) { }

    lbool()       : value(0) { }
    explicit lbool(bool x) : value(!x) { }

    bool  operator == (lbool b) const { return ((b.value&2) & (value&2)) | (!(b.value&2)&(value == b.value)); }
    bool  operator != (lbool b) const { return !(*this == b); }
    lbool operator ^  (bool  b) const { return lbool((uint8_t)(value^(uint8_t)b)); }

    lbool operator && (lbool b) const { 
        uint8_t sel = (this->value << 1) | (b.value << 3);
        uint8_t v   = (0xF7F755F4 >> sel) & 3;
        return lbool(v); }

    lbool operator || (lbool b) const {
        uint8_t sel = (this->value << 1) | (b.value << 3);
        uint8_t v   = (0xFCFCF400 >> sel) & 3;
        return lbool(v); }

    friend int   toInt  (lbool l);
    friend lbool toLbool(int   v);
};

const lbool l_True = lbool((uint8_t)0);
const lbool l_False = lbool((uint8_t)1);
const lbool l_Undef = lbool((uint8_t)2);

inline int   toInt  (lbool l) { return l.value; }
inline lbool toLbool(int   v) { return lbool((uint8_t)v);  }

class FOD_Problem;

class Clause {
	
	public:
		Clause()
		: m_lits_bits( m_num_lits )  {
		}		

		Clause( const LitVec& lits ) 
		: m_lits_bits( m_num_lits ) {
			m_lits.reserve( lits.size() );
			m_lits.assign( lits.begin(), lits.end() );
			for ( auto it = m_lits.begin(); it != m_lits.end(); it++ ) 
				m_lits_bits.set( toInt(*it) );
		}

		Clause( const Clause& other ) 
		: m_lits_bits( other.m_lits_bits ) {
			m_lits.reserve( other.size() );
			m_lits.assign( other.begin(), other.end() );
		}

		Clause( Clause&& other ) 
		: m_lits( std::move( other.m_lits ) ),
		m_lits_bits( std::move( other.m_lits_bits ) ) {
		}

		const Clause& operator=( Clause&& other ) {
			m_lits = std::move( other.m_lits );
			m_lits_bits = std::move( other.m_lits_bits );
			return *this;
		}

		const Clause& operator=( const Clause& other ) {
			m_lits.reserve( other.size() );
			for ( auto it = other.begin(); it != other.end(); it++ ) 
				add(*it);
			return *this;
		}

		// Generic container with lits provided as {+,-}(atom+1)
		template <typename Container>
		Clause( const Container& lits ) 
		: m_lits_bits( m_num_lits ) {
			m_lits.reserve( lits.size() );
			for ( auto it = lits.begin(); it != lits.end(); it++ ) {
				m_lits.push_back( mkLit2( *it ) );
				m_lits_bits.set( toInt( m_lits.back() ) );
			}
		}

		~Clause();

		bool	operator==( const Clause& o ) const {
			if ( size() != o.size() ) return false;
			for ( auto it = begin(); it != end(); it++ ) {
				if ( !o.m_lits_bits.isset( toInt(*it) ) )
					return false;
			}

			for ( auto it = o.begin(); it != o.end(); it++ ) {
				if ( !m_lits_bits.isset( toInt(*it) ) )
					return false;
			}
			
			return true;
		}

		template < typename Hasher > 
		void	update_hash( Hasher& h ) const {
			h.add( m_lits_bits.packs(), m_lits_bits.npacks() );
		}

		void	resize_bitmap() { m_lits_bits.resize( m_num_lits ); }

		bool	satisfies( const Clause& other ) const;
		bool	satisfies2( const Clause& other ) const;

		template < typename Precondition, typename Effect >
		bool	apply( const Precondition& prec, const Effect& eff, Clause& succ ) const {

			if ( !satisfies( prec ) ) return false;
			
			for ( auto eff_it = eff.begin(); eff_it != eff.end(); eff_it++ ) {
				if ( eff_it->condition.empty() || satisfies( eff_it->condition ) )
					succ.add( eff_it->effect );
			}
	
			for ( auto it = begin(); it != end(); it++ ) {
				if ( !succ.entails(*it) && !succ.entails( ~(*it) ) )
					succ.add( *it );
			}
			return true;
		}

		bool	is_defined( Lit l ) const { return entails(l) || entails(~l); }

		bool	implies( const Clause& other ) const;

		bool	implies( const Clause& other, Clause& missing ) const;

		bool	inconsistent() const;

		void	write( std::ostream& os ) const;

		void	write( std::ostream& os, const FOD_Problem& i, bool write_negated = true ) const;

		void	write_pddl(  std::ostream& os, const FOD_Problem& i ) const; 
 
		void	clear() 			{ m_lits_bits.reset(); m_lits.clear(); }
		void	reserve( size_t sz ) 		{ m_lits.reserve( sz ); }
		void	sort();

		typedef	LitVec::iterator iterator;
		
		LitVec::iterator	begin() 	{ return m_lits.begin(); }
		LitVec::iterator	end() 		{ return m_lits.end(); }
		LitVec::const_iterator	begin() const	{ return m_lits.begin(); }
		LitVec::const_iterator	end() 	const	{ return m_lits.end(); }

		size_t			size() const	{ return m_lits.size(); }
		bool			empty() const	{ return m_lits.empty(); }

		void			add( Lit l )	{ 
			if ( m_lits_bits.isset( toInt(l) ) ) return;
			m_lits.push_back( l ); 
			m_lits_bits.set( toInt(l) ); 
		}

		void			remove( Lit l ) {
			assert( m_lits_bits.isset( toInt(l) ) );
			m_lits_bits.unset( toInt(l) );
			unsigned i = m_lits.size();
			for ( unsigned k = 0; k < m_lits.size(); k++ ) {
				if ( m_lits[k] == l ) {
					i = k;
					break;
				}
			}
			assert( i != m_lits.size() );
			for ( unsigned k = i+1; k < m_lits.size(); k++ ) 
				 m_lits[k-1] = m_lits[k];
			m_lits.resize( m_lits.size() - 1 );
		}


		lbool	
		value( Atom v ) const {
			if ( entails( mkLit( v ) ) ) return l_True;
			if ( entails( mkLit( v, true) ) ) return l_False;
			return l_Undef;	
		}

		void			add( const Clause& c );

		template <typename Container>
		void add( const Container& lits ) {
 
			m_lits.reserve( m_lits.size() + lits.size() );
			for ( auto it = lits.begin(); it != lits.end(); it++ ) {
				m_lits.push_back( mkLit2( *it ) );
				m_lits_bits.set( toInt( m_lits.back() ) );
			}
		}



		bool			entails( Lit l ) const { return m_lits_bits.isset( toInt(l) ); }
	
		void			set_union( const Clause& other );	

		Lit&			operator[]( size_t i ) { return m_lits.at(i); }
		Lit			operator[]( size_t i ) const { return m_lits.at(i); }

		static void		set_num_lits( unsigned sz );

		static unsigned		num_lits();

		size_t			nbytes() const {
			size_t nbytes = sizeof( Clause );
			nbytes += sizeof(aptk::Bit_Array) + m_lits_bits.nbytes();
			nbytes += sizeof(LitVec) + m_lits.size()*sizeof(Lit);
			return nbytes;
		}
	private:
		LitVec			m_lits;
		aptk::Bit_Array		m_lits_bits;
		static	unsigned	m_num_lits;
};

}

