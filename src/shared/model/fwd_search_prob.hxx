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

#ifndef __FWD_SEARCH_PROB__
#define __FWD_SEARCH_PROB__

#include <strips_prob.hxx>
#include <search_prob.hxx>
#include <action.hxx>

#include <strips_state.hxx>

namespace aptk {

class State;

namespace agnostic {


class Fwd_Search_Problem : public Search_Problem<State> {
public:

	Fwd_Search_Problem( STRIPS_Problem* );
	virtual ~Fwd_Search_Problem();

	virtual	int		num_actions() const;
	virtual State*	make_state( const Fluent_Vec& s ) const;
	virtual State*	init() const;
	virtual bool	goal( const State& s ) const;
	bool	        lazy_goal( const State& s, Action_Idx a  ) const;
	virtual bool	is_applicable( const State& s, Action_Idx a ) const;
	virtual void	applicable_set( const State& s, std::vector<Action_Idx>& app_set ) const;
	virtual void	applicable_set_v2( const State& s, std::vector<Action_Idx>& app_set ) const;	
	virtual float	cost( const State& s, Action_Idx a ) const;
    virtual State*  next( const State& s, Action_Idx a, Fluent_Vec* added, Fluent_Vec* deleted ) const;
    virtual State*	next( const State& s, Action_Idx a ) const;
	virtual void	print( std::ostream& os ) const;

	STRIPS_Problem&		    task() 		{ return *m_task; }
	const STRIPS_Problem&	task() const 	{ return *m_task; }

	class Action_Iterator {
	public:
		Action_Iterator( const Fwd_Search_Problem& p )
		  :       m_problem(p) {
		}
        
		~Action_Iterator() {
		}

		int	start( const State& s ) {
			m_app_set.clear();
			m_problem.applicable_set_v2( s, m_app_set );
			m_it = m_app_set.begin();
			if ( m_it == m_app_set.end() ) return no_op;
			return *m_it;
		}
	
		int	next() {
			m_it++;
			if ( m_it == m_app_set.end() ) return no_op;
			return *m_it;
		}	
	
	private:
		const Fwd_Search_Problem& 		m_problem;
		std::vector<Action_Idx>			m_app_set;
		std::vector<Action_Idx>::iterator	m_it;
 	};

private:

	STRIPS_Problem*		m_task;
	
};

}

}

#endif // fwd_search_prob.hxx
