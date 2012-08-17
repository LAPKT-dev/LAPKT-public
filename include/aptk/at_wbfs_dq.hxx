#ifndef __ANYTIME_DUAL_QUEUE_DUAL_HEURISTIC_WEIGHTED_BEST_FIRST_SEARCH__
#define __ANYTIME_DUAL_QUEUE_DUAL_HEURISTIC_WEIGHTED_BEST_FIRST_SEARCH__

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

// Anytime best-first search, with one single open list and one single
// heuristic estimator, with delayed evaluation of states generated.
// Evaluation function f(n) corresponds to that of Weighted A*
//          f(n) = g(n) + W h(n)
// the value of W decreases each time a solution is found, according to the
// value of the decay parameter.

template <typename Search_Model, typename Abstract_Heuristic, typename Open_List_Type >
class AT_WBFS_DQ_SH  : public AT_BFS_DQ_SH<Search_Model, Abstract_Heuristic, Open_List_Type > {

public:
	typedef		typename Search_Model::State_Type		State;
	typedef  	Node< State >					Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_WBFS_DQ_SH( 	const Search_Model& search_problem, float W = 5.0f, float decay = 0.75f ) 
	: AT_BFS_DQ_SH<Search_Model, Abstract_Heuristic, Open_List_Type>(search_problem), m_W( W ), m_decay( decay ) {
	}

	~AT_WBFS_DQ_SH() {
	}

	void 			process(  Search_Node *head ) {

		for(int i = 0; i < this->problem().num_actions(); i++) {

			if( this->problem().is_applicable( *(head->state()), i ) ) {

				State *succ = this->problem().next( *(head->state()), i );
				Search_Node* n = new Search_Node( succ, this->problem().cost( *(head->state()), i ), i, head );
				if ( is_closed( n ) ) {
					delete n;
					continue;
				}
				n->hn() = head->hn();
				n->fn() = m_W * n->hn() + n->gn();
				if( this->previously_hashed(n) ) {
					delete n;
				}
				else 
					this->open_node(n, head->is_po(i));
			}
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
};

}

}

}

#endif // at_bfs_sq_sh.hxx
