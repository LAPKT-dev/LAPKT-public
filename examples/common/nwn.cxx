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

#include <common/nwn.hxx>
#include <action.hxx>
#include <cstdlib>
#include <sstream>
#include <fstream>
#include <algorithm>

NWN_Mockup::NWN_Mockup( int random_seed ) {
	srandom( random_seed );
}

NWN_Mockup::~NWN_Mockup() {
}

void	NWN_Mockup::setup_nav_graph( int w, int h, float p ) {
	std::vector< std::vector< int > >	nodes;
	nodes.resize( h );	

	// MRJ: Generate grid, with nodes which are actually reachable
	for ( int i = 0; i < h; i++ ) {
		nodes[i].resize(w);
		for ( int j = 0; j < w; j++ ) {
			float k = (float)random()/(float)RAND_MAX;
			nodes[i][j] = ( k < p ? -1 : 0 );
			if ( nodes[i][j] == -1 ) continue;
			std::stringstream ss;
			ss << "node_" << i << "_" << j;
			nodes[i][j] = m_nav_graph.add_vertex( ss.str() );	
		}
	}

	// MRJ: Connect nodes in grid
	for ( int i = 0; i < h; i++ ) {
		for ( int j = 0; j < w; j++ ) {
			if ( nodes[i][j] == -1 ) continue;

			int neighbours[4][2] = { { i, j-1}, {i, j+1}, { i-1, j }, { i+1, j } };

			for ( int k = 0; k < 4; k++ ) {
				int ni = neighbours[k][0], nj = neighbours[k][1];
				if ( ni < 0 || ni >= h ) continue;
				if ( nj < 0 || nj >= w ) continue;
				if ( nodes[ni][nj] == -1 ) continue;
				m_nav_graph.connect( nodes[i][j], nodes[ni][nj] );
			}
		}
	}
	
	std::ofstream nav_graph( "nav.graph" );
	for ( int k = 0; k < w+2; k++ ) nav_graph << "*";
	nav_graph << std::endl;

	for ( int i = 0; i < h; i++ ) {
		nav_graph << "*";
		for ( int j = 0; j < w; j++ ) {
			if ( nodes[i][j] >= 0 )
				nav_graph << ".";
			else
				nav_graph << "*";
		}
		nav_graph << "*" << std::endl;
	}

	for ( int k = 0; k < w+2; k++ ) nav_graph << "*";
	nav_graph << std::endl;
}

void	NWN_Mockup::add_items( int n_items ) {

	static const char* item_types[14] = { 
		"Sword", "Boots", "Cloak", "Amulet", "Belt", "Mace", "Axe",
		"Spear", "Longbow", "Ring", "Helmet", "Book", "Mail", "Plate"
	};

	static const char* item_adjectives[12] = {
		"Of_Destruction", "Of_Madness", "Of_Despair", "Of_Recall", "Of_Speed", "Of_Revelation",
		"Of_Power", "Of_Fortitude", "Of_Laughter", "Of_Morosity", "Of_Sloth", "Of_Fun"
	};

	for ( int k = 0; k < n_items; k++ ) {
		std::stringstream ss;
		ss << item_types[random()%14] << "_" << item_adjectives[random()%12];
		unsigned loc = random()%m_nav_graph.vertices().size();
		m_items.push_back( Item( ss.str(), loc ) );	
	}

}

void	NWN_Mockup::make_fluents( aptk::STRIPS_Problem& prob ) {
	
	for ( unsigned n_k = 0; n_k < m_nav_graph.vertices().size(); n_k++ ) {
		// MRJ: Agent possible locations
		std::stringstream at_fl_buffer;
		at_fl_buffer << "(at " << m_nav_graph.vertices()[n_k]->label() << ")";
		m_nav_graph.vertices()[n_k]->set_at_fluent( aptk::STRIPS_Problem::add_fluent( prob, at_fl_buffer.str() ) );

		// MRJ: Item possible locations
		for ( unsigned i = 0; i < m_items.size(); i++ ) {
			std::stringstream at_it_fl_buffer;
			at_it_fl_buffer << "(at " << m_items[i].name << " " << m_nav_graph.vertices()[n_k]->label() << ")";
			m_items[i].loc_fluents.push_back( aptk::STRIPS_Problem::add_fluent( prob, at_it_fl_buffer.str() ) );
		}
	}

	for ( unsigned i = 0; i < m_items.size(); i++ ) {
		// MRJ: Agent carries item fluents
		std::stringstream carries_it_fl_buffer;
		carries_it_fl_buffer << "(carrying " << m_items[i].name << ")";
		m_items[i].carries_fluent = aptk::STRIPS_Problem::add_fluent( prob, carries_it_fl_buffer.str() );
	}

}

void	NWN_Mockup::make_actions( aptk::STRIPS_Problem& prob ) {

	// MRJ: Move actions
	for ( unsigned v_k = 0; v_k < m_nav_graph.vertices().size(); v_k++ )
		for ( Graph::Vertex_It v_j = m_nav_graph.begin_adj( v_k );
			v_j != m_nav_graph.end_adj( v_k ); v_j++ ) {

			aptk::Fluent_Vec pre; // Precondition
			aptk::Fluent_Vec add; // Adds
			aptk::Fluent_Vec del; // Dels
			aptk::Conditional_Effect_Vec ceff; // Conditional effects
			std::stringstream buffer; // Buffer to build the signature
			
			buffer << "(move " << m_nav_graph.vertices()[v_k]->label() << " " << (*v_j)->label() << ")";

			pre.push_back( m_nav_graph.vertices()[ v_k ]->at_fluent() );
			add.push_back( (*v_j)->at_fluent() );
			del.push_back(  m_nav_graph.vertices()[ v_k ]->at_fluent() );

			aptk::STRIPS_Problem::add_action( prob, buffer.str(), pre, add, del, ceff );
		}

	// Pick Up & Drop actions
	for ( unsigned v_k = 0; v_k < m_nav_graph.vertices().size(); v_k++ ) {
		aptk::Conditional_Effect_Vec ceff;
		Graph::Vertex* n_k = m_nav_graph.vertices()[v_k];
		unsigned at_n_k_fl = n_k->at_fluent();
		for (unsigned i = 0; i < m_items.size(); i++) {
			// Pick up
			aptk::Fluent_Vec pre; // Precondition
			aptk::Fluent_Vec add; // Adds
			aptk::Fluent_Vec del; // Dels
			std::stringstream pick_buffer;

			pick_buffer << "(pick-up " << m_items[i].name << " " << n_k->label() << ")";
			
			pre.push_back( at_n_k_fl );
			pre.push_back( m_items[i].loc_fluents[ v_k ] );
			add.push_back( m_items[i].carries_fluent );
			del.push_back( m_items[i].loc_fluents[ v_k ] );

			aptk::STRIPS_Problem::add_action( prob, pick_buffer.str(), pre, add, del, ceff, 2.0f );
			
			pre.clear(); add.clear(); del.clear();

			// Drop
			std::stringstream drop_buffer;

			drop_buffer << "(drop " << m_items[i].name << " " << n_k->label() << ")";

			pre.push_back( at_n_k_fl );
			pre.push_back( m_items[i].carries_fluent );
			add.push_back( m_items[i].loc_fluents[ v_k ] );
			del.push_back( m_items[i].carries_fluent );
			
			aptk::STRIPS_Problem::add_action( prob, drop_buffer.str(), pre, add, del, ceff );
		}
	}

	prob.make_action_tables();
}

void	NWN_Mockup::make_init( aptk::STRIPS_Problem& prob ) {
	aptk::Fluent_Vec I;
	// MRJ: Choose starting agent location at random
	unsigned n_k = random()%m_nav_graph.vertices().size();
	I.push_back( m_nav_graph.vertices()[n_k]->at_fluent() );
	// MRJ: Add fluents corresponding to items actual locations
	for ( unsigned k = 0; k < m_items.size(); k++ )
		I.push_back( m_items[k].loc_fluents[m_items[k].location] );
	aptk::STRIPS_Problem::set_init( prob, I );
}

void	NWN_Mockup::make_goal( int n_goal_items, int n_goal_locs, aptk::STRIPS_Problem& prob ) {

	std::vector<unsigned> goal_items;
	for ( int i = 0; i < n_goal_items; i++ ) {
		unsigned item;
		do {
			item = random()%m_items.size();
		} while ( std::find( goal_items.begin(), goal_items.end(), item ) != goal_items.end() );
		goal_items.push_back( item );
	}

	std::vector<unsigned> goal_locs;
	for ( int i = 0; i < n_goal_locs; i++ ) 
		goal_locs.push_back( random()%m_nav_graph.vertices().size() );	

	aptk::Fluent_Vec G;
	for ( unsigned k = 0; k < goal_items.size(); k++ ) {
		unsigned dst_loc_idx = random()%goal_locs.size();
		G.push_back( m_items[ goal_items[k] ].loc_fluents[ goal_locs[ dst_loc_idx ] ] );
	}
	aptk::STRIPS_Problem::set_goal( prob, G );
}

void	NWN_Mockup::build_strips_problem( int n_goal_items, int n_goal_locs, aptk::STRIPS_Problem& prob ) {

	make_fluents(prob);
	make_actions(prob);
	make_init(prob);
	make_goal( n_goal_items, n_goal_locs, prob );
}
