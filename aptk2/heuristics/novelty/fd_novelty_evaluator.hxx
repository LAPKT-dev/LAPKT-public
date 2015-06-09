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

#ifndef __FD_NOVELTY_EVALUATOR__
#define __FD_NOVELTY_EVALUATOR__

#include <vector>
#include <boost/container/flat_set.hpp>
#include <aptk2/heuristics/interfaces/novelty_evaluator.hxx>
#include <aptk2/heuristics/novelty/tuples.hxx>
#include <cassert>

namespace aptk {

	template < typename StateType >
	class FiniteDomainNoveltyEvaluator : public NoveltyEvaluator< StateType > {
	public:
		typedef std::vector< boost::container::flat_set< ValuesTuple > >	NoveltyTables;
		typedef NoveltyEvaluator< StateType >		BaseClass;

		FiniteDomainNoveltyEvaluator()
			: BaseClass() {
		}
		virtual ~FiniteDomainNoveltyEvaluator() { }

		virtual unsigned	initialize( const StateType& s ) {
			return 1;
		}

		virtual unsigned	evaluate( const StateType& s ) {
			assert( _tables.size() > 0 );

			s.get_valuation( _varnames, _valuation );

			unsigned current_novelty = 0;

			for ( unsigned i = 0; i < _varnames.size(); i++  ) {
				VariableIndex X = _varnames[i];
				ValueIndex v = _valuation[i];
				ValuesTuple t(1,false);
				t.add( X, v );
				auto result = _tables[1].insert(t);
				if (! result.second) continue; // This tuple was already accounted for
				current_novelty=1; // It wasn't
			}
			if ( current_novelty == 1 ) {
				_counts[1]++;
				return current_novelty;
			}

			unsigned min_novelty = 2;

			while ( min_novelty <= BaseClass::max_novelty() ) {
				ValuesTupleIterator it( _varnames, _valuation, min_novelty );
				ValuesTuple t( min_novelty );
				bool updated_tables = false;
				while ( it.next(t) ) {
					auto result = _tables[min_novelty].insert( t );
					updated_tables |= result.second;
				}
				if ( updated_tables ) {
					_counts[min_novelty]++;
					return min_novelty;
				}
				min_novelty++;
			}

			_counts[0]++;
			return _varnames.size() + 1;
		}

		virtual void		reset() {
			_tables.resize( BaseClass::max_novelty() + 1 );
			_counts.resize( BaseClass::max_novelty() + 1 );
			for ( unsigned k = 0; k <= BaseClass::max_novelty(); k++ )
				_counts[k] = 0;
		}

		void	get_num_states( unsigned novelty ) { return _counts[novelty]; }

	protected:

		NoveltyTables			_tables;
		std::vector< VariableIndex >	_varnames;
		std::vector< ValueIndex >	_valuation;
		std::vector< unsigned >		_counts;

	};

}


#endif // fd_novelty_evaluator.hxx
