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

	~AT_RWBFS_DQ_SH() {
		for ( typename Closed_List_Type::iterator i = m_seen.begin();
			i != m_seen.end(); i++ ) {
			delete i->second;
		}
		m_seen.clear();
	}

	void			eval( Search_Node* candidate ) {
		if ( candidate->seen() ) return;
		std::vector<Action_Idx>	po;
		this->heuristic().eval( *(candidate->state()), candidate->hn(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po( po[k] );	
	}

	void 			process(  Search_Node *head ) {

		typedef typename Search_Model::Action_Iterator Iterator;
		Iterator it( this->problem() );
		int a = it.start( *(head->state()) );
		while ( a != no_op ) {
			State *succ = this->problem().next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), a ), a, head, this->problem().num_actions() );
			if ( is_closed( n ) ) {
				delete n;
				a = it.next();
				continue;
			}

			Search_Node* n2 = m_seen.retrieve(n);
			if ( n2 == NULL ) {	
				n->hn() = head->hn();
				n->fn() = m_W * n->hn() + n->gn();
				if( this->previously_hashed(n) ) {
					delete n;
				}
				else 
					this->open_node(n, head->is_po(a));
			}
			else {
				if ( n->gn() < n2->gn() ) {
					m_seen.erase( m_seen.retrieve_iterator(n2) );
					delete n2;
					if ( this->previously_hashed(n) ) {
						delete n;
					}
					else
						this->open_node(n, head->is_po(a));
				}
				else {
					delete n;
					n2->fn() = m_W * n2->hn() + n2->gn();
					this->open_node( n2, head->is_po(a) );
				}
			}
			a = it.next();
		}
		this->inc_eval();
	}

	Search_Node*	 	do_search() {
		Search_Node *head = this->get_node();
		while(head) {
			if ( head->gn() >= this->bound() )  {
				this->inc_pruned_bound();
				if ( !head->seen() )
					this->close(head);
				head = this->get_node();
				continue;
			}

			if(this->problem().goal(*(head->state()))) {
				this->close(head);
				this->set_bound( head->gn() );
				m_W *= m_decay;
				if ( m_W < 1.0f ) m_W = 1.0f;
				restart_search();	
				return head;
			}
			if ( (time_used() - this->t0() ) > this->time_budget() )
				return NULL;
	
			this->eval( head );

			this->process(head);
			if ( !head->seen() )
				this->close(head);
			head = this->get_node();
			if ( this->expanded() % 1000 ) {
				std::cout << "Expanded: " << this->expanded() << " g(head(OPEN)) = " << head->gn() << std::endl;
			}
		}
		return NULL;
	}

	void	restart_search() {
		// MRJ: Move Closed to Seen
		for ( typename Closed_List_Type::iterator it = this->closed().begin();
			it != this->closed().end(); it++ ) {
			it->second->set_seen();
			m_seen.put( it->second );
		} 
		this->closed().clear();
		// MRJ: Clear the contents of Open
		this->open_hash().clear();
		Search_Node *head = this->get_node();
		while ( head ) {
			delete head;
			head = this->get_node();
		}
		open_node( this->root(), false );
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
