
/*
Lightweight Automated Planning Toolkit
Copyright (C) 2015

<contributors>
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
</contributors>

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

#include <aptk2/search/interfaces/open_list.hxx>


namespace aptk {
	
	template < typename NodeType, typename EvaluatorT>
	class StlUnsortedFIFOTest : public StlUnsortedFIFO<NodeType> {
	protected:
		//! The evaluator object, which is required to have a single method 'bool accept(NodeType)'
		std::shared_ptr<EvaluatorT> _evaluator;

	public:
		typedef std::shared_ptr<NodeType>	NodePtrType;

		StlUnsortedFIFOTest(std::shared_ptr<EvaluatorT> evaluator = nullptr) 
			: _evaluator(evaluator)
		{}

		virtual	void 	insert( NodePtrType n ) {
			if (_evaluator && _evaluator->accept(n->state)) {
				this->push_back( n );
			}
		}

	};

}
