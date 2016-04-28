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

#pragma once

#include <limits>
#include <utility>
#include <cmath>

#define infty std::numeric_limits<float>::infinity()

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

inline bool dgreater( float f1, float f2 ) {
	return ((f1 - f2) > THRESHOLD);
}

inline bool dgeq( float f1, float f2 ) {
	return dgreater(f1,f2) || dequal(f1,f2);
}

inline bool dleq( float f1, float f2 ) {
	return dless(f1,f2) || dequal(f1,f2);
}


template <typename T>
T pow( T a, unsigned b )
{
        T result = 1;
        while (b){
                if (b & 1)
                        result *= a;
                b >>= 1;
                a *= a;
        }
        return result;
}

}
