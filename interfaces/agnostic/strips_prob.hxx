#ifndef __STRIPS_PROBLEM__
#define __STRIPS_PROBLEM__

#include <string>
#include <map>
#include <iosfwd>
#include <types.hxx>
#include <succ_gen.hxx>

namespace aptk
{

	class STRIPS_Problem
	{
	public:
	
		STRIPS_Problem();
		~STRIPS_Problem();

		unsigned 		num_fluents() const		{ return m_num_fluents; }
		unsigned 		num_actions() const		{ return m_num_actions; }

		void			set_num_fluents( unsigned nf ) { m_num_fluents = nf; }
		void			set_num_actions( unsigned na ) { m_num_actions = na; }

		static unsigned 	add_action( STRIPS_Problem& p, std::string signature,
						    Fluent_Vec& pre, Fluent_Vec& add, Fluent_Vec& del,
						    Conditional_Effect_Vec& ceffs, float cost = 1.0f );

		static unsigned 	add_fluent( STRIPS_Problem& p, std::string signature );

		static void		set_init( STRIPS_Problem& p, Fluent_Vec& init );
		static void		set_goal( STRIPS_Problem& p, Fluent_Vec& goal, bool createEndOp = true );

	  	
		Fluent_Ptr_Vec&		fluents() 			{ return m_fluents; }
		Action_Ptr_Vec&		actions() 			{ return m_actions; }
		const std::vector< const Fluent*>&	
					fluents() const			{ return m_const_fluents; }
		const std::vector< const Action*>&
					actions() const			{ return m_const_actions; }


		Fluent_Vec&		init()	  			{ return m_init; }
		Fluent_Vec&		goal()	  			{ return m_goal; }
		const Fluent_Vec&	init() const  			{ return m_init; }
		const Fluent_Vec&	goal() const  			{ return m_goal; }

		std::vector<const Action*>&		
					actions_adding( unsigned f )		{ return m_adding[f]; }

		std::vector< std::pair< unsigned, const Action*> >&
					ceffs_adding( unsigned f )		{ return m_ceffs_adding[f]; }

		const std::vector< std::pair< unsigned, const Action*> >&
					ceffs_adding( unsigned f ) const	{ return m_ceffs_adding[f]; }

		std::vector<const Action*>&		
					actions_deleting( unsigned f )		{ return m_deleting[f]; }
		std::vector<const Action*>&		
					actions_requiring( unsigned f )		{ return m_requiring[f]; }
		const std::vector<const Action*>&		
					actions_adding( unsigned f ) const	{ return m_adding[f]; }
		const std::vector<const Action*>&		
					actions_deleting( unsigned f ) const	{ return m_deleting[f]; }
		const std::vector<const Action*>&		
					actions_requiring( unsigned f ) const	{ return m_requiring[f]; }

		const std::vector<const Action*>&
					empty_prec_actions() const 		{ return m_empty_precs; }

		void			applicable_actions( const State& s, std::vector<const Action* >& actions  ) const {
			m_succ_gen.retrieve_applicable(s,actions);
		}
		
		void			applicable_actions( const State& s, std::vector<int>& actions ) const {
			m_succ_gen.retrieve_applicable(s,actions);
		}

		void			applicable_actions( const std::vector<float>& v, std::vector<const Action*>& actions ) const {
			m_succ_gen.retrieve_applicable( v, actions );
		}

		bool			is_in_init( unsigned f )	{ return m_in_init[f]; }
		bool			is_in_goal( unsigned f )	{ return m_in_goal[f]; }

		void                    print_fluent_vec(const Fluent_Vec &a);
		unsigned                end_operator() { return m_end_operator_id; }
	        unsigned                get_fluent_index(std::string signature);

		void			make_action_tables();

		void			print( std::ostream& os ) const;
		void			print_fluents( std::ostream& os ) const;
		void			print_actions( std::ostream& os ) const;
		void			print_fluent_vec( std::ostream& os, const Fluent_Vec& v ) const;	
		const agnostic::Successor_Generator&
					successor_generator() const { return m_succ_gen; }	
	protected:
	
		void			increase_num_fluents()        	{ m_num_fluents++; }
		void			increase_num_actions()        	{ m_num_actions++; }
		void			register_action_in_tables( Action* act );

	protected:

		unsigned		 				m_num_fluents;
		unsigned		 				m_num_actions;
		Action_Ptr_Vec		 				m_actions;
		std::vector<const Action*>				m_const_actions;
		Fluent_Ptr_Vec		 				m_fluents;
		std::vector<const Fluent*>				m_const_fluents;
		Fluent_Vec		 				m_init;
		Fluent_Vec		 				m_goal;
		Fluent_Action_Table	 				m_adding;
		Fluent_Action_Table	 				m_requiring;
		Fluent_Action_Table	 				m_deleting;
		std::vector<bool>	 				m_in_init;
		std::vector<bool>	 				m_in_goal;
		unsigned                 				m_end_operator_id;
	  	std::map<std::string,int> 				m_fluents_map;
		agnostic::Successor_Generator				m_succ_gen;
		std::vector< const  Action* >   			m_empty_precs;
		std::vector< std::vector< std::pair< unsigned, const Action* > > >	m_ceffs_adding;
	  };

}

#endif // STRIPS_Problem.hxx
