#include <module.hxx>
#include <iostream>
#include <fstream>
#include <succ_gen.hxx>

using namespace boost::python;

SuccGen_Example::SuccGen_Example() 
	: FOD_Problem() {
}

SuccGen_Example::SuccGen_Example( std::string domain, std::string problem )
	: FOD_Problem( domain, problem ) {
}

SuccGen_Example::~SuccGen_Example() {

}

void
SuccGen_Example::execute() {

	aptk::Successor_Generator<aptk::Clause> succ_gen( *instance() );

	succ_gen.build();

	std::ofstream	tree_stream( "decision.tree" );

	succ_gen.dump_tree( tree_stream );

	tree_stream.close();

	aptk::Clause s0 = instance()->init;

	std::cout << "Initial state:" << std::endl;
	s0.write( std::cout, *instance() );
	std::cout << std::endl;

	aptk::Successor_Generator<aptk::Clause>::Iterator i( s0, succ_gen.nodes() );

	int action_index = i.first();

	while ( action_index != i.last() ) {
		assert( action_index < (int)instance()->actions.size() );
		const aptk::FOD_Problem::Action* action = instance()->actions[action_index];
		assert( s0.satisfies( action->precondition ) );
		std::cout << "Applicable action:" << action->name << std::endl;		
		action_index = i.next();
	}
	 
}

BOOST_PYTHON_MODULE( libaptk )
{
	class_<SuccGen_Example>("SuccGen_Example")
		.def( init< std::string, std::string >() )
		.def( "add_atom", &SuccGen_Example::add_atom )
		.def( "add_action", &SuccGen_Example::add_action )
		.def( "add_invariant", &SuccGen_Example::add_invariant )
		.def( "num_atoms", &SuccGen_Example::n_atoms )
		.def( "num_actions", &SuccGen_Example::n_actions )
		.def( "get_atom_name", &SuccGen_Example::get_atom_name )
		.def( "get_domain_name", &SuccGen_Example::get_domain_name )
		.def( "get_problem_name", &SuccGen_Example::get_problem_name )
		.def( "add_precondition", &SuccGen_Example::add_precondition )
		.def( "add_effect", &SuccGen_Example::add_effect )
		.def( "set_init", &SuccGen_Example::set_init )
		.def( "set_goal", &SuccGen_Example::set_goal )
		.def( "set_domain_name", &SuccGen_Example::set_domain_name )
		.def( "set_problem_name", &SuccGen_Example::set_problem_name )
		.def( "write_ground_pddl", &SuccGen_Example::write_ground_pddl )
		.def( "print_action", &SuccGen_Example::print_action )
		.def( "setup", &SuccGen_Example::setup )
		.def( "execute", &SuccGen_Example::execute )
		.def_readwrite( "parsing_time", &SuccGen_Example::m_parsing_time )
	;
}

