#ifndef __HEURISTIC__
#define __HEURISTIC__

#include <aptk/search_prob.hxx>
#include <vector>

namespace aptk {

template <typename State>
class Heuristic {

public:

	Heuristic( const Search_Problem<State>& prob ) 
	: m_problem( prob ) {
	}

	virtual ~Heuristic() {
	}

	virtual void init() 	{ }
	virtual void reset() 	{ }

	virtual void eval( const State& s, float& h_val ) = 0;
	
	virtual void eval( const State& s, float& h_val, std::vector<Action_Idx>& pref_ops ) = 0;

	const Search_Problem<State>&	problem() const { return m_problem; }

private:
	const Search_Problem<State>& m_problem; 

};

}

#endif // heuristic.hxx
