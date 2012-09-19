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

#ifndef __STRING_CONVERSIONS__
#define __STRING_CONVERSIONS__

#include <string>
#include <vector>
#include <iostream>
#include <sstream>

namespace aptk
{

template <class T>
std::string to_string( T& value, std::ios_base& (*converter)( std::ios_base& ) )
{
	std::stringstream ss;
	ss << converter << value;
	return ss.str();
}

template <class T>
bool from_string( T& value, const std::string& s, std::ios_base& (*converter)( std::ios_base& ) )
{
	std::istringstream iss( s );
	return !(iss >> converter >> value).fail();
}

}

#endif // Utils.hxx
