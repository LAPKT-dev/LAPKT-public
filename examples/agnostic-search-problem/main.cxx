// MRJ: In this example, we'll show how to create a search problem out of
// a planning problem we acquired from some external source
#include <sstream>
#include <common/toy_graph.hxx>

#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <cond_eff.hxx>
#include <strips_state.hxx>

#include <fwd_search_prob.hxx>

using	aptk::STRIPS_Problem;
using	aptk::agnostic::Fwd_Search_Problem;
using	aptk::State;
using	aptk::Action;

void setup_graph( Graph& g ) {

	g.add_vertex( "Kitchen" );	// v0
	g.add_vertex( "Sitting_Room" );	// v1
	g.add_vertex( "Balcony" );	// v2
	g.add_vertex( "Bathroom" );	// v3
	g.add_vertex( "Bedroom" );	// v4

	g.connect( 0, 1 );
	g.connect( 1, 2 );
	g.connect( 1, 3 );
	g.connect( 1, 4 );
}

void setup_planning_problem( Graph& g, STRIPS_Problem& prob ) {

	std::map<unsigned, unsigned>	vtx_to_fl;

	for ( unsigned v_k = 0; v_k < g.vertices().size(); v_k++ ) {
		std::stringstream buffer;
		buffer << "(at " << g.vertices()[v_k]->label() << ")";
		unsigned fl_idx = aptk::STRIPS_Problem::add_fluent( prob, buffer.str() );
		vtx_to_fl.insert( std::make_pair( v_k, fl_idx ) );
	}

	for ( unsigned v_k = 0; v_k < g.vertices().size(); v_k++ )
		for ( Graph::Vertex_It v_j = g.begin_adj( v_k );
			v_j != g.end_adj( v_k ); v_j++ ) {

			aptk::Fluent_Vec pre; // Precondition
			aptk::Fluent_Vec add; // Adds
			aptk::Fluent_Vec del; // Dels
			aptk::Conditional_Effect_Vec ceff; // Conditional effects
			std::stringstream buffer; // Buffer to build the signature
			
			buffer << "(move " << g.vertices()[v_k]->label() << " " << (*v_j)->label() << ")";

			pre.push_back( vtx_to_fl[ v_k ] );
			add.push_back( vtx_to_fl[ (*v_j)->index() ] );
			del.push_back( vtx_to_fl[ v_k ] );

			aptk::STRIPS_Problem::add_action( prob, buffer.str(), pre, add, del, ceff );
		}

	prob.make_action_tables();

	aptk::Fluent_Vec	I;
	aptk::Fluent_Vec	G;
	
	I.push_back( vtx_to_fl[ 0 ] );
	G.push_back( vtx_to_fl[ 2 ] );

	aptk::STRIPS_Problem::set_init( prob, I );
	aptk::STRIPS_Problem::set_goal( prob, G );

	prob.print( std::cout );
}

int main( int argc, char** argv ) {

	// MRJ: We create our graph
	Graph	g;
	setup_graph( g );

	STRIPS_Problem plan_prob;
	setup_planning_problem( g, plan_prob );

	Fwd_Search_Problem	search_prob( &plan_prob );

	// MRJ: we get the initial state s_0
	State* s_0 = search_prob.init();
	
	std::cout << "s_0 = ";
	plan_prob.print_fluent_vec( std::cout, s_0->fluent_vec() );
	std::cout << std::endl;

	// MRJ: we can generate successors of s_0 via the iterator-based interface
	for ( int ai = 0; ai < search_prob.num_actions(); ai++ ) {
		if ( !search_prob.is_applicable( *s_0, ai ) ) continue; 
		State* succ = search_prob.next( *s_0, ai );
		std::cout << "s' = ";
		plan_prob.print_fluent_vec( std::cout, succ->fluent_vec() );
		std::cout << std::endl;
		std::cout << "Reached executing action: " << std::endl;
		plan_prob.actions().at( ai )->print( plan_prob, std::cout );
	}

	return 0;
}
