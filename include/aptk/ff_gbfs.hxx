#ifndef __FF_GBFS__
#define __FF_GBFS__
#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <vector>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace search{

template <typename Node>
class Node_Comparer_HA
{             
public:
	bool operator()( Node* a, Node* b ) const {
		if ( b->fn() < a->fn() ) return true;
		if ( b->fn() > a->fn() ) return false;
		/*
		if ( b->gn() < a->gn() ) return true;
		if ( b->gn() > a->gn() ) return false;
		*/
		return false;

	}
};        
 
template <typename State>
class FF_GBFS_Node {
public:

	typedef State State_Type;

	FF_GBFS_Node( State* s, unsigned cost, Action_Idx action, FF_GBFS_Node<State>* parent, bool is_ha = false ) 
	: m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ), m_is_ha(is_ha) {
		m_g = ( parent ? parent->m_g + cost : 0.0f);
	}
	
	virtual ~FF_GBFS_Node() {
		if ( m_state != NULL ) delete m_state;
	}

	unsigned&			hn()		{ return m_h; }
	unsigned			hn() const 	{ return m_h; }
	unsigned&			gn()		{ return m_g; }			
	unsigned			gn() const 	{ return m_g; }
	unsigned&			fn()		{ return m_f; }
	unsigned			fn() const	{ return m_f; }
	FF_GBFS_Node<State>*	parent()   	{ return m_parent; }
	Action_Idx		action() const 	{ return m_action; }
	State*			state()		{ return m_state; }
	const State&		state() const 	{ return *m_state; }
	bool			is_ha() const	{ return m_is_ha;}
	std::vector<Action_Idx>&	ha()	{ return m_ha;}

	void			print( std::ostream& os ) const {
		os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = " << m_g << ", h(n) = " << m_h << ", f(n) = " << m_f << "}";
	}

	bool   	operator==( const FF_GBFS_Node<State>& o ) const {
		
		return (const State&)(o.state()) == (const State&)(state());
	}

	size_t                  hash() const { return m_state->hash(); }

public:

	State*				m_state;
	FF_GBFS_Node<State>*		m_parent;
	unsigned				m_h;
	Action_Idx			m_action;
	unsigned				m_g;
	unsigned				m_f;
	bool				m_is_ha;
	std::vector<Action_Idx>		m_ha;
};

template <typename Search_Model, typename Abstract_Heuristic, typename Open_List_Type >
class FF_GBFS {

public:

	typedef	typename 		Search_Model::State_Type		State;
	typedef typename	 	Open_List_Type::Node_Type		Search_Node;
	typedef 			Closed_List< Search_Node >		Closed_List_Type;

	FF_GBFS( 	const Search_Model& search_problem ) 
	: m_problem( search_problem ), m_heuristic_func(NULL), 
	m_exp_count(0), m_gen_count(0), m_pruned_B_count(0), m_dead_end_count(0), m_open_repl_count(0),
	  m_B( infty ) {
		m_heuristic_func = new Abstract_Heuristic( search_problem );
	}

	virtual ~FF_GBFS() {
		for ( typename Closed_List_Type::iterator i = m_closed.begin();
			i != m_closed.end(); i++ ) {
			delete i->second;
		}
		while	(!m_open.empty() ) 
		{	
			Search_Node* n = m_open.pop();
			delete n;
		}
		m_closed.clear();
		m_open_hash.clear();
		delete m_heuristic_func;
	}

	void	start() {
		m_B = infty;
		m_root = new Search_Node( m_problem.init(), 0.0f, no_op, NULL );	
		#ifdef DEBUG_FF_GBFS
		std::cout << "Initial search node: ";
		m_root->print(std::cout);
		std::cout << std::endl;
		m_root->state()->print( std::cout );
		std::cout << std::endl;
		#endif
		m_h_time = 0.0f; 
		eval(m_root);
		m_open.insert( m_root );
		inc_gen();
	}

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		Search_Node* end = do_search();
		#ifdef DEBUG
		std::cout << "Heuristic time: " << m_h_time << " secs" << std::endl;
		#endif
		if ( end == NULL ) return false;
		extract_plan( m_root, end, plan, cost );	
		
		return true;
	}

	unsigned		bound() const			{ return m_B; }
	void			set_bound( unsigned v ) 		{ m_B = v; }
	
	void			inc_gen()			{ m_gen_count++; }
	unsigned		generated() const		{ return m_gen_count; }
	void			inc_eval()			{ m_exp_count++; }
	unsigned		expanded() const		{ return m_exp_count; }
	void			inc_pruned_bound() 		{ m_pruned_B_count++; }
	unsigned		pruned_by_bound() const		{ return m_pruned_B_count; }
	void			inc_dead_end()			{ m_dead_end_count++; }
	unsigned		dead_ends() const		{ return m_dead_end_count; }
	void			inc_replaced_open()		{ m_open_repl_count++; }
	unsigned		open_repl() const		{ return m_open_repl_count; }

	void 			close( Search_Node* n ) 	{  m_closed.put(n); }
	Closed_List_Type&	closed() 			{ return m_closed; }
	Closed_List_Type&	open_hash() 			{ return m_open_hash; }

	const	Search_Model&	problem() const			{ return m_problem; }

	void			eval( Search_Node* candidate ) {
		float t0 = time_used(); 
		m_heuristic_func->eval( *(candidate->state()), candidate->hn(), candidate->ha() );
		float tf = time_used();
		m_h_time += (tf - t0);
	}

	bool 		is_closed( Search_Node* n ) 	{
		Search_Node* n2 = this->closed().retrieve(n);

		if ( n2 != NULL ) {
			return true;
		}
		return false;
	}

	Search_Node* 		get_node() {
		Search_Node *next = NULL;
		if(! m_open.empty() ) {
			next = m_open.pop();
		}
		return next;
	}

	void	 	open_node( Search_Node *n ) {
		if(n->hn() == infty ) {
			close(n);
			inc_dead_end();
		}
		else {
			m_open.insert(n);
		}
		inc_gen();
	}

	/**
	 * Succ Generator Process
	 */
	virtual void 			process(  Search_Node *head ) {

		
#ifdef DEBUG_FF_GBFS
		std::cout << "Expanding:" << std::endl;
		head->print(std::cout);
		std::cout << std::endl;
		head->state()->print( std::cout );
		std::cout << std::endl;
#endif
		std::vector< aptk::Action_Idx > app_set;
		this->problem().applicable_set_v2( *(head->state()), app_set );

		for (unsigned i = 0; i < app_set.size(); ++i ) {
			int a = app_set[i];
			
			State *succ = m_problem.next( *(head->state()), a ); 
			Search_Node* n = new Search_Node( succ, m_problem.cost( *(head->state()), a ), a, head, false );			
			

			#ifdef DEBUG_FF_GBFS

			std::cout << "Successor:" << std::endl;
			n->print(std::cout);
			std::cout << std::endl;
			n->state()->print( std::cout );
			std::cout << std::endl;
			#endif

			if ( is_closed( n ) ) {
				#ifdef DEBUG_FF_GBFS

				std::cout << "Already in CLOSED" << std::endl;
				#endif
				delete n;
				continue;
			}
			eval(n);
			n->fn() = n->hn();
			if ( n->fn() == infinity() ) {
				close(n);
				continue;
			}
			#ifdef DEBUG_FF_GBFS

			std::cout << "Inserted into OPEN" << std::endl;
			#endif
			open_node(n);	
		} 
		inc_eval();
	}

	unsigned infinity() const { return std::numeric_limits<unsigned>::max(); }

	virtual Search_Node*	 	do_search() {
		unsigned	min_h = infinity();

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

			if ( head->hn() < min_h ) {
				min_h = head->hn();
				#ifdef DEBUG
				std::cout << "GBFS: h(n) = " << min_h << ", expanded: " << expanded() << ", generated: " << generated() << std::endl;
				#endif
			}

			close(head);
			process(head);
			counter++;
			head = get_node();
		}
		return NULL;
	}

protected:

	void	extract_plan( Search_Node* s, Search_Node* t, std::vector<Action_Idx>& plan, float& cost ) {
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
	Abstract_Heuristic*			m_heuristic_func;
	Open_List_Type				m_open;
	Closed_List_Type			m_closed, m_open_hash;
	unsigned				m_exp_count;
	unsigned				m_gen_count;
	unsigned				m_pruned_B_count;
	unsigned				m_dead_end_count;
	unsigned				m_open_repl_count;
	unsigned				m_B;
	Search_Node*				m_root;
	std::vector<Action_Idx> 		m_app_set;
	bool                                    m_greedy;
	bool                                    m_delay_eval;
	float					m_h_time;
};

}

}

#endif
