// Copyright 2012 Ethan Burns. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.
#ifndef _SEARCH_HPP_
#define _SEARCH_HPP_

#include <vector>
#include <hashtbl.hxx>

// A Edge holds information about an edge in the
// search graph, i.e., the cost, operator and successor.
template<class D> struct Edge {
	Edge(int c, int o,  int po) : op(o), pop(po), cost(c) { }

	int op;	// The operator that generated this node.
	int pop;	// The operator that would re-generate the parent.
	int cost;	// The cost of the edge.

	typename D::State kid;
	typename D::Undo undo;
};

// SearchAlg defines the common interface to all search
// algorithms.
template<class D> struct SearchAlg {

	// SearchAlg constructs a new search algorithm that
	// searches in the given domain.
	SearchAlg(D &d) : dom(d), expd(0), gend(0) { }

	// search searches for a goal from the initial state
	// The return value is the path to the goal which can
	// be empty if the goal was no found.
	virtual std::vector<typename D::State> search(typename D::State&) = 0;

	// dom is the domain over which this search is defined.
	D &dom;

	// expd and gend are the number of states that have been
	// expanded and generated respectively.
	unsigned long expd, gend;
};

#endif	// _SEARCH_HPP_
