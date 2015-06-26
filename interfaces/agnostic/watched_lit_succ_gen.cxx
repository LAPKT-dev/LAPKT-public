#include <watched_lit_succ_gen.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <action.hxx>

namespace aptk {

void WatchedLitSuccGen::init(){
	watchers.clear();
	watchers.resize(prob.num_fluents());
	for(unsigned op = 0; op < prob.num_actions(); ++op){
		auto act = prob.actions()[op];
		auto& precs = act->prec_vec();
		unsigned f = precs[0];
		for(unsigned i = 1; i < precs.size(); ++i){
			if(watchers[precs[i]].size() <= watchers[f].size())
				f = precs[i];
		}
		watchers[f].push_back(act->index());
	}
}


WatchedLitSuccGen::iterator& WatchedLitSuccGen::iterator::operator++(){
	++w_offset;
	auto& fv = s.fluent_vec();
	for(; s_offset < fv.size(); s_offset++){
		auto& wl = w[ fv[s_offset] ];
		for(; w_offset < wl.size(); w_offset++){
			auto op = wl[w_offset];
			if(s.entails(w.prob.actions()[op]->prec_vec()))
				return *this;
		}
		w_offset = 0;
	}
	return *this;
}

void WatchedLitSuccGen::applicable_actions(const State& s, std::vector<int>& actions) const {
	for(auto i = applicable_actions(s); !i.finished(); ++i)
		actions.push_back(*i);
	return;
}

bool WatchedLitSuccGen::iterator::applicable() const {
	return s.entails(w.prob.actions()[**this]->prec_vec());
}

bool WatchedLitSuccGen::iterator::finished() const {
	return s_offset >= s.fluent_vec().size();
}

unsigned WatchedLitSuccGen::iterator::current_f() const {
	return s.fluent_vec()[s_offset];
}

};
