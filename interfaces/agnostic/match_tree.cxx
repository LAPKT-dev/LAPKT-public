/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
Miquel Ramirez <miquel.ramirez@rmit.edu.au>
Nir Lipovetzky <nirlipo@gmail.com>
Christian Muise <christian.muise@gmail.com>

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

#include <match_tree.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>
#include <action.hxx>
#include <algorithm>
#include <iostream>

namespace aptk {

namespace agnostic {

void Match_Tree::build() {
	std::set<int> vars_seen;
	std::vector<int> actions;
	
	for (unsigned i = 0; i < m_problem.num_actions(); ++i)
	    actions.push_back(i);
	
	root_node = new SwitchNode( actions, vars_seen, m_problem );
}

void Match_Tree::retrieve_applicable( const State& s, std::vector<int>& actions ) const {
	return root_node->generate_applicable_items( s, actions );
}

/********************/

BaseNode * BaseNode::create_tree( std::vector<int>& actions, std::set<int> &vars_seen, const STRIPS_Problem& prob ) {
	
	if (actions.empty())
		return new EmptyNode;
	
	// If every item is done, then we create a leaf node
	bool all_done = true;
	for (unsigned i = 0; all_done && (i < actions.size()); ++i) {
		if (!(action_done(actions[i], vars_seen, prob))) {
			all_done = false;
		}
	}
	
	if (all_done) {
		return new LeafNode(actions);
	} else {
		return new SwitchNode(actions, vars_seen, prob);
	}

}

int BaseNode::get_best_var( std::vector<int>& actions, std::set<int> &vars_seen, const STRIPS_Problem& prob ) {
	
	// TODO: This fluents.size() stuff needs to change to the number of mutexes once they're computed
	
	std::vector< std::pair<int,int> > var_count = std::vector< std::pair<int,int> >(prob.fluents().size());
	
	for (unsigned i = 0; i < prob.fluents().size(); ++i) {
		var_count[i] = std::pair<int,int>(0, i);
	}
	
	for (unsigned i = 0; i < actions.size(); ++i) {
		const Action* act = prob.actions()[actions[i]];
		for (unsigned j = 0; j < act->prec_varval().size(); ++j) {
			var_count[act->prec_varval()[j].first].first++;
		}
	}
	
	sort(var_count.begin(), var_count.end());
	
	for (int i = var_count.size() - 1; i >= 0; --i) {
		if (vars_seen.count(var_count[i].second) <= 0) {
			//cout << "Best var " << var_count[i].second << " with a count of " << var_count[i].first << endl;
			return var_count[i].second;
		}
	}
	
	assert(false);
	return -1;
}

bool BaseNode::action_done( int action_id, std::set<int> &vars_seen, const STRIPS_Problem& prob ) {
	
	const Action* act = prob.actions()[action_id];
	
	for (unsigned i = 0; i < act->prec_varval().size(); ++i) {
		if (0 == vars_seen.count(act->prec_varval()[i].first))
			return false;
	}
	
	return true;
}

/********************/

void EmptyNode::dump( std::string indent, const STRIPS_Problem& ) const {
	std::cout << indent << "<empty>" << std::endl;
}

/********************/

LeafNode::LeafNode( std::vector<int>& actions ) {
	applicable_items.swap(actions);
}

void LeafNode::dump( std::string indent, const STRIPS_Problem& prob ) const {
	for (unsigned i = 0; i < applicable_items.size(); ++i)
		std::cout << indent << prob.actions()[applicable_items[i]]->signature() << std::endl;
}

void LeafNode::generate_applicable_items( const State&, std::vector<int>& actions ) {
    actions.insert( actions.end(), applicable_items.begin(), applicable_items.end() );
}

/********************/

void SwitchNode::generate_applicable_items( const State& s, std::vector<int>& actions ) {
    actions.insert( actions.end(), immediate_items.begin(), immediate_items.end() );
    
    // TODO: Change this when mutex's are done proper
    //children[s.value_for_var(switch_var)]->generate_applicable_items( s, actions );
    if (1 == s.value_for_var(switch_var))
        children[0]->generate_applicable_items( s, actions );
    
    default_child->generate_applicable_items( s, actions );
}

SwitchNode::SwitchNode( std::vector<int>& actions, std::set<int> &vars_seen, const STRIPS_Problem& prob ) {

    switch_var = get_best_var(actions, vars_seen, prob);
    
    std::vector< std::vector<int> > value_items;
    std::vector<int> default_items;
    
    // TODO: This should change when the mutex's are computed
    //        Ditto for the "1 == s.value..." and "value_items[0]..." lines below
    int num_of_var_values = 1;
    
    // Initialize the value_items
    for (int i = 0; i < num_of_var_values; ++i)
        value_items.push_back( std::vector<int>() );
    
    // Sort out the regression items
    for (unsigned i = 0; i < actions.size(); ++i) {
        if (action_done(actions[i], vars_seen, prob)) {
            immediate_items.push_back(actions[i]);
        } else if (prob.actions()[actions[i]]->requires(switch_var)) {
            value_items[0].push_back(actions[i]);
        } else { // == -1
            default_items.push_back(actions[i]);
        }
    }
    
    vars_seen.insert(switch_var);
    
    // Create the switch generators
    for (unsigned i = 0; i < value_items.size(); i++) {
        children.push_back(create_tree(value_items[i], vars_seen, prob));
    }
    
    // Create the default generator
    default_child = create_tree(default_items, vars_seen, prob);
    
    vars_seen.erase(switch_var);
}

void SwitchNode::dump( std::string indent, const STRIPS_Problem& prob ) const {
    std::cout << indent << "switch on " << prob.fluents()[switch_var]->signature() << std::endl;
    std::cout << indent << "immediately:" << std::endl;
    for (unsigned i = 0; i < immediate_items.size(); ++i)
        std::cout << indent << prob.actions()[immediate_items[i]]->signature() << std::endl;
    for (unsigned i = 0; i < children.size(); ++i) {
        std::cout << indent << "case " << i << ":" << std::endl;
        children[i]->dump(indent + "  ", prob);
    }
    std::cout << indent << "always:" << std::endl;
    default_child->dump(indent + "  ", prob);
}

int SwitchNode::count() const {
    int total = 0;
    for (unsigned i = 0; i < children.size(); ++i)
        total += children[i]->count();
    total += default_child->count();
    total += immediate_items.size();
    return total;
}

/********************/

}

}
