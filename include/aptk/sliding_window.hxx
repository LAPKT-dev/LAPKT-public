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

#ifndef __SLIDING_WINDOW__
#define __SLIDING_WINDOW__

#include <vector>

// Original code by Geoff Sutcliffe <s3352626@student.rmit.edu.au>

namespace aptk {

	template <typename T>
	class Sliding_Window {
	
		typedef std::vector<T>	Container;

	public:

		Sliding_Window( unsigned N, unsigned thr ) 
		: m_buffer( N ), m_sum(0.0), m_oldest(0), m_count(0), m_threshold( thr ), m_settled( false ),
		m_total( 0 ) {
		}

		~Sliding_Window() {
		}

		void	push( T v ) {
			m_total++;
			if ( !settled() && m_total > m_threshold ) 
				set_settled();

			if ( m_count < m_buffer.size() )
				m_count++;
			else {
				T removed = m_buffer[m_oldest];
				m_sum -= removed;
			}
			m_buffer[m_oldest] = v;
			m_oldest = ( m_oldest + 1 ) % m_buffer.size();
			m_sum += v;
		}	

		bool	settled() const {
			return m_settled;
		}

		void	set_settled() {
			m_settled = true;
		}

		void	unset_settled() {
			m_settled = false;
		}

		void	reset() {
			unset_settled();
			m_total = 0;
			m_count = 0;
			m_oldest = 0;
			m_sum = 0.0;
		}

		double	get_avg( ) const {
			return ( m_count > 0 ? m_sum / (double)m_count : 0.0f );
		}

	protected:

		Container	m_buffer;
		double		m_sum;
		unsigned	m_oldest;
		unsigned	m_count;
		unsigned	m_threshold;
		bool		m_settled;
		unsigned	m_total;
	};
}

#endif // sliding_window.hxx
