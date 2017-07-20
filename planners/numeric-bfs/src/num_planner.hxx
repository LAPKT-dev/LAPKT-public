#ifndef __SIW_PLANNER__
#define __SIW_PLANNER__

#include <py_strips_prob.hxx>
#include <fwd_search_prob.hxx>
#include <novelty.hxx>
#include <aptk/at_bfs.hxx>
#include <aptk/open_list.hxx>
#include <aptk/ext_math.hxx>


using	aptk::agnostic::Fwd_Search_Problem;
using aptk::Action_Idx;


template <typename State>
class Node {
public:
    typedef State State_Type;
    typedef aptk::search::Fibonacci_Open_List< Node >	Open_List;

    Node( State* s, float cost, Action_Idx action, Node<State>* parent )
    : m_state( s ), m_parent( parent ), m_action(action), m_g( 0 ), m_metric(0) {
        m_g = ( parent ? parent->m_g + cost : 0.0f);
    }

    virtual ~Node() {
        if ( m_state != NULL ) delete m_state;
    }

    float&			hn()		{ return m_h; }
    float			hn() const 	{ return m_h; }
    float&			gn()		{ return m_g; }
    float			gn() const 	{ return m_g; }
    float&			fn()		{ return m_f; }
    float			fn() const	{ return m_f; }
    float           metric() const { return m_metric; }
    void          set_metric(float value) { m_metric = value; }

    Node<State>*		parent()   	{ return m_parent; }
    Action_Idx		action() const 	{ return m_action; }
    State*			state()		{ return m_state; }
    const State&		state() const 	{ return *m_state; }
    void			print( std::ostream& os ) const {
        os << "{@ = " << this << ", s = " << m_state << ", parent = " << m_parent << ", g(n) = " << m_g << ", h(n) = " << m_h << ", f(n) = " << m_f << "}";
    }

    // return value is the answer to question "is this node worse than o?"
    bool    operator< ( const Node<State>& o ) const {
        // total
        if ( fn() > o.fn() ) return true;
        // difference is less than threshold
        if ( aptk::dequal( fn(), o.fn() ) ) {
            // heuristic
            if ( hn() > o.hn() ) return true;
            // distance from start node
            if ( gn() < o.gn() ) return true;
        }
        return false;
    }

    bool operator== ( const Node<State>& o ) const {
        return !(o < *this || *this < o);
    }

    size_t                  hash() const { return m_state->hash(); }

    static bool less(const Node & lhs, const Node & rhs) {
        return State::less(lhs.state(), rhs.state());
    }

public:

    State*		m_state;
    Node<State>*	m_parent;
    float		m_h;
    Action_Idx	m_action;
    float		m_g;
    float		m_f;
    float       m_metric;

    // required by fibonacci queue
    typename Open_List::Handle	heap_handle;
    Open_List*			current;
};


template < typename Search_Model>
class Subgoals_Heuristic : public aptk::Heuristic<aptk::State>{
public:
    Subgoals_Heuristic( const Search_Model& prob )
        : Heuristic<aptk::State>( prob ) {
    }


    template <typename Search_Node>
    void eval( const Search_Node* n, float& h_val ) {
        const aptk::State & s = n->state();
        // subgoals
        float left = 0;
        for(size_t FluentId: problem().goal()){
           if (!s.entails(FluentId)){
               left += 1.0;
           }
        }
        float metric = n->metric();
        if (metric == 0.0f){
            metric = 1.0f;
        }
        h_val = left * metric;
    }

};

typedef	aptk::search::bfs::AT_BFS_SQ_SH< Fwd_Search_Problem, Subgoals_Heuristic<Fwd_Search_Problem>, Node<aptk::State>::Open_List >	BFS;

class	NUM_BFS : public Solver, public BFS
{

public:

    NUM_BFS(const Fwd_Search_Problem& search_problem );

    virtual void solve();

    void process(  Search_Node *head );

};

class NUM_BFS_Factory: public SolverFactory {
public:
    virtual Solver * build( aptk::STRIPS_Problem *) const;
};

#endif
