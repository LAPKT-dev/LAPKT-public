
/*
Lightweight Automated Planning Toolkit

Copyright 2022
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

#ifndef __SLIDING_WINDOW__
#define __SLIDING_WINDOW__

#include <vector>

// Original code by Geoff Sutcliffe <s3352626@student.rmit.edu.au>

namespace aptk
{

	template <typename T>
	class Sliding_Window
	{

		typedef std::vector<T> Container;

	public:
		Sliding_Window(unsigned N, unsigned thr)
				: m_buffer(N), m_sum(0.0), m_oldest(0), m_count(0), m_threshold(thr), m_settled(false),
					m_total(0)
		{
		}

		~Sliding_Window()
		{
		}

		void push(T v)
		{
			m_total++;
			if (!settled() && m_total > m_threshold)
				set_settled();

			if (m_count < m_buffer.size())
				m_count++;
			else
			{
				T removed = m_buffer[m_oldest];
				m_sum -= removed;
			}
			m_buffer[m_oldest] = v;
			m_oldest = (m_oldest + 1) % m_buffer.size();
			m_sum += v;
		}

		bool settled() const
		{
			return m_settled;
		}

		void set_settled()
		{
			m_settled = true;
		}

		void unset_settled()
		{
			m_settled = false;
		}

		void reset()
		{
			unset_settled();
			m_total = 0;
			m_count = 0;
			m_oldest = 0;
			m_sum = 0.0;
		}

		double get_avg() const
		{
			return (m_count > 0 ? m_sum / (double)m_count : 0.0f);
		}

	protected:
		Container m_buffer;
		double m_sum;
		unsigned m_oldest;
		unsigned m_count;
		unsigned m_threshold;
		bool m_settled;
		unsigned m_total;
	};
}

#endif // sliding_window.hxx
