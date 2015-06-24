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

#include <vector>

#include <strips_prob.hxx>
#include <action.hxx>
#include <strips_state.hxx>
#include <fwd_search_prob.hxx>

namespace aptk {

using	aptk::STRIPS_Problem;
using	aptk::State;
using	aptk::Action;
using	aptk::Action_Idx;

class WatchedLitSuccGen {
	STRIPS_Problem& prob;
	std::vector< std::vector<aptk::Action_Idx> > watchers;

    public:

    WatchedLitSuccGen(STRIPS_Problem& prob): prob(prob), watchers(prob.num_fluents()) {
		for(unsigned op = 0; op < prob.num_actions(); ++op){
            auto act = prob.actions()[op];
			auto& precs = act->prec_vec();
			unsigned f = precs[0];
            for(unsigned i = 1; i < precs.size(); ++i){
				if(watchers[precs[i]].size() < watchers[f].size())
					f = precs[i];
			}
			watchers[f].push_back(act->index());
		}
	}
	
	const std::vector<aptk::Action_Idx>& operator[](unsigned f){
		return watchers[f];
	}

	struct iterator {
		WatchedLitSuccGen& w;
		const State& s;
		unsigned s_offset;
		unsigned w_offset;	// 

		iterator(WatchedLitSuccGen& w, const State& s)
			: w(w), s(s), s_offset(0), w_offset(0){ if(!finished() && !applicable()) ++*this; }

		inline unsigned current_f() const {
			return s.fluent_vec()[s_offset];
		}

		inline iterator& operator++(){
			++w_offset;
			while(!finished() && !applicable()){
				++w_offset;
				if(w_offset >= w[current_f()].size()){
					w_offset = 0;
					++s_offset;
				}
			}
			return *this;
		}

		inline bool applicable(){
			if(w[current_f()].size() <= w_offset)
				return false;
			aptk::Action_Idx op = w[current_f()][w_offset];
			return s.entails(w.prob.actions()[op]->prec_vec());
		}
		
		inline aptk::Action_Idx operator*() const{
			return w[current_f()][w_offset];
		}

		bool finished(){
			return s_offset >= s.fluent_vec().size();
		};
	};

	iterator applicable_actions(aptk::State s){
		return iterator(*this, s);
	}

};
}
