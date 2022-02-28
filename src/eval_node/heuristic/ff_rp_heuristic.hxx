/*
Lightweight Automated Planning Toolkit
Copyright (C) 2012
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

/**
 * @brief This file contains the classes to compute a relaxed plan and FF heuristic. 
 * 
 * 
 */
#ifndef __FF_RP_HEURISTIC__
#define __FF_RP_HEURISTIC__

#include <search_prob.hxx>
#include <heuristic.hxx>
#include <resources_control.hxx>
#include <strips_state.hxx>
#include <types.hxx>
#include <action.hxx>
#include <fluent.hxx>
#include <queue>
#include <bit_array.hxx>
#include <vector>

namespace aptk {

namespace agnostic {


/**
 * @brief Defines if the relaxed plan is sensitive to action costs.
 * 
 */
enum class FF_RP_Cost_Function { Ignore_Costs, Use_Costs};

/**
 * @brief Represents and computes a relaxed plan given a base heuristic to define the best supporters. Classic FF relies on h_{max}, but other
 * heuristics can be used too, e.g. h_{add}. If this class is to be used by search algorithms, use the wraper class FF_Relaxed_Plan_Heuristic.
 * 
 * @tparam Primary_Heuristic Heuristic used to compute the best supporters.
 * @tparam Cost_Type Optional. Specifies the datatype of costs in the base heuristic and the resulting heuristic
 *  from the relaxed plan, e.g. int, float, double, etc.
 * @tparam cost_opt Optional. Specifies if the relaxed plan heuristic should treat all costs as 1 or take into acount their true costs.
 */
template < typename Primary_Heuristic, typename Cost_Type = float, FF_RP_Cost_Function cost_opt = FF_RP_Cost_Function::Use_Costs >
class FF_Relaxed_Plan_Extractor
{
	/**
	 * @brief Node representing a fluent and its heuristic value. This is used in the backward propagation starting from the goals through to 
	 * the preconditions of best supporters.
	 * 
	 */
	class Goal_Node {
	public:
		
		/**
		 * @brief Construct a new Goal_Node object
		 * 
		 * @param p Fluent
		 * @param h heuristic value
		 */
		Goal_Node( unsigned p, Cost_Type h )
			: m_fluent(p), m_h(h) {
		}

		/**
		 * @brief Move Constructor. Construct a new Goal_Node object given another opject
		 * 
		 * @param other 
		 */
		Goal_Node( Goal_Node&& other ) 
			: m_fluent( other.m_fluent ), m_h( other.m_h ) {
			
		}
	
		/**
		 * @brief Copy constructor. Constructs a new Goal_Node object
		 * 
		 * @param other 
		 */
		Goal_Node( const Goal_Node& other ) 
			: m_fluent( other.m_fluent ), m_h( other.m_h ) {
		}
	
		/**
		 * @brief Assignment operator. Copies the other object
		 * 
		 * @param other other goal node
		 * @return Goal_Node& target goal node to overwrite
		 */
		Goal_Node&	operator=( Goal_Node&& other ) {
			m_fluent = other.m_fluent;
			m_h = other.m_h;
			return *this;
		}
	
		/**
		 * @brief Greater than operator. Evaluates to true if heuristic value of the left-hand side goal node is greater than the right-hand side. 
		 * 
		 * @param n right hand side node
		 * @return true 
		 * @return false 
		 */
		bool	operator>( const Goal_Node& n ) const {
			return m_h > n.m_h;
		}
	
		/**
		 * @brief Less than operator. Evaluates to true if heuristic value of the left-hand side goal node is less than the right-hand side. 
		 * 
		 * @param n right hand side node
		 * @return true 
		 * @return false 
		 */
		bool	operator<( const Goal_Node& n ) const {
			return m_h < n.m_h;
		}
	
		unsigned 	m_fluent;
		Cost_Type	m_h;
	
	};

	/**
	 * @brief Priority Queue to sort which fluents need to be supported next while computing the relaxed plan
	 * 
	 */
	typedef std::priority_queue<Goal_Node>				Goal_Queue;
	typedef typename STRIPS_Problem::Best_Supporter  		Best_Supporter;
public:

	/**
	 * @brief Construct a new ff relaxed plan extractor object. By default the flags m_ignore_rp_h_value and m_one_ha_per_fluent are set to False.
	 * 
	 * @param prob Reference to the STRIPS Problem object
	 * @param h Reference to the base heuristic used to extract the relaxed plan
	 */
	FF_Relaxed_Plan_Extractor( const STRIPS_Problem& prob, Primary_Heuristic& h )
		: m_base_heuristic(h), m_strips_model( prob ), m_ignore_rp_h_value(false), m_one_ha_per_fluent(false) {
		m_init_fluents.resize( m_strips_model.num_fluents() );
		m_po_set.resize( m_strips_model.num_actions() );
		m_rp_precs.resize( m_strips_model.num_fluents() );
		m_rp_goals.resize( m_strips_model.num_fluents() );
	}

	/**
	 * @brief Destroy the ff relaxed plan extractor object
	 * 
	 */
	virtual ~FF_Relaxed_Plan_Extractor() {}

	/**
	 * @brief Computes the relaxed plan from state s, returning the heuristic value, prefered operators, and optionally, 
	 * the actions in the relaxed plan. If you don't want to use the default goal of the problem, you can specify it as an argument.
	 * 
	 * @param[in] s Current state where the heuristic will be computed from
	 * @param[out] h_val This argument is passed by reference and will contain the resulting heuristic value. 
	 * @param[out] pref_ops This argument is passed by reference and will contain the prefered operators, also known as helfpul actions. 
	 * @param[out] copy_rel_plan This argument is optional and passed by reference. It will contain the actions in the relaxed plan. 
	 * @param[in] goals This argument is optional. If defined, the relaxed plan will be computed from the goals in the argument, otherwise
	 *   the default goals of the problem will be used.
	 */
  	virtual void compute( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>* copy_rel_plan = NULL, Fluent_Vec* goals = NULL ) {
		m_deletes_goal = false;
		//float t0 = time_used();
		m_base_heuristic.eval( s, h_val );		
		//float tf = time_used();
		//std::cout << tf - t0 << std::endl;
		if ( h_val == std::numeric_limits<Cost_Type>::max() )
			return;

		// 0. Initialize data structures
		init_fluents().reset();

		for ( unsigned k = 0; k < s.fluent_vec().size(); k++ )
			init_fluents().set( s.fluent_vec()[k] );
	
		std::vector< Best_Supporter > 	relaxed_plan;
		std::vector< Cost_Type >		rp_level;
		const Fluent_Vec& G = goals ? *goals : m_strips_model.goal();

		m_rp_precs.reset();
		m_rp_goals.reset();

		for ( auto g : G ) {
			if ( init_fluents().isset( g ) ) {
				#ifdef DEBUG_RP_HEURISTIC
				std::cout << "Goal: " << m_strips_model.fluents()[ g ]->signature() << std::endl;
				std::cout << "\th = " <<  m_base_heuristic.value( g ) << std::endl;
				std::cout << "Best supporter = (START)" << std::endl;
				#endif
				continue;
			}

			m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
			m_rp_goals.set(g);
		}

		if(!m_ignore_rp_h_value)
			h_val = 0.0f;

		while ( !m_goal_queue.empty() ) {
			Goal_Node n = m_goal_queue.top();
			m_goal_queue.pop();
			auto rp_entry = m_base_heuristic.get_best_supporter( n.m_fluent );
			if ( rp_entry.act_idx == no_such_index ) // No best supporter for fluent
			{
				if(n.m_h > 0){
					std::cerr << "No best supporter (neither START) found for goal fluent ";
					std::cerr << m_strips_model.fluents()[n.m_fluent]->signature() << std::endl;
				}
				
				return;
			}
			const Action* sup = m_strips_model.actions()[ rp_entry.act_idx ];
			#ifdef DEBUG_RP_HEURISTIC
			std::cout << "Goal: " << m_strips_model.fluents()[n.m_fluent]->signature() << std::endl;
			std::cout << "\t h = " << m_base_heuristic.value( n.m_fluent ) << std::endl;
			std::cout << "\t Best supporter = " << sup->signature() << std::endl;
			std::cout << "\t Effect = " << rp_entry.eff_idx << std::endl;
			#endif

			//if ( std::find( relaxed_plan.begin(), relaxed_plan.end(), rp_entry ) != relaxed_plan.end() ) continue;
			bool duplicate = false;
			if ( rp_entry.eff_idx == no_such_index ) {
				for ( unsigned k = 0 ; k < relaxed_plan.size(); k++ ) {
					if ( relaxed_plan[k].act_idx == rp_entry.act_idx ) {
						duplicate = true;
						break;
					}
				}
			} else {
				for ( unsigned k = 0 ; k < relaxed_plan.size(); k++ ) {
					if ( relaxed_plan[k].act_idx == rp_entry.act_idx ) {
						if ( rp_level[k] == n.m_h ) {
							duplicate = true;
							break;
						}
					}
				}
			}
			if ( duplicate )
				continue;
			// Check goal deletion
			for ( auto g : G ) {
				if ( rp_entry.eff_idx == no_such_index ) {
					if ( sup->del_set().isset( g ) ) {
						m_deletes_goal = true;
						break;
					}
				}
				else {
					if ( sup->ceff_vec()[rp_entry.eff_idx]->del_set().isset( g ) 
						|| sup->del_set().isset(g) ) {
						m_deletes_goal = true;
						break;
					}
				}
			}

			relaxed_plan.push_back( rp_entry );
			rp_level.push_back( n.m_h );
			

			if(!m_ignore_rp_h_value)
				h_val += ( cost_opt == FF_RP_Cost_Function::Ignore_Costs ? 1.0f : sup->cost() );

			// Add preconditions to relaxed plan
			bool all_initially_true = true;
			for ( auto g : sup->prec_vec() ) {
				if ( !init_fluents().isset( g ) ) {
					all_initially_true = false;
					m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
					m_rp_goals.set(g);
				}
				else {
					#ifdef DEBUG_RP_HEURISTIC
					std::cout << "Goal: " << m_strips_model.fluents()[ g ]->signature() << std::endl;
					std::cout << "\th = " <<  m_base_heuristic.value( g ) << std::endl;
					std::cout << "Best supporter = (START)" << std::endl;
					#endif
					continue;
				} 
			}
			if ( rp_entry.eff_idx != no_such_index ) {
				for ( auto g : sup->ceff_vec()[rp_entry.eff_idx]->prec_vec() ) {
					if ( !init_fluents().isset( g ) ) {
						all_initially_true = false;
						m_goal_queue.push( Goal_Node( g, m_base_heuristic.value(g) ) );
						m_rp_goals.set(g);
					}
					else {
						#ifdef DEBUG_RP_HEURISTIC
						std::cout << "Goal: " << m_strips_model.fluents()[ g ]->signature() << std::endl;
						std::cout << "\th = " <<  m_base_heuristic.value( g ) << std::endl;
						std::cout << "Best supporter = (START)" << std::endl;
						#endif
						continue;
					} 
				}
			}
			if ( all_initially_true ) {
				m_rp_precs.set( n.m_fluent );
			}
		}

		if(copy_rel_plan) 
			for(unsigned i = 0; i < relaxed_plan.size(); i++)
				copy_rel_plan->push_back( relaxed_plan[i].act_idx );

		#ifdef DEBUG	
		std::cout << std::endl << "Rel Plan: " << std::endl;
		for ( unsigned k = 0; k < relaxed_plan.size(); k++ ) {
			std::cout << "\t "<< k <<": " << m_strips_model.actions()[relaxed_plan[k].act_idx]->signature() << std::endl;
		}
		#endif
	
		std::vector< aptk::Action_Idx > app_set;
		m_strips_model.applicable_actions_v2( s, app_set );
		m_po_set.reset();	
		
		std::vector<unsigned> unordered_pref_ops;
		std::vector<unsigned> po_dels;
	
		for (unsigned i = 0; i < app_set.size(); ++i) {
			const Action& act = *(m_strips_model.actions()[app_set[i]]);
	
			for ( auto a_p : act.add_vec() ) {
				if ( !m_rp_precs.isset( a_p ) ) continue;
				if ( m_po_set.isset( act.index() ) && one_HA_per_fluent() ) continue;
				if ( !m_po_set.isset( act.index() ) ) {
					unordered_pref_ops.push_back( act.index() );
					po_dels.push_back(0);
					m_po_set.set( act.index() );
				}
				m_rp_precs.unset(a_p);
			}

			for ( unsigned k = 0; k < act.ceff_vec().size(); k++ ) {
				if ( !s.entails( act.ceff_vec()[k]->prec_vec() ) ) continue;
				for ( auto a_p : act.ceff_vec()[k]->add_vec() ) {
					if ( !m_rp_precs.isset( a_p ) ) continue;
					if ( m_po_set.isset( act.index() ) && one_HA_per_fluent() ) continue;
					if ( !m_po_set.isset( act.index() ) ) {
						unordered_pref_ops.push_back( act.index() );
						po_dels.push_back(0);
						m_po_set.set( act.index() );
					}
					m_rp_precs.unset( a_p );
				}
			} 
		}

		unsigned processed_index = 0;
		pref_ops.resize( unordered_pref_ops.size() );

		for ( int i = unordered_pref_ops.size() - 1; i >= 0; i-- ) {

			unsigned d = 0;
			
			const Action* a = m_strips_model.actions()[pref_ops[i]];
			
			for ( auto p : a->del_vec() )
				if ( m_rp_goals.isset(p) ) d++;

			for ( unsigned k = 0; k < a->ceff_vec().size(); k++ ) {
				if ( !s.entails( a->ceff_vec()[k]->prec_vec() ) ) continue;
				for ( auto p : a->ceff_vec()[k]->del_vec() )
					if ( m_rp_goals.isset(p) ) d++;
			}
			
			unsigned j;
			for (j = 0; j < processed_index; j++ )
				if ( po_dels[j] > d ) break;
			for ( unsigned k = processed_index; k > j; k-- ) {
				pref_ops[k] = pref_ops[k-1];
				po_dels[k] = po_dels[k-1];	
			}
			
			pref_ops[j] = unordered_pref_ops[i];
			po_dels[j] = d;
			processed_index++;
		}
	}

	/**
	 * @brief Set this to true if you are not interested in computing the heuristic value, but just want the relaxed plan.
	 * 
	 * @param b whether a heuristic value will be computed.
	 */
	void ignore_rp_h_value(bool b) {m_ignore_rp_h_value = b;}

	/**
	 * @brief Set to false if you want to set as helpful actions (prefered operators) all actions applicable in the current state adding a fluent in the relaxed plan. 
	 * If set to true, just the action chosen in the relaxed plan will be returned as helpful. The latter is the classic definition.
	 * 
	 * @param b Boolean flag
	 */
	void set_one_HA_per_fluent( bool b ) { m_one_ha_per_fluent = b; }

	/**
	 * @brief Returns the flag being used to return 1 helpful action per fluent, or all possible helpful actions.
	 * 
	 * @return true 
	 * @return false 
	 */
	bool one_HA_per_fluent() const { return m_one_ha_per_fluent; }

	/**
	 * @brief Returns a reference to the base heuristic member being used to extract the relaxed plan
	 * 
	 * @return Primary_Heuristic& Refereence to m_base_heuristic
	 */
	Primary_Heuristic& base_h() { return m_base_heuristic; }

	/**
	 * @brief Indicates if an action in the relaxed plan has a deletes one of the original goals of the problem.
	 * 
	 * @return true 
	 * @return false 
	 */
	bool deletes_goal() const { return m_deletes_goal; }

protected:

	/**
	 * @brief Reference to the fluents used to initialize the computation.
	 * 
	 * @return Bit_Array& reference to the member m_initial_fluents
	 */
	Bit_Array&		init_fluents() { return m_init_fluents; }


protected:

	/**
	 * @brief Reference to the primary object. Do not owned by the class, so it won't be removed by the destructor.
	 * 
	 */
	Primary_Heuristic&		m_base_heuristic;

	/**
	 * @brief Set of fluents from which the relaxed plan is extracted
	 * 
	 */
	Bit_Array			m_init_fluents;

	/**
	 * @brief Reference to the STRIPS Problem Object. It won't be removed by the destructor.
	 * 
	 */
	const STRIPS_Problem&		m_strips_model;

	/**
	 * @brief Set of Prefered Operators 
	 * 
	 */
	Bit_Set				m_po_set;

	/**
	 * @brief Used in the computation of a relaxed plan. It keeps track of preconditions that still need to be supported by an action in the relaxed plan. 
	 * 
	 */
	Bit_Set				m_rp_precs;

	/**
	 * @brief Flag to avoid computing the heuristic value.
	 * 
	 */
	bool                            m_ignore_rp_h_value;

	/**
	 * @brief Flag to decide whether one/all possible helpful actions per fluent are extracted.  
	 * 
	 */
	bool				m_one_ha_per_fluent;

	/**
	 * @brief Queue used to extract the relaxed plan, starting from the goals backwards through the preconditions of best supporters. See compute() function.
	 * 
	 */
	Goal_Queue			m_goal_queue;

	/**
	 * @brief Indicates if actions from the relaxed plan delete a goal fluent
	 * 
	 */
	bool				m_deletes_goal;

	/**
	 * @brief Set of fluents appearing as goals or preconditions of actions in the relaxed plan 
	 * 
	 */
	Bit_Set				m_rp_goals;
};

/**
 * @brief Wraps the relaxed plan extractor class (FF_Relaxed_Plan_Extractor) to implement the interface defined by the abstract heuristic class. 
 * The function defined below are the ones used by other components in LAPKT, e.g. search algorithms.
 * 
 * @code
 * 	/// Example valid classes that can be used to specify the template and instantiante an object.
 * typedef		H1_Heuristic<Fwd_Search_Problem, H_Add_Evaluation_Function>	H_Add_Fwd; 
 * typedef 	    H1_Heuristic<Fwd_Search_Problem, H_Max_Evaluation_Function>	H_Max_Fwd;
 * 
 * typedef		FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Add_Fwd >	FF_H_Add_Rp_Fwd;
 * typedef		FF_Relaxed_Plan_Heuristic< Fwd_Search_Problem, H_Max_Fwd >	FF_H_Max_Rp_Fwd;
 * 
 * @endcode 
 * @tparam Search_Model The class representing a forward or backward search model
 * @tparam Primary_Heuristic Heuristic used to compute the best supporters.
 * @tparam Cost_Type Optional. Specifies the datatype of costs in the base heuristic and the resulting heuristic
 *  from the relaxed plan, e.g. int, float, double, etc.
 * @tparam cost_opt Optional. Specifies if the relaxed plan heuristic should treat all costs as 1 or take into acount their true costs.
 */
template < typename Search_Model, typename Primary_Heuristic, typename Cost_Type = float, FF_RP_Cost_Function cost_opt = FF_RP_Cost_Function::Use_Costs >
class FF_Relaxed_Plan_Heuristic : public Heuristic<State>
{
public:

	/**
	 * @brief Construct a new ff relaxed plan heuristic object. It instantiates a base heuristic object member, and passes the reference to the relaxed plan extractor member. 
	 * 
	 * @param prob Onbject containing the Search Problem representation
	 */
	FF_Relaxed_Plan_Heuristic( const Search_Model& prob )
	: Heuristic<State>(prob), m_base_heuristic(prob), m_plan_extractor( prob.task(), m_base_heuristic ) {

	}

	/**
	 * @brief Destroy the ff relaxed plan heuristic object
	 * 
	 */
	virtual ~FF_Relaxed_Plan_Heuristic() {}
	
	/**
	 * @brief Evaluates a search node containing a state, and returns the heuristic value and prefered operators (helpful actions) 
	 * 
	 * @tparam Search_Node Different Search algorithms have different node representations
	 * @param[in] n Node from where the heuristic will be computed
	 * @param[out] h_val returned heuristic value
	 * @param[out] pref_ops returned prefered operators
	 */
	template <typename Search_Node>
        void eval( const Search_Node* n, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops) {
		eval(n->state(), h_val, pref_ops);				
	}

	/**
	 * @brief Evaluates a search node containing a state, and returns the heuristic value 
	 * 
	 * @tparam Search_Node Different Search algorithms have different node representations
	 * @param[in] n Node from where the heuristic will be computed
	 * @param[out] h_val returned heuristic value
	 */
	template <typename Search_Node>
        void eval( const Search_Node* n, Cost_Type& h_val ) {
		
		eval(n->state(),h_val);
	}

	/**
	 * @brief Evaluates a fluent vector representing the current state, and returns the heuristic value 
	 * 
	 * @param[in] s Fluent vector representing the current state
	 * @param[out] h_val returned heuristic value
	 */
	virtual void eval( const Fluent_Vec& s, Cost_Type& h_val ) {
		m_plan_extractor.base_h().eval( s, h_val );
	}

	/**
	 * @brief Evaluates from the current state, and returns the heuristic value 
	 * 
	 * @param[in] s Current state
	 * @param[out] h_val returned heuristic value
	 */
	virtual void eval( const State& s, Cost_Type& h_val ) {
		std::vector<Action_Idx> po;
		eval( s, h_val, po );
	}
	
	/**
	* @brief Evaluates from the current state, and returns the heuristic value as well as the prefered operators 
	 * 
	 * @param[in] s Current state
	 * @param[out] h_val returned heuristic value
	 * @param[out] pref_ops returned prefered operators
	 */
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops ) {
		m_plan_extractor.compute( s, h_val, pref_ops );
	}
  
	/**
	* @brief Evaluates from the current state, and returns the heuristic value, prefered operators as well as the actions in the relaxed plan 
	 * 
	 * @param[in] s Current state
	 * @param[out] h_val returned heuristic value
	 * @param[out] pref_ops returned prefered operators
	 * @param[out] rel_plan returns the actions in the relaxed plan
	 */
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan ) {
		m_plan_extractor.compute( s, h_val, pref_ops, &rel_plan );
	}

	/**
	* @brief Evaluates from the current state up to the goals provided, and returns the heuristic value as well as the prefered operators  
	 * 
	 * @param[in] s Current state
	 * @param[out] h_val returned heuristic value
	 * @param[out] pref_ops returned prefered operators
	 * @param[in] goals specifies the goals used by the heuristic. If left to NULL, the default goals will be used. 
	 */	
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, Fluent_Vec* goals ) {
		  m_plan_extractor.compute( s, h_val, pref_ops, NULL, goals );
	}
  
  /**
	* @brief Evaluates from the current state up to the goals provided, and returns the heuristic value, prefered operators as well as the actions in the relaxed plan 
	 * 
	 * @param[in] s Current state
	 * @param[out] h_val returned heuristic value
	 * @param[out] pref_ops returned prefered operators
	 * @param[out] rel_plan returns the actions in the relaxed plan

	 * @param[in] goals specifies the goals used by the heuristic. If left to NULL, the default goals will be used. 
	 */	
	virtual void eval( const State& s, Cost_Type& h_val, std::vector<Action_Idx>& pref_ops, std::vector<Action_Idx>& rel_plan, Fluent_Vec* goals ) {
		m_plan_extractor.compute( s, h_val, pref_ops, &rel_plan, goals );
	}
	
	/**
	 * @brief Set to true if you are only interested in the relaxed plan and prefered operators, not the heuristic value.
	 * 
	 * @param b Whether a heuristic value will be returned
	 */
	void ignore_rp_h_value(bool b) {m_plan_extractor.ignore_rp_h_value(b);}

	/**
	 * @brief Set to false if you want to set as helpful actions (prefered operators) all actions applicable in the current state adding a fluent in the relaxed plan. 
	 * If set to true, just the action chosen in the relaxed plan will be returned as helpful. The latter is the classic definition.
	 * 
	 * @param b 
	 */
	void set_one_HA_per_fluent( bool b ) { m_plan_extractor.set_one_HA_per_fluent(b); }

	/**
	 * @brief Indicates if an action in the relaxed plan has a deletes one of the original goals of the problem.
	 * 
	 * @return true 
	 * @return false 
	 */
	bool deletes_goal( ) const	{ return m_plan_extractor.deletes_goal(); }

	/**
	 * @brief returns the heuristic value of fluent p
	 * 
	 * @param p fluent
	 * @return unsigned heuristic value 
	 */
	unsigned value( unsigned p ){ return m_base_heuristic.value(p); }
protected:

	/**
	 * @brief Base heuristic used to extract the relaxed plan
	 * 
	 */
	Primary_Heuristic							m_base_heuristic;

	/**
	 * @brief The Relaxed plan extractor member. It uses the base heuristic member to extract the relaxed plan.
	 * 
	 */
	FF_Relaxed_Plan_Extractor< Primary_Heuristic, Cost_Type, cost_opt >	m_plan_extractor;
};

}

}

#endif // rp_heuristic.hxx
