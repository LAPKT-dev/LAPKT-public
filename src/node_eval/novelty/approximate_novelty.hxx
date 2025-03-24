/**
 * @file approximate_novelty.hxx
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

#ifndef __APPROXIMATE_NOVELTY__
#define __APPROXIMATE_NOVELTY__

#include <search_prob.hxx>
#include <heuristic.hxx>
#include <ext_math.hxx>
#include <strips_state.hxx>
#include <strips_prob.hxx>
#include <vector>
#include <deque>
#include <random>
#include <chrono>
#include <math.h>
#include <boost/random/uniform_01.hpp>
#include <boost/random/mersenne_twister.hpp>

#include <iostream>
#include <iterator>
#include <algorithm>

#include "bloomfilter.hxx"
#include <bit_set.hxx>
#define RAND_SEED 101
#define NORMAL_FACTOR 1.0
using namespace boost::random;

namespace aptk
{

  namespace agnostic
  {

    template <typename Search_Model, typename Search_Node>
    class Approximate_Novelty : public Heuristic<State>
    {
    public:
      Approximate_Novelty(const Search_Model &prob, std::string sampling_strategy, float sample_size,
                unsigned rand_seed, unsigned min_k4sample,
                unsigned max_arity = 1, const unsigned max_MB = 2048)
        : Heuristic<State>(prob), m_strips_model(prob.task()),
          m_max_memory_size_MB(max_MB), m_verbose(true),
          m_sampling_strategy(sampling_strategy), m_sample_factor(sample_size),
          m_min_k4sample(min_k4sample),
          m_comb_idx(NULL), m_tuple(NULL), m_overflow_enabled(false)
      {
        m_nodes_3plus_tuples = NULL;
        m_num_fluents = prob.task().num_fluents();
        // m_check_false_positives = false;
        // m_num_false_positives = 0;
        // m_num_false_novelties = 0;
        set_arity(max_arity);
        m_fluent_sample.reserve(prob.task().num_fluents());
        m_fluent_temp.resize(m_num_fluents);
        m_gen = boost::mt11213b(RAND_SEED);
        // unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
        // std::srand(RAND_SEED);
        // m_gen = std::ranlux48_base(RAND_SEED);
        // m_gen = std::mt19937_64(RAND_SEED);
      }

      // void    set_check_false_positives( bool v ) { m_check_false_positives = v; }
      void set_verbose(bool v) { m_verbose = v; }

      virtual ~Approximate_Novelty()
      {
        delete m_nodes_3plus_tuples;
        free(m_tuple);
        free(m_comb_idx);
      }

      void init()
      {
        if (m_nodes_3plus_tuples)
          m_nodes_3plus_tuples->reset();
        std::fill(m_nodes_12_tuples.begin(), m_nodes_12_tuples.end(), 0);
        // m_num_false_positives = 0;
        // m_num_false_novelties = 0;
      }

      // unsigned   num_false_positives() { return m_num_false_positives; }
      // unsigned   num_false_novelties() { return m_num_false_novelties; }

      unsigned arity() const { return m_arity; }

      float bloom_fillratio() { 
        if (m_arity > 2)
          return m_nodes_3plus_tuples->bloom_fillratio();
        else 
          return 0; 
      }

      void set_arity(unsigned max_arity)
      {
        m_num_fluents = m_strips_model.num_fluents();
        m_arity = max_arity;
        m_fl_sample_size.resize(m_arity);

        if (m_arity > 2)
        {
          delete m_nodes_3plus_tuples;
          m_nodes_3plus_tuples = new BloomFilter(
            std::pow(2, m_arity) * m_num_fluents * m_num_fluents,
            std::pow(m_num_fluents, m_arity));
        }

        if (m_arity == 1)
        {
          m_nodes_12_tuples.clear();
          m_nodes_12_tuples.resize(m_num_fluents, false);
        }
        else if (m_arity > 1)
        {
          m_nodes_12_tuples.clear();
          m_nodes_12_tuples.resize(m_num_fluents * m_num_fluents, false);
        }

        for (unsigned k = 0; k < m_arity; k++)
        {
          m_fl_sample_size[k] = compute_sample_size(
            (double)m_num_fluents, (double)k + 1);
          std::cout << "Size for k = " << k + 1 << " is = " << m_fl_sample_size[k] << " and num_fluents = " << m_num_fluents << std::endl;
        }

        float size_novelty = std::min(((std::pow(2, m_arity) + 1) *
                         (float)std::pow(m_num_fluents, 2)) /
                          1024000.0,
                        (float)std::pow(m_num_fluents, m_arity) / 1024000.0);
        std::cout << "size_novelty = " << size_novelty << "MB" << std::endl;
        while (size_novelty > m_max_memory_size_MB && m_arity > 1)
        {
          std::cout << "Failed novelty setup for arity=" << m_arity << " --> size: " << size_novelty << " MB" << std::endl;
          m_arity--;
          size_novelty = std::min(((std::pow(2, m_arity) + 1) *
                       (float)std::pow(m_num_fluents, 2)) /
                        1024000.0,
                      (float)std::pow(m_num_fluents, m_arity) / 1024000.0);

          std::cout << "Attempting m_arity downgrade to arity=" << m_arity << " --> size: " << size_novelty << " MB" << std::endl;
        }

        if (m_comb_idx != NULL)
          free(m_comb_idx);
        m_comb_idx = (unsigned *)malloc(m_arity * sizeof(unsigned));
        if (m_tuple != NULL)
          free(m_tuple);
        m_tuple = (unsigned *)malloc(m_arity * sizeof(unsigned));

        std::cout << "Succeded m_arity setup to arity=" << m_arity << " --> size: " << size_novelty << " MB" << std::endl;

        // Setup overflow
        m_num_id = 1;
        for (unsigned i = 0; i < m_arity; i++)
        {
          if (((unsigned long long)(m_num_id * (unsigned long long)m_num_fluents)) /
              (unsigned long long)m_num_fluents !=
            m_num_id)
          {
            m_overflow_enabled = true;
            std::cout << "WARNING!! overflow enabled on novelty computation" << std::endl;
            break;
          }
          m_num_id *= m_num_fluents;
        }
      }

      void eval(Search_Node *n, float &h_val)
      {
        compute(n, h_val);
      }

      void eval(Search_Node *n, float &h_val, std::vector<unsigned> &fluent_freq)
      {
        // m_fluent_freq = fluent_freq;
        compute(n, h_val);
      }

      void eval(Search_Node *n, float &h_val, std::vector<Action_Idx> &pref_ops)
      {
        eval(n, h_val);
      }

      virtual void eval(const State &s, float &h_val)
      {
        assert(true);
      }

      virtual void eval(const State &s, float &h_val, std::vector<Action_Idx> &pref_ops)
      {
        assert(true);
      }

      int factorial(int n)
      {
        return (n == 1 || n == 0) ? 1 : factorial(n - 1) * n;
      }

    protected:
      // Usage: Used for sampling size
      // @Params:
      //
      // @Ouput:
      size_t compute_sample_size(size_t fl_size, double k)
      {
        // IF OPTIMIZATION for IW2 is enabled then no need to sample since O(n) combinations
        if (k < 2)
          return fl_size + 1;
        size_t fl_sample_size = std::min((size_t)ceil((std::pow(2 * M_PI * k,
                                    1.0 / (2.0 * k)) *
                                 k * std::pow(m_sample_factor * fl_size, 1.0 / k)) /
                                exp(1)),
                         fl_size);
        return fl_sample_size > k ? fl_sample_size : k + 1;
      }

      // Usage: Used for simple random sampling
      // @Params:
      //
      // @Ouput:
      void sample_rand_shuffle(Fluent_Vec &sample_fl, unsigned fl_sample_size)
      {
        // SHUFFLE AND PICK FIRST FEW ( Note - Processing is slower)
        std::shuffle(sample_fl.begin(), sample_fl.end(), m_gen);
        // sample_fl.resize(fl_sample_size);
      }

      // Usage: Used for simple random sampling
      // @Params:
      //
      // @Ouput:
      void sample_rand(Fluent_Vec &sample_fl, unsigned fl_sample_size)
      {
        std::uniform_int_distribution<> dis(0, sample_fl.size() - 1);

        for (unsigned i = 0; i < fl_sample_size; i++)
          m_fluent_temp[i] = sample_fl[dis(m_gen)];
        // for(unsigned i=0; i < fl_sample_size|| m_fsample_bset.size()
        // m_fsample_bset.set(sample_fl[dis(m_gen)]);

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
      /*
        void sample_freq( Fluent_Vec& fl, unsigned k, std::string option = "min" ) {
          //k = (fl.size()-k) > k ? k : (fl.size()-k);

          unsigned fl_sample_size = (unsigned)ceil(m_sample_factor*k*std::pow(fl.size(),1.0/k));
          fl_sample_size = fl_sample_size > k ? fl_sample_size : k+1;
          //unsigned fl_sample_size = k + (unsigned)ceil( (fl.size()*m_sample_factor)/k );
          //unsigned fl_sample_size = (unsigned)floor( std::pow( (k*m_sample_factor)/NORMAL_FACTOR, 1.0/k) );
          //unsigned fl_sample_size = (unsigned)floor( std::pow( (k*m_sample_factor)/(NORMAL_FACTOR*fl.size()), 1.0/k) );
          //std::cout << "FREQ " << m_sample_factor <<" " << fl_sample_size << " " << fl.size() <<  std::endl;
          m_fsample_bset.reset();
          if (fl_sample_size >= fl.size()){
            for(auto f : fl){
              m_fsample_bset.set(f);
            }
          }
          else{
            std::vector<std::pair<int, int>> vals_with_indices;
            //sort
            for ( size_t iter = 0; iter < fl.size(); iter++ ) {
              vals_with_indices.emplace_back(iter, fl[iter]);
            }
            if (option == "min")
              std::sort( vals_with_indices.begin(), vals_with_indices.end()
              , [](const std::pair<int,int> &x, const std::pair<int,int> &y)
                {return x.second < y.second; });
            else
              std::sort( vals_with_indices.begin(), vals_with_indices.end()
              , [](const std::pair<int,int> &x, const std::pair<int,int> &y)
                {return x.second > y.second; });

            for ( size_t iter = 0; iter<fl_sample_size && iter<fl.size(); iter++ ) {
              m_fsample_bset.set(fl[vals_with_indices[iter].first]);
            }
          }

          m_fluent_sample.clear();
          for( auto index : m_fsample_bset){
            if(m_fsample_bset.isset(index)){
              m_fluent_sample.push_back(index);
            }
          }
        }

        void sample_weighted( Fluent_Vec& fl, unsigned k, std::string option = "min" ) {
          //k = (fl.size()-k) > k ? k : (fl.size()-k);

          unsigned fl_sample_size = (unsigned)ceil(m_sample_factor*k*std::pow(fl.size(),1.0/k));
          fl_sample_size = fl_sample_size > k ? fl_sample_size : k+1;
          //unsigned fl_sample_size = k + (unsigned)ceil( (fl.size()*m_sample_factor)/k );
          //unsigned fl_sample_size = (unsigned)floor( std::pow( (k*m_sample_factor)/(NORMAL_FACTOR*fl.size()), 1.0/k) );
          //unsigned fl_sample_size = (unsigned)floor( std::pow( (k*m_sample_factor)/NORMAL_FACTOR, 1.0/k) );
          //std::cout << "WEIGHTED " << m_sample_factor <<" " << fl_sample_size << " " << fl.size() <<  std::endl;
          m_fsample_bset.reset();
          if (fl_sample_size >= fl.size()){
            for(auto f : fl){
              m_fsample_bset.set(f);
            }
          }
          else{

            std::vector<double> fl_weight;

            double sum = 0;
            for( auto p : fl )
              sum += m_fluent_freq[p];
            for( auto p : fl )
              fl_weight.push_back(1-m_fluent_freq[p]/sum);

            uniform_01<> dist;
            unsigned seed = std::chrono::system_clock::now().time_since_epoch().count();
            std::mt19937 gen(seed);
            std::vector<double> vals;
            for (auto iter : fl_weight) {
              vals.push_back(std::pow(dist(gen), 1.0 / iter));
            }

          //sort
            std::vector<std::pair<int, double>> valsWithIndices;
            for ( size_t iter = 0; iter < vals.size(); iter++ ) {
              valsWithIndices.emplace_back(iter, vals[iter]);
            }
            if( option.compare("min") == 0 )
              std::sort( valsWithIndices.begin(), valsWithIndices.end()
                , [](const std::pair<int,double> &x, const std::pair<int,double> &y)
                  {return x.second > y.second; });
            else
              std::sort( valsWithIndices.begin(), valsWithIndices.end()
                , [](const std::pair<int,double> &x, const std::pair<int,double> &y)
                  {return x.second < y.second; });

            for ( size_t iter=0; iter<fl_sample_size && iter<fl.size(); iter++ ) {
              m_fsample_bset.set(fl[valsWithIndices[iter].first]);
            }
          }

          m_fluent_sample.clear();
          for( auto index : m_fsample_bset){
            if(m_fsample_bset.isset(index)){
              m_fluent_sample.push_back(index);
            }
          }
        }

        void sample_stratified_rand( Fluent_Vec fl, std::vector<std::vector<unsigned>>& gp_v, int k )
        {

        }

        void sample_stratified_weighted( Fluent_Vec fl, std::vector<std::vector<unsigned>>& gp_v,
            std::vector<std::vector<double>>& weight_v, int k ){

        }
      */
      void opt_sort(unsigned *item, unsigned size)
      {
        unsigned temp;
        auto comp_swap = [&](unsigned i, unsigned j)
        {
          if (item[i] > item[j])
          {
            temp = item[i];
            item[i] = item[j];
            item[j] = temp;
          }
        };
        if (size == 2)
        {
          comp_swap(0, 1);
        }
        else if (size == 3)
        {
          (comp_swap(1, 2));
          (comp_swap(0, 2));
          (comp_swap(0, 1));
        }
        else if (size == 4)
        {
          (comp_swap(0, 1));
          (comp_swap(2, 3));
          (comp_swap(0, 2));
          (comp_swap(1, 3));
          (comp_swap(1, 2));
        }
        else if (size == 5)
        {
          (comp_swap(0, 1));
          (comp_swap(3, 4));
          (comp_swap(2, 4));
          (comp_swap(2, 3));
          (comp_swap(1, 4));
          (comp_swap(0, 3));
          (comp_swap(0, 2));
          (comp_swap(1, 3));
          (comp_swap(1, 2));
        }
        else
        {
          for (unsigned i = 1; i < size; i++)
          {
            if (item[i] < item[i - 1])
            {
              temp = item[i];
              unsigned j;
              for (j = i; (j > 0) && (temp < item[j - 1]); j--)
                item[j] = item[j - 1];
              item[j] = temp;
            }
          }
        }
      }

      bool sort_n_check_duplicate(unsigned *item, unsigned size)
      {
        if (size == 1)
          return false;
        unsigned temp;
        auto comp_swap = [&](unsigned i, unsigned j)
        {
          if (item[i] == item[j])
            return true;
          if (item[i] > item[j])
          {
            temp = item[i];
            item[i] = item[j];
            item[j] = temp;
          }
          return false;
        };
        if (size == 2)
        {
          return comp_swap(0, 1);
        }
        else if (size == 3)
        {
          if (comp_swap(1, 2))
            return true;
          if (comp_swap(0, 2))
            return true;
          if (comp_swap(0, 1))
            return true;
        }
        else if (size == 4)
        {
          if (comp_swap(0, 1))
            return true;
          if (comp_swap(2, 3))
            return true;
          if (comp_swap(0, 2))
            return true;
          if (comp_swap(1, 3))
            return true;
          if (comp_swap(1, 2))
            return true;
        }
        else if (size == 5)
        {
          if (comp_swap(0, 1))
            return true;
          if (comp_swap(3, 4))
            return true;
          if (comp_swap(2, 4))
            return true;
          if (comp_swap(2, 3))
            return true;
          if (comp_swap(1, 4))
            return true;
          if (comp_swap(0, 3))
            return true;
          if (comp_swap(0, 2))
            return true;
          if (comp_swap(1, 3))
            return true;
          if (comp_swap(1, 2))
            return true;
        }
        else
        {
          for (unsigned i = 1; i < size; i++)
          {
            if (item[i] < item[i - 1])
            {
              temp = item[i];
              unsigned j;
              for (j = i; (j > 0) && (temp < item[j - 1]); j--)
                item[j] = item[j - 1];
              item[j] = temp;
              if (j > 0 && item[j] == item[j - 1])
                return true;
            }
            else if (item[i] == item[i - 1])
              return true;
          }
        }
        return false;
      }
      bool check_duplicate(unsigned *tuple, unsigned arity)
      {

        if (arity <= 1)
        {
          return false;
        }
        else if (arity == 2)
        {
          return tuple[0] == tuple[1];
        }
        else if (arity == 3)
        {
          return tuple[0] == tuple[1] || tuple[1] == tuple[2] || tuple[0] == tuple[2];
        }
        else if (arity == 4)
        {
          return tuple[0] == tuple[1] || tuple[2] == tuple[3] || tuple[0] == tuple[2] || tuple[1] == tuple[3] || tuple[1] == tuple[2] || tuple[0] == tuple[3];
        }
        else if (arity == 5)
        {
          return tuple[0] == tuple[1] || tuple[2] == tuple[3] || tuple[0] == tuple[2] || tuple[1] == tuple[3] || tuple[1] == tuple[2] || tuple[0] == tuple[3] || tuple[0] == tuple[4] || tuple[1] == tuple[4] || tuple[2] == tuple[4] || tuple[3] == tuple[4];
        }
        else
        {
          for (unsigned i = 0; i < arity - 1; i++)
          {
            for (unsigned j = i + 1; j < arity; j++)
            {
              if (tuple[i] == tuple[j])
                return true;
            }
          }
          return false;
        }
      }

      /**
       * If can use add(op), the computation is F^i-1 aprox. FASTER!!!
       * if action == no_op (i.e. start action), the computation is F^i, SLOWER!!
       * where i ranges over 1 to max_arity
       */
      void compute(Search_Node *n, float &novelty)
      {
        novelty = (float)m_arity + 1;
        for (unsigned i = 1; i <= m_arity; i++)
        {
#ifdef DEBUG
          if (m_verbose)
            std::cout << "search node: " << n << std::endl;
#endif
          bool new_covers = n->action() == no_op ? cover_tuples(n, i) : cover_tuples_op(n, i);
          // bool new_covers = cover_tuples( n, i ) ;

#ifdef DEBUG
          if (m_verbose && !new_covers)
            std::cout << "\t \t PRUNE! search node: " << n << std::endl;
#endif
          if (new_covers)
            if (i < novelty)
              novelty = i;
        }
      }

      // Helper function for cover_tuple_op
      void process_tuple3_op(bool &new_covers, unsigned fl_sample_size,
                   Search_Node *n, unsigned arity)
      {
        for (Fluent_Vec::const_iterator it_add = m_add.begin();
           it_add != m_add.end(); it_add++)
        {
          for (unsigned i = 0; i < fl_sample_size; i++)
          {
            for (unsigned j = i + 1; j < fl_sample_size; j++)
            {
              unsigned *t_arr = m_tuple;
              unsigned temp;
              t_arr[0] = *it_add;
              t_arr[1] = m_fluent_sample[i];
              t_arr[2] = m_fluent_sample[j];
              if (t_arr[2] < t_arr[1])
              {
                t_arr[1] = t_arr[2];
                t_arr[2] = m_fluent_sample[i];
              }
              if (t_arr[2] < t_arr[0])
              {
                temp = t_arr[0];
                t_arr[0] = t_arr[2];
                t_arr[2] = temp;
              }
              if (t_arr[1] < t_arr[0])
              {
                temp = t_arr[0];
                t_arr[0] = t_arr[1];
                t_arr[1] = temp;
              }
              if (t_arr[0] == t_arr[1] || t_arr[1] == t_arr[2] ||
                t_arr[0] == t_arr[2])
                continue;

              m_num_id = t_arr[arity - 1];
              for (int t_idx = arity - 2; t_idx >= 0; t_idx--)
                m_num_id = (m_num_id * m_num_fluents) + t_arr[t_idx];

              m_nodes_3plus_tuples->computeIndexes(m_num_id, 1);
              bool new_tuple = m_nodes_3plus_tuples->checkIndexes();
              if (new_tuple)
              {
                m_nodes_3plus_tuples->setIndexes();
                new_covers = true;
              }
            }
          }
        }
      }

      void process_tuple3plus_op(bool &new_covers, unsigned fl_sample_size,
                     Search_Node *n, unsigned arity)
      {
        bool flag_start_loop = false;
        unsigned *idx = m_comb_idx;
        for (unsigned i = 0; i < arity; i++)
          idx[i] = i;
        auto gen_tuple_idx_x = [&]()
        {
          if (arity < 2 || idx[0] == fl_sample_size - arity + 1)
            return false;
          unsigned a = arity - 2;
          while (idx[a] == fl_sample_size - arity + 1 + a)
          {
            a--;
          }
          idx[a]++;
          while (++a < arity - 1)
          {
            idx[a] = idx[a - 1] + 1;
          }
          return true;
        };
        while (!flag_start_loop || gen_tuple_idx_x())
        {
          flag_start_loop = true;
          for (Fluent_Vec::const_iterator it_add = m_add.begin();
             it_add != m_add.end(); it_add++)
          {
            unsigned *t_arr = m_tuple;
            unsigned i = 0;
            while (i++ < arity - 1)
            {
              t_arr[i - 1] = m_fluent_sample[idx[i - 1]];
            }
            t_arr[arity - 1] = *it_add;
            if (sort_n_check_duplicate(t_arr, arity))
              continue;

            i = arity - 1;
            if (!m_overflow_enabled)
            {
              m_num_id = t_arr[arity - 1];
              while (i > 0)
              {
                m_num_id = (m_num_id * m_num_fluents) + t_arr[i - 1];
                i--;
              }
            }
            else
            {
              m_num_id = std::hash<unsigned>{}(t_arr[arity - 1]);
              while (i > 0)
              {
                m_num_id ^= std::hash<unsigned>{}(t_arr[i - 1]) +
                      0x9e3779b9ULL + (m_num_id << 6) + (m_num_id >> 2);
                i--;
              }
            }

            m_nodes_3plus_tuples->computeIndexes(m_num_id, 1);
            bool new_tuple = m_nodes_3plus_tuples->checkIndexes();
            if (new_tuple)
            {
              m_nodes_3plus_tuples->setIndexes();
              new_covers = true;
            }
          }
        }
      }

      /**
       * Instead of checking the whole state, checks the new atoms permutations only!
       */
      // Usage:
      // @Params:
      //
      // @Ouput:
      bool cover_tuples_op(Search_Node *n, unsigned arity)
      {

        const bool has_state = n->has_state();

        const Action *a = m_strips_model.actions()[n->action()];
        if (a->has_ceff())
        {
          static Fluent_Set new_atom_set(m_strips_model.num_fluents() + 1);
          new_atom_set.reset();
          m_add.clear();
          for (Fluent_Vec::const_iterator it = a->add_vec().begin(); it != a->add_vec().end(); it++)
          {
            if (new_atom_set.isset(*it))
              continue;

            m_add.push_back(*it);
            new_atom_set.set(*it);
          }
          for (unsigned i = 0; i < a->ceff_vec().size(); i++)
          {
            Conditional_Effect *ce = a->ceff_vec()[i];
            if (ce->can_be_applied_on(*(n->parent()->state())))
              for (Fluent_Vec::iterator it = ce->add_vec().begin(); it != ce->add_vec().end(); it++)
              {
                {
                  if (new_atom_set.isset(*it))
                    continue;

                  m_add.push_back(*it);
                  new_atom_set.set(*it);
                }
              }
          }
        }
        else
          m_add = a->add_vec();

        if (!has_state)
          n->parent()->state()->progress_lazy_state(m_strips_model.actions()[n->action()]);

        m_fluent_sample = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();

        // for( unsigned i = 0; i < fl.size(); i++ ){
        //     std::cout<< i << "HERE - " << fl[i] << std::endl;
        // }
        unsigned add_sample_size = std::min(m_fl_sample_size[arity - 1] / 2.0,
                          (double)m_add.size());

        unsigned fl_sample_size = (m_fl_sample_size[arity - 1] - add_sample_size) <
                          m_fluent_sample.size()
                        ? (m_fl_sample_size[arity - 1] - add_sample_size)
                        : m_fluent_sample.size();
        fl_sample_size = fl_sample_size < arity ? arity : fl_sample_size;
        if (m_sampling_strategy.compare("rand") == 0)
        {
          if (fl_sample_size < m_fluent_sample.size())
          {
            sample_rand_shuffle(m_fluent_sample, fl_sample_size);
          }
          // if(add_sample_size < m_add.size())
          //     sample_rand_shuffle(m_add, add_sample_size);
        }
        /*
        else if( m_sampling_strategy.compare("min_weighted") == 0 )
          sample_weighted(fl, arity);
        else if( m_sampling_strategy.compare("max_weighted") == 0 )
          sample_weighted(fl, arity, "max");
        else if( m_sampling_strategy.compare("min_freq") == 0 )
          sample_freq(fl, arity);
        else if( m_sampling_strategy.compare("max_freq") == 0 )
          sample_freq(fl, arity, "max");
        else{
          m_fluent_sample.clear();
          for ( size_t iter = 0; iter<fl.size(); iter++ ) {
            m_fluent_sample.push_back(fl[iter]);
          }
        }
        */

        bool new_covers = false;
        // bool new_covers_check = false;

        assert(arity > 0);

        // std::vector<unsigned> tuple( arity );

        if (arity == 1)
        {
          for (Fluent_Vec::const_iterator it_add = m_add.begin();
             it_add != m_add.end(); it_add++)
          {
            if (!m_nodes_12_tuples[*it_add])
            {
              m_nodes_12_tuples[*it_add] = true;
              new_covers = true;
#ifdef DEBUG
              if (m_verbose)
              {
                std::cout << "\t NEW!! : ";
                for (unsigned i = 0; i < arity; i++)
                {
                  std::cout << m_strips_model.fluents()[*it_add]->signature() << "  ";
                }
                std::cout << std::endl;
              }
#endif
            }
          }
        }
        else if (arity == 2)
        {
          for (Fluent_Vec::const_iterator it_add = m_add.begin();
             it_add != m_add.end(); it_add++)
          {
            for (unsigned i = 0; i < fl_sample_size; i++)
            {
              unsigned min = *it_add;
              unsigned max = m_fluent_sample[i];
              if (max < min)
              {
                min = max;
                max = *it_add;
              }
              if (min == max)
                continue;
              m_num_id = min + max * m_num_fluents;
              if (!m_nodes_12_tuples[m_num_id])
              {
                m_nodes_12_tuples[m_num_id] = true;
                new_covers = true;
              }
            }
          }
        }
        else if (arity == 3)
        {
          process_tuple3_op(new_covers, fl_sample_size, n, arity);
        }
        else
        {
          process_tuple3plus_op(new_covers, fl_sample_size, n, arity);
        }

        if (!has_state)
          n->parent()->state()->regress_lazy_state(m_strips_model.actions()[n->action()]);

        return new_covers;
      }

      // Usage:
      // @Params:
      //
      // @Ouput:
      bool cover_tuples(Search_Node *n, unsigned arity)
      {
        const bool has_state = n->has_state();

        if (!has_state)
          n->parent()->state()->progress_lazy_state(m_strips_model.actions()[n->action()]);

        m_fluent_sample = has_state ? n->state()->fluent_vec() : n->parent()->state()->fluent_vec();

        unsigned fl_sample_size = m_fl_sample_size[arity - 1] < m_fluent_sample.size() ? m_fl_sample_size[arity - 1] : m_fluent_sample.size();

        if (m_sampling_strategy.compare("rand") == 0)
        {
          if (fl_sample_size < m_fluent_sample.size())
          {
            sample_rand_shuffle(m_fluent_sample, fl_sample_size);
          }
        }
        /*
        else if( m_sampling_strategy.compare("min_weighted") == 0 )
          sample_weighted(fl, arity);
        else if( m_sampling_strategy.compare("max_weighted") == 0 )
          sample_weighted(fl, arity, "max");
        else if( m_sampling_strategy.compare("min_freq") == 0 )
          sample_freq(fl, arity);
        else if( m_sampling_strategy.compare("max_freq") == 0 )
          sample_freq(fl, arity, "max");
        else{
          m_fluent_sample.clear();
          for ( size_t iter = 0; iter<fl.size(); iter++ ) {
            m_fluent_sample.push_back(fl[iter]);
          }
        }
        */
        bool new_covers = false;

#ifdef DEBUG
        if (m_verbose)
          std::cout << n << " covers: " << std::endl;
#endif
        if (arity == 1)
        {
          for (unsigned i = 0; i < fl_sample_size; i++)
          {
            if (!m_nodes_12_tuples[m_fluent_sample[i]])
            {
              m_nodes_12_tuples[m_fluent_sample[i]] = true;
              new_covers = true;
            }
          }
        }
        else if (arity == 2)
        {
          for (unsigned i = 0; i < fl_sample_size; i++)
          {
            for (unsigned j = i + 1; j < fl_sample_size; j++)
            {
              unsigned min = m_fluent_sample[i];
              unsigned max = m_fluent_sample[j];
              if (max < min)
              {
                min = max;
                max = m_fluent_sample[i];
              }
              if (min == max)
                continue;
              m_num_id = min + max * m_num_fluents;
              if (!m_nodes_12_tuples[m_num_id])
              {
                m_nodes_12_tuples[m_num_id] = true;
                new_covers = true;
              }
            }
          }
        }
        else if (arity == 3)
        {
          process_tuple3(new_covers, fl_sample_size, n, arity);
        }
        else if (arity > 3)
        {
          process_tuple3plus(new_covers, fl_sample_size, n, arity);
        }

        if (!has_state)
          n->parent()->state()->regress_lazy_state(
            m_strips_model.actions()[n->action()]);

        return new_covers;
      }

      void process_tuple3(bool &new_covers, unsigned fl_sample_size,
                Search_Node *n, unsigned arity)
      {
        for (unsigned i = 0; i < fl_sample_size; i++)
        {
          for (unsigned j = i + 1; j < fl_sample_size; j++)
          {
            for (unsigned k = j + 1; k < fl_sample_size; k++)
            {
              unsigned *t_arr = m_tuple;
              t_arr[0] = m_fluent_sample[i];
              t_arr[1] = m_fluent_sample[j];
              t_arr[2] = m_fluent_sample[k];
              unsigned temp;
              if (t_arr[2] < t_arr[1])
              {
                t_arr[1] = t_arr[2];
                t_arr[2] = m_fluent_sample[j];
              }
              if (t_arr[2] < t_arr[0])
              {
                temp = t_arr[0];
                t_arr[0] = t_arr[2];
                t_arr[2] = temp;
              }
              if (t_arr[1] < t_arr[0])
              {
                temp = t_arr[0];
                t_arr[0] = t_arr[1];
                t_arr[1] = temp;
              }
              if (t_arr[0] == t_arr[1] || t_arr[1] == t_arr[2] ||
                t_arr[0] == t_arr[2])
                continue;
              m_num_id = t_arr[arity - 1];
              for (int t_idx = arity - 2; t_idx >= 0; t_idx--)
                m_num_id = (m_num_id * m_num_fluents) + t_arr[t_idx];
              m_nodes_3plus_tuples->computeIndexes(m_num_id, 1);
              bool new_tuple = m_nodes_3plus_tuples->checkIndexes();
              if (new_tuple)
              {
                m_nodes_3plus_tuples->setIndexes();
                new_covers = true;
              }
            }
          }
        }
      }

      void process_tuple3plus(bool &new_covers, unsigned fl_sample_size,
                  Search_Node *n, unsigned arity)
      {
        bool flag_start_loop = false;
        unsigned *idx = m_comb_idx;
        for (unsigned i = 0; i < arity; i++)
          idx[i] = i;

        auto gen_tuple_idx_x = [&]()
        {
          if (idx[0] == fl_sample_size - arity)
            return false;

          unsigned a = arity - 1;
          while (idx[a] == fl_sample_size - arity + a)
          {
            a--;
          }
          idx[a]++;
          while (++a < arity)
          {
            idx[a] = idx[a - 1] + 1;
          }
          return true;
        };

        while (!flag_start_loop || gen_tuple_idx_x())
        {
          flag_start_loop = true;
          unsigned *t_arr = m_tuple;
          unsigned i = 0;
          while (i++ < arity)
            t_arr[i - 1] = m_fluent_sample[idx[i - 1]];
          if (sort_n_check_duplicate(t_arr, arity))
            continue;

          i = arity - 1;
          if (!m_overflow_enabled)
          {
            m_num_id = t_arr[arity - 1];
            while (i > 0)
            {
              m_num_id = (m_num_id * m_num_fluents) + t_arr[i - 1];
              i--;
            }
          }
          else
          {
            m_num_id = std::hash<unsigned>{}(t_arr[arity - 1]);
            while (i > 0)
            {
              m_num_id ^= std::hash<unsigned>{}(t_arr[i - 1]) +
                    0x9e3779b9ULL + (m_num_id << 6) + (m_num_id >> 2);
              i--;
            }
          }
          m_nodes_3plus_tuples->computeIndexes(m_num_id, 1);
          bool new_tuple = m_nodes_3plus_tuples->checkIndexes();
          if (new_tuple)
          {
            m_nodes_3plus_tuples->setIndexes();
            new_covers = true;
          }
        }
      }

      const STRIPS_Problem &m_strips_model;
      std::vector<bool> m_nodes_12_tuples;
      BloomFilter *m_nodes_3plus_tuples;
      unsigned m_arity;
      unsigned m_num_fluents;
      unsigned m_max_memory_size_MB;
      bool m_verbose;
      // bool                            m_check_false_positives;
      // unsigned                        m_num_false_positives;
      // unsigned                        m_num_false_novelties;
      // std::vector<double>             m_fluent_weight;
      // std::vector<std::pair<int, int>>    m_vals_with_indices;
      // std::vector<double>                 m_sample_wf;
      std::string m_sampling_strategy;
      float m_sample_factor;
      std::vector<unsigned> m_fluent_temp;
      Fluent_Vec m_fluent_sample;
      Fluent_Vec m_add;
      std::vector<unsigned> m_fl_sample_size; // from 0 to m_arity-1
      unsigned long long m_num_id;
      boost::mt11213b m_gen;
      unsigned m_rand_seed;
      unsigned m_min_k4sample;
      unsigned *m_comb_idx;
      unsigned *m_tuple;
      bool m_overflow_enabled;
      // std::ranlux48_base m_gen;
      // std::mt19937_64 m_gen;
    };

  }

}

#endif // novelty.hxx
