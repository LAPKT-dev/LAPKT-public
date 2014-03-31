/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef __SUCCESSOR_GENERATOR__
#define __SUCCESSOR_GENERATOR__

#include <deque>
#include <vector>
#include <fod_problem.hxx>
#include <iostream>

namespace aptk {

// Fast-Downward ("The Fast-Downward Planning System", Helmert, M., 2006) successor generator data structure

template <typename State >	
class	Successor_Generator {

	static constexpr	unsigned no_such_index = std::numeric_limits<unsigned>::max();
	static constexpr	float infty	= std::numeric_limits<float>::max();

	class	Node {
	public:

		Node( unsigned p = no_such_index ) 
		: m_selection_fluent( p ), m_true_child( no_such_index ), m_false_child( no_such_index), m_dont_care_child( no_such_index ) {
		}

		~Node() {}

		unsigned	selection_fluent() const { return m_selection_fluent; }

		std::vector<const FOD_Problem::Action*>&		actions() { return m_actions; }
		const std::vector<const FOD_Problem::Action*>&	actions() const { return m_actions; }
		
		bool		selection_node() const { return m_selection_fluent != no_such_index; }
	
		void		set_true_child( unsigned i ) { m_true_child = i; }
		void		set_false_child( unsigned i ) { m_false_child = i; }
		void		set_dont_care_child( unsigned i ) { m_dont_care_child = i; }
		unsigned	true_child() const { return m_true_child; }
		unsigned	false_child() const { return m_false_child; }
		unsigned	dont_care_child() const { return m_dont_care_child; }

		void		set_true_num_actions( unsigned num ) { m_num_act_true_child = num; }
		void		set_false_num_actions( unsigned num ) { m_num_act_false_child = num; }
		void		set_dont_care_num_actions( unsigned num ) { m_num_act_dont_care_child = num; }
		unsigned	true_num_actions() const { return m_num_act_true_child; }
		unsigned	false_num_actions() const { return m_num_act_false_child; }
		unsigned	dont_care_num_actions() const { return m_num_act_dont_care_child; }

	private:
		unsigned					m_selection_fluent;
		std::vector<const FOD_Problem::Action*>		m_actions;
		unsigned					m_true_child;
		unsigned					m_false_child;
		unsigned					m_dont_care_child;
		unsigned					m_num_act_true_child;
		unsigned					m_num_act_false_child;
		unsigned					m_num_act_dont_care_child;
	};

public:

	class	Iterator {
	public:
		Iterator( const State& s, const std::vector<Node*>& nodes );
		~Iterator();

		int	first();
		int	advance();
		int 	next();
		int	last() { return -1; }
	private:
		const State&			m_state;
		const std::vector<Node*>&	m_nodes;
		const Node*			m_current_node;
		unsigned			m_index;
		std::deque<const Node*>		m_open;
		//std::vector<bool>		m_open;
		unsigned			m_open_index;
	};

	Successor_Generator( const FOD_Problem& prob ) 
	: m_problem( prob )  {
	}

	~Successor_Generator();

	void	build();

	void	retrieve_applicable( const State& s, std::vector<const FOD_Problem::Action*>& actions ) const;	
	void	retrieve_applicable( const State& s, std::vector<unsigned>& actions ) const;
	void	retrieve_applicable( const std::vector<float>& v, std::vector<const FOD_Problem::Action*>& actions ) const;

	const std::vector<Node*>&	nodes() const { return m_nodes; }
	void				dump_tree( std::ostream& os ) const;
protected:

	void		build_fluent_ordering( std::vector<unsigned>& ord_fluents );
	unsigned	make_nodes( unsigned index, std::vector<unsigned>& ord_fluents, const std::vector<const FOD_Problem::Action*>& actions );
	void		dump_tree( unsigned depth, unsigned node_index, std::ostream& os ) const;

private:

	const FOD_Problem&		m_problem;
	std::vector<Node*>		m_nodes;
};

template <typename State>
Successor_Generator<State>::~Successor_Generator() {

	for ( unsigned k = 0; k < m_nodes.size(); k++ ) {
		delete m_nodes[k];
	} 
}

class	Fluent_Cmp {
public:
	Fluent_Cmp( const FOD_Problem& p ) 
	: m_problem( p ) {
	}

	bool operator()( Atom l, Atom r ) const {
		return m_problem.actions_requiring_var[l].size() > m_problem.actions_requiring_var[r].size();
	}

	const FOD_Problem&	m_problem;
};

template <typename State>
void	Successor_Generator<State>::build_fluent_ordering( std::vector<unsigned>& ord_fluents ) {
	
	for ( unsigned k = 0; k < m_problem.atoms.size(); k++ ) {
		unsigned op_count = m_problem.actions_requiring_var[k].size();
		if ( op_count == 0 ) continue;
		ord_fluents.push_back( k );
	}

	std::sort( ord_fluents.begin(), ord_fluents.end(), Fluent_Cmp( m_problem ) );
}

template <typename State>
unsigned Successor_Generator<State>::make_nodes( unsigned index, std::vector<unsigned>& F, const std::vector<const FOD_Problem::Action*>& acts ) {
	if ( acts.empty() ) return no_such_index;

	// Leaf Node
	if ( index == F.size() ) {
		Node* n = new Node;
		unsigned node_index = m_nodes.size();
		m_nodes.push_back(n);
		for ( unsigned k = 0; k < acts.size(); k++ )
			n->actions().push_back( acts[k] );
		return node_index;
	}

	// Split action set
	std::vector<const FOD_Problem::Action*>	true_set;
	std::vector<const FOD_Problem::Action*> false_set;
	std::vector<const FOD_Problem::Action*>	dont_care_set;

	do {
		true_set.clear();
		false_set.clear();
		dont_care_set.clear();

		for ( unsigned k = 0; k < acts.size(); k++ ) {
			if ( acts[k]->precondition.entails( mkLit(F[index], false) ) ) {
				true_set.push_back( acts[k] );
			}
			else if ( acts[k]->precondition.entails( mkLit(F[index], true) ) ) {
				false_set.push_back( acts[k] );
			}
			else {
				dont_care_set.push_back( acts[k] ); 
			}
		}
		if ( true_set.empty() && false_set.empty() ) {
			index++;
			continue;
		}
		else
			break;
	} while ( index < F.size()  );
	
	// Leaf Node
	if ( index == F.size() ) {
		Node* n = new Node;
		unsigned node_index = m_nodes.size();
		m_nodes.push_back(n);
		for ( unsigned k = 0; k < acts.size(); k++ )
			n->actions().push_back( acts[k] );
		return node_index;
	}

	Node* n = new Node( F[index] );
	unsigned node_index = m_nodes.size(); 
	m_nodes.push_back(n);
	n->set_true_num_actions( true_set.size() );
	n->set_false_num_actions( false_set.size() );
	n->set_dont_care_num_actions( dont_care_set.size() );

	if ( !true_set.empty() ) {
		unsigned true_child = make_nodes( index + 1, F, true_set );
		n->set_true_child( true_child );
	}

	if ( !false_set.empty() ) {
		unsigned false_child = make_nodes( index + 1, F, false_set );
		n->set_false_child( false_child );
	}

	if ( !dont_care_set.empty() ) {
		unsigned dont_care_child = make_nodes( index + 1, F, dont_care_set );
		n->set_dont_care_child( dont_care_child );
	}

	return node_index;
} 

template <typename State>
void	Successor_Generator<State>::build() {

	std::vector<unsigned> ordered_fluent_set;
	build_fluent_ordering(ordered_fluent_set);
	make_nodes( 0, ordered_fluent_set, m_problem.actions );	
	std::cout << "Successor generator built, with " << m_nodes.size() << " nodes" << std::endl;
}

template <typename State>
void	Successor_Generator<State>::retrieve_applicable( const State& s, std::vector<unsigned>& actions ) const {
	std::deque<const Node*> open;
	open.push_back( m_nodes[0] );
	while ( !open.empty() ) {
		const Node* n = open.front();
		open.pop_front();
		if ( !n->selection_node() ) {
			for ( unsigned k = 0; k < n->actions().size(); k++ )
				actions.push_back( n->actions()[k]->index );
			continue;
		}
		if ( s.entails( mkLit(n->selection_fluent(), false) ) ) {
			if ( n->true_child() != no_such_index ) { 
				open.push_back( m_nodes[n->true_child()] );
			}
		}
		if ( s.entails( mkLit( n->selection_fluent(), true ) ) ) {
			if ( n->false_child() != no_such_index ) { 
				open.push_back( m_nodes[n->false_child()] );
			}

		}
		if ( n->dont_care_child() != no_such_index ) {
			open.push_back( m_nodes[n->dont_care_child()] );	
		}
	}
}

template <typename State>
void	Successor_Generator<State>::retrieve_applicable( const State& s, std::vector<const FOD_Problem::Action*>& actions ) const {

	std::deque<const Node*> open;
	open.push_back( m_nodes[0] );
	while ( !open.empty() ) {
		const Node* n = open.front();
		open.pop_front();
		if ( !n->selection_node() ) {
			for ( unsigned k = 0; k < n->actions().size(); k++ ) {
				assert( s.satisfies( n->actions()[k]->precondition ) );
				actions.push_back( n->actions()[k] );
			}
			continue;
		}
		if ( s.entails( mkLit( n->selection_fluent(), false ) ) ) {
			if ( n->true_child() != no_such_index ) 
				open.push_back( m_nodes[n->true_child()] );
		}
		if ( s.entails( mkLit( n->selection_fluent(), true ) ) ) {
			if ( n->false_child() != no_such_index ) { 
				open.push_back( m_nodes[n->false_child()] );
			}
		}
		if ( n->dont_care_child() != no_such_index )
			open.push_back( m_nodes[n->dont_care_child()] );	
	}

}

template <typename State>
void	Successor_Generator<State>::retrieve_applicable( const std::vector<float>& v, std::vector<const FOD_Problem::Action*>& actions ) const {

	std::deque<const Node*> open;
	open.push_back( m_nodes[0] );
	while ( !open.empty() ) {
		const Node* n = open.front();
		open.pop_front();
		if ( !n->selection_node() ) {
			for ( unsigned k = 0; k < n->actions().size(); k++ ) {
				actions.push_back( n->actions()[k] );
			}
			continue;
		}
		if ( v[toInt(mkLit( n->selection_fluent(), false ))] != infty ) {
			if ( n->true_child() != no_such_index ) { 
				open.push_back( m_nodes[n->true_child()] );
			}
		}
		if ( v[toInt(mkLit( n->selection_fluent(), true ))] != infty ) {
			if ( n->false_child() != no_such_index ) { 
				open.push_back( m_nodes[n->false_child()] );
			}
		}
		if ( n->dont_care_child() != no_such_index ) {
			open.push_back( m_nodes[n->dont_care_child()] );	
		}
	}

}

template <typename State>
Successor_Generator<State>::Iterator::Iterator( const State& s, const std::vector<Node*>& nodes )
	: m_state(s), m_nodes( nodes ), m_current_node( NULL ), m_index(no_such_index) {
	//m_open.resize( m_nodes.size() );
}

template <typename State>
Successor_Generator<State>::Iterator::~Iterator() {
}

template <typename State>
int	Successor_Generator<State>::Iterator::first( ) {
	//m_open.push_back( m_nodes[0] );
	m_open.push_back( m_nodes[0] );
	m_open_index = 0;
	//m_open[m_open_index] = true;
	return advance();
}

template <typename State>
int	Successor_Generator<State>::Iterator::advance( ) {
	while ( !m_open.empty() ) {
		const Node* n = m_open.front();
		assert( n != nullptr );
		m_open.pop_front();
		if ( !n->selection_node() ) {
			m_current_node = n;
			m_index = 0;
			return n->actions()[m_index++]->index;
		}
		if ( m_state.entails( mkLit( n->selection_fluent(), false ) ) ) {
			if ( n->true_child() != no_such_index ) {
				assert(  m_nodes[n->true_child()] != nullptr );
				m_open.push_back( m_nodes[n->true_child()] );
			}
		}
		if ( m_state.entails( mkLit( n->selection_fluent(), true ) ) ) {
			if ( n->false_child() != no_such_index ) { 
				assert(  m_nodes[n->false_child()] != nullptr );
				m_open.push_back( m_nodes[n->false_child()] );
			}
		}
		if ( n->dont_care_child() != no_such_index ) {
			assert(  m_nodes[n->dont_care_child()] != nullptr );
			m_open.push_back( m_nodes[n->dont_care_child()] );	
		}
	}
	return -1;	
}

template <typename State>
int	Successor_Generator<State>::Iterator::next( ) {
	if ( m_current_node != NULL && m_index < m_current_node->actions().size() ) {
		return m_current_node->actions()[m_index++]->index;
	}
	return advance();
}


template <typename State>
void	Successor_Generator<State>::dump_tree( std::ostream& os ) const {
	dump_tree( 0, 0, os );	
}

template <typename State>
void	Successor_Generator<State>::dump_tree( unsigned depth, unsigned node_index, std::ostream& os ) const {
	if ( node_index == no_such_index ) return;

	std::string indent;
	for ( unsigned k = 0; k < depth; k++ )
		indent.push_back( ' ' );

	Node* n = m_nodes[node_index];

	if ( !n->selection_node() ) { // leaf
		os << indent << "Actions in this leaf: " << std::endl;
		for ( auto a : n->actions() )
			os << indent << a->name << std::endl;
		return;
	}

	os << indent << "Selection variable: " << m_problem.atoms[ n->selection_fluent() ]->name << "[" << n->selection_fluent() << "]" <<std::endl;
	os << indent << "positive branch: " << "# actions: " << n->true_num_actions() << std::endl;
	dump_tree( depth+1, n->true_child(), os );
	os << indent << "negative branch: " << "# actions: " << n->false_num_actions() << std::endl;
	dump_tree( depth+1, n->false_child(), os );
	os << indent << "don't care branch: " << "# actions: " << n->dont_care_num_actions() << std::endl;
	dump_tree( depth+1, n->dont_care_child(), os );
}

}

#endif // succ_gen.hxx
