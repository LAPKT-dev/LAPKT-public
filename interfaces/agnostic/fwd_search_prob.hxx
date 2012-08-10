#ifndef __FWD_SEARCH_PROB__
#define __FWD_SEARCH_PROB__

#include <strips_prob.hxx>
#include <aptk/search_prob.hxx>

namespace aptk {

class State;

namespace agnostic {


class Fwd_Search_Problem : public Search_Problem<State> {
public:

	Fwd_Search_Problem( STRIPS_Problem* );
	virtual ~Fwd_Search_Problem();

	virtual	int		num_actions() const;
	virtual State*		init() const;
	virtual bool		goal( const State& s ) const;
	virtual bool		is_applicable( const State& s, Action_Idx a ) const;
	virtual float		cost( const State& s, Action_Idx a ) const;
	virtual State*		next( const State& s, Action_Idx a ) const;
	virtual void		print( std::ostream& os ) const;

protected:

	STRIPS_Problem&		task() 		{ return *m_task; }
	const STRIPS_Problem&	task() const 	{ return *m_task; }

private:

	STRIPS_Problem*		m_task;
	
};

}

}

#endif // fwd_search_prob.hxx
