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

void	Graph::add_vertex( std::string label ) {
	Vertex* v = new Vertex( m_vertices.size(), label );
	m_vertices.push_back( v );
}

void	Graph::connect( unsigned v1, unsigned v2 ) {
	m_vertices.at(v1)->neighbours().push_back( m_vertices.at(v2) );
	m_vertices.at(v2)->neighbours().push_back( m_vertices.at(v1) );
}

