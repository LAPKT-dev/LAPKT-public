#ifndef __MATH_UTILITY__
#define __MATH_UTILITY__
// method to compute factorial
//
inline size_t fact_uint(unsigned n)
{
    size_t res = 1;
    for (unsigned i = 2; i <= n; i++)
        res = res * i;
    return res;
}

#endif
