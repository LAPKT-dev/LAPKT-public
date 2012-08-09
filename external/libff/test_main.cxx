#include "libff.h"
#include "output.h"
#include <iostream>
#include <fstream>

int main( int argc, char** argv )
{
	int res = FF_parse_problem( argv[1], argv[2] );
	if ( res == 0 )
	{
		std::cout << "Parsing of " << argv[1] << " and " << argv[2] << "was successful!" << std::endl;
 	}
	else
	{
		std::cerr << "Trouble parsing, check PDDL files!" << std::endl;
		std::exit(1);
	}

	res = FF_instantiate_problem();
	
	if ( res == 0 )
	{
		std::cout << "Problem was instantiated" << std::endl;
	}
	else
	{
		std::cerr << "Could not instantiate problem!" << std::endl;
		std::exit(1);
	}

	// Creating atoms.list and operators.list
	std::ofstream out("atoms.list");
	for(int i = 0; i < gnum_ft_conn; i++) 
	{
	      	//print_ft_name(i);
		out << i+1 << " "<< FF::get_ft_name(i) <<  std::endl;
	}
	out.close();

	std::ofstream out2("operators.list");
	out2 << "Name:" << std::endl;
	out2 << "START()" << std::endl;
	std::vector<unsigned> I, G;
	FF::get_initial_state( I );
	out2 << "Preconditions:" << std::endl;
	out2 << "Adds:" << std::endl;
	for ( unsigned i = 0; i < I.size(); i++ )
		out2 << FF::get_ft_name( I[i] ) << std::endl;
	out2 << "Deletes:" << std::endl;

	FF::get_goal_state( G );
	out2 << "Name:" << std::endl;
	out2 << "END()" << std::endl;
	out2 << "Preconditions:" << std::endl;
	for ( unsigned i = 0; i < G.size(); i++ )
		out2 << FF::get_ft_name( G[i] ) << std::endl;
	out2 << "Adds:" << std::endl;
	out2 << "Deletes:" << std::endl;


	for(int i = 0; i < gnum_ef_conn; i++) 
	{
		if ( gef_conn[i].removed == TRUE ) continue;
		if ( gef_conn[i].illegal == TRUE ) continue;
		out2 << "Name: " << std::endl;
		out2 << FF::get_op_name(i) << std::endl;

		out2 << "Preconditions:" << std::endl;
		for(int j = 0; j < gef_conn[i].num_PC; j++) {
			out2 << FF::get_ft_name( gef_conn[i].PC[j] ) << std::endl;
		}


		out2 << "Adds:" << std::endl;
		for(int j = 0; j < gef_conn[i].num_A; j++) {
			out2 << FF::get_ft_name( gef_conn[i].A[j] ) << std::endl;
		}

		
		out2 << "Deletes:" << std::endl;
		for(int j = 0; j < gef_conn[i].num_D; j++) {
			out2 << FF::get_ft_name( gef_conn[i].D[j] ) << std::endl;
		}


	}


	return 0;
}
