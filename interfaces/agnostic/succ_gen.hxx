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

#include <types.hxx>
#include <deque>
#include <vector>

namespace aptk {

class STRIPS_Problem;
class State;
class Action;

namespace agnostic {

// Fast-Downward ("The Fast-Downward Planning System", Helmert, M., 2006) successor generator data structure
	
class	Successor_Generator {

	class	Node {
	public:

		Node( unsigned p = no_such_index ) 
		: m_selection_fluent( p ), m_true_child( no_such_index ), m_dont_care_child( no_such_index ) {
		}

		~Node() {}

		unsigned	selection_fluent() const { return m_selection_fluent; }

		std::vector<const Action*>&		actions() { return m_actions; }
		const std::vector<const Action*>&	actions() const { return m_actions; }
		
		bool		selection_node() const { return m_selection_fluent != no_such_index; }
	
		void		set_true_child( unsigned i ) { m_true_child = i; }
		void		set_dont_care_child( unsigned i ) { m_dont_care_child = i; }
		unsigned	true_child() const { return m_true_child; }
		unsigned	dont_care_child() const { return m_dont_care_child; }

		void		set_true_num_actions( unsigned num ) { m_num_act_true_child = num; }
		void		set_dont_care_num_actions( unsigned num ) { m_num_act_dont_care_child = num; }
		unsigned	true_num_actions() const { return m_num_act_true_child; }
		unsigned	dont_care_num_actions() const { return m_num_act_dont_care_child; }

	private:
		unsigned			m_selection_fluent;
		std::vector<const Action*>	m_actions;
		unsigned			m_true_child;
		unsigned			m_dont_care_child;
		unsigned			m_num_act_true_child;
		unsigned			m_num_act_dont_care_child;
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
		//std::deque<const Node*>		m_open;
		std::vector<bool>		m_open;
		unsigned			m_open_index;
	};

	class	Heuristic_Iterator {
	public:
		Heuristic_Iterator( const std::vector<float>& v, const std::vector<Node*>& nodes );
		~Heuristic_Iterator();

		int	first();
		int	advance();
		int 	next();
		int	last() { return -1; }
	private:
		const std::vector<float>&	m_values;
		const std::vector<Node*>&	m_nodes;
		const Node*			m_current_node;
		unsigned			m_index;
		std::deque<const Node*>		m_open;
	};


	Successor_Generator( const STRIPS_Problem& prob ) 
	: m_problem( prob ) {
	}

	~Successor_Generator();

	void	build();

	void	retrieve_applicable( const State& s, std::vector<const Action*>& actions ) const;	
	void	retrieve_applicable( const State& s, std::vector<int>& actions ) const;
	void	retrieve_applicable( const std::vector<float>& v, std::vector<const Action*>& actions ) const;

	const std::vector<Node*>&	nodes() const { return m_nodes; }

protected:

	void		build_fluent_ordering( std::vector<unsigned>& ord_fluents );
	unsigned	make_nodes( unsigned index, std::vector<unsigned>& ord_fluents, const std::vector<const Action*>& actions );

private:

	const STRIPS_Problem&		m_problem;
	std::vector<Node*>		m_nodes;
};

}

}

#endif // succ_gen.hxx
