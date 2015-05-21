// Copyright 2012 Ethan Burns. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.
#include <search.hxx>

template<class D> class Idastar : public SearchAlg<D> {
	std::vector<typename D::State> path;
	int bound, minoob;

public:

	Idastar(D &d) : SearchAlg<D>(d) { }

	virtual std::vector<typename D::State> search(typename D::State &root) {
		bound = this->dom.h(root);

		dfrowhdr(stdout, "iteration", 4, "number", "bound",
			"nodes expanded", "nodes generated");
		unsigned int n = 0;
		do {
			minoob = -1;
			dfs(root, 0, -1);
			n++;
			dfrow(stdout, "iteration", "uduu", (unsigned long) n, (long) bound,
				this->expd, this->gend);
			bound = minoob;
		} while (path.size() == 0);

		return path;
	}

private:

	bool dfs(typename D::State &n,  int cost, int pop) {
		int f = cost + this->dom.h(n);

		if (f <= bound && this->dom.isgoal(n)) {
			path.push_back(n);
			return true;
		}

		if (f > bound) {
			if (minoob < 0 || f < minoob)
				minoob = f;
			return false;
		}

		this->expd++;
		int nops = this->dom.nops(n);
		for (int i = 0; i < nops; i++) {
			int op = this->dom.nthop(n, i);
			if (op == pop)
				continue;

			this->gend++;
			Edge<D> e = this->dom.apply(n, op);
			bool goal = dfs(n, e.cost + cost, e.pop);
			this->dom.undo(n, e);
			if (goal) {
				path.push_back(n);
				return true;
			}
		}

		return false;
	}
};
