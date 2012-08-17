#include <fwd_search_prob.hxx>
#include <algorithm>

namespace aptk {

namespace agnostic {

Fwd_Search_Problem::Fwd_Search_Problem( STRIPS_Problem* p )
	: m_task( p ) {
}

Fwd_Search_Problem::~Fwd_Search_Problem() {
}

int	Fwd_Search_Problem::num_actions() const {

	return task().num_actions();	
}

State*	Fwd_Search_Problem::init() const {

	State* s0 = new State( task() );

 	for(unsigned i = 0; i < task().init().size(); i++)
      		s0->set(task().init()[i]);

	std::sort( s0->fluent_vec().begin(), s0->fluent_vec().end() );

	s0->update_hash();

	return s0;
}

bool	Fwd_Search_Problem::goal( const State& s ) const {

	return s.entails( task().goal() );
}

bool	Fwd_Search_Problem::is_applicable( const State& s, Action_Idx a ) const {

	const Action& act = *(task().actions().at(a));
	return act.can_be_applied_on(s);
}

float	Fwd_Search_Problem::cost( const State& s, Action_Idx a ) const {
	const Action& act = *(task().actions().at(a));
	return act.cost();
}

State*	Fwd_Search_Problem::next( const State& s, Action_Idx a ) const {
	const Action& act = *(task().actions().at(a));
	State* succ = s.progress_through( act );
	succ->update_hash();
	return succ;
}

void	Fwd_Search_Problem::print( std::ostream& os ) const {
	task().print( os );
}

}

}

