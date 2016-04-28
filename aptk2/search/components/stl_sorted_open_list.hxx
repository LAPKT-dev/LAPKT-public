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

#include <vector>
#include <cassert>
#include <functional>
#include <queue>

#include <aptk2/search/interfaces/open_list.hxx>
#include <aptk2/search/components/stl_unordered_map_closed_list.hxx>

namespace aptk {

//! An adapter to compare proper nodes in the open list, not pointers.
template <typename T>
struct StlNodePointerAdapter {
	bool operator()( const T& p1, const T& p2 ) const { return *p1 > *p2 ; }
};


template <typename NodeType,
          typename Heuristic,
          typename Container = std::vector< std::shared_ptr< NodeType > >,
          typename Comparer = StlNodePointerAdapter< std::shared_ptr< NodeType > > >

class StlSortedOpenList : public OpenList<NodeType, std::priority_queue<std::shared_ptr<NodeType>, Container, Comparer>>
{
public:
	typedef std::shared_ptr<NodeType> NodePtrType;

protected:
	//! A binary predicate to decide when we need to update an already existing entry on Open
	struct ReplaceWhen {
		bool operator()( const NodeType& node_to_be_inserted, const NodeType& node_already_inserted ) const {
			return node_to_be_inserted.g < node_already_inserted.g;
		}
	};

	//! An update operator to replace one node by another with less g.
	struct ReplaceOperation {
		void operator()(NodePtrType replacee, NodePtrType replaced) const {
			//@TODO: Very important: updating g is correct provided that
			// the order of the nodes in the open list is not changed by
			// updating it. This is an open problem with the design,
			// and a more definitive solution needs to be found (soon).
			replaced->g = replacee->g;
			replaced->parent = replacee->parent;
		}
	};
	
public:
	//! The constructor of a sorted open list needs to specify the heuristic to sort the nodes with
	StlSortedOpenList(Heuristic* heuristic, bool delayed)
		: heuristic_(heuristic), delayed_(delayed)
	{}
	virtual ~StlSortedOpenList() = default;
	
	// Disallow copy, but allow move
	StlSortedOpenList(const StlSortedOpenList& other) = delete;
	StlSortedOpenList(StlSortedOpenList&& other) = default;
	StlSortedOpenList& operator=(const StlSortedOpenList& rhs) = delete;
	StlSortedOpenList& operator=(StlSortedOpenList&& rhs) = default;

	virtual void insert( NodePtrType node ) override {
		// Check whether there is n' in the open list 
		// such that state(n) == state(n').
		// If it is the case, we just need to replace the
		// entry on the hash table if g(n) < g(n')

		if ( already_in_open_.update(node, ReplaceWhen(), ReplaceOperation() ) )
			return;

		// If using delayed evaluation, set the heuristic value to that of the parent; otherwise, compute it anew.
		if (delayed_) {
			node->inherit_heuristic_estimate();
		} else {
			node->evaluate_with(*heuristic_);
		}
		
		if ( node->dead_end() ) return;
		this->push( node );
		already_in_open_.put( node );
	}

	virtual NodePtrType get_next() override {
		assert( !is_empty() );
		NodePtrType node = this->top();
		this->pop();
		already_in_open_.remove(*node);
		
		if (delayed_) { // If using delayed evaluation, we update the heuristic value of the node before returning it.
			node->evaluate_with(*heuristic_);
		}
		
		return node;
	}

	virtual bool is_empty() const override {
		return this->empty();
	}

	//! The heuristic we'll use to sort the nodes
	Heuristic* heuristic_;
	
	//! Whether to use delayed evaluation or not
	bool delayed_;
	
	//! A list of nodes which are already in the open list
	StlUnorderedMapClosedList< NodeType > already_in_open_;
};

}
