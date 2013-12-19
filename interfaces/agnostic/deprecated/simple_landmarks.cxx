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

#include <simple_landmarks.hxx>
#include <cassert>

namespace aptk {

namespace agnostic {

Landmarks_Graph::Landmarks_Graph( const STRIPS_Problem& p) 
: m_strips_model( p ) {
	m_fl_to_node.resize( m_strips_model.num_fluents() );
	for ( unsigned k = 0; k < m_fl_to_node.size(); k++ )
		m_fl_to_node[k] = NULL;

	m_fl_in_graph.resize( m_strips_model.num_fluents() );
}

Landmarks_Graph::~Landmarks_Graph() {
	for ( unsigned k = 0; k < m_lm_graph.size(); k++ ) {
		delete m_lm_graph[k];
	}
}

void	Landmarks_Graph::preceding( unsigned p, Fluent_Vec& preceding  ) const {
	Node* n = m_fl_to_node[p];
	if ( n == NULL ) return;
	for ( unsigned k = 0; k < n->preceded_by().size(); k++ )
		preceding.push_back( n->preceded_by()[k]->fluent() );
}

void	Landmarks_Graph::following( unsigned p, Fluent_Vec& following  ) const {
	Node* n = m_fl_to_node[p];
	if ( n == NULL ) return;
	for ( unsigned k = 0; k < n->required_by().size(); k++ )
		following.push_back( n->required_by()[k]->fluent() );
}

void	Landmarks_Graph::add_landmark( unsigned p ) {
	Node* n = new Node( p );
	m_lm_graph.push_back( n );
	m_fl_in_graph.set(p);
	m_fl_to_node[p] = n;
}

void	Landmarks_Graph::add_landmark_for( unsigned p, unsigned q ) {
	Node* p_node = m_fl_to_node[p];
	assert( p_node != NULL );
	Node* q_node = m_fl_to_node[q];	
	assert( q_node != NULL );
	p_node->add_precedent( q_node );
	q_node->add_requiring( p_node );
}

void	Landmarks_Graph::print( std::ostream& os ) const {
	for ( unsigned k = 0; k < m_lm_graph.size(); k++ ) {
		Node* n = m_lm_graph[k];
		std::cout << k + 1 << ". " << m_strips_model.fluents()[ n->fluent() ]->signature() << std::endl;
		std::cout << "\tPreceded by: ";
		for ( unsigned i = 0; i < n->preceded_by().size(); i++ ) {
			Node* pred = n->preceded_by()[i];
			std::cout << m_strips_model.fluents()[ pred->fluent() ]->signature();
			if ( i < n->preceded_by().size() - 1 )
				std::cout << ", ";
		}
		std::cout << "\n\tRequired by: ";
		for ( unsigned i = 0; i < n->required_by().size(); i++ ) {
			Node* pred = n->required_by()[i];
			std::cout << m_strips_model.fluents()[ pred->fluent() ]->signature();
			if ( i < n->required_by().size() - 1 )
				std::cout << ", ";
		}

		std::cout << std::endl;
	}	
}

}

}
