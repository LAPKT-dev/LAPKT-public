#ifndef __PY_FOD_PROBLEM__
#define __PY_FOD_PROBLEM__

#include <strips_prob.hxx>
#include <fluent.hxx>
#include <action.hxx>
#include <boost/python.hpp>
#include <string>
#include <set>

namespace aptk{
    namespace agnostic{
        class Fwd_Search_Problem;
    }
}


class Solver{
public:
    virtual void solve()=0;
    virtual void set_output_filename(std::string){}
};

class SolverFactory{
public:
    virtual Solver * build( aptk::STRIPS_Problem *) const {
        return nullptr;
    }
};



class STRIPS_Problem {
public:
	STRIPS_Problem(  );
	STRIPS_Problem( std::string, std::string );
	virtual ~STRIPS_Problem();

	aptk::STRIPS_Problem*	instance() {
		return m_problem;
	}

	void	add_atom( std::string name );
    void    add_function( std::string name );
    size_t	add_action( std::string name );
	void	add_precondition( int index, boost::python::list& lits );
    std::size_t     add_comparison(unsigned BoundFluentId, aptk::CompareType t, std::shared_ptr<aptk::Expression<float> > & expr);
    void    define_action(size_t idx, boost::python::list& precs, boost::python::list& effs, boost::python::list &num_eff_vec );
	void	add_cond_effect( int index, boost::python::list& cond_lits, boost::python::list& eff_lits );
	void	add_effect( int index, boost::python::list& list );
	void	set_cost( int index, float v );

	virtual 
	void	add_mutex_group( boost::python::list& list );
	void	notify_negated_conditions( boost::python::list& list );
    void    add_negated_conditions ( boost::python::list& fluents );
	void	create_negated_fluents();
    void	set_init_num( boost::python::list& list, boost::python::list val_lst=boost::python::list() );
    void    set_init(boost::python::list& list);
	void	set_goal( boost::python::list& list );
	void	set_domain_name( std::string name );
	void	set_problem_name( std::string name );
    void    set_add_cost(bool value);
    void    set_metric_expression(std::shared_ptr<aptk::Expression<float> > expr);

	virtual	void	setup();
    void solve(const SolverFactory & solver, std::string out);

	void	print_action( int index );

	void	print_fluents();
	void	print_actions();

	std::string	get_atom_name( int idx ) const { return m_problem->fluents()[idx]->signature(); }
	std::string	get_domain_name() const { return m_problem->domain_name(); }
	std::string	get_problem_name() const { return m_problem->problem_name(); }

	size_t	n_atoms() 	const { return m_problem->num_fluents(); }
	size_t	n_actions()	const { return m_problem->num_actions(); }

	void	write_ground_pddl( std::string domain, std::string instance );

	float	m_parsing_time;
	bool	m_ignore_action_costs;

protected:
    void  _set_init( boost::python::list& list, boost::python::list val_lst=boost::python::list() );
	aptk::STRIPS_Problem*	m_problem;
	std::set<int>		m_negated_conditions;
	aptk::Fluent_Ptr_Vec	m_negated;
};


#endif // py_strips_problem.hxx
