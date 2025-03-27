/**
 * @file approximate_novelty_partition_1.hxx
 * @author Anubhav Singh (anubhav.singh.er@pm.me)
 * @author Miquel Ramirez (miquel.ramirez@unimelb.edu.au)
 * @author Nir Lipovetzky (nirlipo@gmail.com)
 * @brief 
 * @version 0.1
 * @date 2023-03-28
 * 
 * @copyright Copyright (c) 2023
 * 
  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files
  (the "Software"), to deal in the Software without restriction,
  including without limitation the rights to use, copy, modify, merge,
  publish, distribute, sublicense, and/or sell copies of the Software,
  and to permit persons to whom the Software is furnished to do so, subject
  to the following conditions:

  The above copyright notice and this permission notice shall be included
  in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
  DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#ifndef __Approximate_Novelty_Partition__
#define __Approximate_Novelty_Partition__


#include <boost/random/mersenne_twister.hpp>
#include <search_prob.hxx>
#include <heuristic.hxx>
#include <ext_math.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <vector>
#include <deque>
#include <algorithm>   
#include <math_utility.hxx>
#include <bloomfilter.hxx>

namespace aptk {

namespace agnostic {


template <typename Search_Model, typename Search_Node >
class Approximate_Novelty_Partition : public Heuristic<State>{
public:

    Approximate_Novelty_Partition( const Search_Model& prob, 
        std::string sampling_strategy, float sample_factor, 
        unsigned rand_seed, unsigned min_k4sample, 
        unsigned sample_fs = 0, float bf_fs = 0 , float bf_max_size = 0.5, 
        unsigned max_arity = 1, const unsigned max_MB = 8192) : 
        Heuristic<State>( prob ), m_strips_model( prob.task() ), 
        m_max_memory_size_MB(max_MB), m_always_full_state(false), 
        m_partition_size(0), m_verbose( true ), m_fluent_set_size(0), 
        m_sampling_strategy(sampling_strategy), m_sample_factor(sample_factor),
        m_sample_fs(sample_fs), m_bf_fs(bf_fs),m_bf_max_size(bf_max_size),
        m_min_k4sample( min_k4sample ), m_comb_idx( NULL ), m_tuple( NULL ), 
        m_overflow_enabled(false), m_max_arity_4space_alloc(0)

    {   
        set_arity(max_arity, 1);
        m_gen = boost::mt11213b( rand_seed );
        m_fluent_temp.resize( prob.task().num_fluents() );
        m_add.reserve( prob.task().num_fluents() );
        m_fluent_sample.reserve( prob.task().num_fluents() );
        m_fluent_temp.resize( prob.task().num_fluents() );
    }

    virtual ~Approximate_Novelty_Partition() {
        typedef typename std::vector<Fluent_Set*>::iterator     Node_1Vec_Ptr_It;
        typedef typename std::vector<std::vector<
                                   Fluent_Set*>*>::iterator     Node_2Vec_Ptr_It;
        typedef typename std::vector<BloomFilter*>::iterator    Node_3plusVec_Ptr_It;
        for( Node_1Vec_Ptr_It it_p = m_nodes_tuples1_by_partition.begin();
                it_p != m_nodes_tuples1_by_partition.end(); it_p++)
            delete *it_p;

        for(Node_2Vec_Ptr_It it_2p = m_nodes_tuples2_by_partition.begin();
                it_2p != m_nodes_tuples2_by_partition.end(); it_2p++)
        {
            if(! *it_2p) continue;
            for(Node_1Vec_Ptr_It it_p = (*it_2p)->begin(); it_p != (*it_2p)->end(); it_p++)
                if((*it_p) && (*it_p)->bits().packs() != NULL)
                    (*it_p)->reset();
        }
        for(auto& nodes_3plus : m_nodes_tuples3plus_by_partition)
            for( Node_3plusVec_Ptr_It it_p = nodes_3plus.begin();
                it_p != nodes_3plus.end(); it_p++)
                delete *it_p;
        free(m_comb_idx);
        free(m_tuple);
    }

    void init() {
        
        typedef typename std::vector<Fluent_Set*>::iterator     Node_1Vec_Ptr_It;
    
        typedef typename std::vector<std::vector<
                                   Fluent_Set*>*>::iterator     Node_2Vec_Ptr_It;
        typedef typename std::vector<BloomFilter*>::iterator    Node_3plusVec_Ptr_It;
                
        for( Node_1Vec_Ptr_It it_p = m_nodes_tuples1_by_partition.begin();
                it_p != m_nodes_tuples1_by_partition.end(); it_p++)
        {
            if((*it_p) && (*it_p)->bits().packs() != NULL)
                (*it_p)->reset();
        }
        for(Node_2Vec_Ptr_It it_2p = m_nodes_tuples2_by_partition.begin();
                it_2p != m_nodes_tuples2_by_partition.end(); it_2p++)
        {
            if(! *it_2p) continue;
            for(Node_1Vec_Ptr_It it_p = (*it_2p)->begin(); it_p != (*it_2p)->end(); it_p++)
                if((*it_p) && (*it_p)->bits().packs() != NULL)
                    (*it_p)->reset();
        }
        for(auto& nodes_3plus : m_nodes_tuples3plus_by_partition)
            for( Node_3plusVec_Ptr_It it_p = nodes_3plus.begin();
                    it_p != nodes_3plus.end(); it_p++)
            {
                if(*it_p)
                    (*it_p)->reset();
            }

    }

    unsigned arity() const { return m_arity; }

    void set_full_state_computation( bool b )  { m_always_full_state = b; }

    void set_verbose( bool v ) { m_verbose = v; }

    unsigned& partition_size() {return m_partition_size;}
    
    void set_arity( unsigned max_arity, unsigned partition_size = 0 ){
        m_num_fluents = m_strips_model.num_fluents();
        m_arity = max_arity > m_num_fluents ? m_num_fluents : max_arity;
        m_max_arity_4space_alloc = max_arity;// 2x size for modulo optimization in bloomfilter
        m_partition_size = partition_size;

        std::cout<< "|----------------------------------------------------------|"<< std::endl;
        std::cout << "Sampling Strategy is - " << m_sampling_strategy << " , "
            << "Sample Factor = " << m_sample_factor << " , " << "min_k4sample = "
            << m_min_k4sample << std::endl;
        if(m_sample_fs > 0)
            std::cout << "Set sample size = " << m_sample_fs << std::endl;
        else
            std::cout << "Set sample size = " << "|I|" << std::endl;
            
        if(m_bf_fs > 0)
            std::cout << "Set Bloom F. size = " << m_bf_fs << " GB" << std::endl;
        else 
            std::cout << "Set Bloom F. size = " << "|F|^2" << std::endl;
        
        if(m_bf_max_size > 0)
            std::cout << "Set Total Bloom Fs. size <= " << m_bf_max_size <<" GB" << std::endl;
        else
            std::cout << "Set Total Bloom Fs. size <= " << "infty" << std::endl;

        m_fl_sample_size.resize(max_arity);
        m_fl_sample_size_op.resize(max_arity);
        for(unsigned k = 0; k < max_arity; k++)
        {
            if(m_sample_fs > 0)
            {
                m_fl_sample_size_op[k] = compute_sample_size(
                    (double)m_sample_fs,(double)k+1, true);
                std::cout << "Size_op for k = " << k+1 <<" is = " << 
                    m_fl_sample_size_op[k] << " and num_fluents = " << 
                    m_num_fluents << std::endl;
                m_fl_sample_size[k] = compute_sample_size(
                    (double)m_sample_fs,(double)k+1, false);
                std::cout << "Size for k = " << k+1 <<" is = " << 
                    m_fl_sample_size[k] << " and num_fluents = " << 
                    m_num_fluents << std::endl;
            }
            else
            {
                m_fl_sample_size_op[k] = compute_sample_size(
                    (double)m_strips_model.init().size(),(double)k+1, true);
                std::cout << "Size for k = " << k+1 <<" is = " << 
                    m_fl_sample_size_op[k] << " and num_fluents = " << 
                    m_num_fluents << std::endl;
                m_fl_sample_size[k] = compute_sample_size(
                    (double)m_strips_model.init().size(),(double)k+1, false);
                std::cout << "Size for k = " << k+1 <<" is = " << 
                    m_fl_sample_size[k] << " and num_fluents = " << 
                    m_num_fluents << std::endl;
            }

        }

        if(m_comb_idx !=   NULL)
            free(m_comb_idx);
        m_comb_idx      =   (unsigned*) malloc(m_arity*sizeof(unsigned));
        if(m_tuple !=  NULL)
            free(m_tuple);
        m_tuple         =   (unsigned*) malloc(m_arity*sizeof(unsigned));

        if(m_arity>2)
        {
            if(m_bf_fs > 0 )
                m_bf_fs_bits = m_bf_fs*8*1024*1024*1024;
            else
            {
                m_bf_fs_bits = std::pow(m_num_fluents, 2);
                m_bf_fs = (float)m_bf_fs_bits/(8.0*1024.0*1024.0*1024.0);
            }

            std::cout << "1. m_bf_fs - " << m_bf_fs << std::endl; 
            std::cout << "1. m_bf_fs_bits - " << m_bf_fs_bits << std::endl; 

            if(m_bf_max_size > 0)
            {
                unsigned x = (unsigned)floor(m_bf_max_size/(m_bf_fs*(m_arity-2)));
                if(m_partition_size > x)
                {
                    // m_bf_max_size < m_bf_fs implies x = 0, we can't allocate required 
                    // memory for a BF. Hence, we reduce BF size to m_bf_max_size
                    m_num_bf =  x > 0 ? x : 1;
                    m_bf_fs_bits = x > 0 ? m_bf_fs_bits : m_bf_max_size*8*1024*1024*1024;
                }
                else
                {
                    m_num_bf =  m_partition_size;
                    m_bf_fs_bits = (m_bf_max_size/((float)m_num_bf*(m_arity-2)))*8*1024*1024*1024;
                }
            }
            else
                m_num_bf = m_partition_size;

            m_bf_fs = (float)m_bf_fs_bits/(8.0*1024.0*1024.0*1024.0);
            std::cout << "2. m_bf_max_size - " << m_bf_max_size << std::endl; 
            std::cout << "2. m_num_bf - " << m_num_bf << std::endl; 
            std::cout << "2. m_bf_fs - " << m_bf_fs << std::endl; 
            std::cout << "2. m_bf_fs_bits - " << m_bf_fs_bits << std::endl; 
        }

        if(m_arity >= 1)
             m_size_novelty =   (std::pow(m_num_fluents, 1)*(float)m_partition_size)/ (8.0*1024.0*1024.0);
        if(m_arity >= 2)
             m_size_novelty +=  (std::pow(m_num_fluents, 2)*(float)m_partition_size)/ (8.0*1024.0*1024.0);
        if(m_arity >= 3)
             m_size_novelty +=  (((m_max_arity_4space_alloc-2)*
                                   m_bf_fs_bits*(float)m_num_bf))/(8.0*1024.0*1024.0);

        std::cout << "m_size_novelty = " << m_size_novelty << "MB" << std::endl;

        while(m_size_novelty > m_max_memory_size_MB && m_max_arity_4space_alloc > 0){
            std::cout<<"Failed novelty setup for arity="<< m_max_arity_4space_alloc <<" --> size: "<<
            m_size_novelty<<" MB"<<std::endl;
            m_max_arity_4space_alloc--;
            if(m_max_arity_4space_alloc >= 1)
                m_size_novelty =   (std::pow(m_num_fluents, 1)*(float)m_partition_size)/ (8.0*1024.0*1024.0);
            if(m_max_arity_4space_alloc >= 2)
                m_size_novelty +=  (std::pow(m_num_fluents, 2)*(float)m_partition_size)/ (8.0*1024.0*1024.0);
            if(m_max_arity_4space_alloc >= 3)
                m_size_novelty +=  (((m_max_arity_4space_alloc-2)*
                                   m_bf_fs_bits*(float)m_num_bf))/ (8.0*1024.0*1024.0);

            std::cout<<"Attempting to downgrade memory requirements to arity=" <<
            m_max_arity_4space_alloc <<" --> size: "<< m_size_novelty<<" MB"<<std::endl;
        }

        if( m_arity>=2 && m_max_arity_4space_alloc < 2){
            std::cout   <<"Memory requirement for novelty table not met!" 
                        << " Downgrading to arity = 1" << std::endl;
            m_arity=1;
        }
        else if (m_size_novelty > m_max_memory_size_MB){
            std::cerr<<"Warning! Maximum novelty table size may exceed memory limit :"
                <<" Ignoring and attempting search... with k=" << m_arity  << " --> size: "<<
                m_size_novelty<<" MB"<<std::endl;
        }
        m_nodes_tuples1_by_partition.resize( m_partition_size+1 );
        if(m_arity > 1)
            m_nodes_tuples2_by_partition.resize( m_partition_size + 1 );
        if(m_arity > 2){
            m_nodes_tuples3plus_by_partition.resize(m_arity-2); 
            for(auto& nodes_3plus : m_nodes_tuples3plus_by_partition)
                nodes_3plus.resize( m_num_bf);
            m_partition_hashmap.resize(m_partition_size+1);
            std::uniform_int_distribution<> distrib(0, m_num_bf-1);
            for(auto& p : m_partition_hashmap)
                p = distrib(m_gen);
            std::cout   << "SIZE m_nodes_tuples3plus_by_partition = " 
                        <<  m_nodes_tuples3plus_by_partition.size() << std::endl;
        }

        for( unsigned i = 0; i < m_partition_size+1; i++ )
        {
            if(m_nodes_tuples1_by_partition[i])
            {
                m_nodes_tuples1_by_partition[i]->reset();           
            }
            if(m_arity > 1){
                for(unsigned j = 0; j < m_num_fluents; j++){
                    if(m_nodes_tuples2_by_partition[i] &&
                       m_nodes_tuples2_by_partition[i]->at(j) &&
                       m_nodes_tuples2_by_partition[i]->at(j)->bits().packs() != NULL){
                        m_nodes_tuples2_by_partition[i]->at(j)->reset();
                    }
                }
            }
        }

        if(m_arity > 2)
            for(auto& nodes_3plus : m_nodes_tuples3plus_by_partition)
                for(auto& i : nodes_3plus)
                    if(i){
                        delete i;
                        i=NULL;
                    }

        std::cout<<"Succeded m_arity setup to arity="<< m_arity <<" --> size: "<< 
            m_size_novelty<<" MB"<<std::endl;

        // Setup overflow
        m_num_id = 1;
        for(unsigned i = 0; i< m_arity; i++){
            if(((unsigned long long)(m_num_id*(unsigned long long)m_num_fluents))/
                    (unsigned long long)m_num_fluents != m_num_id)
            {
                m_overflow_enabled = true;
                std::cout << "NOTE- overflow enabled on novelty computation" << std::endl;
                break;
            }
            m_num_id *= m_num_fluents;
        }
        std::cout<< "|----------------------------------------------------------|"<< std::endl;
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

    // Usage: Used for sampling size
    // @Params:
    //
    // @Ouput:
    size_t compute_sample_size(size_t fl_size, double k, unsigned flag_cover_op) {
        if (flag_cover_op)
        {
            if (k < m_min_k4sample) return m_num_fluents;
            size_t fl_sample_size = std::min((size_t)ceil((std::pow(2*M_PI*k,
                        1.0/(2.0*k))*k*std::pow(m_sample_factor*fl_size,
                        1.0/k))/exp(1)), fl_size);
            if(fl_sample_size > std::pow(m_num_fluents, k)) 
                return std::pow(m_num_fluents, k);
            else
                return fl_sample_size > k ? fl_sample_size : k+1;
        }
        else
        {
            if (k < m_min_k4sample) return m_num_fluents;
            size_t fl_sample_size = std::min((size_t)ceil((std::pow(2*M_PI*k,
                        1.0/(2.0*k))*k*std::pow(m_sample_factor*fl_size,
                        1.0/k))/exp(1)), fl_size);
            if(fl_sample_size > std::pow(m_num_fluents, k)) 
                return std::pow(m_num_fluents, k);
            else
                return fl_sample_size > k ? fl_sample_size : k+1;
        }    
    }

    void sample_rand_shuffle(Fluent_Vec& sample_fl, unsigned fl_sample_size)
    {
       // SHUFFLE AND PICK FIRST FEW ( Note - Processing is slower)
       std::shuffle (sample_fl.begin(), sample_fl.end(), m_gen);
       //sample_fl.resize(fl_sample_size);
    }

    void sample_rand(Fluent_Vec& sample_fl, unsigned fl_sample_size)
    {
        std::uniform_int_distribution<> dis(0, sample_fl.size()-1);

        for(unsigned i=0; i < fl_sample_size; i++)
            m_fluent_temp[i] = sample_fl[dis(m_gen)];
        //for(unsigned i=0; i < fl_sample_size|| m_fsample_bset.size()
            //m_fsample_bset.set(sample_fl[dis(m_gen)]);

        sample_fl = m_fluent_temp;
        /*
        sample_fl.resize( fl_sample_size);
        unsigned i = 0;
        for(auto index : m_fsample_bset) {
            if(m_fsample_bset.isset(index))
                sample_fl[i] = index;
        i++;
        }
        */
    }
    // Sort an unsigned array of items(if equal items then return true)
    bool sort_n_check_duplicate( unsigned* item, unsigned size) {
        if(size==1)
            return false;
        unsigned temp, i, j;
        auto comp_swap = [&] () {
            if (item[i]==item[j]) return true;
            if (item[i] > item[j]) {
                temp = item[i];
                item[i] = item[j];
                item[j] = temp;
            }
            return false;
        };
        if  (size == 2){ 
            i = 0, j = 1;
            return comp_swap();
        }
        else if(size == 3) {
            i = 1, j = 2;
            if (comp_swap()) return true;
            i = 0, j = 2;
            if (comp_swap()) return true;
            i = 0, j = 1;
            if (comp_swap()) return true;
        }
        else if(size==4){
            i = 0, j = 1;
            if (comp_swap()) return true;
            i = 2, j = 3;
            if (comp_swap()) return true;
            i = 0, j = 2;
            if (comp_swap()) return true;
            i = 1, j = 3;
            if (comp_swap()) return true;
            i = 1, j = 2;
            if (comp_swap()) return true;
        }
        else if(size==5){
            i = 0, j = 1;
            if (comp_swap()) return true;
            i = 3, j = 4;
            if (comp_swap()) return true;
            i = 2, j = 4;
            if (comp_swap()) return true;
            i = 2, j = 3;
            if (comp_swap()) return true;
            i = 1, j = 4;
            if (comp_swap()) return true;
            i = 0, j = 3;
            if (comp_swap()) return true;
            i = 0, j = 2;
            if (comp_swap()) return true;
            i = 1, j = 3;
            if (comp_swap()) return true;
            i = 1, j = 2;
            if (comp_swap()) return true;
        }
        else{
            //inplace insertion sort
            for(unsigned i=1; i < size; i++){
                if (item[i] < item[i-1]) {
                    temp = item[i];
                    unsigned j;
                    for(j=i; (j > 0) && (temp < item[j-1]); j--)
                        item[j] = item[j-1];
                    item[j] = temp;
                    if (j>0 && item[j]==item[j-1])
                        return true;
                }
                else if(item[i]==item[i-1])
                    return true;
            }
        }
        return false;
    }

    void check_table_size( Search_Node* n )
    {
        if(m_partition_size < n->partition()){
            m_nodes_tuples1_by_partition.resize(n->partition() + 1);
            if(m_arity >1 ){
                m_nodes_tuples2_by_partition.resize(n->partition() + 1 );
                m_nodes_tuples2_by_partition[ n->partition() ] 
                        = new std::vector< Fluent_Set* >(m_num_fluents + 1);
            }
            if(m_arity > 2)
            {
                m_partition_hashmap.resize(n->partition() + 1);
                std::uniform_int_distribution<> distrib(0, m_num_bf-1);
                for(unsigned i = m_partition_hashmap.size(); i<n->partition()+1; i++)
                    m_partition_hashmap[i] = distrib(m_gen);
            }
            m_partition_size = n->partition();
        }
    
        if(m_nodes_tuples1_by_partition[n->partition()] == NULL)
                m_nodes_tuples1_by_partition[n->partition()] 
                        = new Fluent_Set( m_num_fluents );
        if(m_arity > 1 && m_nodes_tuples2_by_partition[n->partition()] == NULL)
                m_nodes_tuples2_by_partition[n->partition()] 
                        = new std::vector< Fluent_Set* >( m_num_fluents + 1);
        if(m_arity > 2)
            for(auto& nodes_3plus : m_nodes_tuples3plus_by_partition)
                if(nodes_3plus[m_partition_hashmap[n->partition()]] == NULL)
                    nodes_3plus[m_partition_hashmap[n->partition()]] 
                        = new BloomFilter(m_bf_fs_bits, (float)fact_uint(m_num_fluents)/
                                (float)(fact_uint(m_num_fluents-m_arity)*fact_uint(m_arity)));
    }

    /**
     * If parent node is in the same space partition, check only new atoms,
     * otherwise check all oatoms in state
     */
    void compute(  Search_Node* n, unsigned& novelty ) 
    {

        novelty = (float) m_arity+1;

        if( n->partition() == std::numeric_limits<unsigned>::max() ) return;
        unsigned offset = 0;    
        check_table_size( n );
           
        for(unsigned i = 1; i <= m_arity-offset; i++){
#ifdef DEBUG
            if ( m_verbose )
                std::cout << "search state node: "<<&(n)<<std::endl;
#endif  
            
            bool new_covers;

            if(n->parent() == nullptr || m_always_full_state)
                new_covers = cover_tuples( n, i );
            else
                //new_covers = cover_tuples_op( n, i );
                new_covers = (n->partition() == n->parent()->partition()) ?  
                    cover_tuples_op( n, i ) : cover_tuples( n, i );

#ifdef DEBUG
            if(m_verbose && !new_covers)    
                std::cout << "\t \t PRUNE! search node: "<<&(n)<<std::endl;
#endif  
            if ( new_covers )
                if(i < novelty )
                    novelty = i;
        }
    }

    void process_tuple3(bool& new_covers, unsigned fl_sample_size, 
            Search_Node* n, unsigned arity)
    {
        for(unsigned i = 0; i < fl_sample_size; i++){
            for(unsigned j = i+1; j<fl_sample_size; j++){
                for(unsigned k = j+1; k<fl_sample_size; k++){
                    unsigned* t_arr = m_tuple;
                    t_arr[0] = m_fluent_sample[i];
                    t_arr[1] = m_fluent_sample[j];
                    t_arr[2] = m_fluent_sample[k];
                    unsigned temp;
                    if (t_arr[2] < t_arr[1]) {
                        t_arr[1]    =   t_arr[2];
                        t_arr[2]    =   m_fluent_sample[j];
                    }
                    if (t_arr[2] < t_arr[0]) {
                        temp        =   t_arr[0];
                        t_arr[0]    =   t_arr[2];
                        t_arr[2]    =   temp;
                    }
                    if (t_arr[1] < t_arr[0]) {
                        temp        =   t_arr[0];
                        t_arr[0]    =   t_arr[1];
                        t_arr[1]    =   temp;
                    }
                    if (t_arr[0]==t_arr[1] || t_arr[1]==t_arr[2] ||
                            t_arr[0]==t_arr[2]) continue;
                    m_num_id = t_arr[arity-1];
                    for(int t_idx=arity-2; t_idx >=0; t_idx--)
                        m_num_id  =   (m_num_id*m_num_fluents) + t_arr[t_idx];
                    m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->
                                computeIndexes(m_num_id, 1);
                    bool new_tuple = m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->
                                            checkIndexes();
                    if( new_tuple ){
                        m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->setIndexes();
                        new_covers = true;
                    }
                }
            }
        }
    }
    void process_tuple3plus(bool& new_covers, unsigned fl_sample_size, 
            Search_Node* n, unsigned arity)
    {
        bool flag_start_loop = false;
        unsigned* idx = m_comb_idx;
        for(unsigned i = 0; i < arity; i++)
            idx[i] = i;

        auto gen_tuple_idx_x =  [&] () {
            if(idx[0]==fl_sample_size-arity)
                return false;
    
            unsigned a = arity-1;
            while(idx[a]==fl_sample_size-arity+a){
                a--;
            }
            idx[a]++;
            while(++a<arity){
                idx[a] = idx[a-1]+1;
            }
            return true;
        };

        while( !flag_start_loop || gen_tuple_idx_x() ) 
        {
            flag_start_loop = true;
            unsigned* t_arr = m_tuple;
            unsigned i = 0;
            while(i++ < arity)
                t_arr[i-1] = m_fluent_sample[idx[i-1]];
            if ( sort_n_check_duplicate(t_arr, arity)) continue;

            i = arity-1;
            if (!m_overflow_enabled) {
                m_num_id = t_arr[arity-1];
                while(i>0){
                    m_num_id  = (m_num_id*m_num_fluents) + t_arr[i-1];
                    i--;
                }
            }
            else {
                m_num_id = std::hash<unsigned>{} (t_arr[arity-1]);
                while(i>0){
                    m_num_id^=std::hash<unsigned>{} (t_arr[i-1])+ 
                        0x9e3779b9ULL + (m_num_id<<6) + (m_num_id>>2);
                    i--;
                }

            }

            m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->
                            computeIndexes(m_num_id, 1);
            bool new_tuple = m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->
                            checkIndexes();
            if( new_tuple ){
                m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->setIndexes();
                new_covers = true;
            }
        }
    }

    
    inline void set_union( Bit_Set* table, Bit_Set& other, bool& new_covers, unsigned idx ) {
        assert( table->max_index() == other.max_index()  );
        assert( table->bits().npacks() == other.bits().npacks() );
        unsigned np = other.bits().npacks();
        uint32_t* op = other.bits().packs();
        //for(unsigned p_idx = idx/32; p_idx < np; p_idx++) {
        for(unsigned p_idx = 0; p_idx < np; p_idx++) {
            uint32_t pack = table->bits().packs()[p_idx];
            table->bits().packs()[p_idx] |= op[p_idx];
            if( pack != table->bits().packs()[p_idx] )
                new_covers = true;
        }
    }

    bool cover_tuples( Search_Node* n, unsigned arity  )
    {
        const bool has_state = n->has_state();

        static Fluent_Vec added;
        static Fluent_Vec deleted;
        if(!has_state){
            added.clear();
            deleted.clear();
            n->parent()->state()->progress_lazy_state(  
                m_strips_model.actions()[ n->action() ], &added, &deleted );
        }
                

        m_fluent_sample = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();      
#ifdef DEBUG
        std::cout << "State's Fluents - ";
        for(auto fl : m_fluent_sample)
            std::cout << fl << " ";
        std::cout<<std::endl;
#endif
        unsigned fl_sample_size =   m_fl_sample_size[arity-1] < m_fluent_sample.size() ? 
                                    m_fl_sample_size[arity-1] : m_fluent_sample.size() ;
        fl_sample_size = (fl_sample_size < arity && 
                            arity <= m_fluent_sample.size()) 
                            ? arity : fl_sample_size;
        if(arity>fl_sample_size){
            if(!has_state)
                n->parent()->state()->regress_lazy_state(
                m_strips_model.actions()[ n->action() ], &added, &deleted );
            return true;
        }
        if( m_sampling_strategy.compare("rand") == 0 )
        {
            if ( fl_sample_size < m_fluent_sample.size())
            {
                sample_rand(m_fluent_sample, fl_sample_size);
            }
        }
        bool new_covers = false;
        Fluent_Set& fl_set = has_state ? n->state()->fluent_set() : 
                                n->parent()->state()->fluent_set();

        if(arity == 1){
            for(unsigned i = 0; i < fl_sample_size; i++){
                if (!m_nodes_tuples1_by_partition[ n->partition() ]->isset(
                            m_fluent_sample[i]))
                {
                    m_nodes_tuples1_by_partition[ n->partition() ]->set(
                            m_fluent_sample[i]);
                    new_covers=true;
                }
            }
        }
        else if(arity == 2){
            std::vector<Fluent_Set*>& tables = *(m_nodes_tuples2_by_partition[ n->partition() ]);
            unsigned fl_idx = 0;
            for(unsigned i = 0; i < fl_sample_size; i++) {
                fl_idx = m_fluent_sample[i];
                if(tables[fl_idx] == NULL)
                    tables[fl_idx] = new Fluent_Set( m_num_fluents );

                set_union( tables[fl_idx] , fl_set, new_covers, fl_idx);
            }
        }
        else if(arity == 3){
           process_tuple3(new_covers, fl_sample_size, n, arity); 
        }
        else if(arity > 3){
           process_tuple3plus(new_covers, fl_sample_size, n, arity);  
        }
        if(!has_state)
            n->parent()->state()->regress_lazy_state( 
            m_strips_model.actions()[ n->action() ], &added, &deleted );
    
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
            for(Fluent_Vec::const_iterator it = a->add_vec().begin(); 
                    it != a->add_vec().end(); it++)
            {
                if ( new_atom_set.isset( *it ) ) continue;
            
                new_atom_vec.push_back( *it );
                new_atom_set.set( *it );

            }
            for( unsigned i = 0; i < a->ceff_vec().size(); i++ )
            {
                Conditional_Effect* ce = a->ceff_vec()[i];
                if( ce->can_be_applied_on( *(n->parent()->state()) ) )
                {
                    for(Fluent_Vec::iterator it = ce->add_vec().begin(); 
                    it != ce->add_vec().end(); it++)
                    {
                        if ( new_atom_set.isset( *it ) ) continue;
                        new_atom_vec.push_back( *it );
                        new_atom_set.set( *it );
                    }
                }
            }
        }
        m_add = a->has_ceff() ? new_atom_vec : a->add_vec();
        //if(!has_state)
        //  n->parent()->state()->progress_lazy_state(  m_strips_model.actions()[ n->action() ]);

        m_fluent_sample = has_state ? n->state()->fluent_vec() : 
                n->parent()->state()->fluent_vec();   
        unsigned add_sample_size = std::min(m_fl_sample_size_op[arity-1]/2.0,
                                        (double)m_add.size());

        unsigned fl_sample_size = (m_fl_sample_size_op[arity-1]-add_sample_size) <
            m_fluent_sample.size() ? (m_fl_sample_size_op[arity-1]-add_sample_size):
            m_fluent_sample.size();
        fl_sample_size = fl_sample_size < arity ? arity : fl_sample_size;
        if(arity>fl_sample_size)
            return true;
        if( m_sampling_strategy.compare("rand") == 0 )
        {
            if (fl_sample_size < m_fluent_sample.size())
            {
                sample_rand(m_fluent_sample, fl_sample_size);
            }
            //if(add_sample_size < m_add.size())
            //    sample_rand_shuffle(m_add, add_sample_size);
        }
                    
        

        bool new_covers = false;
        
                
        if(arity == 1)
        {
            for ( Fluent_Vec::const_iterator it_add = m_add.begin();
                    it_add != m_add.end(); it_add++ )
            {
                if (! m_nodes_tuples1_by_partition[ n->partition() ]->isset(*it_add) ) 
                {       
                    m_nodes_tuples1_by_partition[ n->partition() ]->set(*it_add);
                    new_covers = true;

#ifdef DEBUG
                    if ( m_verbose ) {
                        std::cout<<"\t NEW!! : ";
                        for(unsigned i = 0; i < arity; i++){
                            std::cout<< m_strips_model.fluents()[ *it_add ]->signature()<<"  ";
                        }
                        std::cout << std::endl;
                    }
#endif
                }                   
            }
        }
        else if(arity==2){
            std::vector<Fluent_Set*>* tables = m_nodes_tuples2_by_partition[ n->partition() ];
            for ( Fluent_Vec::const_iterator it_add = m_add.begin();
                    it_add != m_add.end(); it_add++ )
            {
                for(unsigned i=0; i<fl_sample_size; i++){
                        unsigned min = *it_add;
                        unsigned max = m_fluent_sample[i];
                        if( max < min ){
                            min = max;
                            max = *it_add;
                        }
                        if( min == max ) continue;
                        if(tables->at(min) == NULL)
                            tables->at(min) = new Fluent_Set( m_num_fluents );
                        if( ! tables->at(min)->isset(max) ){
                            tables->at(min)->set(max);
                            new_covers = true;
                        }
                }
            }
        }
        else if(arity==3){
            process_tuple3_op(new_covers, fl_sample_size, n, arity);
        }
        else {
            process_tuple3plus_op(new_covers, fl_sample_size, n, arity);
        }
        //if(!has_state  && arity == 2)
        //  n->parent()->state()->regress_lazy_state( m_strips_model.actions()[ n->action() ] );
        
        return new_covers;
    }
    // Helper function for cover_tuple_op 
    void process_tuple3_op(bool& new_covers, unsigned fl_sample_size,
            Search_Node* n, unsigned arity)
    {
        for ( Fluent_Vec::const_iterator it_add = m_add.begin();
                    it_add != m_add.end(); it_add++ )
        {
            for(unsigned i = 0; i < fl_sample_size; i++){
                for(unsigned j=i+1; j < fl_sample_size; j++){
                    unsigned* t_arr = m_tuple;
                    unsigned temp;
                    t_arr[0] = *it_add;
                    t_arr[1] = m_fluent_sample[i];
                    t_arr[2] = m_fluent_sample[j];
                    if (t_arr[2] < t_arr[1]){
                        t_arr[1]    =   t_arr[2];
                        t_arr[2]    =   m_fluent_sample[i];
                    }
                    if (t_arr[2] < t_arr[0]){
                        temp        =   t_arr[0];
                        t_arr[0]    =   t_arr[2];
                        t_arr[2]    =   temp;
                    }
                    if (t_arr[1] < t_arr[0]){
                        temp        =   t_arr[0];
                        t_arr[0]    =   t_arr[1];
                        t_arr[1]    =   temp;
                    }
                    if (t_arr[0]==t_arr[1] || t_arr[1]==t_arr[2] ||
                        t_arr[0]==t_arr[2]) continue;

                    m_num_id = t_arr[arity-1];
                    for(int t_idx=arity-2; t_idx >=0; t_idx--)
                        m_num_id  =   (m_num_id*m_num_fluents) + t_arr[t_idx];

                    m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->
                            computeIndexes(m_num_id, 1);
                    bool new_tuple = m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]
                                            ->checkIndexes();
                    if( new_tuple ){
                        m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->setIndexes();
                        new_covers = true;
                    }
                }
            }
        }
    }

    void process_tuple3plus_op(bool& new_covers, unsigned fl_sample_size,
            Search_Node* n, unsigned arity)
    {
        bool flag_start_loop = false;
        unsigned* idx = m_comb_idx;
        for(unsigned i = 0; i < arity; i++)
            idx[i] = i;
        auto gen_tuple_idx_x =  [&] () {
            if(arity<2 || idx[0]==fl_sample_size-arity+1)
                return false;
            unsigned a = arity-2;
            while(idx[a]==fl_sample_size-arity+1+a){
                a--;
            }
            idx[a]++;
            while(++a<arity-1){
                idx[a] = idx[a-1]+1;
            }
            return true;
        };
        while( !flag_start_loop || gen_tuple_idx_x() ) 
        {
            flag_start_loop = true;
            for ( Fluent_Vec::const_iterator it_add = m_add.begin();
                it_add != m_add.end(); it_add++ )
            {
                unsigned* t_arr = m_tuple;
                unsigned i = 0;
                while(i++<arity-1)
                {
                    t_arr[i-1] = m_fluent_sample[idx[i-1]];
                }
                t_arr[ arity - 1 ] = *it_add;
                if ( sort_n_check_duplicate(t_arr, arity)) continue;
    
                i = arity-1;
                if (!m_overflow_enabled) {
                    m_num_id = t_arr[arity-1];
                    while(i>0){
                        m_num_id  = (m_num_id*m_num_fluents) + t_arr[i-1];
                        i--;
                    }
                }
                else {
                    m_num_id = std::hash<unsigned>{} (t_arr[arity-1]);
                    while(i>0){
                        m_num_id^=std::hash<unsigned>{} (t_arr[i-1])+ 
                            0x9e3779b9ULL + (m_num_id<<6) + (m_num_id>>2);
                        i--;
                    }

                }
                        
                m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->
                        computeIndexes(m_num_id, 1);
                bool new_tuple = m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]
                                    ->checkIndexes();
                if( new_tuple ){
                    m_nodes_tuples3plus_by_partition[arity-3][m_partition_hashmap[n->partition()]]->setIndexes();
                new_covers = true;
                }
            } 
        }
    }

    const STRIPS_Problem&           m_strips_model;
    std::vector< Fluent_Set* >      m_nodes_tuples1_by_partition;
    std::vector< std::vector< Fluent_Set* >* > 
                                    m_nodes_tuples2_by_partition;
    std::vector<std::vector< BloomFilter* >>     
                                    m_nodes_tuples3plus_by_partition;
    std::vector<unsigned>           m_partition_hashmap;
    unsigned                        m_arity;
    unsigned                        m_num_fluents;
    unsigned                        m_max_memory_size_MB;
    bool                            m_always_full_state;
    unsigned                        m_partition_size;
    bool                            m_verbose;
    float                           m_fluent_set_size;
    float                           m_size_novelty;
    std::vector<unsigned>           m_fluent_temp;
    std::vector<unsigned>           m_add;
    std::vector<unsigned>           m_fl_sample_size;
    std::vector<unsigned>           m_fl_sample_size_op;
    Fluent_Vec                      m_fluent_sample;
    Fluent_Vec                      m_add_sample;
    boost::mt11213b                 m_gen;
    std::string                     m_sampling_strategy;
    float                           m_sample_factor;
    unsigned                        m_rand_seed;
    unsigned                        m_min_k4sample;
    unsigned long long              m_num_id;
    unsigned*                       m_comb_idx;
    unsigned*                       m_tuple;
    bool                            m_overflow_enabled;
    unsigned                        m_max_arity_4space_alloc;
    unsigned                        m_sample_fs; 
    float                           m_bf_fs;
    size_t                          m_bf_fs_bits;
    float                           m_bf_max_size;
    size_t                          m_bf_max_size_bits;
    unsigned                        m_num_bf;

};

}

}

#endif // novelty_partition.hxx
