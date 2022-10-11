
/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files 
(the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, 
publish, distribute, sublicense, and/or sell copies of the Software, 
and to permit persons to whom the Software is furnished to do so, subject
 to the following conditions:

The above copyright notice and this permission notice shall be included 
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
