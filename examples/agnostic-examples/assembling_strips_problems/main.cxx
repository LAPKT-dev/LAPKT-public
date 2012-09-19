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

// MRJ: In this example, I'll try to show how can one assemble a simple
// STRIPS planning problem from objects and data structures from an application.
#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <sstream>
#include <common/toy_graph.hxx>

int main( int argc, char** argv ) {

	// MRJ: We create our graph
	Graph	g;

	g.add_vertex( "Kitchen" );	// v0
	g.add_vertex( "Sitting_Room" );	// v1
	g.add_vertex( "Balcony" );	// v2
	g.add_vertex( "Bathroom" );	// v3
	g.add_vertex( "Bedroom" );	// v4

	g.connect( 0, 1 );
	g.connect( 1, 2 );
	g.connect( 1, 3 );
	g.connect( 1, 4 );

	aptk::STRIPS_Problem prob;

	// MRJ: Now we create one fluent for each of the possible locations, and keep
	// the indices corresponding to each fluent associated with the appropiate
	// graph vertex
	std::map<unsigned, unsigned>	vtx_to_fl;

	for ( unsigned v_k = 0; v_k < g.vertices().size(); v_k++ ) {
		std::stringstream buffer;
		buffer << "(at " << g.vertices()[v_k]->label() << ")";
		unsigned fl_idx = aptk::STRIPS_Problem::add_fluent( prob, buffer.str() );
		vtx_to_fl.insert( std::make_pair( v_k, fl_idx ) );
	}

	// MRJ: Actions in this task correspond to (directed) edges in the graph
	for ( unsigned v_k = 0; v_k < g.vertices().size(); v_k++ )
		for ( Graph::Vertex_It v_j = g.begin_adj( v_k );
			v_j != g.end_adj( v_k ); v_j++ ) {

			aptk::Fluent_Vec pre; // Precondition
			aptk::Fluent_Vec add; // Adds
			aptk::Fluent_Vec del; // Dels
			aptk::Conditional_Effect_Vec ceff; // Conditional effects
			std::stringstream buffer; // Buffer to build the signature
			
			buffer << "(move " << g.vertices()[v_k]->label() << " " << (*v_j)->label() << ")";

			// MRJ: actions have as a precondition that agent is at location v_k
			pre.push_back( vtx_to_fl[ v_k ] );
			// MRJ: once the action is executed, the agent will now be at v_j
			add.push_back( vtx_to_fl[ (*v_j)->index() ] );
			// MRJ: and no longer where it was
			del.push_back( vtx_to_fl[ v_k ] );

			// MRJ: now we can register the action, but in this example we don't
			// need to keep a reference to the action which results of this
			aptk::STRIPS_Problem::add_action( prob, buffer.str(), pre, add, del, ceff );
		}

	// MRJ: After adding actions, it is necessary to initialize data structures that
	// keep track of relationships between fluents and actions. These data structures
	// are used to improve efficiency of search and heuristic computations.

	prob.make_action_tables();

	// MRJ: Now we can specify the initial and goal states
	aptk::Fluent_Vec	I;
	aptk::Fluent_Vec	G;
	
	// MRJ: The agent starts at the kitchen
	I.push_back( vtx_to_fl[ 0 ] );
	// MRJ: And wants to get to the balcony
	G.push_back( vtx_to_fl[ 2 ] );

	// MRJ: And now we set the initial and goal states of prob	
	aptk::STRIPS_Problem::set_init( prob, I );
	aptk::STRIPS_Problem::set_goal( prob, G );

	// MRJ: We'd be ready for solving this problem with a search algorithm
	// but that's stuff to be covered by another example

	return 0;
}
