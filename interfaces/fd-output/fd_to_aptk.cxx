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

#include <fd_to_aptk.hxx>
#include <strips_prob.hxx>
#include <action.hxx>
#include <cond_eff.hxx>

#include <cassert>
#include <vector>
#include <iostream>
#include <fstream>

namespace aptk {
namespace FD_Parser {


	template<class T>
	struct Block {
		T& body;
		std::string block_name;

		Block(T& body): body(body){}
		operator T(){
			return body;
		}
	};
	template<class T>
	std::istream& operator>>(std::istream& s, Block<T> b){
		s >> b.block_name;
		s >> b.body;
		std::string end_block;
		s >> end_block;
		return s;
	}


	template<class T>
	struct MultiBlock {
		std::vector<T>& body;
		MultiBlock(std::vector<T>& body):body(body){}
	};
	template<class T>
	std::istream& operator>>(std::istream& s, MultiBlock<T> b){
		int n_elems;
		s >> n_elems;
		for(int i=0; i<n_elems;i++){
			b.body.emplace_back();
			s >> b.body.back();
		}
		return s;
	}


	template<class T>
	struct NMultiBlock {
		int num;
		std::vector<T>& body;
		NMultiBlock(int num, std::vector<T>& body):num(num), body(body){}
	};
	template<class T>
	std::istream& operator>>(std::istream& s, NMultiBlock<T> b){
		for(int i=0; i < b.num; i++){
			b.body.emplace_back();
			s >> b.body.back();
		}
		return s;
	}
	
	struct VarVal {
		int var, val;
	};

	struct Variable {
		std::string name;
		int layer;
		std::vector<std::string> values;

		std::vector<unsigned> stripsvals;
		void add_to(STRIPS_Problem& prob){
			for(auto& sig: values){
				unsigned idx = STRIPS_Problem::add_fluent(prob, sig);
				stripsvals.push_back(idx);
			}
		}
	};
	std::istream& operator>>(std::istream& s, Variable& v){
		std::string begin, end;
		int num_vals;
		s >> begin;
		assert(begin == "begin_variable");
		s >> v.name
		  >> v.layer
		  >> num_vals
		  >> std::ws;
		for(int i = 0; i < num_vals; i++){
			v.values.emplace_back();
                        std::getline(s, v.values.back());
		}
		s >> end;
		assert(end == "end_variable");		
		return s;
	}


	std::istream& operator>>(std::istream& s, VarVal& v){
		return s >> v.var >> v.val;
	}


	struct MutexGroup {
		std::string kind, dir;
		std::vector<VarVal> varvals;
		void add_to(STRIPS_Problem& prob, std::vector<Variable> vars){
			std::vector<unsigned> m;
			for(auto& v: varvals){
				m.push_back(vars[v.var].stripsvals[v.val]);
			}
			prob.mutexes().add(m);
		}
	};
        std::istream& operator>>(std::istream& s, MutexGroup& m){
		std::string begin, end;
		s >> begin >> std::ws;
		assert(begin == "begin_mutex_group");
		if (!std::isdigit(s.peek())) {
			// SymBA* style
			s >> m.kind >> m.dir >> std::ws;
		}
		s >> MultiBlock<VarVal>(m.varvals);
		s >> end;
		assert(end == "end_mutex_group");
		return s;
	}

	struct Effect {
		std::vector<VarVal> precs;
		int var, pre, post;
	};
	std::istream& operator>>(std::istream& s, Effect& e){
		return s >> MultiBlock<VarVal>(e.precs)
			 >> e.var >> e.pre >> e.post;
	}

	struct Operator {
		std::string name;
		std::vector<VarVal> prevails;
		std::vector<Effect> effects;
		int cost;

		int strips_idx;

		void add_to(STRIPS_Problem& prob, std::vector<Variable> vars){
			std::vector<unsigned> add, del, pre;
			std::vector<aptk::Conditional_Effect*> ceffs;
			for (auto& v : prevails) {
				pre.push_back(vars[v.var].stripsvals[v.val]);
			}
			for (auto& e : effects) {
                                auto& svs = vars[e.var].stripsvals;
				if(e.precs.empty()){
					add.push_back(svs.at(e.post));
					if (e.pre == -1){
						for(auto v: svs)
							if (v != svs[e.post])
								del.push_back(v);
					} else {
						pre.push_back(svs.at(e.pre));
						del.push_back(svs.at(e.pre));
					}
				} else {
					std::vector<unsigned> cadd = { svs[e.post] }, cdel = {svs[e.pre]}, cpre;
                                        aptk::Conditional_Effect* ce = new aptk::Conditional_Effect(prob);
					ceffs.push_back(ce);
                                        for(auto& prec : e.precs){
						cpre.push_back(vars[prec.var].stripsvals[prec.val]);
                                        }
					ce->define(cpre, cadd, cdel);
				}
			}
			strips_idx = STRIPS_Problem::add_action(prob, name, pre, add, del, ceffs, cost);
		}

	};
        std::istream& operator>>(std::istream& s, Operator& op){
		std::string begin, end;
		s >> begin >> std::ws;
		assert(begin == "begin_operator");
		std::getline(s, op.name);
                s >> MultiBlock<VarVal>(op.prevails)
		  >> MultiBlock<Effect>(op.effects);
		s >> op.cost;
		s >> end;
		assert(end == "end_operator");
		return s;
	}

	struct Axiom : public Effect {
	};
	std::istream& operator>>(std::istream& s, Axiom& e){
		std::string begin, end;
		s >> begin >> std::ws;
		assert(begin == "begin_rule");
		s >> static_cast<Effect&>(e);
		s >> end >> std::ws;
		assert(end == "end_rule");
		return s;
	}

	struct FDParser{
		std::ifstream s;
		int version, metric;
		std::vector<Variable> vars;
		std::vector<MutexGroup> mutexes;
		std::vector<unsigned> init;
		std::vector<VarVal> goal;
		std::vector<Operator> operators;
		std::vector<Axiom> axioms;
		std::vector<DTG> dtgs;

		FDParser(std::string sas_file):s(sas_file){}

		void parse(){
                        s >> Block<int>(version)
			  >> Block<int>(metric)
			  >> MultiBlock<Variable>(vars)
			  >> MultiBlock<MutexGroup>(mutexes);

                        NMultiBlock<unsigned> init_parser(vars.size(), init);
                        MultiBlock<VarVal> goal_parser(goal);
                        s >> Block<decltype(init_parser)>(init_parser)
			  >> Block<decltype(goal_parser)>(goal_parser)
			  >> MultiBlock<Operator>(operators)
			  >> MultiBlock<Axiom>(axioms);
		}

		void add_to(aptk::STRIPS_Problem& prob){
			std::vector<unsigned> strips_init, strips_goal;
			for(auto& v : vars){
				v.add_to(prob);
			}
			// Must add all vars before adding the implied mutexes
			// so that the number of strips vars is known in advance
			for(auto& v : vars){
				prob.mutexes().add(v.stripsvals);
			}
			for(auto& m : mutexes){
				m.add_to(prob, vars);
			}
			for(unsigned var = 0; var < vars.size(); var++){
				int val = init[var];
				strips_init.push_back(vars[var].stripsvals[val]);
			}
			STRIPS_Problem::set_init(prob, strips_init);
			for(auto& g : goal){
				strips_goal.push_back(vars[g.var].stripsvals[g.val]);
			}
			STRIPS_Problem::set_goal(prob, strips_goal);
			for(auto& op : operators){
				op.add_to(prob, vars);
			}
			prob.make_action_tables();
			prob.compute_edeletes();

			// Compute DTGs
			dtgs.resize(vars.size());
			for(unsigned i = 0; i < vars.size(); i++){
				dtgs[i].values = vars[i].stripsvals;
			}

			unsigned op_idx = 0;
			for(auto& op : operators){
				auto act = prob.actions()[op_idx];
				for(auto& eff : op.effects){
					auto& dtg = dtgs[eff.var];
					int pre = eff.pre;
					if(pre >= 0 && prob.mutexes().are_mutex(act, dtg.values[pre]))
						continue;
					TransID tr = {pre, eff.post};
					dtg.edges.insert(std::make_pair(tr, op_idx));
					dtg.ops.insert(std::make_pair(op_idx, tr));
				}
				for(auto& prev : op.prevails){
					auto& dtg = dtgs[prev.var];
					TransID tr = {prev.val, prev.val};
					dtg.edges.insert(std::make_pair(tr, op_idx));
					dtg.ops.insert(std::make_pair(op_idx, tr));
				}
				op_idx++;
			}

			for (unsigned i = 0; i < vars.size(); i++){
				auto& d = dtgs[i];
				std::vector<unsigned> op_occs(prob.num_actions());
				d.init_idx = d.goal_idx = -1;
				for(unsigned i = 0; i<d.values.size(); i++){
					if(prob.is_in_init(d.values[i]))
						d.init_idx = i;
					if(prob.is_in_goal(d.values[i]))
						d.goal_idx = i;
				}

				// Ops are sorted, dtg is unsafe iff an op
				// occurs in two or more transitions
				unsigned prev_op = prob.num_actions() + 1;
				for(auto& e: d.ops){
					unsigned op = e.first;
					if(prev_op == op){
						std::cerr << prob.actions()[op]->signature();
						d.unsafe = true;
						break;
					}
					prev_op = op;
				}
				if(d.unsafe)
					std::cerr << "Unsafe DTG!" << std::endl;
			}
		}
	};

void get_problem_description(std::string fd_output, STRIPS_Problem& prob){
    std::vector<DTG> dtgs;
    get_problem_description(fd_output, prob, dtgs);
};

void get_problem_description(std::string sas_file, aptk::STRIPS_Problem& prob, std::vector<DTG>& dtgs){
	FDParser parser(sas_file);
	parser.parse();	
	parser.add_to(prob);
	dtgs = parser.dtgs;
}
}
}
