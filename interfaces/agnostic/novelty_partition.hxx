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

#ifndef __NOVELTY_PARTITION__
#define __NOVELTY_PARTITION__

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
class Novelty_Partition : public Heuristic<State>{
public:


	Novelty_Partition( const Search_Model& prob, unsigned max_arity = 1, const unsigned max_MB = 2048 ) 
		: Heuristic<State>( prob ), m_strips_model( prob.task() ), m_max_memory_size_MB(max_MB), m_always_full_state(true), m_verbose( true ) {
		
		set_arity(max_arity, 1);
		
	}

	virtual ~Novelty_Partition() {
	}


	void init() {
		typedef typename std::vector< std::vector<Search_Node*> >::iterator        Node_Vec_Ptr_It;
		typedef typename std::vector<Search_Node*>::iterator                       Node_Ptr_It;
				
		for(Node_Vec_Ptr_It it_p = m_nodes_tuples_by_partition.begin();it_p != m_nodes_tuples_by_partition.end(); it_p++)
			for(Node_Ptr_It it = it_p->begin(); it != it_p->end(); it++)		
				*it = NULL;

	}

	unsigned arity() const { return m_arity; }
	void set_full_state_computation( bool b )  { m_always_full_state = b; }

	void set_verbose( bool v ) { m_verbose = v; }

	void set_arity( unsigned max_arity, unsigned goal_size ){
	
		m_arity = max_arity;
		m_num_tuples = 1;
		m_num_fluents = m_strips_model.num_fluents();

		float size_novelty = ( (float) pow(m_num_fluents,m_arity) / 1024000.)  * (float) goal_size * sizeof(Search_Node*);
		//std::cout << "Try allocate size: "<< size_novelty<<" MB"<<std::endl;
		if(size_novelty > m_max_memory_size_MB){
			m_arity = 1;
			size_novelty =  ( (float) pow(m_num_fluents,m_arity) / 1024000.) * (float) goal_size * sizeof(Search_Node*);

			std::cout<<"EXCEDED, m_arity downgraded to 1 --> size: "<< size_novelty<<" MB"<<std::endl;
		}

		for(unsigned k = 0; k < m_arity; k++)
			m_num_tuples *= m_num_fluents;

		m_nodes_tuples_by_partition.resize( goal_size+1 );
		for( unsigned i = 0; i < goal_size+1; i++ )
			m_nodes_tuples_by_partition[i].resize(m_num_tuples, NULL);

	}
	

	virtual void eval( Search_Node* n, unsigned& h_val ) {
	
		compute( n, h_val );		
	}

	
	virtual void eval( Search_Node* n, float& h_val ) {
		unsigned h;
		compute( n, h );		
		h_val = h;
	}


	virtual void eval( const State& s, unsigned& h_val ) {
	
		assert(true);
	}

	virtual void eval( const State& s, unsigned& h_val,  std::vector<Action_Idx>& pref_ops ) {
		assert(true);
	}



protected:

	/**
	 * If parent node is in the same space partition, check only new atoms,
	 * otherwise check all atoms in state
	 */
	void compute(  Search_Node* n, unsigned& novelty ) 
	{

		novelty = (float) m_arity+1;
		for(unsigned i = 1; i <= m_arity; i++){
#ifdef DEBUG
			if ( m_verbose )
				std::cout << "search state node: "<<&(n)<<std::endl;
#endif 	
			
			bool new_covers;
			if(n->parent() == nullptr || m_always_full_state)
				new_covers = cover_tuples( n, i );
			else
				new_covers = (n->partition() == n->parent()->partition()) ?  cover_tuples_op( n, i ) : cover_tuples( n, i );			
#ifdef DEBUG
			if(m_verbose && !new_covers)	
				std::cout << "\t \t PRUNE! search node: "<<&(n)<<std::endl;
#endif 	
			if ( new_covers )
				if(i < novelty )
					novelty = i;
		}
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
			bool cover_new_tuple = ( !m_nodes_tuples_by_partition[ n->partition() ][ tuple_idx ] ) ? true : ( is_better( m_nodes_tuples_by_partition[ n->partition() ][tuple_idx], n  ) ? true : false);
			
			if( cover_new_tuple ){
				m_nodes_tuples_by_partition[ n->partition() ][ tuple_idx ] = (Search_Node*) n;

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

	/**
	 * Instead of checking the whole state, checks the new atoms permutations only!
	 */
	
	bool    cover_tuples_op( Search_Node* n, unsigned arity  )
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
					bool cover_new_tuple = ( !m_nodes_tuples_by_partition[ n->partition() ][ tuple_idx ] ) ? true : ( is_better( m_nodes_tuples_by_partition[ n->partition() ][tuple_idx], n  ) ? true : false);
                       
					if( cover_new_tuple ){
						
						m_nodes_tuples_by_partition[ n->partition() ][ tuple_idx ] = (Search_Node*) n;
						new_covers = true;


#ifdef DEBUG
						if ( m_verbose ) {
							std::cout<<"\t NEW!! : ";
							for(unsigned i = 0; i < arity; i++){
								std::cout<< m_strips_model.fluents()[ tuple[i] ]->signature()<<"  ";
							}
							std::cout << std::endl;
						}
#endif
					}

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
		int n_atoms =  fl.size();

		for(int i = arity-1; i >= 0 ; i--) {
			// MRJ: Let's use the fast version
			// n_atoms = 10
			// i = 3 (w=4) -> div = 1000
			// i = 2 (w=3) -> div = 100
			// i = 1 (w=2) -> div = 10
			// i = 0 (w=1) -> div = 1
			div = aptk::unrolled_pow( n_atoms , i );

			if ( current_idx < div ) {
				next_idx = current_idx;
				current_idx = 0;
			}
			else {
				// current index : 32
				// i = 3 -> next_idx = 32 % 1000 = 32, 32 / 1000 = 0
				// i = 2 -> next_idx = 32 % 100 = 32, 32 / 100 = 0
				// i = 1 -> next_idx = 32 % 10 = 2, 32 / 10 = 3
				// i = 0 -> next_idx = 32 % 1 = 0, 32 / 1 = 32
				next_idx = current_idx % div;
				const int div_res = current_idx / div;
				// if current_idx is zero and is the last index, then take next_idx
				// i = 3, current_idx = ( 32 / 1000 != 0 || i != 0 ) ? 32 / 1000 : 32 = ( F || T ) ? 0 : 32 = 0
				current_idx = ( div_res != 0 || i != 0) ? div_res : next_idx;
			}
			tuple[ i ] = fl[ current_idx ];

			current_idx = next_idx;
		}
	}

	inline bool      is_better( Search_Node* n,const Search_Node* new_n ) const { 
	  return new_n->is_better( n );		
	}


	const STRIPS_Problem&	m_strips_model;
	std::vector< std::vector<Search_Node*> >     m_nodes_tuples_by_partition;
        unsigned                m_arity;
	unsigned long           m_num_tuples;
	unsigned                m_num_fluents;
	unsigned                m_max_memory_size_MB;
	bool                    m_always_full_state;
	bool			m_verbose;
};


}

}

#endif // novelty_partition.hxx
