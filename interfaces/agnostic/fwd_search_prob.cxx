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

State*	Fwd_Search_Problem::make_state( const Fluent_Vec& v ) const {
	State* s = new State( task() );

 	for(unsigned i = 0; i < v.size(); i++)
      		s->set(v[i]);

	std::sort( s->fluent_vec().begin(), s->fluent_vec().end() );

	s->update_hash();

	return s;
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

bool	Fwd_Search_Problem::lazy_goal( const State& s, Action_Idx a  ) const {

	const Action& act = *(task().actions().at(a));
	const Fluent_Vec& g = task().goal();
	for ( unsigned i = 0; i < g.size(); i++ )
		if ( !s.fluent_set().isset(g[i]) && ( !act.asserts(g[i]) || act.retracts(g[i])) ) {
			return false;
		}
	return true;
}

bool	Fwd_Search_Problem::is_applicable( const State& s, Action_Idx a ) const {

	const Action& act = *(task().actions().at(a));
	return act.can_be_applied_on(s);
}

void	Fwd_Search_Problem::applicable_set( const State& s, std::vector<Action_Idx>& app_set ) const {
	//m_task->applicable_actions( s, app_set );
	m_task->applicable_actions_v2( s, app_set ); 
}

void	Fwd_Search_Problem::applicable_set_v2( const State& s, std::vector<Action_Idx>& app_set ) const {
	m_task->applicable_actions_v2( s, app_set ); 
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

State*	Fwd_Search_Problem::next( const State& s, Action_Idx a, Fluent_Vec* added, Fluent_Vec* deleted ) const {
	const Action& act = *(task().actions().at(a));
	State* succ = s.progress_through( act, added, deleted );
	succ->update_hash();
	return succ;
}


void	Fwd_Search_Problem::print( std::ostream& os ) const {
	task().print( os );
}

}

}

