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

#ifndef __ANYTIME_MULTIPLE_QUEUE_MULTIPLE_HEURISTIC_RESTARTING_WEIGHTED_BEST_FIRST_SEARCH__
#define __ANYTIME_MULTIPLE_QUEUE_MULTIPLE_HEURISTIC_RESTARTING_WEIGHTED_BEST_FIRST_SEARCH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <aptk/at_bfs_dq_mh.hxx>

namespace aptk {

namespace search {

namespace bfs_dq_mh {

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


template <typename Search_Model, typename Primary_Heuristic, typename Secondary_Heuristic, typename Open_List_Type >
class AT_RWBFS_DQ_MH  : public AT_BFS_DQ_MH<Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type > {

public:
	typedef		typename AT_BFS_DQ_MH<Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type >::Search_Node	Search_Node;
	typedef		typename Search_Model::State_Type		State;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_RWBFS_DQ_MH( 	const Search_Model& search_problem, float W = 5.0f, float decay = 0.75f ) 
	: AT_BFS_DQ_MH<Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type>(search_problem), m_W( W ), m_decay( decay ) {
	}

	virtual ~AT_RWBFS_DQ_MH() {
		for ( typename Closed_List_Type::iterator i = m_seen.begin();
			i != m_seen.end(); i++ ) {
			assert( this->closed().retrieve( i->second ) == NULL );
			delete i->second;
		}
		m_seen.clear();
	}

	virtual void			eval( Search_Node* candidate ) {
		if ( candidate->seen() ) return;

		std::vector<Action_Idx>	po;
		this->h1().eval( candidate, candidate->h1n(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po_1( po[k] );	

		po.clear();

		this->h2().eval( candidate, candidate->h2n(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po_2( po[k] );	
	}

	virtual void 			process(  Search_Node *head ) {

		std::vector< aptk::Action_Idx >	app_set;
		this->problem().applicable_set_v2( *(head->state()), app_set );
		/*
		typedef typename Search_Model::Action_Iterator Iterator;
		Iterator it( this->problem() );
		int a = it.start( *(head->state()) );
		while ( a != no_op ) {
		*/
		for ( unsigned i = 0; i < app_set.size(); i++ ) {
			int a = app_set[i];

			State *succ = this->problem().next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), a ), a, head, this->problem().num_actions() );

			if ( this->is_closed( n ) ) {
				delete n;
				//a = it.next();
				continue;
			}

			if ( is_open( n ) ) {
				delete n;
				//a = it.next();
				continue;
			}
			if ( is_seen( n ) ) {
				delete n;
				//a = it.next();
				continue;
			}
			n->h1n() = head->h1n();
			n->h2n() = head->h2n();
			n->fn() = m_W * n->h1n() + n->gn();
			this->inc_gen();
			if ( this->generated() % 100000 == 0 ) {
				std::cout << "Generated: " << this->generated() << " B = " << this->bound();
				std::cout << " Expanded: " << this->expanded() << " Pruned: " << this->pruned_by_bound() << " f(n) = ";
				std::cout << head->fn() << " g(n) = " << head->gn();
				std::cout << " h1(n) = " << n->h1n() << " h2(n) = " << n->h2n() << std::endl;
			}

			this->open_node(n, head->is_po_1(a), head->is_po_2(a));

			//a = it.next();
		}
		this->inc_eval();
	}

	virtual Search_Node*	 	do_search() {
		std::cout << "RWA* search!" << std::endl;
		Search_Node *head = this->get_node();
		while(head) {
			if ( head->gn() >= this->bound() )  {
				this->inc_pruned_bound();
				this->close(head);
				if ( this->expanded() > 1000 && this->pruned_by_bound() > this->expanded() ) {
					m_W *= m_decay;
					if ( m_W < 1.0f ) m_W = 1.0f;
					restart_search();
					std::cout << "New W value = " << m_W << std::endl;
				}
				head = this->get_node();
				continue;
			}

			if(this->problem().goal(*(head->state()))) {
				this->close(head);
				this->set_bound( head->gn() );
				m_W *= m_decay;
				if ( m_W < 1.0f ) m_W = 1.0f;
				restart_search();	
				std::cout << "New W value = " << m_W << std::endl;
				return head;
			}
			float t = time_used();
			if ( ( t - this->t0() ) > this->time_budget() ) {
				return NULL;
			}	
			
			this->eval( head );
			if ( head->h1n() != infty && head->h2n() != infty )
				this->process(head);
			this->close(head);
			head = this->get_node();
		}
		return NULL;
	}

	void	update_weight() {
		m_W *= m_decay;
		if ( m_W < 1.0f ) m_W = 1.0f;
		std::cout << "New W value = " << m_W << std::endl;
	}

	void	restart_search() {
		// MRJ: Move Closed to Seen
		std::cout << "Restart!" << std::endl;
		for ( typename Closed_List_Type::iterator it = this->closed().begin();
			it != this->closed().end(); it++ ) {
			it->second->set_seen();
			if ( it->second == this->root() ) continue;
			assert( m_seen.retrieve( it->second ) == NULL );
			//this->garbage().push_back( n2 );
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
				m_seen.put(head);
			head = this->get_node();
		}
		this->open_node( this->root(), false, false );
		this->reset_expanded();
		this->reset_pruned_by_bound();
	}

	virtual bool is_open( Search_Node *n ) {
		Search_Node *n2 = NULL;

		if( ( n2 = this->open_hash().retrieve(n)) ) {
			
			if(n->gn() < n2->gn())
			{
				n2->m_parent = n->m_parent;
				n2->m_action = n->m_action;
				n2->m_g = n->m_g;
				n2->m_f = m_W * n2->m_h1 + n2->m_g;
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
		n2->fn() = m_W * n2->h1n() + n2->gn();
		m_seen.erase( m_seen.retrieve_iterator(n2) );
		this->open_node( n2, n2->parent()->is_po_1(n2->action()), n2->parent()->is_po_2(n2->action()) );
		return true;
	}

	float	weight() const { return m_W; }

	Closed_List_Type&	seen() { return m_seen; }

protected:

	float					m_W;
	float					m_decay;
	Closed_List_Type			m_seen;	
};

}

}

}

#endif // at_bfs_sq_sh.hxx
