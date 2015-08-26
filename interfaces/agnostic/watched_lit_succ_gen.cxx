#include <watched_lit_succ_gen.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <action.hxx>
#include <limits>

namespace aptk {

WatchedLitSuccGen::WatchedLitSuccGen(STRIPS_Problem& prob): prob(prob), watchers() {
	init();
}

void WatchedLitSuccGen::init(){
	state_fixpoint.reset(new State(prob));
	watchers.clear();
	watchers.resize(prob.num_fluents());
	for(unsigned op = 0; op < prob.num_actions(); ++op){
		auto act = prob.actions()[op];
		auto& precs = act->prec_vec();
		bool unreachable = false;
		unsigned f = precs[0];
		for(unsigned i = 0; i < precs.size(); ++i){
			if (act->edel_set().isset(precs[i]) && !act->del_set().isset(precs[i]))
				unreachable = true;
			if(watchers[precs[i]].size() < watchers[f].size()){
				f = precs[i];
			}
		}
		if(!unreachable){
			watcher w = {
				act->index(),
				(precs[0] == f ?
				 precs[precs.size()-1] :
				 precs[0])
			};
			watchers[f].push_back(w);
		}
	}
}

unsigned  WatchedLitSuccGen::filter(std::function<bool(Action*)> is_mutex){
	unsigned n_removed = 0;
	for (unsigned i = 0; i < watchers.size(); i++){
		auto& wl = watchers[i];
		for (unsigned j = 0; j < wl.size(); j++){
			if(is_mutex(prob.actions()[wl[j].op])){
				std::swap(wl[j], wl.back());
				wl.pop_back();
				j--;
				n_removed++;
			}
		}
	}
	return n_removed;
}


bool WatchedLitSuccGen::watcher::triggers(const STRIPS_Problem& prob, const State& s) const {
	return (
			s.entails(blocker) &&
			s.entails(prob.actions()[op]->prec_vec())
			);
}


WatchedLitSuccGen::iterator& WatchedLitSuccGen::iterator::operator++(){
	++w_offset;
	auto& fv = s.fluent_vec();
	for(; s_offset < (int)fv.size(); s_offset++){
		auto& wl = w[ fv[s_offset] ];
		for(; w_offset < (int)wl.size(); w_offset++){
			if(wl[w_offset].triggers(w.prob, s))
				return *this;
		}
		w_offset = 0;
	}
	return *this;
}

void WatchedLitSuccGen::map_watching(const State& s, unsigned f, std::function<bool(watcher&)> update){
	auto& wl = watchers[f];
	for(int j = watchers[f].size() -1; j >= 0 ; j--){
		auto& w = wl[j];
		if(update(w)){
			update_watcher(wl[j], f, s);
		}
	}
}

unsigned WatchedLitSuccGen::iterator::operator*() const{
	return w[s.fluent_vec()[s_offset]][w_offset].op;
}

bool WatchedLitSuccGen::iterator::finished() const {
	return s_offset >= (int)s.fluent_vec().size();
}

void WatchedLitSuccGen::applicable_actions(const State& s, std::vector<int>& actions) const {
	auto& fv = s.fluent_vec();
	for(unsigned s_offset = 0; s_offset < fv.size(); s_offset++){
		auto& wl = watchers[ fv[s_offset] ];
		for(unsigned w_offset = 0; w_offset < wl.size(); w_offset++){
			if(wl[w_offset].triggers(prob, s))
				actions.push_back(wl[w_offset].op);
		}
	}
}

bool WatchedLitSuccGen::reachable(State& s0){
	return reachable(s0, [&](unsigned op, const State& s){
			return true;
		});
}

bool WatchedLitSuccGen::reachable(State& s0, WatchedLitSuccGen::filter_t filter){
	return reachable(s0, 0, filter);
}

bool WatchedLitSuccGen::reachable(State& s0, unsigned q0, WatchedLitSuccGen::filter_t filter){
	auto& q = s0.fluent_vec();
	q.reserve(prob.num_fluents());
	for(unsigned i = q0; i < q.size(); i++){
		auto f = q[i];
		if(prob.is_in_goal(f) && s0.entails(prob.goal()))
			return true;
		map_watching(
			s0, 
			f,
			[&](watcher& w){
				if(!w.triggers(prob, s0)){
					return true;
				}
				auto& adds = prob.actions()[w.op]->add_vec();
				if(filter(w.op, s0)) {
					for(auto added : adds){
						s0.set(added);
					}
				}
				return false;
			});
	}
	
	return false;
}

bool WatchedLitSuccGen::is_reachable(const State& s0){
	return is_reachable(s0, [&](unsigned op, const State& s){
			return true;
		});
}

bool WatchedLitSuccGen::is_reachable(const State& s0, WatchedLitSuccGen::filter_t filter){
	state_fixpoint->reset();
	state_fixpoint->set(s0.fluent_vec());
	return reachable(*state_fixpoint, 0, filter);
}

void WatchedLitSuccGen::update_watcher(watcher& w, unsigned f, const State& s){
	auto act = prob.actions()[w.op];
	auto& precs = act->prec_vec();

	auto& wl = watchers[f];

	unsigned next_w = f, next_b = w.blocker;
	for(auto p : precs){
		if(!s.entails(p)){
			if(next_w == f) {
				next_w = p;
			} else {
				next_b = p;
				break;
			}
		}
	}
	if(next_w != f){
		watchers[next_w].push_back({w.op, next_b});
		w = std::move(wl.back());
		wl.pop_back();
	}
}

};
