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

#include <ff_to_aptk.hxx>
#include <action.hxx>
#include <iostream>
#include <algorithm>

namespace aptk
{

namespace  FF_Parser {

void	get_problem_description( std::string pddl_domain_path,
					std::string pddl_problem_path,
					STRIPS_Problem& strips_problem,
					bool ignore_action_costs,
					bool get_detailed_fluent_names )
{
	FF_reinitialize_globals();
	FF_parse_problem( pddl_domain_path.c_str(), pddl_problem_path.c_str() );
	//	std::cout << "FF-preprocessing of PDDL problem description" << std::endl;
	FF_instantiate_problem();
	//	std::cout << "Facts in problem:" << gnum_ft_conn << std::endl;

	strips_problem.set_domain_name( FF::get_domain_name() );
	strips_problem.set_problem_name( FF::get_problem_name() );

	for ( int i = 0; i < gnum_ft_conn; i++ )
	{
		if ( !get_detailed_fluent_names )
		{
			std::string ft_name = FF::get_ft_name(i);
			STRIPS_Problem::add_fluent( strips_problem, ft_name);
			continue;
		}
		std::string ft_signature = FF::get_ft_name(i);
		STRIPS_Problem::add_fluent( strips_problem, ft_signature  );
	}
	Fluent_Vec I, G;
	FF::get_initial_state( I );
	FF::get_goal_state( G );
	STRIPS_Problem::set_init( strips_problem, I);
	STRIPS_Problem::set_goal( strips_problem, G);

	//	std::cout << "Operators in problem:" << gnum_ef_conn << std::endl;

        bool with_costs = false;
        for ( int i = 0; i < gnum_ef_conn; i++ )
                if( FF::get_op_metric_cost( i ) != 0 )
                {
                        with_costs = true;
                        break;
                }

	if ( ignore_action_costs ) with_costs = false;

        if(gconditional_effects)
	{
		for ( int i = 0; i < gnum_op_conn; i++ )
		{
			if( ! (gop_conn[i].action) )
				continue;

			std::string op_name = FF::get_op_name( gop_conn[i].action );
			
			Fluent_Vec op_precs;

			for( int j = 0; j < gop_conn[i].action->num_preconds; j++)
				op_precs.push_back( gop_conn[i].action->preconds[j] );
			
			bool inconsistent = false;
			float op_cost = 0;
			Conditional_Effect_Vec cond_effects;
			for( int j = 0; j < gop_conn[i].num_E; j++)
			{
				unsigned ef = gop_conn[i].E[j];

				if ( gef_conn[ef].removed == TRUE ) continue;
				if ( gef_conn[ef].illegal == TRUE ) continue;

			
				Fluent_Vec  op_conds, op_adds, op_dels;

				//Do not add the preconditions of the action into the CE
				int common_prec = gop_conn[i].action->num_preconds;
				
				for ( int j = common_prec; j < gef_conn[ef].num_PC; j++ ){				
					op_conds.push_back( gef_conn[ef].PC[j] );
				}
				for ( int j = 0; j < gef_conn[ef].num_A; j++ )
					op_adds.push_back( gef_conn[ef].A[j] );
				for ( int j = 0; j < gef_conn[ef].num_D; j++ )
					op_dels.push_back( gef_conn[ef].D[j] );

				
				if(with_costs)
				{
					if ( gef_conn[ef].num_IN == 0 ) {
						op_cost = 0;
					}
					else if ( gef_conn[ef].num_IN >= 1 ) {
						op_cost = gef_conn[ef].cost;
					}
				}
				else
					op_cost = 1;
				for ( auto p : op_adds ) 
					if ( std::find( op_dels.begin(), op_dels.end(), p ) != op_dels.end() ) {
						inconsistent = true;
						break;
					}
				if ( inconsistent ) {
					std::cout << "WARNING: FF Parser: Operator " << op_name << " has inconsistent adds and deletes in conditional effect #" << ef+1 << std::endl;
					break;
				}
	
				for ( auto p : op_dels ) 
					if ( std::find( op_adds.begin(), op_adds.end(), p ) != op_adds.end() ) {
						inconsistent = true;
						break;
					}
				if ( inconsistent ) {
					std::cout << "WARNING: FF Parser: Operator " << op_name << " has inconsistent adds and deletes in conditional effect #" << ef+1 << std::endl;
					break;
				}
		
				Conditional_Effect* new_cef = new Conditional_Effect( strips_problem );
				new_cef->define( op_conds, op_adds, op_dels );
				cond_effects.push_back( new_cef );
			}
			
			if ( inconsistent ) {
				continue;
			}

			unsigned op_idx;
			Fluent_Vec op_adds, op_dels;

			op_idx = STRIPS_Problem::add_action( strips_problem, op_name, op_precs, op_adds, op_dels, cond_effects );
			strips_problem.actions()[op_idx]->set_cost( op_cost );
			
		}
	}
	else
	{
		for ( int i = 0; i < gnum_ef_conn; i++ )
		{
			if ( gef_conn[i].removed == TRUE ) continue;
			if ( gef_conn[i].illegal == TRUE ) continue;

			std::string op_name = FF::get_op_name(i);
			Fluent_Vec  op_precs, op_adds, op_dels;
			Conditional_Effect_Vec cond_effects;


			for ( int j = 0; j < gef_conn[i].num_PC; j++ )
				op_precs.push_back( gef_conn[i].PC[j] );
			for ( int j = 0; j < gef_conn[i].num_A; j++ )
				op_adds.push_back( gef_conn[i].A[j] );
			for ( int j = 0; j < gef_conn[i].num_D; j++ )
				op_dels.push_back( gef_conn[i].D[j] );

			float op_cost = 0;
			if(with_costs)
			{
				if ( gef_conn[i].num_IN == 0 ) {
					op_cost = 0;
				}
				else if ( gef_conn[i].num_IN >= 1 ) {
					op_cost = gef_conn[i].cost;
				}
			}
			else
				op_cost = 1;

			bool inconsistent = false;
			for ( auto p : op_adds ) 
				if ( std::find( op_dels.begin(), op_dels.end(), p ) != op_dels.end() ) {
					inconsistent = true;
					break;
				}
			if ( inconsistent ) {
				std::cout << "WARNING: FF Parser: Operator " << op_name << " has inconsistent adds and deletes" << std::endl;
				continue;
			}

			for ( auto p : op_dels ) 
				if ( std::find( op_adds.begin(), op_adds.end(), p ) != op_adds.end() ) {
					inconsistent = true;
					break;
				}
			if ( inconsistent ) {
				std::cout << "WARNING: FF Parser: Operator " << op_name << " has inconsistent adds and deletes" << std::endl;
				continue;
			}

			unsigned op_idx;
			op_idx = STRIPS_Problem::add_action( strips_problem, op_name, op_precs, op_adds, op_dels, cond_effects );
			strips_problem.actions()[op_idx]->set_cost( op_cost );
		}
	}
	strips_problem.make_action_tables();
	strips_problem.make_effect_tables();
	
}

}

}
