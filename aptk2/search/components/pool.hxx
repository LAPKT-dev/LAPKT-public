/*
Lightweight Automated Planning Toolkit (LAPKT)
Copyright (C) 2015

<contributors>
Miquel Ramirez <miquel.ramirez@gmail.com>
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

Portions of this code:

Copyright 2012 Ethan Burns. All rights reserved.
*/

#pragma once

#include <vector>
#include <cstdlib>

namespace aptk {

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
	
}
