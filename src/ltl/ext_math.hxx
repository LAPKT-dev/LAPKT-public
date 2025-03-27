
/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

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

#ifndef __EXT_MATH__
#define __EXT_MATH__

#include <limits>
#include <utility>
#include <math.h>

namespace aptk
{

        template <typename T>
        T add(T a, T b)
        {
                static const T inf = std::numeric_limits<T>::max();
                return (a == inf || b == inf ? inf : a + b);
        }

        template <typename T>
        T abs_add(T a, T b)
        {
                return (a == std::numeric_limits<T>::max() ? std::numeric_limits<T>::max() : (b == std::numeric_limits<T>::max() ? std::numeric_limits<T>::max() : a + b));
        }

#define THRESHOLD 1e-04

        inline bool dless(float f1, float f2)
        {

                return ((f2 - f1) > THRESHOLD);
        }

        inline bool dequal(float f1, float f2)
        {

                return ((fabs(f2 - f1)) < THRESHOLD);
        }

        template <typename T>
        T pow(T a, unsigned b)
        {
                T result = 1;
                while (b)
                {
                        if (b & 1)
                                result *= a;
                        b >>= 1;
                        a *= a;
                }
                return result;
        }
        inline size_t unrolled_pow_z(size_t n, unsigned k)
        {
                switch (k)
                {
                case 0:
                        return 1;
                case 1:
                        return n;
                case 2:
                        return n * n;
                case 3:
                        return n * n * n;
                case 4:
                        return n * n * n * n;
                case 5:
                        return n * n * n * n * n;
                };
                // MRJ: Fallback
                return aptk::pow(n, k);
        }

        inline unsigned unrolled_pow(unsigned n, unsigned k)
        {
                switch (k)
                {
                case 0:
                        return 1;
                case 1:
                        return n;
                case 2:
                        return n * n;
                case 3:
                        return n * n * n;
                case 4:
                        return n * n * n * n;
                case 5:
                        return n * n * n * n * n;
                };
                // MRJ: Fallback
                return aptk::pow(n, k);
        }

#ifndef no_such_index
#define no_such_index std::numeric_limits<unsigned>::max()
#endif

#ifndef int_infty
#define int_infty std::numeric_limits<int>::max()
#endif

#ifndef infty
#define infty std::numeric_limits<float>::max()
#endif

}

#endif // ext_math.hxx
