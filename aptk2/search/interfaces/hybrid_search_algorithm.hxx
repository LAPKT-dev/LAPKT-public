/*
Lightweight Automated Planning Toolkit (LAPKT)
Copyright (C) 2015

<contributors>
Miquel Ramirez <miquel.ramirez@gmail.com>
</contributors>

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

Additional note:

Concepts borrowed from Ethan Burn's heuristic search framework.
*/

#pragma once

#include <vector>
#include <iostream>
#include <tuple>
#include <map>
#include <string>

#include <aptk2/tools/logging.hxx>


namespace aptk {

    enum HybridSearchAlgorithmResult {
        FoundSolution = 0,
        ExhaustedSearchSpace,
        DeadEnd,
        TerminalNonGoal,
        NeedsToRunFirst
    };

    inline std::string
    human_readable_result(HybridSearchAlgorithmResult e ) {
        switch( e ) {
            case aptk::HybridSearchAlgorithmResult::FoundSolution:
                return "Yes";
            case aptk::HybridSearchAlgorithmResult::ExhaustedSearchSpace:
                return "Exhausted Search Space";
            case aptk::HybridSearchAlgorithmResult::DeadEnd:
                return "Dead End";
            case aptk::HybridSearchAlgorithmResult::TerminalNonGoal :
                return "Terminal Non Goal";
                break;
            case aptk::HybridSearchAlgorithmResult::NeedsToRunFirst :
                return "Needs to Run";
        }
        return "Can't Happen";
    }

	template < typename StateModel >
	class	HybridSearchAlgorithm {

	public:
        typedef typename StateModel::ActionType::IdType                         ActionType;
        typedef std::tuple< double, ActionType >   PlanEntry;
		typedef std::vector< PlanEntry > Plan;


		//! Constructs a new search algorithm that performs searches
		//! in the given state model.
		HybridSearchAlgorithm( const StateModel& _model ) :
			model( _model ), expanded( 0 ), generated( 0 ), outcome(NeedsToRunFirst),
            plan_duration(std::numeric_limits<double>::max()) {
		}

		virtual ~HybridSearchAlgorithm() {}

		//! This method encapsulates the actual search for a plan achieving the
		//! goal from the provided state s. Argument solution will be empty if there
		//! is no valid plan.
		virtual bool search( const typename StateModel::StateType& s, Plan& solution ) = 0;

		//! Convenience method for when we are interested in starting from the initial state
		virtual bool solve_model( Plan& solution ) {
			LPT_INFO("cout", "Solving model");
			return search( model.init(), solution );
		}

		//! A constant reference to the state model. This is public because it
		//! makes no sense to have an accessor
		const			           StateModel&	model;
		//! Number of expanded states, that is, states for which all successors have
		//! been generated
		unsigned long				expanded;
		//! Number of generated states, that is, states that have been created and
		//! and kept for potential use during the search
		unsigned long				generated;
        //! Maximum depth reached during search
        unsigned                    max_depth;
        //! Search outcomes
        HybridSearchAlgorithmResult outcome;
        //! Plan duration
        double                      plan_duration;

	};

}
