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
