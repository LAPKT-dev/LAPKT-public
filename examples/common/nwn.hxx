#ifndef __NWN_HXX__
#define __NWN_HXX__

#include <common/toy_graph.hxx>
#include <strips_prob.hxx>

// This class produces a planning domain
// similar to those one can ellicit from NWN areas and modules

class NWN_Mockup {

public:
	class Item {
	public:
		Item() {}

		Item( std::string n, unsigned loc ) 
		: name(n), location( loc ) {
		}		

		std::string		name;
		unsigned		location;
		std::vector<unsigned>	loc_fluents;
		unsigned		carries_fluent;
	};


	NWN_Mockup( int random_seed = 2381 );
	~NWN_Mockup();

	// Setups the navigation graph.
	// Parameters:
	// w - width of the grid
	// h - height of the grid
	// p - probability of tile not being accessible
	void	setup_nav_graph( int w, int h, float p );

	// Creates the specified number of items, placing them 
	// at random locations
	void	add_items( int n_items );
	
	// Builds a STRIPS task out of the parameters specified
	// above. Initial location of the player agent is chosen
	// randomly amongst accessible nav graph nodes. Goals consist
	// in placing a certain number of items k in l different locations.
	// Parameters:
	// n_goal_items - number of items which need to be relocated by the agent
	//                this number can't be greater than the number of items
	//                created when calling add_items()
	// n_goal_locs -  number of locations where goal items might need to end
	void	build_strips_problem( int n_goal_items, int n_goal_locs, aptk::STRIPS_Problem& prob );

protected:

	void	make_fluents( aptk::STRIPS_Problem& prob );
	void	make_actions( aptk::STRIPS_Problem& prob );
	void	make_init( aptk::STRIPS_Problem& prob );
	void	make_goal( int n_goal_items, int n_goal_locs, aptk::STRIPS_Problem& prob );

private:

	Graph			m_nav_graph;
	std::vector<Item>	m_items;
};

#endif // nwn.hxx
