#ifndef FUNCTION_HXX
#define FUNCTION_HXX

#include <string>

namespace aptk
{


class Function
{
public:
    Function(unsigned index, std::string & signature);
    void		set_index( unsigned idx );
    void		set_signature( std::string signature );
    unsigned		index() const;
    std::string	signature() const;

protected:
    unsigned			m_index;
    std::string			m_signature;
};


inline unsigned		Function::index() const
{
    return m_index;
}

inline	std::string	Function::signature() const
{
    return m_signature;
}

inline void	Function::set_index( unsigned idx )
{
    m_index = idx;
}

inline void	Function::set_signature( std::string sig )
{
    m_signature = sig;
}

}


#endif // FUNCTION_HXX
