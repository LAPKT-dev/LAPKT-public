// Copyright 2012 Ethan Burns. All rights reserved.
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file.
#ifndef _POOL_HXX_
#define _POOL_HXX_

#include <vector>
#include <cstdlib>

template <class Obj> class Pool {
public:

	Pool(unsigned int sz = 1024) : blksz(sz), nxt(0), freed(0) {
		newblk();
	}

	~Pool(void) {
		for (unsigned int i = 0; i < blks.size(); i++)
			delete[] blks[i];
	}

	Obj *get(void) {
		if (freed) {
			Ent *res = freed;
			freed = freed->nxt;
			return (Obj*) res->bytes;
		}

		if (nxt == blksz)
			newblk();

		return (Obj*) blks.back()[nxt++].bytes;
	}

	void put(Obj *o) {
		Ent *e = (Ent*) o;
		e->nxt = freed;
		freed = e;
	}

	Obj *construct(void) {
		Obj *o = get();
		return new (o) Obj();
	}

	void destruct(Obj *o) {
		o->~Obj();
		put(o);
	}

private:

	void newblk(void) {
		Ent *blk = new Ent[blksz];
		blks.push_back(blk);
		nxt = 0;
	}

	union Ent {
		char bytes[sizeof(Obj)];
		Ent *nxt;
	};

	unsigned int blksz, nxt;
	Ent *freed;
	std::vector<Ent*> blks;
};

#endif	// _POOL_HXX_
