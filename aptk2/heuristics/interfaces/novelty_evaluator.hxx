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
*/

#ifndef __NOVELTY_EVALUATOR__
#define __NOVELTY_EVALUATOR__

namespace aptk {

	template < typename StateType >
	class NoveltyEvaluator {
	public:
	
		NoveltyEvaluator() : _max_novelty(1) {}
		virtual ~NoveltyEvaluator() { }
		
		virtual unsigned	initialize( const StateType& s ) = 0;
		virtual unsigned	evaluate( const StateType& s ) = 0;
		virtual void		reset() = 0;


		void			set_max_novelty( unsigned upper_bound ) { 
			_max_novelty = upper_bound; 
			reset();
		}
		
		unsigned		max_novelty() const { return _max_novelty; }

	protected:
	
		//! Maximum novelty value to be computed
		unsigned		_max_novelty;
	
	};	

}


#endif // novelty_evaluator.hxx
