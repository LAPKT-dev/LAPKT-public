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

#include <common/toy_graph.hxx>

Graph::Vertex::Vertex( unsigned index, std::string l )
	: m_index(index), m_label(l) {
}

Graph::Vertex::~Vertex() {
}

Graph::Graph(  ) {
}

Graph::~Graph() {
}

unsigned	Graph::add_vertex( std::string label ) {
	Vertex* v = new Vertex( m_vertices.size(), label );
	m_vertices.push_back( v );
	return v->index();
}

void	Graph::connect( unsigned v1, unsigned v2 ) {
	m_vertices.at(v1)->neighbours().push_back( m_vertices.at(v2) );
}

