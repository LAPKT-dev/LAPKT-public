#ifndef __CONJ_COMP_PROB__
#define __CONJ_COMP_PROB__

#include <strips_prob.hxx>
#include <action.hxx>
#include <fl_conj.hxx>
#include <algorithm>
#include <utility>
#include <iosfwd>

namespace aptk {

namespace agnostic {

	class CC_Problem {

	public: // Nested classes

		typedef std::pair< Fluent_Vec, Fluent_Vec > CC_Cond_Eff;

		class CC_Action {
		public:
			CC_Action( const Action& a );
			~CC_Action();
			
			void	add_new_pre( unsigned p ) {
				m_pre.push_back( p );
			}

			void	add_new_eff( unsigned p ) {
				m_add.push_back( p );
			}

			void	add_new_cond_eff( Fluent_Vec& cond, Fluent_Vec& eff ) {
				m_cond_eff_list.push_back( std::make_pair( cond, eff ) );
			}

			const 	Fluent_Vec& pre() const { return m_pre; }

			bool	requires( unsigned p ) const {
				return std::find( m_pre.begin(), m_pre.end(), p ) != m_pre.end();
			}

			const	Fluent_Vec& add() const { return m_add; }

			bool	adds( unsigned p ) const {
				return std::find( m_add.begin(), m_add.end(), p ) != m_add.end();
			}

			float	cost( ) const { return original().cost(); }

			const	Action&	original() const { return m_orig_act; }

			const	std::vector<CC_Cond_Eff>& cond_effs() const { return m_cond_eff_list; }
			
			std::string signature() const { return m_orig_act.signature(); }

		protected:
			const Action&			m_orig_act;
			Fluent_Vec			m_pre;
			Fluent_Vec			m_add;
			std::vector<CC_Cond_Eff>	m_cond_eff_list;
		};

	public:
		
		CC_Problem( const STRIPS_Problem& prob, const std::vector<Fluent_Vec>& conjs );
		CC_Problem( const STRIPS_Problem& prob, const std::vector<Fluent_Conjunction*>& conjs );
		template <typename Mutex_Table >
		CC_Problem( const STRIPS_Problem& prob, const std::vector<Fluent_Conjunction*>& conjs, const Mutex_Table& mutexes ) 
		: m_orig_prob( prob ) {
			import_fluents_from_original();
			for ( auto it = conjs.begin(); it != conjs.end(); it++ ) {
				Fluent_Conjunction* fc = new Fluent_Conjunction( m_fluents.size(), (*it)->fluents() );
				m_fluents.push_back( fc );
				m_cfluents.push_back( m_fluents.back() );
			}
			make_actions();
			compute_actions_closure(mutexes);
			make_goal();		
		}
		CC_Problem( const STRIPS_Problem& prob, unsigned sz = 1 );
		virtual ~CC_Problem();
		unsigned		num_fluents() const  { return m_fluents.size(); }
		unsigned		num_actions() const  { return m_actions.size(); }

		const std::vector<const Fluent_Conjunction*>& fluents() const {
			return m_cfluents;
		}

		const std::vector<const CC_Action*>& actions() const {
			return m_cactions;
		}

		const Fluent_Vec&	goal() const { return m_goal; }
		const std::vector<const Action*>&
					empty_prec_actions() const { return m_orig_prob.empty_prec_actions(); }
	
		void	print_fluent( unsigned p, std::ostream& os ) const;
		void 	print_fluents( const Fluent_Vec& v, std::ostream& os ) const;
		void	print_fluents( std::ostream& os ) const;
		void	print_actions( std::ostream& os ) const;

		const std::vector<unsigned>&	requiring( unsigned p) const { return m_requiring[p]; }

		void  filter_subsumed( const std::vector<Fluent_Vec>& conjs, std::vector<Fluent_Conjunction*>& filtered ) const;
		void  filter_subsumed( const std::vector<Fluent_Vec>& conjs, std::vector<Fluent_Vec>& filtered ) const;

		Fluent_Conjunction*  	subsumed( const Fluent_Vec& ) const;
		bool  			subsumed( const Fluent_Conjunction& fc ) const ;
		void			flatten( const Fluent_Vec&, Fluent_Vec& ) const;
		bool			subsumed_flat( const Fluent_Vec& C ) const;

		template <typename Mutex_Table >
		void	compute_actions_closure( const Mutex_Table& mutex_table ) {
			for ( unsigned c = m_orig_prob.num_fluents(); c < num_fluents(); c++ ) {
				Fluent_Conjunction& pc = *(m_fluents[c]);
				for ( unsigned a = 0; a < m_actions.size(); a++ ) {
					CC_Action& act = *(m_actions[a]);
					if ( pc.in_set( act.pre() ) ) {
						//std::cout << "Conjunction ";
						//print_fluent( c, std::cout );
						//std::cout << " added to precondition of " << act.signature() << std::endl;
						act.add_new_pre( c );
						m_requiring[c].push_back( a );
					}
					if ( pc.in_set( act.add() ) ) {
						//std::cout << "Conjunction ";
						//print_fluent( c, std::cout );
						//std::cout << " added to add(a) of " << act.signature() << std::endl;
						act.add_new_eff( c );
					}
					if ( 	pc.intersects( act.original().add_vec() ) 
						&& !pc.intersects( act.original().del_vec() ) ) {
						//if ( !mutex_table.is_mutex( flat_pc ) ) {
							Fluent_Vec cond, eff;
						
							cond = act.original().prec_vec();
							for ( auto fl_it = pc.fluents().begin(); fl_it != pc.fluents().end(); fl_it++ )
								if ( std::find( act.original().add_vec().begin(), act.original().add_vec().end(), *fl_it ) == act.original().add_vec().end() )
									cond.push_back( *fl_it );
							Fluent_Vec flat_pc;
							flatten( cond, flat_pc );
							if ( !mutex_table.is_mutex( flat_pc ) ) {

								for ( unsigned c2 = m_orig_prob.num_fluents(); c2 < num_fluents(); c2++ ) {
									Fluent_Conjunction& pc2 = *(m_fluents[c2]);
									if ( pc2.in_set(cond) )
										cond.push_back(c2);								
								}
								//std::cout << "Conjunction ";
								//print_fluent( c, std::cout );
								//std::cout << " added to conditional effect of " << act.signature() << std::endl;
								eff.push_back( c );
								act.add_new_cond_eff( cond, eff );
							}
					}	
				}	
			}
		}


	protected: 
		void 		import_fluents_from_original();	
		void 		enumerate_binary_conjunctions();
		void		compute_actions_closure();
		void		make_actions();
		void		make_goal();
		void		compute_relevant_C_fluents( const Fluent_Vec& vec, std::vector<Fluent_Conjunction*>& rel );
	
	protected:

		const STRIPS_Problem&			m_orig_prob;
		std::vector<Fluent_Conjunction*>	m_fluents;
		std::vector<const Fluent_Conjunction*>  m_cfluents;
		std::vector<CC_Action*>			m_actions;
		std::vector<const CC_Action*>		m_cactions;
		Fluent_Vec				m_goal;
		std::vector< std::vector< unsigned > >	m_requiring;
	};

}

}

#endif // conj_comp_prob.hxx
