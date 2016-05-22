
#pragma once

#include <gp_atoms.hxx>
#include <iosfwd>

namespace aptk {

	class	FOD_Problem {

	public:

		struct Atom {
			std::string	name;
			unsigned	index;
			float		cost;
			
			Atom( const std::string& _name, unsigned i = 0 ) 
			: name( _name ), index(i) {
			}

			Atom( const Atom& a ) {
				name = a.name;
				index = a.index;
			}

			const Atom& operator=( const Atom& a ) {
				name = a.name;
				index = a.index;
				return *this;
			}

			bool	operator==( const Atom& other ) const {
				return index == other.index;
			}

			void	print( std::ostream& os, const FOD_Problem& model ) const;
		};

		typedef	std::vector< Atom* >	Atom_Vec;

		struct Effect {

			Clause	condition;
			Clause	effect;

			Effect() {
			}
		};


		typedef std::vector< Effect >	Effect_Vec;

		struct Action {

			std::string			name;
			size_t				index;
			Clause			precondition;
			Effect_Vec			effects;
			float				cost;

			Action( const std::string& _name, size_t i = 0 ) 
			: name( _name ), index(i), cost( 1.0f ) {
			}
			
			Action( const Action& a ) {
				name = a.name;
				index = a.index;
				precondition = a.precondition;
				effects = a.effects;
				cost = a.cost;
			}

			const Action& operator=( const Action& a ) {
				name = a.name;
				index = a.index;
				precondition = a.precondition;
				effects = a.effects;
				cost = a.cost;
				return *this;
			} 


			bool operator==( const Action& a ) { return index == a.index; }

			void print( std::ostream& os, const FOD_Problem& model ) const;
		};

		typedef	std::vector< const Action* >		Action_Vec;

		// needed to fix the ordering of actions
		class Action_Cmp {
		public:
			bool operator()( const Action* lhs, const Action* rhs ) const {
				return lhs->precondition.size() < rhs->precondition.size();
			}
		};

		struct Axiom
		{
			Clause	body;
			Clause	head;
			
			void		print( std::ostream& os, const FOD_Problem& model ) const;
		};

		typedef	std::vector< Axiom* >		Axiom_Vec;

		std::string				domain_name;
		std::string				problem_name;
		Atom_Vec				atoms;
		Action_Vec				actions;
		Axiom_Vec				axioms;
		std::vector< Action_Vec >		actions_requiring_var;
		Clause					init;
		Clause					goal;
		std::vector<Clause>			invariants;
		size_t					max_precondition_size;

		FOD_Problem( ) 
			: max_precondition_size(0) {
		}

		FOD_Problem( const std::string& dom, const std::string& prob ) 
			: domain_name( dom ), problem_name( prob ), max_precondition_size(0) {
		}


		virtual 	~FOD_Problem();

		 // access instance information
		size_t 		n_atoms() const { return atoms.size(); }
		size_t 		n_actions() const { return actions.size(); }


		Atom&		new_atom( const std::string& name );
		Action&		new_action( const std::string& name );
		
		void		add_invariant( const Clause& inv );

		void		add_axiom( const Clause& body, const Clause& head );
		void		close_under_axioms( const Clause& situation, Clause& closed_situation ) const;

		void		setup();

	protected:

		void		compute_var_to_action_table();
	};

}
