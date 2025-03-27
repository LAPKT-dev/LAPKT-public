/**
 * @file bloomfilter.hxx
 * @author Anubhav Singh (anubhav.singh.er@pm.me)
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

#ifndef __BLOOM_FILTER__
#define __BLOOM_FILTER__

// #include<bitset>
// #include<aptk/jenkins_12bit.hxx>
// #include <boost/functional/hash.hpp>
// #include <hash_functions.hxx>

#include <ostream>

namespace aptk
{

  namespace agnostic
  {

    //---- Bounds on the Bloom-Filter parameters ----//

#define SEED 5701
// Maximum size of the Bloom-Filter
// #define MAX_SIZE 2147483647 //2048MB
#define MAX_SIZE 4294967296ULL // 2^32
// #define MAX_SIZE  34359738368// = 4GB in case of bool vector(specialized-storage)

// Lower bound on the probability of false-positives
// #define P_CONST 0.01 // 1%
#define P_CONST 0.5

// Number of distinct elements
#define NUM_ELEMENTS 220000000 // 224044921 (224 Million)

// Maximum number of hash functions
#define MAX_K 50
#define MIN_K 1

    class BloomFilter
    {
    public:
      /*
       * N - Number of different items expected to be inserted
       * P - Desired probability of collision(Lower means higher bloomfilter size)
       */
      BloomFilter(unsigned bf_size, unsigned num_dist_items,
                  unsigned long long max_size = MAX_SIZE, double probability = P_CONST) : _P(probability), _M(max_size), _N(bf_size), m_bloom_size(0), _log_b2_M(0)
      {
        _M = _N;
        //_M = (unsigned long long)(std::ceil(((double)_N * std::log( _P )) / std::log(
        //                1.0 / ( std::pow( 2.0, std::log( 2.0 ))))));
        _K = std::min((unsigned)MAX_K, std::max((unsigned)MIN_K,
                                                unsigned(std::round(std::log(2.0) * double(_M) /
                                                                    double(num_dist_items)))));

        // Find next next power of 2
        unsigned ull_bits = sizeof(unsigned long long) * CHAR_BIT;
        _M--;
        for (unsigned i = 0; std::pow(2, i) < ull_bits; i++)
        {
          _M |= _M >> (unsigned)std::pow(2, i);
        }
        _M++;
        _M = _M == 0 ? (unsigned long long)MAX_SIZE : _M; // If exceeds ULL bounds

        _M = std::min(_M, (unsigned long long)MAX_SIZE);

        // Compute number of log base 2 of _M
        unsigned v = _M;
        while (v >>= 1) // unroll for more speed...
        {
          _log_b2_M++;
        }
        // Setup bitset of size _M
        _bitset = std::vector<bool>(_M, false);
#ifdef DEBUG
        std::cout << "Bloom-Filter details : " << std::endl;
        std::cout << "Num-Elements : " << _N << " Size-Bloom : " << _M
                  << " Num-hash_functions : " << _K << " log2(_M) = " << _log_b2_M << std::endl;
#endif
      }

      // Setup Bloomfilter params from the class creating Bloom object
      BloomFilter(unsigned M, unsigned N, int K) : _M(M), _N(N), _K(K), m_bloom_size(0)
      {
        _bitset = std::vector<bool>(_M, false);
      }

      // Destructor
      ~BloomFilter() {}

      // Usage:   Compute the k-indexes for an input value by hashing
      void computeIndexes(unsigned long long &num, unsigned size, unsigned offset = SEED)
      {
        unsigned hash = offset; // size of an integer
        for (unsigned i = 0; i < _K; i++)
        {
          hash_n(num, size, hash);
          _indexes[i] = hash;
        }
      }

      void hash_n(unsigned long long &item_arr, unsigned count, unsigned &hash)
      {

        // for( unsigned j=0; j < count; j++)
        //     hash = hash*4973 + *item_arr++;

        // hash = jenkins_hash( (ub1*)boost::lexical_cast<std::string>(item_arr).c_str(),
        //         count*sizeof(unsigned), hash );

        // boost::hash_combine(hash, FNV1A_Pippip_Yurii((char*)item_arr,
        //             count*sizeof(unsigned)));

        // hash = SuperFastHash(boost::lexical_cast<std::string>(item_arr).c_str(),
        //         count*sizeof(unsigned), hash );

        // std::hash for ULL, with Bithack trick for modulo operation
        hash = hash * 4973 + item_arr;
        hash = (unsigned)(std::hash<unsigned>{}(hash) &
                          ((1ULL << _log_b2_M) - 1));
        // hash = hash & ((1ULL<<_log_b2_M) - 1);
      }

      /*
      inline unsigned  tuple2idx_size2( unsigned* indexes, unsigned arity) const
      {
        return indexes[0] + indexes[1]*_iw2_spec_jumpsize;
      }
      */

      // Usage:   verify if any of the indexes populated by computeIndexes method
      //          has not been set before.
      // @Params: None
      // @Ouput:  Boolean - True or False
      bool checkIndexes()
      {
        for (unsigned i = 0; i < _K; i++)
        {
          if (!_bitset[_indexes[i]])
          {
            return true; // not in the set
          }
        }
        return false; // probably in the set
      }

      // For reporting - analysis
      float bloom_fillratio()
      {
        return (float)m_bloom_size / _bitset.size();
      }

      double probFalsePositives(int N, int M, int K)
      {
        // Probability a bit is not set to 1 in M-sized vector
        double pn1 = (1.0 - (1.0 / double(M)));
        // Probability of 0 for K hash functions and N elements
        double p0 = pow(pn1, double(N * K));
        // Probability of 1 for K hash functions and N elements
        double p1 = 1 - p0;
        // Probability of all ones
        double all1 = pow(p1, double(K)); // approx ( 1 - e^( (-KN) / M ) )^K
        // If all are ones, then new elements will be declared as already inserted
        // so this is the approximate probability of false positive
        return all1;
      }

      // Usage: Reset all the _bitset values to False
      // @Params: none
      // @Ouput:  none
      void reset()
      {
        _bitset.clear();
        _bitset.resize(_M, false);
      }

      // Usage:   set the value of _bitset to True, for each index populated by
      //          computeIndexes method
      // @Params: none
      //
      // @Ouput:  none
      void setIndexes()
      {
        for (unsigned i = 0; i < _K; i++)
        {
          _bitset[_indexes[i]] = true;
          // UNCOMMENT TO TRACK BLOOMFILTER FILL %
          //  if (!_bitset[ _indexes[i] ]){
          //      _bitset[ _indexes[i] ] = true;
          //      m_bloom_size++;
          //  }
        }
      }

    private:
      double _P;                 // error probability (collision probability)
      unsigned long long _M;     // number of bits in a vector (size of bloom filter)
      unsigned _N;               // number of different items/elements (combinations)
      unsigned _K;               // number of hash functions
      std::vector<bool> _bitset; // set of boolean variables
      unsigned _indexes[MAX_K];  // vector of indexes from last computation
      unsigned m_bloom_size;
      unsigned _log_b2_M; // 2^_log_b2_M = _M

    }; // Class BloomFilter

  } // namespace agnostic

} // name space aptk
#endif
