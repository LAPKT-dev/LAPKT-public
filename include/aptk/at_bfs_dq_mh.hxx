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

#ifndef __ANYTIME_DUAL_QUEUE_MULTIPLE_HEURISTIC_BEST_FIRST_SEARCH__
#define __ANYTIME_DUAL_QUEUE_MULTIPLE_HEURISTIC_BEST_FIRST_SEARCH__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <aptk/hash_table.hxx>
#include <aptk/open_list.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <list>

namespace aptk {

namespace search {

namespace bfs_dq_mh {

template <typename State>
class Node {
public:

	typedef	Fibonacci_Open_List< Node >	Open_List;
        typedef State State_Type;

        Node( State* s, float cost, Action_Idx action, Node<State>* parent, int num_actions ) 
        : m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ), m_po_1( num_actions ), m_po_2( num_actions), m_seen(false),
	current( nullptr ) {
                m_g = ( parent ? parent->m_g + cost : 0.0f);
        }
        
        virtual ~Node() {
                if ( m_state != NULL ) delete m_state;
        }

        float&                        h1n()                                { return m_h1; }
        float                        h1n() const                         { return m_h1; }
        float&                        h2n()                                { return m_h2; }
        float                        h2n() const                         { return m_h2; }
        float&                        gn()                                { return m_g; }                        
        float                        gn() const                         { return m_g; }
        float&                        fn()                                { return m_f; }
        float                        fn() const                        { return m_f; }
        Node<State>*                parent()                           { return m_parent; }
        Action_Idx                action() const                         { return m_action; }
        State*                        state()                                { return m_state; }
        const State&                state() const                         { return *m_state; }
        void                        add_po_1( Action_Idx index )        { m_po_1.set( index ); }
        void                        remove_po_1( Action_Idx index ) { m_po_1.unset( index ); }
        void                        add_po_2( Action_Idx index )        { m_po_2.set( index ); }
        void                        remove_po_2( Action_Idx index ) { m_po_2.unset( index ); }
        bool                        is_po_1(Action_Idx index) const        { return m_po_1.isset( index ); }
        bool                        is_po_2(Action_Idx index) const        { return m_po_2.isset( index ); }
        void                        set_seen( )                        { m_seen = true; }
        bool                        seen() const                        { return m_seen; }

        void                        print( std::ostream& os ) const {
                os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = ";
                os << m_g << ", h1(n) = " << m_h1 << ", h2(n) = " << m_h2 << ", f(n) = " << m_f << "}";
        }

        bool           operator==( const Node<State>& o ) const {
                
                if( &(o.state()) != NULL && &(state()) != NULL)
                        return (const State&)(o.state()) == (const State&)(state());
                /**
                 * Lazy
                 */
                if  ( m_parent == NULL ) {
                        if ( o.m_parent == NULL ) return true;
                        return false;
                }
        
                if ( o.m_parent == NULL ) return false;
                
                return (m_action == o.m_action) && ( *(m_parent->m_state) == *(o.m_parent->m_state) );
        }

	// MRJ: NOTE: return value is the answer to question "is this node worse than o?"
	bool    operator<( const Node<State>& o ) const {
		if ( fn() > o.fn() ) return true;

		if ( dequal( fn(), o.fn() ) ) {
			if ( h1n() > o.h1n() ) return true;
			if ( dequal( h1n(), o.h1n() ) ) {
				if ( h2n() > o.h2n() ) return true;
				if ( dequal( h2n(), o.h2n() ) ) {
					if ( gn() > o.gn() ) return true;
				}
			}
		}
		return false;
	}

        size_t                  hash() const { return m_state->hash(); }

	void notify_update( ) {
		assert( current != nullptr );
		if ( current )
			current->update( this ); 
	}

	void detach() {
		assert( current != nullptr );
		if ( current )
			current->erase( this );
	}

public:

        State*                		m_state;
        Node<State>*        		m_parent;
        float                		m_h1;
        float                		m_h2;
        Action_Idx        		m_action;
        float                		m_g;
        float                		m_f;
        Bit_Set                		m_po_1;
        Bit_Set                		m_po_2;
        bool     	           	m_seen;
	typename Open_List::Handle	heap_handle;
	Open_List*			current;
};


template <typename State>
class Lazy_Node {
public:

        typedef State State_Type;

        Lazy_Node( float cost, Action_Idx action, Lazy_Node<State>* parent, int num_actions ) 
        : m_state( NULL ), m_parent( parent ), m_action(action), m_g( 0 ), m_po_1( num_actions ), m_po_2( num_actions) {
                m_g = ( parent ? parent->m_g + cost : 0.0f);
        }
        
        virtual ~Lazy_Node() {
                if ( m_state != NULL ) delete m_state;
        }

        float&                        h1n()                                { return m_h1; }
        float                        h1n() const                         { return m_h1; }
        float&                        h2n()                                { return m_h2; }
        float                        h2n() const                         { return m_h2; }
        float&                        gn()                                { return m_g; }                        
        float                        gn() const                         { return m_g; }
        float&                        fn()                                { return m_f; }
        float                        fn() const                        { return m_f; }
        Lazy_Node<State>*        parent()                           { return m_parent; }
        Action_Idx                action() const                         { return m_action; }
        void                        set_state( State* s )                { m_state = s; }
        State*                        state()                                { return m_state; }
        const State&                state() const                         { return *m_state; }
        void                        add_po_1( Action_Idx index )        { m_po_1.set( index ); }
        void                        remove_po_1( Action_Idx index ) { m_po_1.unset( index ); }
        void                        add_po_2( Action_Idx index )        { m_po_2.set( index ); }
        void                        remove_po_2( Action_Idx index ) { m_po_2.unset( index ); }
        bool                        is_po_1(Action_Idx index) const        { return m_po_1.isset( index ); }
        bool                        is_po_2(Action_Idx index) const        { return m_po_2.isset( index ); }
        void                        set_seen( )                        { m_seen = true; }
        bool                        seen() const                        { return m_seen; }

        bool                        operator==( const Lazy_Node<State>& o ) const {
                if  ( m_parent == NULL ) {
                        if ( o.m_parent == NULL ) return true;
                        return false;
                }
        
                if ( o.m_parent == NULL ) return false;
                
                return (m_action == o.m_action) && ( *(m_parent->m_state) == *(o.m_parent->m_state) );
        }

        void                        print( std::ostream& os ) const {
                os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = ";
                os << m_g << ", h1(n) = " << m_h1 << ", h2(n) = " << m_h2 << ", f(n) = " << m_f << "}";
        }

        size_t        hash() const { return m_hash; }

        void        update_hash() {
                Hash_Key hasher;
                hasher.add( m_action );
                if ( m_parent != NULL )
                        hasher.add( m_parent->state()->fluent_vec() );
                m_hash = (size_t)hasher;
        }

public:

        State*                        m_state;
        Lazy_Node<State>*        m_parent;
        float                        m_h1;
        float                        m_h2;
        Action_Idx                m_action;
        float                        m_g;
        float                        m_f;
        Bit_Set                        m_po_1;
        Bit_Set                        m_po_2;
        bool                        m_seen;
        size_t                        m_hash;
};

// Anytime best-first search, with one single open list and one single
// heuristic estimator, with delayed evaluation of states generated
template <typename Search_Model, typename Primary_Heuristic, typename Secondary_Heuristic, typename Open_List_Type >
class AT_BFS_DQ_MH {

public:

	typedef		typename Search_Model::State_Type		State;
	typedef  	typename Open_List_Type::Node_Type		Search_Node;
	typedef 	Closed_List< Search_Node >			Closed_List_Type;

	AT_BFS_DQ_MH( 	const Search_Model& search_problem ) 
	: m_problem( search_problem ), m_primary_h(NULL), 
	m_exp_count(0), m_gen_count(0), m_pruned_B_count(0), m_dead_end_count(0), m_open_repl_count(0),
	m_B( infty ), m_time_budget(infty), m_po_joint_exp_left( 100 ), m_po_1_exp_left(50), m_non_po_exp_left(1), m_po_joint_exp_max(100), m_po_1_exp_max(50), m_non_po_exp_max(1) {
		m_primary_h = new Primary_Heuristic( search_problem );
		m_secondary_h = new Secondary_Heuristic( search_problem );
	}

	virtual ~AT_BFS_DQ_MH() {
		for ( typename Closed_List_Type::iterator i = m_closed.begin();
			i != m_closed.end(); i++ ) {
			delete i->second;
		}
		Search_Node *head = this->get_node();
		while ( head ) {
			delete head;
			head = this->get_node();
		}
	
		m_closed.clear();
		m_open_hash.clear();

		for ( typename std::list<Search_Node*>::iterator it = m_garbage.begin();
			it != m_garbage.end(); it++ )
			delete *it;

		delete m_primary_h;
		delete m_secondary_h;
	}

	virtual void	start( float B = infty) {
		m_B = B;
		m_root = new Search_Node( m_problem.init(), 0.0f, no_op, NULL, m_problem.num_actions() );
		eval(m_root);
		#ifdef DEBUG
		std::cout << "Initial search node: ";
		m_root->print(std::cout);
		std::cout << std::endl;
		#endif 
		m_open.insert( m_root );
		m_open_hash.put( m_root );
		inc_gen();
	}

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		cost = infty;
		m_t0 = time_used();
		Search_Node* end = do_search();
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );	
		float t2 = time_used();
		m_time_budget -= ( t2 - m_t0);
		return true;
	}

	void	set_schedule( int max_po_joint_exp, int max_po_1_exp, int max_non_po_exp ) {
		m_po_joint_exp_max = max_po_joint_exp;
		m_po_1_exp_max = max_po_1_exp;
		m_non_po_exp_max = max_non_po_exp;
	}

	float			bound() const			{ return m_B; }
	void			set_bound( float v ) 		{ m_B = v; }

	void			inc_gen()			{ m_gen_count++; }
	unsigned		generated() const		{ return m_gen_count; }
	void			inc_eval()			{ m_exp_count++; }
	void			reset_expanded()		{ m_exp_count = 0; }
	unsigned		expanded() const		{ return m_exp_count; }
	void			reset_pruned_by_bound()		{ m_pruned_B_count = 0; }
	void			inc_pruned_bound() 		{ m_pruned_B_count++; }
	unsigned		pruned_by_bound() const		{ return m_pruned_B_count; }
	void			inc_dead_end()			{ m_dead_end_count++; }
	unsigned		dead_ends() const		{ return m_dead_end_count; }
	void			inc_replaced_open()		{ m_open_repl_count++; }
	unsigned		open_repl() const		{ return m_open_repl_count; }

	void			set_budget( float v ) 		{ m_time_budget = v; }
	float			time_budget() const		{ return m_time_budget; }

	float			t0() const			{ return m_t0; }

	void 			close( Search_Node* n ) 	{  m_closed.put(n); }

	const	Search_Model&	problem() const			{ return m_problem; }

	Search_Node*		root()				{ return m_root; }
	void			set_root( Search_Node* n )	{ m_root = n; }	

	Closed_List_Type&		closed() 			{ return m_closed; }
	Open_List_Type&			open()				{ return m_open; }
	Closed_List_Type&		open_hash() 			{ return m_open_hash; }
	std::list<Search_Node*>&	garbage()			{ return m_garbage; }
	Primary_Heuristic&	h1()				{ return *m_primary_h; }
	Secondary_Heuristic&	h2()				{ return *m_secondary_h; }

	virtual void	eval( Search_Node* candidate ) {
		std::vector<Action_Idx>	po;
		m_primary_h->eval( candidate, candidate->h1n(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po_1( po[k] );
		po.clear();
		m_secondary_h->eval( candidate, candidate->h2n(), po );
		for ( unsigned k = 0; k < po.size(); k++ )
			candidate->add_po_2( po[k] );
			
	}
	
	Search_Node*		get_node( Open_List_Type& open ) {
		if ( open.empty() ) return NULL;

		Search_Node* next = open.pop();
		if ( !m_open_hash.empty() ) 
			m_open_hash.erase( m_open_hash.retrieve_iterator( next) );
		return next;				
	}

	Search_Node* 		get_node() {
		
		if ( m_open.empty() && m_open_po_joint.empty() && m_open_po_1.empty() ) return NULL;
	
		Search_Node *next = NULL;

		if ( m_po_joint_exp_left > 0 ) {	
			next = get_node( m_open_po_joint );
			if (next == NULL )
				m_po_1_exp_left++;
			else
			{
				m_po_joint_exp_left--;			
				if ( m_po_joint_exp_left == 0 )
					m_po_1_exp_left = m_po_1_exp_max;
				return next;
			}
		}
		
		if ( m_po_1_exp_left > 0 ) {	
			next = get_node( m_open_po_1 );
			if (next == NULL )
				m_non_po_exp_left++;
			else
			{
				m_po_1_exp_left--;			
				if ( m_po_1_exp_left == 0 )
					m_non_po_exp_left = m_non_po_exp_max;
				return next;
			}
		}

		if ( m_non_po_exp_left > 0 ) {
			next = get_node( m_open );
			if ( next == NULL ) {
				next = get_node( m_open_po_joint );		
				if ( next == NULL ) {
					next = get_node( m_open_po_1 );
				}
			}
			else {
				m_non_po_exp_left--;
				if ( m_non_po_exp_left == 0 )
					m_po_joint_exp_left = m_po_joint_exp_max;
			}
		}

		return next;
	}

	void	 	open_node( Search_Node *n, bool po_1, bool po_2 ) {
		if(n->h1n() == infty ) {
			close(n);
			inc_dead_end();
		}
		else {
			if ( po_1 && po_2 ) {
				/*
				#ifdef DEBUG
				std::cout << "Node: ";
				n->print(std::cout);
				std::cout << " goes to JOINT OPEN" << std::endl;
				#endif
				*/
				m_open_po_joint.insert(n);
			}
			else if ( po_1 && !po_2 ) {
				m_open_po_1.insert(n);
			}
			else {
				/*
				#ifdef DEBUG
				std::cout << "Node: ";
				n->print(std::cout);
				std::cout << " goes to DEFAULT OPEN" << std::endl;
				#endif
				*/
				m_open.insert(n);
			}
			m_open_hash.put(n);
			inc_gen();
		}
	}

	

	virtual void 	process(  Search_Node *head ) {
		typedef typename Search_Model::Action_Iterator Iterator;
		Iterator it( this->problem() );
		int a = it.start( *(head->state()) );
		while ( a != no_op ) {		
			State *succ = m_problem.next( *(head->state()), a );
			Search_Node* n = new Search_Node( succ, m_problem.cost( *(head->state()), a ), a, head, m_problem.num_actions() );
			if ( is_closed( n ) ) {
				delete n;
				a = it.next();
				continue;
			}
			if( is_open(n) ) {
				delete n;
				a = it.next();
				continue;
			}

			n->h1n() = head->h1n();
			n->h2n() = head->h2n();
			n->fn() = n->h1n() + n->gn();

			open_node(n, head->is_po_1(a), head->is_po_2(a));

			a = it.next();	
		} 
		inc_eval();
	}

	virtual Search_Node*	 	do_search() {
		Search_Node *head = get_node();
		int counter =0;
		while(head) {
			if ( head->gn() >= bound() )  {
				inc_pruned_bound();
				close(head);
				head = get_node();
				continue;
			}
			if(m_problem.goal(*(head->state()))) {
				close(head);
				set_bound( head->gn() );	
				return head;
			}
			if ( (time_used() - m_t0 ) > m_time_budget )
				return NULL;
	
			eval( head );

			process(head);
			close(head);
			counter++;
			head = get_node();
		}
		return NULL;
	}

	virtual bool is_open( Search_Node *n ) {
		Search_Node *previous_copy = NULL;

		if( (previous_copy = m_open_hash.retrieve(n)) ) {
			
			if(n->gn() < previous_copy->gn())
			{
				previous_copy->m_parent = n->m_parent;
				previous_copy->m_action = n->m_action;
				previous_copy->m_g = n->m_g;
				previous_copy->m_f = previous_copy->m_h1 + previous_copy->m_g;
				previous_copy->notify_update();
				inc_replaced_open();
			}
			return true;
		}

		return false;
	}

	bool	is_closed( Search_Node* n ) {
		Search_Node* n2 = closed().retrieve(n);

		if ( n2 != NULL ) {
			if ( n2->gn() <= n->gn() ) {
				// The node we generated is a worse path than
				// the one we already found
				return true;
			}
			// Otherwise, we put it into Open and remove
			// n2 from closed
			closed().erase( closed().retrieve_iterator( n2 ) );
			m_garbage.push_back( n2 );
		}
		return false;
	}

protected:

	virtual void	extract_plan( Search_Node* s, Search_Node* t, std::vector<Action_Idx>& plan, float& cost ) {
		Search_Node *tmp = t;
		cost = 0.0f;
		while( tmp != s) {
			cost += m_problem.cost( *(tmp->state()), tmp->action() );
			plan.push_back(tmp->action());
			tmp = tmp->parent();
		}
		
		std::reverse(plan.begin(), plan.end());		
	}

	void	extract_path( Search_Node* s, Search_Node* t, std::vector<Search_Node*>& plan ) {
		Search_Node* tmp = t;
		while( tmp != s) {
			plan.push_back(tmp);
			tmp = tmp->parent();
		}
		
		std::reverse(plan.begin(), plan.end());				
	}
	
protected:

	const Search_Model&			m_problem;
	Primary_Heuristic*			m_primary_h;
	Secondary_Heuristic*			m_secondary_h;
	Open_List_Type				m_open_po_joint;
	Open_List_Type				m_open_po_1;
	Open_List_Type				m_open_po_2;
	Open_List_Type				m_open;
	Closed_List_Type			m_closed, m_open_hash;
	unsigned				m_exp_count;
	unsigned				m_gen_count;
	unsigned				m_pruned_B_count;
	unsigned				m_dead_end_count;
	unsigned				m_open_repl_count;
	float					m_B;
	float					m_time_budget;
	float					m_t0;
	Search_Node*				m_root;
	unsigned				m_po_joint_exp_left;
	unsigned				m_po_1_exp_left;
	unsigned				m_non_po_exp_left;
	unsigned				m_po_joint_exp_max;
	unsigned				m_po_1_exp_max;
	unsigned				m_non_po_exp_max;
	std::list<Search_Node*>			m_garbage;
};

}

}

}

#endif // at_bfs_sq_sh.hxx
