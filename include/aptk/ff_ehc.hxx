#ifndef __FF_EHC__
#define __FF_EHC__

#include <aptk/search_prob.hxx>
#include <aptk/resources_control.hxx>
#include <aptk/closed_list.hxx>
#include <vector>
#include <algorithm>
#include <iostream>
#include <deque>
#include <aptk/hash_table.hxx>

namespace aptk {

namespace search {

	template < typename State >
	class FF_EHC_Node {
	
	public:
		
		typedef State	State_Type;
		
		FF_EHC_Node( State* s, Action_Idx action, FF_EHC_Node<State>* parent )
		: m_state ( s ), m_parent( parent ), m_action( action ), m_depth(0) {
			if ( m_parent != nullptr )
				m_depth = m_parent->depth() + 1;
		}
	
		~FF_EHC_Node() {
			if ( m_state )
				delete m_state;
		}
	
		FF_EHC_Node<State>*	parent() 	{ return m_parent; }
		Action_Idx		action() const  { return m_action; }
		State*			state()		{ return m_state; }
		const State&		state() const 	{ return *m_state; }
	
		void			print( std::ostream& os ) const {
			os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << "}";
		}
	
		bool   	operator==( const FF_EHC_Node<State>& o ) const {
			return (const State&)(o.state()) == (const State&)(state());
		}
	
		size_t                  hash() const { return m_state->hash(); }
	
		unsigned&		depth() { return m_depth; }

	public:
		State*				m_state;
		FF_EHC_Node<State>*		m_parent;
		Action_Idx			m_action;
		unsigned			m_depth;	
	};

template <typename Search_Model, typename Abstract_Heuristic >
class FF_EHC {

public:
	typedef typename		Search_Model::State_Type		State;
	typedef 			FF_EHC_Node< State >			Search_Node;
	//typedef 			std::deque< Search_Node* >	Open_List_Type;
	typedef				std::list< Search_Node* >	Open_List_Type;
	typedef 			Closed_List< Search_Node >		Closed_List_Type;		

	FF_EHC( const Search_Model& search_problem ) 
	: m_problem( search_problem ), m_heuristic_func( nullptr ),
	m_exp_count(0), m_gen_count(0) {
		m_heuristic_func = new Abstract_Heuristic( search_problem );
	}

	virtual ~FF_EHC( ) {
		for ( typename Closed_List_Type::iterator i = m_closed.begin();
			i != m_closed.end(); i++ ) {
			delete i->second;
		}
		while	(!m_open.empty() ) 
		{	
			Search_Node* n = m_open.front();
			m_open.pop_front();
			delete n;
		}
		m_closed.clear();
		if ( m_heuristic_func != nullptr )
			delete m_heuristic_func;		
	}

	void start() {
		m_root = new Search_Node( m_problem.init(), no_op, nullptr );	
		#ifdef DEBUG
		std::cout << "Initial search node: ";
		m_root->print(std::cout);
		std::cout << std::endl;
		m_root->state()->print( std::cout );
		std::cout << std::endl;
		#endif 
	}

	bool	find_solution( float& cost, std::vector<Action_Idx>& plan ) {
		Search_Node* end = do_search();
		if ( end == nullptr ) return false;
		extract_plan( m_root, end, plan, cost );
		return true;
	}

	void			inc_gen()			{ m_gen_count++; }
	unsigned		generated() const		{ return m_gen_count; }
	void			inc_eval()			{ m_exp_count++; }
	unsigned		expanded() const		{ return m_exp_count; }
	void 			close( Search_Node* n ) 	{  m_closed.put(n); }
	Closed_List_Type&	closed() 			{ return m_closed; }
	const	Search_Model&	problem() const			{ return m_problem; }


	bool 		is_closed( Search_Node* n ) 	{
		Search_Node* n2 = this->closed().retrieve(n);
		if ( n2 != nullptr ) {
			return true;
		}
		return false;
	}

	virtual void	process( Search_Node* head, const std::vector< Action_Idx >& A ) {
		#ifdef DEBUG
			std::cout << "Expanding:" << std::endl;
			head->print(std::cout);
			std::cout << std::endl;
			head->state()->print( std::cout );
			std::cout << std::endl;
		#endif
		
		for ( auto a : A ) {
			Search_Node* n = new Search_Node( nullptr, a, head );
			m_open.push_back( n );
			inc_gen();
		}
	}

	unsigned infinity() const { return std::numeric_limits<unsigned>::max(); }

	virtual Search_Node*	 	do_search() {

		unsigned h_time = 0.0f, t0, tf;
		Search_Node* current = m_root;
		std::vector< Action_Idx >	H;
		unsigned			hS;
		close( current );
		t0 = time_used();
		m_heuristic_func->eval( *(current->state()), hS, H );
		tf = time_used();
		h_time += ( tf - t0 );
		inc_eval();


		while ( !m_problem.goal( *(current->state()) ) ) {
			#ifdef DEBUG_FF_EHC	
			std::cout << "EHC: h(n) = " << hS << ", expanded: " << expanded() << ", generated: " << generated() << ", depth: " << current->depth() << std::endl;
			#endif
			current->depth() = 0;
			if ( hS == infinity() ) {
				#ifdef DEBUG_FF_EHC
				std::cout << "EHC Fails!" << std::endl;
				#endif
				return nullptr;
			}
 
			process( current, H );
			bool improved = false;
			while ( !m_open.empty() ) {
				Search_Node* n = m_open.front();
				m_open.pop_front();
				

				if ( n->state() == nullptr ) {
					State* succ = m_problem.next( *(n->parent()->state()), n->action() );
					n->m_state = succ;
				}
				if ( is_closed( n ) ) {
					#ifdef DEBUG_FF_EHC
					std::cout << "Already in CLOSED" << std::endl;
					#endif
					delete n;
					continue;
				}
				close( n );	
							
				unsigned hN;
				H.clear();
				t0 = time_used();
				m_heuristic_func->eval( *(n->state()), hN, H );
				tf = time_used();
				h_time += tf - t0;				
				inc_eval();

				if ( hN < hS ) {
					hS = hN;
					current = n;
					improved = true;
					break;
				}

				if ( hN == infinity() ) continue;
				if ( m_heuristic_func->deletes_goal() ) continue; // See Section 6.2 "Added Goal Deletion"

				process( n, H );
				
			}	

			if ( !improved ) {
				#ifdef DEBUG_FF_EHC
				std::cout << "EHC Fails!" << std::endl;
				#endif
				return nullptr;
			}
			// Clear breadth-first search queue
			while ( !m_open.empty() ) {
				Search_Node* n = m_open.front();
				m_open.pop_front();
				delete n;
			}
		}
		#ifdef DEBUG_FF_EHC
		std::cout << "EHC: h(n) = " << hS << ", expanded: " << expanded() << ", generated: " << generated() << std::endl; 
		std::cout << "Heuristic Time: " << h_time << " secs" << std::endl;
		#endif
		return current;
	}

protected:

	void	extract_plan( Search_Node* s, Search_Node* t, std::vector<Action_Idx>& plan, float& cost ) {
		Search_Node *tmp = t;
		cost = 0;
		while( tmp != s) {
			cost += m_problem.cost( *(tmp->state()), tmp->action() );
			plan.push_back(tmp->action());
			tmp = tmp->parent();
		}
		
		std::reverse(plan.begin(), plan.end());		
	}

protected:

	const Search_Model&			m_problem;
	Abstract_Heuristic*			m_heuristic_func;
	Open_List_Type				m_open;
	Closed_List_Type			m_closed;
	unsigned				m_exp_count;
	unsigned				m_gen_count;
	Search_Node*				m_root;
};

}

}

#endif // ff_ehc.h
