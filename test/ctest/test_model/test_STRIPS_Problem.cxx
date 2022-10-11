/**
 * @file test_STRIPS_Problem.cxx
 * @author Anubhav Singh a.k.a. Anu (anubhav.singh.er@protonmail.com)
 * @brief A set of test cases for STRIPS_Problem class and its interface methods
 * @version 0.1
 * @date 2022-01-27
 * 
 * @copyright Copyright (c) 2022
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files 
 * (the "Software"), to deal in the Software without restriction, 
 * including without limitation the rights to use, copy, modify, merge, 
 * publish, distribute, sublicense, and/or sell copies of the Software, 
 * and to permit persons to whom the Software is furnished to do so, subject
 * to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included 
 * in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * 
 */

#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <sstream>
#include <toy_graph.hxx>
#include <catch2/catch_test_macros.hpp>

/**
 * @brief A functional test of the interface to generate a STRIP_Problem
 * instance using a graph. We reuse the code from the example - 
 * https://github.com/LAPKT-dev/LAPKT-public/blob/d54b68fcc67d5d75ea40b3921220c29f49c71814/examples/agnostic-examples/assembling_strips_problems/main.cxx#L30
 * 
 */
TEST_CASE("Assembling a STRIPS_Problem"){

	std::cout << "BEGIN TEST_CASE(Assembling a STRIPS_Problem)" << std::endl;

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
	std::cout << "END TEST_CASE(Assembling a STRIPS_Problem)" << std::endl;

}
