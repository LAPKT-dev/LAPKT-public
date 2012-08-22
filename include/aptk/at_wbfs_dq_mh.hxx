#ifndef __ANYTIME_DUAL_QUEUE_DUAL_HEURISTIC_WEIGHTED_BEST_FIRST_SEARCH__
#define __ANYTIME_DUAL_QUEUE_DUAL_HEURISTIC_WEIGHTED_BEST_FIRST_SEARCH__

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

// Anytime best-first search, with one single open list and one single
// heuristic estimator, with delayed evaluation of states generated.
// Evaluation function f(n) corresponds to that of Weighted A*
//          f(n) = g(n) + W h(n)
// the value of W decreases each time a solution is found, according to the
// value of the decay parameter.

template <typename Search_Model, typename Primary_Heuristic, typename Secondary_Heuristic, typename Open_List_Type >
class AT_WBFS_DQ_MH  : public AT_BFS_DQ_MH<Search_Model, Primary_Heuristic, Secondary_Heuristic, Open_List_Type > {

public:
	typedef		typename Search_Model::State_Type		State;
	typedef  	Node< State >					Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_WBFS_DQ_MH( 	const Search_Model& search_problem, float W = 5.0f, float decay = 0.75f ) 
	: AT_BFS_DQ_MH<Search_Model, Abstract_Heuristic, Open_List_Type>(search_problem), m_W( W ), m_decay( decay ) {
	}

	~AT_WBFS_DQ_MH() {
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
			n->h1n() = head->h1n();
			n->h2n() = head->h2n();
			n->fn() = m_W * n->h1n() + n->gn();
			if( previously_hashed(n) ) {
				delete n;
			}
			else 
				open_node(n, head->is_po_1(a), head->is_po_2(a));	
			a = it.next();	
		} 
		this->inc_eval();
	}

	Search_Node*	 	do_search() {
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

protected:

	float					m_W;
	float					m_decay;
	std::vector<Action_Idx>			m_app_set;
};

}

}

}

#endif // at_bfs_sq_sh.hxx
