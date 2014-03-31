#ifndef __PROP_H2__
#define __PROP_H2__

#include <queue>
#include <list>
#include <fod_problem.hxx>
#include <gp_atoms.hxx>
#include <bit_array.hxx>
#include <judy_set.hxx>
#include <ext_math.hxx>

namespace aptk {

	class	Rule_Based_H2_Heuristic {
		typedef	std::vector< float >	ValueTable;

	public:
		Rule_Based_H2_Heuristic( const FOD_Problem& model );
				
		~Rule_Based_H2_Heuristic();

		void	setup( bool use_invariants = false);
 
		float	value( Lit p, Lit q ) const {
			return m_values[ index( p, q ) ];
		}

		const	LitVec& consequences( Lit l ) const {
			return m_consequences.at(toInt(l));
		}

		float	eval( const Clause& c ) const {
			//std::cout << "Evaluation: " << std::endl;
			float h_val = 0.0f;
			auto c_end = c.end();
			for ( auto pi = c.begin(); pi != c_end; pi++ ) {
				int base = toInt(*pi) * m_num_lits;
				for ( auto pj = pi; pj != c_end; pj++ ) {
					/*
					std::cout << "\t";
					print_pair( base + toInt(*pj), std::cout );
					std::cout << " -> " << m_values[ base + toInt(*pj) ];
					std::cout << std::endl;
					*/
					h_val = std::max( m_values[ base + toInt(*pj) ], h_val );
					if ( h_val == infty ) return h_val;
				}
			}
			//std::cout << h_val << std::endl;
			return h_val;
		}

		float	eval( const Clause& c, const Clause& d ) const {
			float h_val = 0.0f;
			auto c_start = c.begin();
			auto d_start = d.begin();
			auto c_end = c.end();
			auto d_end = d.end();
			for ( auto pi = c_start; pi != c_end; pi++ ) {
				int base = toInt(*pi) * m_num_lits;
				for ( auto pj = pi; pj != c_end; pj++ ) {
					h_val = std::max( m_values[ base + toInt(*pj) ], h_val );
					if ( h_val == infty ) return h_val;
				}
				for ( auto pj = d_start; pj != d_end; pj++ ) {
					h_val = std::max( m_values[ base + toInt(*pj) ], h_val );
					if ( h_val == infty ) return h_val;
				}
			}
			for ( auto pi = d_start; pi != d_end; pi++ ) {
				int base = toInt(*pi) * m_num_lits;
				for ( auto pj = pi; pj != d_end; pj++ ) {
					h_val = std::max( m_values[ base + toInt(*pj) ], h_val );
					if ( h_val == infty ) return h_val;
				}
			}

			return h_val;
		}

		void	set_value( int index, float v ) {
			m_values[ index ] = v;
			m_values[ symmetric_index( index ) ] = v;
		}

		bool	update_value( int index, float v ) {
			if ( fabs ( v - m_values[ index ] ) < 1e-7  ) return false;
			if ( ( v - m_values[index] ) > 1e-7 ) return false;
			/*
			if ( m_values[index] == infty ) {
				m_reachable.set( first_index(index) );
				m_reachable.set( second_index(index) );
			}
			*/
			m_values[ index ] = v;
			m_values[ symmetric_index( index ) ] = v;
			return true;
		}
		
		void 
		add_consequences( const Clause& c1, Clause& c2 ) const {
			bool changed;
			c2.add(c1);
			unsigned start = 0;
			Clause tmp;
			do {
				changed = false;
				for ( unsigned j = start; j < c2.size(); j++ ) {
					assert( toInt(c2[j]) >= 0 );
					assert( toInt(c2[j]) < (int)m_consequences.size() );
					for ( auto con_it = m_consequences.at(toInt(c2[j])).begin();
						con_it != m_consequences.at(toInt(c2[j])).end(); con_it++ ) {
						if ( tmp.entails( *con_it ) || c2.entails( *con_it)  ) continue;
						tmp.add( *con_it );
						changed = true;
					}
				}
				start += c2.size();
				c2.add(tmp);
				tmp.clear();
			} while (changed);
		}
	
		void		build_propagation_rules();
		void 		initialize();
		void		compute();
		void		compute_from_model_invariants();
		void 		extract_consequences_table();
		void 		print( std::ostream& os ) const;
		void		print_pair( int index, std::ostream& os ) const;
		void		print_consequences( std::ostream& os ) const;

		void		set_verbose_computation( bool v ) { m_verbose_computation = v; }

		unsigned	num_rules() const { return m_prop_rules.size(); }
		unsigned	num_rules_fired() const { return m_rules_fired; }
		unsigned	num_noop_checks() const { return m_noop_checks; }

	protected: // helper data structures

		class Rule {
		public:
			Clause			m_condition;
			Clause			m_prevail;
			unsigned			m_cond_top;
			Clause			m_effect;
			float				m_value;
			const FOD_Problem::Action*	m_action;
			std::vector< int >		m_effects;
			aptk::Bit_Array			m_noop_mask;
						
			Rule( const FOD_Problem::Action* a, const Clause& condition );
			Rule( const FOD_Problem::Action* a );
			Rule( const Rule& r );
			const  Rule& operator=( const Rule& r );
			~Rule() {}

			void				update_reachability( const Rule_Based_H2_Heuristic& h, int pair_index );

			bool				reachable() const { return m_cond_top == m_condition.size(); }

			double				footprint_size() const;

			void write( std::ostream& os, const FOD_Problem& model ) const;
		};
		

		class	Trigger  {
		public:
			Trigger( Rule* r )
			: m_is_noop( false ), m_noop_idx(-1), m_rule( r ) {}

			Trigger( int idx, Rule* r )
			: m_is_noop(true), m_noop_idx( idx ), m_rule(r) {}

			Trigger( const Trigger& o ) 
			: m_is_noop( o.m_is_noop ), m_noop_idx( o.m_noop_idx ), m_rule( o.m_rule ) {}

			Trigger( Trigger&& o ) 
			: m_is_noop( o.m_is_noop ), m_noop_idx( o.m_noop_idx), m_rule( o.m_rule ) {
			}

			const Trigger&	operator=( const Trigger& o ) {
				m_is_noop = o.m_is_noop;
				m_noop_idx = o.m_noop_idx;
				m_rule = o.m_rule;
				return *this;
			}
			
			~Trigger() {}

			bool				is_noop() const { return m_is_noop; }
			Rule*				rule() { return m_rule; }
			int				noop_idx() const { return m_noop_idx; }
		private:
			bool				m_is_noop;
			int				m_noop_idx;
			Rule*				m_rule;
		};

		void	
		register_rule( Rule* r );

		void
		register_rule_triggers();

		void
		release_resources();

	protected: // propagation
		
		void
		notify_update( int index ) {
			if ( m_updated_hash.isset(index) ) return;
			//m_updated.push_back( index );
			m_updated.push( index );
			m_updated_hash.set( index );
		}

		void
		mark_as_processed( int index ) {
			assert( index == m_updated.front() );
			//m_updated.pop_front();
			m_updated.pop();
			m_updated_hash.unset( index );
		}

	protected: // indexing

		inline	int	index( int p, int q ) const {
			return p * m_num_lits + q;
		}


		inline	int	index( const Lit& p, const Lit& q ) const {
			return index( toInt(p), toInt(q) );
		}

		inline	int	first_index( int index ) const{
			return index / m_num_lits;
		}

		inline  int	second_index( int index ) const{
			return index % m_num_lits;
		}

		inline Lit	first( int index ) const{
			return mkLit3( first_index( index ) );
		}

		inline Lit	second( int index ) const{
			return mkLit3( second_index( index ) );
		}

		inline	int 	symmetric_index( int _index ) const{
			int i = first_index( _index );
			int j = second_index( _index );
			return ( i == j ? _index : index( j, i ) );
		}

	private:
		const FOD_Problem& 			m_model;
		ValueTable				m_values;
		std::vector< LitVec>			m_consequences;
		int					m_num_lits;
		std::queue< int, std::list<int> >	m_updated;
		aptk::Bit_Array				m_updated_hash;
		std::vector< Rule* >			m_prop_rules;
		std::vector< Trigger* >			m_triggers;
		//std::vector< std::vector< Trigger* > >	m_eff_idx_to_rule;
		//std::vector< Judy_Set >			m_eff_idx_to_rule;
		Judy_Set				m_eff_idx_to_rule;	
		unsigned				m_rules_fired;
		unsigned				m_noop_checks;
		double					m_rules_footprint;
		unsigned				m_num_trigger_refs;
		bool					m_verbose_computation;
	};

}

#endif // prop_h2.hxx
