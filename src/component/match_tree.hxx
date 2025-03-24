/*
Lightweight Automated Planning Toolkit

Copyright 2022
Miquel Ramirez <miquel.ramirez@unimelb.edu.au>Nir Lipovetzky <nirlipo@gmail.com>
Christian Muise <christian.muise@gmail.com>

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

#ifndef __MATCH_TREE__
#define __MATCH_TREE__

#include <types.hxx>
#include <vector>
#include <string>
#include <set>

namespace aptk
{

	class STRIPS_Problem;
	class State;
	class Action;

	namespace agnostic
	{

		// Match tree data structure from PRP ( https://bitbucket.org/haz/planner-for-relevant-policies )

		class BaseNode
		{
		public:
			virtual ~BaseNode() {}
			virtual void dump(std::string indent, const STRIPS_Problem &prob) const = 0;
			virtual void generate_applicable_items(const State &s, std::vector<int> &actions) = 0;
			virtual int count() const = 0;

			BaseNode *create_tree(std::vector<int> &actions, std::vector<bool> &vars_seen, const STRIPS_Problem &prob);
			int get_best_var(std::vector<int> &actions, std::vector<bool> &vars_seen, const STRIPS_Problem &prob);
			bool action_done(int action_id, std::vector<bool> &vars_seen, const STRIPS_Problem &prob);
		};

		class SwitchNode : public BaseNode
		{
			int switch_var;
			std::vector<int> immediate_items;
			std::vector<BaseNode *> children;
			BaseNode *default_child;

		public:
			SwitchNode(std::vector<int> &actions, std::vector<bool> &vars_seen, const STRIPS_Problem &prob);
			virtual void generate_applicable_items(const State &s, std::vector<int> &actions);
			virtual void dump(std::string indent, const STRIPS_Problem &prob) const;
			virtual int count() const;
		};

		class LeafNode : public BaseNode
		{
			std::vector<int> applicable_items;

		public:
			LeafNode(std::vector<int> &actions);
			virtual void generate_applicable_items(const State &s, std::vector<int> &actions);
			virtual void dump(std::string indent, const STRIPS_Problem &prob) const;
			virtual int count() const { return applicable_items.size(); }
		};

		class EmptyNode : public BaseNode
		{
		public:
			virtual void generate_applicable_items(const State &, std::vector<int> &) {}
			virtual void dump(std::string indent, const STRIPS_Problem &prob) const;
			virtual int count() const { return 0; }
		};

		class Match_Tree
		{

		public:
			Match_Tree(const STRIPS_Problem &prob) : m_problem(prob) {}

			~Match_Tree() { delete root_node; };

			void build();
			void retrieve_applicable(const State &s, std::vector<int> &actions) const;
			int count() { return root_node->count(); }
			void dump() { root_node->dump("", m_problem); }

		private:
			const STRIPS_Problem &m_problem;
			BaseNode *root_node;
		};

	}

}

#endif // match_tree.hxx
