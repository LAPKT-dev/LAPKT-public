
#pragma once

#include <fod_problem.hxx>
#include <boost/python.hpp>
#include <string>

class FOD_Problem {
public:
	FOD_Problem(  );
	FOD_Problem( std::string, std::string );
	virtual ~FOD_Problem();

	aptk::FOD_Problem*	instance() {
		return m_problem;
	}

	void	add_atom( std::string name );
	void	add_action( std::string name );
	void	add_precondition( int index, boost::python::list& lits );
	void	add_cond_effect( int index, boost::python::list& cond_lits, boost::python::list& eff_lits );
	void	add_effect( int index, boost::python::list& list );
	void	add_invariant( boost::python::list& list );
	void	add_axiom( boost::python::list& condition, boost::python::list& effect );

	void	set_cost( int index, float v );

	void	set_init( boost::python::list& list );
	void	set_goal( boost::python::list& list );
	void	set_domain_name( std::string name );
	void	set_problem_name( std::string name );

	virtual void	setup();

	void	print_action( int index );

	std::string	get_atom_name( int idx ) const { return m_problem->atoms[idx]->name; }
	std::string	get_domain_name() const { return m_problem->domain_name; }
	std::string	get_problem_name() const { return m_problem->problem_name; }

	size_t	n_atoms() 	const { return m_problem->n_atoms(); }
	size_t	n_actions()	const { return m_problem->n_actions(); }

	void	write_ground_pddl( std::string domain, std::string instance );

	float	m_parsing_time;
	bool	m_ignore_action_costs;


protected:
	aptk::FOD_Problem*	m_problem;
};
