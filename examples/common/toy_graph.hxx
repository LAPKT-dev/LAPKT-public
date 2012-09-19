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

#ifndef __TOY_GRAPH__
#define __TOY_GRAPH__

#include <string>
#include <vector>
#include <map>

// MRJ: Extremely simple graph data structure
class Graph {
public:

	class Vertex {
	public:
		Vertex( unsigned index, std::string l );
		~Vertex();

		unsigned			index() const { return m_index; }
		std::string			label() const { return m_label; }
		std::vector<Vertex*>& 		neighbours() { return m_neighbours; }
		unsigned			at_fluent() const { return m_at_fluent_idx; }
		void				set_at_fluent( unsigned idx ) { m_at_fluent_idx = idx; }

	protected:
		unsigned		m_index;
		std::string		m_label;
		std::vector< Vertex* >	m_neighbours;
		unsigned		m_at_fluent_idx;
	};

	Graph();
	~Graph();

	unsigned		add_vertex( std::string label );
	void			connect( unsigned v1, unsigned v2 );
	std::vector< Vertex* >&	vertices() { return m_vertices; }

	typedef	std::vector<Vertex*>::iterator	Vertex_It;

	// MRJ: Iterator interface to access vertices adjacent
	Vertex_It	begin_adj( unsigned v1 ) { return m_vertices.at(v1)->neighbours().begin(); }
	Vertex_It	end_adj( unsigned v1 ) { return m_vertices.at(v1)->neighbours().end(); }

protected:

	std::vector< Vertex* >  		m_vertices;
};


#endif // toy_graph.hxx
