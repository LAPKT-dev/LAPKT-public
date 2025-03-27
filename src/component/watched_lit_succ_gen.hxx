/*
Lightweight Automated Planning Toolkit

Copyright 2022
Toby Davies <tobyodavies@gmail.com>
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files
(the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject
 to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#ifndef WATCHED_LIT_SUCC_GEN_HXX
#define WATCHED_LIT_SUCC_GEN_HXX

#include <vector>
#include <queue>
#include <functional>
#include <memory>

namespace aptk
{

	class STRIPS_Problem;
	class State;
	class Action;

	class WatchedLitSuccGen
	{
	public:
		struct watcher
		{
			unsigned op : 16;
			unsigned blocker : 16;
			bool triggers(const STRIPS_Problem &prob, const State &s) const;
		};

		WatchedLitSuccGen(STRIPS_Problem &prob);

		void init();

		unsigned filter(std::function<bool(Action *)> is_mutex);

		const std::vector<watcher> &operator[](unsigned f) const
		{
			return watchers[f];
		}
		std::vector<watcher> &operator[](unsigned f)
		{
			return watchers[f];
		}

		unsigned size() const { return watchers.size(); }

		struct iterator
		{
			const WatchedLitSuccGen &w;
			const State &s;
			int s_offset;
			int w_offset;

			iterator(const WatchedLitSuccGen &w, const State &s, unsigned s_offset = 0)
					: w(w), s(s), s_offset(0), w_offset(-1) { ++*this; }

			iterator &operator++();

			unsigned operator*() const;

			bool finished() const;
		};

		iterator applicable_actions(const aptk::State &s) const
		{
			return iterator(*this, s);
		}

		void applicable_actions(const State &s, std::vector<int> &actions) const;

		// Map the update function over every watcher watching f.
		// If update returns true, the watcher will be moved to
		// some other fluent not true in s.
		void map_watching(const State &s, unsigned f, std::function<bool(watcher &)> update);

		// A filter is called with an operator and a (delete relaxed)
		// state in which it is applicable.
		// It should return true if the operator should be applied.
		typedef std::function<bool(unsigned, const State &)> filter_t;

		// Compute the fixpoint of delete-relaxed reachability.
		// If a filter is specified, only operators returning true will be applied.
		// Note this modifies the state argument.
		bool reachable(State &s0);
		bool reachable(State &s0, filter_t filter);
		bool reachable(State &s0, unsigned q0, filter_t filter);

		bool is_reachable(const State &s0);
		bool is_reachable(const State &s0, filter_t filter);

	private:
		void update_watcher(watcher &w, unsigned f, const State &s);

		STRIPS_Problem &prob;
		std::vector<std::vector<watcher>> watchers;
		std::shared_ptr<State> state_fixpoint;
	};
}
#endif
