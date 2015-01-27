#include <fod_problem.hxx>
#include <iostream>
#include <algorithm>

namespace aptk {

	FOD_Problem::~FOD_Problem() {
	}

	FOD_Problem::Atom&
	FOD_Problem::new_atom( const std::string& name ) {
		Atom*	a = new Atom( name, atoms.size() );
		atoms.push_back( a );

		Clause::set_num_lits( 2*(atoms.size()) );
		init.resize_bitmap();
		goal.resize_bitmap();
		return *a;
	}
		
	FOD_Problem::Action&
	FOD_Problem::new_action( const std::string& name ) {
		Action* a = new Action( name, actions.size() );
		actions.push_back( a );

		return *a;
	}

	void
	FOD_Problem::add_invariant( const Clause& inv ) {
		invariants.push_back( inv );
	}

	void
	FOD_Problem::Atom::print( std::ostream& os, const FOD_Problem& model ) const {
		os << name;
	}

	void
	FOD_Problem::Action::print( std::ostream& os, const FOD_Problem& model ) const {
		os << name << std::endl;
		os << "Precondition: ";
		precondition.write_pddl( os, model );
		os << std::endl;
		os << "Effects: " << std::endl;
		for ( const Effect& eff : effects ) {
			eff.condition.write_pddl( os, model );
			os << " -> " << std::endl;
			os << "\t";
			eff.effect.write_pddl( os, model );
			os << std::endl;
		}
		os << std::endl;
		
	}

	void
	FOD_Problem::Axiom::print( std::ostream& os, const FOD_Problem& model ) const {
		os << "Axiom: ";
		os << "Head: ";
		head.write( os, model, true );
		os << " Body: ";
		body.write( os, model, true );
		os << std::endl;
	}

	void
	FOD_Problem::compute_var_to_action_table() {

		actions_requiring_var.resize( atoms.size() );

		for ( const Action* a : actions ) {
			for ( Atom* x : atoms ) {
				Lit lp = mkLit( x->index, false );
				Lit ln = mkLit( x->index, true );
				if ( a->precondition.entails(lp) || a->precondition.entails(ln) )
					actions_requiring_var[ x->index ].push_back( a );		
			}			

		}

	}

	void 
	FOD_Problem::setup() {
		std::sort( actions.begin(), actions.end(), Action_Cmp() );
		for ( unsigned k = 0; k < actions.size(); k++ )
			const_cast<Action*>(actions[k])->index = k;

		compute_var_to_action_table();
	}

	void
	FOD_Problem::add_axiom( const Clause& body, const Clause& head ) {
		Axiom* ax = new Axiom;
		ax->body = body;
		ax->head = head;
		axioms.push_back( ax );
	}

	void
	FOD_Problem::close_under_axioms( const Clause& situation, Clause& closed ) const {
		
		bool changed;
		Clause  current = situation;
		
		do {
			changed = false;
			for ( auto axiom : axioms ) {
				if ( current.satisfies(  axiom->head ) )
					continue;
				if ( current.satisfies( axiom->body ) ) {
					changed = true;
					current.add( axiom->head );	
				}
			}

		} while( changed );
	
		closed = current;
	}
	

}
