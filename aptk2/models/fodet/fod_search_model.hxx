
#pragma once

#include <fod_problem.hxx>
#include <det_state_model.hxx>
#include <gp_atoms.hxx>

namespace aptk {

	class	FOD_Search_Model : public Det_State_Model< Clause > {

	public:

		typedef typename	Det_State_Model< Clause >::State_Type	State;

		FOD_Search_Model( const FOD_Problem& the_task );
		virtual ~FOD_Search_Model();

		virtual int		num_actions() const;
		virtual State		init() const;
		virtual bool		goal( const State& s ) const;
		virtual bool		is_applicable( const State& s, Action_Idx a ) const;
		virtual void		applicable_set( const State& s, std::vector<Action_Idx>& app_set ) const;
		virtual void		applicable_set_v2( const State& s, std::vector<Action_Idx>& app_set ) const;	

		// MRJ: Returns cost of executing action a on state s
		virtual float		cost( const State& s, Action_Idx a ) const;

		// MRJ: Returns the state resulting from applying action a on state s
		virtual State		next( const State& s, Action_Idx a ) const;

		// MRJ: Outputs a description of the problem
		virtual void 		print(std::ostream &os) const;

		State			goals_achieved( const State& s ) const;
		unsigned		num_goals_achieved( const State& s ) const;

		void			print( const State& s, std::ostream& os ) const;	
		void			print_action( Action_Idx a, std::ostream& os ) const;
	
	protected:

		const	FOD_Problem&	m_task;
	};


}
