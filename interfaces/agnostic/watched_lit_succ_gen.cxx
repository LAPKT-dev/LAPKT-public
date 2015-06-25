#include <watched_lit_succ_gen.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <action.hxx>

namespace aptk {

void WatchedLitSuccGen::init(){
	watchers.resize(prob.num_fluents());
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

inline bool WatchedLitSuccGen::iterator::applicable(){
	if(w[current_f()].size() <= w_offset)
		return false;
	unsigned op = w[current_f()][w_offset];
	return s.entails(w.prob.actions()[op]->prec_vec());
}

void WatchedLitSuccGen::applicable_actions(const State& s, std::vector<int> actions) const {
	for(unsigned i = 0; i < s.fluent_vec().size(); ++i){
		auto& w = watchers[i];
		for(unsigned j = 0; j < w.size(); j++){
			if(s.entails(prob.actions()[w[j]]->prec_vec()))
				actions.push_back(w[j]);
		}
	}
}

bool WatchedLitSuccGen::iterator::finished() const {
	return s_offset >= s.fluent_vec().size();
}

unsigned WatchedLitSuccGen::iterator::current_f() const {
	return s.fluent_vec()[s_offset];
}

};
