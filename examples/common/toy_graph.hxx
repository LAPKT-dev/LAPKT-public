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

	protected:
		unsigned		m_index;
		std::string		m_label;
		std::vector< Vertex* >	m_neighbours;
	};

	Graph();
	~Graph();

	void	add_vertex( std::string label );
	void	connect( unsigned v1, unsigned v2 );
	std::vector< Vertex* >&	vertices() { return m_vertices; }

	typedef	std::vector<Vertex*>::iterator	Vertex_It;

	// MRJ: Iterator interface to access vertices adjacent
	Vertex_It	begin_adj( unsigned v1 ) { return m_vertices.at(v1)->neighbours().begin(); }
	Vertex_It	end_adj( unsigned v1 ) { return m_vertices.at(v1)->neighbours().end(); }

protected:

	std::vector< Vertex* >  		m_vertices;
};


#endif // toy_graph.hxx
