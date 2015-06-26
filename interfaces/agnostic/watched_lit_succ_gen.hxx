/*
Lightweight Automated Planning Toolkit
Copyright (C) 2015
Toby Davies <tobyodavies@gmail.com>
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>

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

#ifndef WATCHED_LIT_SUCC_GEN_HXX
#define WATCHED_LIT_SUCC_GEN_HXX

#include <vector>

namespace aptk {

class STRIPS_Problem;
class State;


class WatchedLitSuccGen {
	STRIPS_Problem& prob;
	std::vector< std::vector<unsigned> > watchers;

    public:

    WatchedLitSuccGen(STRIPS_Problem& prob): prob(prob), watchers() {
		init();
	}

	void init();
	
	const std::vector<unsigned>& operator[](unsigned f) const{
		return watchers[f];
	}

	struct iterator {
		const WatchedLitSuccGen& w;
		const State& s;
		unsigned s_offset;
		unsigned w_offset;

		iterator(const WatchedLitSuccGen& w, const State& s, unsigned s_offset = 0)
			: w(w), s(s), s_offset(0), w_offset(0){ if(!finished() && !applicable()) ++*this; }

		iterator& operator++();
		
		inline unsigned operator*() const{
			return w[current_f()][w_offset];
		}

		bool finished() const;
	protected:
		unsigned current_f() const; 
		bool applicable() const;
	};

	iterator applicable_actions(const aptk::State& s) const {
		return iterator(*this, s);
	}

	void applicable_actions(const State& s, std::vector<int>& actions) const;

};
}
#endif
