#ifndef __EXT_MATH__
#define __EXT_MATH__

#include <limits>
#include <utility>
#include <math.h>

namespace aptk
{

template <typename T>
T add( T a, T b )
{
        static const T inf = std::numeric_limits<T>::max();
        return ( a==inf || b==inf ? inf : a+b );
}

template <typename T>
T abs_add( T a, T b )
{
	return ( a == std::numeric_limits<T>::max() ? std::numeric_limits<T>::max() : ( b == std::numeric_limits<T>::max() ? std::numeric_limits<T>::max() : a + b) );
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



}

#endif // ext_math.hxx
