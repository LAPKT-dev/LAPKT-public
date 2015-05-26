#include <tuples.hxx>
#include <iostream>

namespace aptk 
{

	ValuesTuple::ValuesTuple() {
	}

	ValuesTuple::ValuesTuple( size_t sz, bool preallocate ) {
		if (preallocate )
			elements.resize( sz );
		else
			elements.reserve( sz );
	}

	ValuesTuple::ValuesTuple( const ValuesTuple& other ) {
		elements = other.elements;
	}

	ValuesTuple::ValuesTuple( ValuesTuple&& other ) {
		elements = std::move( other.elements );
	}

	ValuesTuple::~ValuesTuple() {
	}

	std::ostream&
	operator<<( std::ostream& stream, const ValuesTuple& t ) {
		stream << "[";
		for ( const ValuesTuple::Entry& e : t.elements )
			stream << "(" << e.x << "," << e.v << ")";
		stream << "]";
		return stream; 
	}

	ValuesTupleIterator::ValuesTupleIterator( const std::vector<VariableIndex>& X, const std::vector<ValueIndex>& v, size_t sz )
	: vars(X), values(v), tuple_sz(sz), count(0) {
		assert( vars.size() >= tuple_sz );
		offsets.resize( tuple_sz );
		index.resize( tuple_sz );
		for ( unsigned k = 0; k < tuple_sz; k++ ) {
			offsets[k] = k;	
			index[k] = offsets[k];
		}
	}


	ValuesTupleIterator::~ValuesTupleIterator() {
	}
}
