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

#ifndef __NOVELTY__
#define __NOVELTY__

#include <aptk/search_prob.hxx>
#include <aptk/heuristic.hxx>
#include <aptk/ext_math.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <vector>
#include <deque>

namespace aptk {

namespace agnostic {


template <typename Search_Model, typename Search_Node >
class Novelty : public Heuristic<State> {
public:

	Novelty( const Search_Model& prob, unsigned max_arity = 1, const unsigned max_MB = 2048 ) 
		: Heuristic<State>( prob ), m_strips_model( prob.task() ), m_max_memory_size_MB(max_MB), m_verbose( true ) {
		
		set_arity(max_arity);
		
	}

	void	set_verbose( bool v ) { m_verbose = v; }

	virtual ~Novelty() {
	}


	void init() {		
		typedef typename std::vector<Search_Node*>::iterator                       Node_Ptr_It;

		for(Node_Ptr_It it = m_nodes_tuples.begin(); it != m_nodes_tuples.end(); it++)		
			*it = NULL;

	}

	unsigned arity() const { return m_arity; }

	void set_arity( unsigned max_arity ){
	
		m_arity = max_arity;
		m_num_tuples = 1;
		m_num_fluents = m_strips_model.num_fluents();

		float size_novelty = ( (float) pow(m_num_fluents,m_arity) / 1024000.) * sizeof(Search_Node*);
		if ( m_verbose )
			std::cout << "Try allocate size: "<< size_novelty<<" MB"<<std::endl;
		if(size_novelty > m_max_memory_size_MB){
			m_arity = 1;
			size_novelty =  ( (float) pow(m_num_fluents,m_arity) / 1024000.) * sizeof(Search_Node*);
			if ( m_verbose )
				std::cout<<"EXCEDED, m_arity downgraded to 1 --> size: "<< size_novelty<<" MB"<<std::endl;
		}

		for(unsigned k = 0; k < m_arity; k++)
			m_num_tuples *= m_num_fluents;

		m_nodes_tuples.resize(m_num_tuples, NULL);

	}
	
	void eval(  Search_Node* n, float& h_val ) { 
			compute( n, h_val );
	}

	
	void eval( Search_Node* n, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		eval( n, h_val );
	}

	
	virtual void eval( const State& s, float& h_val ) {
		assert(true);
	}

	virtual void eval( const State& s, float& h_val,  std::vector<Action_Idx>& pref_ops ) {
		assert(true);
	}



protected:

	
	/**
	 * If can use add(op), the computation is F^i-1 aprox. FASTER!!!
	 * if action == no_op (i.e. start action), the computation is F^i, SLOWER!! 
	 * where i ranges over 1 to max_arity
	 */

	void compute(  Search_Node* n, float& novelty ) 
	{

		novelty = (float) m_arity+1;
		for(unsigned i = 1; i <= m_arity; i++){

#ifdef DEBUG
			if ( m_verbose )
				std::cout << "search node: "<< n <<std::endl;
#endif 	
			bool new_covers = n->action() == no_op ? cover_tuples( n, i ) : cover_tuples_op( n, i );
			
#ifdef DEBUG
			if(m_verbose && !new_covers)	
				std::cout << "\t \t PRUNE! search node: "<< n <<std::endl;
#endif 	
			if ( new_covers )
				if(i < novelty )
					novelty = i;
		}
	}
	
	/**
	 * Instead of checking the whole state, checks the new atoms permutations only!
	 */
	
	bool    cover_tuples_op( Search_Node* n, unsigned arity )
	{

		const bool has_state = n->has_state();
		
		static Fluent_Vec new_atom_vec;
		const Action* a = m_strips_model.actions()[ n->action() ];
		if( a->has_ceff() )
		  {
		    static Fluent_Set new_atom_set( m_strips_model.num_fluents()+1 );
		    new_atom_set.reset();
		    new_atom_vec.clear();
		    for(Fluent_Vec::const_iterator it = a->add_vec().begin(); it != a->add_vec().end(); it++)
		      {
			if ( new_atom_set.isset( *it ) ) continue;
			
			new_atom_vec.push_back( *it );
			new_atom_set.set( *it );
			
		      }
		    for( unsigned i = 0; i < a->ceff_vec().size(); i++ )
		      {
			Conditional_Effect* ce = a->ceff_vec()[i];
			if( ce->can_be_applied_on( *(n->parent()->state()) ) )
			  for(Fluent_Vec::iterator it = ce->add_vec().begin(); it != ce->add_vec().end(); it++){
				{
				  if ( new_atom_set.isset( *it ) ) continue;
				  
				  new_atom_vec.push_back( *it );
				  new_atom_set.set( *it );
			 	}
			  }
			  
		      }
		  }

		const Fluent_Vec& add = a->has_ceff() ? new_atom_vec : a->add_vec();
        
		if(!has_state)
			n->parent()->state()->progress_lazy_state(  m_strips_model.actions()[ n->action() ] );	

		Fluent_Vec& fl = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();
		
		bool new_covers = false;

		assert ( arity > 0 );

		std::vector<unsigned> tuple( arity );

		unsigned atoms_arity = arity - 1;
		unsigned n_combinations = aptk::unrolled_pow(  fl.size() , atoms_arity );	       
		
		
		for ( Fluent_Vec::const_iterator it_add = add.begin();
					it_add != add.end(); it_add++ )
			{
		
				tuple[ atoms_arity ] = *it_add;

				for( unsigned idx = 0; idx < n_combinations; idx++ ){

					/**
					 * get tuples from indexes
					 */
					if(atoms_arity > 0)
						idx2tuple( tuple, fl, idx, atoms_arity );

					/**
					 * Check if tuple is covered
					 */
					unsigned tuple_idx = tuple2idx( tuple, arity );

					/**
					 * new_tuple if
					 * -> none was registered
					 * OR
					 * -> n better than old_n
					 */
					bool cover_new_tuple = ( !m_nodes_tuples[ tuple_idx ] ) ? true : ( is_better( m_nodes_tuples[tuple_idx], n  ) ? true : false);
                       
					if( cover_new_tuple ){
						
						m_nodes_tuples[ tuple_idx ] = (Search_Node*) n;
						new_covers = true;


#ifdef DEBUG
						if ( m_verbose ) {
							std::cout<<"\t NEW!! : ";
							for(unsigned i = 0; i < arity; i++){
								std::cout<< m_strips_model.fluents()[ tuple[i] ]->signature()<<"  ";
							}
							std::cout << " by state: "<< m_nodes_tuples[ tuple_idx ] << "" ;
							std::cout << std::endl;
						}
#endif
					}
					else
						{		
#ifdef DEBUG		
							if ( m_verbose ) {
								std::cout<<"\t TUPLE COVERED: ";
								for(unsigned i = 0; i < arity; i++){
									std::cout<< m_strips_model.fluents()[ tuple[i] ]->signature()<<"  ";
								}
					
								std::cout << " by state: "<< m_nodes_tuples[ tuple_idx ] << "" <<std::flush;
									
								std::cout<< std::endl;
							}
#endif
						}

				}
			}

		if(!has_state)
			n->parent()->state()->regress_lazy_state( m_strips_model.actions()[ n->action() ] );
		
		return new_covers;
	}

	bool cover_tuples( Search_Node* n, unsigned arity  )
	{
		const bool has_state = n->has_state();
		
		if(!has_state)
			n->parent()->state()->progress_lazy_state(  m_strips_model.actions()[ n->action() ] );	
		
		Fluent_Vec& fl = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();      

		bool new_covers = false;

		std::vector<unsigned> tuple( arity );

 		unsigned n_combinations = aptk::unrolled_pow(  fl.size() , arity );


#ifdef DEBUG
		if ( m_verbose )
			std::cout<< n << " covers: " << std::endl;
#endif

		for( unsigned idx = 0; idx < n_combinations; idx++ ){
			/**
			 * get tuples from indexes
			 */
			idx2tuple( tuple, fl, idx, arity );

			/**
			 * Check if tuple is covered
			 */
			unsigned tuple_idx = tuple2idx( tuple, arity );

			/**
			 * new_tuple if
			 * -> none was registered
			 * OR
			 * -> n better than old_n
			 */
			bool cover_new_tuple = ( !m_nodes_tuples[ tuple_idx ] ) ? true : ( is_better( m_nodes_tuples[tuple_idx], n  ) ? true : false);
			
			if( cover_new_tuple ){
				m_nodes_tuples[ tuple_idx ] = (Search_Node*) n;

				new_covers = true;
#ifdef DEBUG
				if ( m_verbose ) {
					std::cout<<"\t";
					for(unsigned i = 0; i < arity; i++){
						std::cout<< m_strips_model.fluents()[ tuple[i] ]->signature()<<"  ";
					}
					std::cout << std::endl;
				}
#endif
			}

		}
		if(!has_state)
			n->parent()->state()->regress_lazy_state( m_strips_model.actions()[ n->action() ] );

		return new_covers;

	}


	inline unsigned  tuple2idx( std::vector<unsigned>& indexes, unsigned arity) const
	{
		unsigned idx=0;
		unsigned dimension = 1;

		for(int i = arity-1; i >= 0; i--)
			{
				idx += indexes[ i ] * dimension;
				dimension*= m_num_fluents;
			}

		return idx;

	}

	inline void      idx2tuple( std::vector<unsigned>& tuple, Fluent_Vec& fl, unsigned idx, unsigned arity ) const
	{
		unsigned next_idx, div;
		unsigned current_idx = idx;
		unsigned n_atoms = fl.size();

		for(unsigned i = arity-1; i >= 0 ; i--){
			div = aptk::unrolled_pow( n_atoms , i );

			if ( current_idx < div ) {
				next_idx = current_idx;
				current_idx = 0;
			}
			else {
				next_idx = current_idx % div;
				// if current_idx is zero and is the last index, then take next_idx
				current_idx = ( current_idx / div != 0 || i != 0) ? current_idx / div : next_idx;
			}
			
			tuple[ i ] = fl[ current_idx ];

			current_idx = next_idx;
			if(i == 0) break;
		}
	}

	inline bool      is_better( Search_Node* n, Search_Node* new_n ) const { 
		return (new_n->gn() < n->gn() );
		//return false; 
	}


	const STRIPS_Problem&	      m_strips_model;
        std::vector<Search_Node*>     m_nodes_tuples;
        unsigned                      m_arity;
	unsigned long                 m_num_tuples;
	unsigned                      m_num_fluents;
	unsigned                      m_max_memory_size_MB;
	bool			      m_verbose;
};


}

}

#endif // novelty.hxx
