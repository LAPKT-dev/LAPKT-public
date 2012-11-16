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

			Cost_Type	cost( ) const { return original().cost(); }

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

		const std::vector<unsigned>&	requiring( unsigned p) const { return m_requiring[p]; }

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
