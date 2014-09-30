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

#ifndef __ANYTIME_DUAL_QUEUE_DUAL_HEURISTIC_RESTARTING_WEIGHTED_BEST_FIRST_SEARCH__
#define __ANYTIME_DUAL_QUEUE_DUAL_HEURISTIC_RESTARTING_WEIGHTED_BEST_FIRST_SEARCH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <aptk/at_bfs_dq.hxx>

namespace aptk {

namespace search {

namespace bfs_dq {

// Anytime Restarting Weighted Best-First Search, with two open lists - one for preferred operators, the other for non-preferred
// operator, and one single heuristic estimator, with delayed evaluation of states generated.
// Evaluation function f(n) corresponds to that of Weighted A*
//          f(n) = g(n) + W h(n)
// the value of W decreases each time a solution is found, according to the
// value of the decay parameter.
// 
// Details and rationale on how to handle restarts to improve quality of plans found by anytime heuristic search
// can be found on the paper:
//
// The Joy of Forgetting: Faster Anytime Search via Restarting
// Richter, S. and Thayer, J. T. and Ruml, W.
// ICAPS 2010


template <typename Search_Model, typename Abstract_Heuristic, typename Open_List_Type >
class AT_RWBFS_DQ_SH  : public AT_BFS_DQ_SH<Search_Model, Abstract_Heuristic, Open_List_Type > {

public:
	typedef		typename Search_Model::State_Type		State;
	typedef  	Node< State >					Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_RWBFS_DQ_SH( 	const Search_Model& search_problem, float W = 5.0f, float decay = 0.75f ) 
	: AT_BFS_DQ_SH<Search_Model, Abstract_Heuristic, Open_List_Type>(search_problem), m_W( W ), m_decay( decay ) {
	}

	AT_RWBFS_DQ_SH( const Search_Model& search_problem, Abstract_Heuristic& h, float W = 5.0f, float decay = 0.75f ) 
	: AT_BFS_DQ_SH<Search_Model, Abstract_Heuristic, Open_List_Type>(search_problem, h), m_W( W ), m_decay( decay ) {
	}

	virtual ~AT_RWBFS_DQ_SH() {
		for ( typename Closed_List_Type::iterator i = m_seen.begin();
			i != m_seen.end(); i++ ) {
			delete i->second;
		}
		m_seen.clear();
	}

	virtual void	eval( Search_Node* candidate ) {
		if ( candidate->seen() ) return;
		std::vector<Action_Idx>	po;
		this->heuristic().eval( candidate, candidate->hn(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po( po[k] );	
	}

	bool in_closed( Search_Node* n )  {
		return this->closed().retrieve(n) != nullptr;
	}

	bool in_open( Search_Node* n )  {
		return this->open_hash().retrieve(n) != nullptr;
	}

	bool in_seen( Search_Node* n )  {
		return m_seen.retrieve(n) != nullptr;
	}

	virtual void 	process(  Search_Node *head ) {

		typedef typename Search_Model::Action_Iterator Iterator;
		Iterator it( this->problem() );
		int a = it.start( *(head->state()) );
		while ( a != no_op ) {
			State *succ = this->problem().next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), a ), a, head, this->problem().num_actions() );
			bool is_in_closed = in_closed(n);
			bool is_in_open = in_open(n);
			bool is_in_seen = in_seen(n);
			if ( !is_in_closed && !is_in_open && !is_in_seen ) {
				n->hn() = head->hn();
				n->fn() = m_W * n->hn() + n->gn();

				this->open_node(n, head->is_po(a));

				a = it.next();
				continue;
			}
			if ( is_in_seen ) {
				Search_Node* n2 = m_seen.retrieve(n);
				if ( n->gn() < n2->gn() ) {
					n2->gn() = n->gn();
					n2->m_parent = n->m_parent;
					n2->m_action = n->action();
				}
				n2->fn() = m_W * n2->hn() + n2->gn();
				m_seen.erase( m_seen.retrieve_iterator(n2) );
				this->open_node( n2, n2->parent()->is_po(n2->action()));
				delete n;
				a = it.next();
				continue;
			}
			if ( is_in_closed ) {
				Search_Node* n2 = this->closed().retrieve(n);
				if ( n->gn() < n2->gn() ) {
					n2->gn() = n->gn();
					n2->m_parent = n->m_parent;
					n2->m_action = n->action();
					n2->fn() = m_W * n2->hn() + n2->gn();
					this->closed().erase( this->closed().retrieve_iterator( n2 ) );
					n2->set_seen();
					this->open_node( n2, n2->parent()->is_po(n2->action()));
				}
				delete n;
				a = it.next();
				continue;
			}
			if ( is_in_open ) {
				Search_Node* n2 = this->open_hash().retrieve(n);
				if ( n->gn() < n2->gn() ) {
					n2->gn() = n->gn();
					n2->m_parent = n->m_parent;
					n2->m_action = n->action();
					n2->fn() = m_W * n2->hn() + n2->gn();
					this->inc_replaced_open();
				}
				delete n;
				a = it.next();
				continue;
			}
			assert(false);
			/*
			if ( is_closed( n ) ) {
				delete n;
				a = it.next();
				continue;
			}

			if ( is_open( n ) ) {
				delete n;
				a = it.next();
				continue;
			}
			if ( is_seen( n ) ) {
				delete n;
				a = it.next();
				continue;
			}

			n->hn() = head->hn();
			n->fn() = m_W * n->hn() + n->gn();

			this->open_node(n, head->is_po(a));

			a = it.next();
			*/
		}
		this->inc_eval();
	}

	virtual Search_Node*	 	do_search() {
		if ( !this->closed().empty() )
			restart_search();	
		Search_Node *head = this->get_node();
		while(head) {
			if ( head->gn() >= this->bound() )  {
				this->inc_pruned_bound();
				this->close(head);
				head = this->get_node();
				continue;
			}

			if(this->problem().goal(*(head->state()))) {
				this->close(head);
				this->set_bound( head->gn() );
				m_W *= m_decay;
				if ( m_W < 1.0f ) m_W = 1.0f;
				return head;
			}
			if ( (time_used() - this->t0() ) > this->time_budget() )
				return NULL;
	
			this->eval( head );

			this->process(head);
			this->close(head);
			
			head = this->get_node();
		}
		return NULL;
	}

	void	restart_search() {
		// MRJ: Move Closed to Seen
		for ( typename Closed_List_Type::iterator it = this->closed().begin();
			it != this->closed().end(); it++ ) {
			it->second->set_seen();
			if ( it->second == this->root() ) continue;
			/*
			Search_Node* n2 = m_seen.retrieve( it->second );
			if ( n2 == nullptr ) {
				m_seen.put( it->second );
				continue;
			}
			if ( n2->gn() <= it->second->gn() ) {
				delete it->second;
				continue;
			}
			m_seen.erase( m_seen.retrieve_iterator( n2 ) );
			*/
			m_seen.put( it->second );
		} 
		this->closed().clear();
		// MRJ: Clear the contents of Open
		this->open_hash().clear();
		Search_Node *head = this->get_node();
		while ( head ) {
			if ( !head->seen() )
				delete head;
			else
				m_seen.put( head );
			head = this->get_node();
		}
		#ifdef DEBUG
		std::cout << "Size(SEEN) = " << m_seen.size() << std::endl;
		#endif

		this->open_node( this->root(), false );
	}

	virtual bool is_open( Search_Node *n ) {
		Search_Node *n2 = NULL;

		if( ( n2 = this->open_hash().retrieve(n)) ) {
			
			if(n->gn() < n2->gn())
			{
				n2->m_parent = n->m_parent;
				n2->m_action = n->m_action;
				n2->m_g = n->m_g;
				n2->m_f = m_W * n2->m_h + n2->m_g;
				this->inc_replaced_open();
			}
			return true;
		}

		return false;
	}

	bool is_seen( Search_Node* n ) {
		Search_Node* n2 = m_seen.retrieve(n);
		
		if ( n2 == NULL ) return false;
		
		if ( n->gn() < n2->gn() ) {
			n2->gn() = n->gn();
			n2->m_parent = n->m_parent;
			n2->m_action = n->action();
		}
		n2->fn() = m_W * n2->hn() + n2->gn();
		m_seen.erase( m_seen.retrieve_iterator(n2) );
		this->open_node( n2, n2->parent()->is_po(n2->action()));
		return true;
	}

protected:

	float					m_W;
	float					m_decay;
	Closed_List_Type			m_seen;	
};

}

}

}

#endif // at_bfs_sq_sh.hxx
