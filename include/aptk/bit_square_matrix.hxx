#ifndef __BIT_SQUARE_MATRIX__
#define __BIT_SQUARE_MATRIX__

#include <aptk/bit_array.hxx>

namespace aptk
{

class Bit_Square_Matrix
{
public:

	Bit_Square_Matrix()
		: m_data(NULL), m_N( 0 )
	{
	}
	
	Bit_Square_Matrix( unsigned N )
		: m_data(NULL), m_N( N )
	{
		resize( m_N*m_N );
	}

	Bit_Square_Matrix( Bit_Square_Matrix& other )
	{
		m_N = other.m_N;
		m_data = new Bit_Array( *(other.m_data) );
	}
	
	~Bit_Square_Matrix()
	{
		if ( m_data ) delete m_data;
	}

	void set_dim( unsigned N )
	{
		m_N = N;
	}
	
	void set( unsigned i, unsigned j )
	{
		m_data->set( i*m_N+j );
	}
	
	void unset( unsigned i, unsigned j )
	{
		m_data->unset( i*m_N+j);
	}

	unsigned isset( unsigned i, unsigned j )
	{
		return m_data->isset( i*m_N+j );
	}


	void resize( unsigned sz )
	{
		m_data = new Bit_Array(sz);
		m_data->reset();
	}
	
protected:
	Bit_Array*   m_data;
	unsigned     m_N;
};

}
#endif // square_matrix.hxx
