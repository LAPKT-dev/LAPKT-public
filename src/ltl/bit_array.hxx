
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

#ifndef __BITARRAY__
#define __BITARRAY__

#include <cstring>
#include <cassert>
#include <cstdint>

namespace aptk
{

	class Bit_Array
	{
	public:
		Bit_Array();
		Bit_Array(unsigned dim);
		Bit_Array(const Bit_Array &other);
		Bit_Array(Bit_Array &&other);
		const Bit_Array &operator=(Bit_Array &&other);
		const Bit_Array &operator=(const Bit_Array &other);

		~Bit_Array();

		void resize(unsigned dim);

		uint32_t *packs()
		{
			return m_packs;
		}

		const uint32_t *packs() const
		{
			return m_packs;
		}

		unsigned npacks() const
		{
			return m_n_packs;
		}

		unsigned max_index() const
		{
			return m_max_idx;
		}

		unsigned size() const // in bytes
		{
			return m_n_packs * 32;
		}

		void set_all()
		{
			memset(m_packs, 0xFFFFFFFF, m_n_packs * sizeof(uint32_t));
		}

		void reset()
		{
			memset(m_packs, 0, m_n_packs * sizeof(uint32_t));
		}

		bool equal(const Bit_Array &other) const
		{
			for (unsigned i = 0; i < m_n_packs; i++)
				if (m_packs[i] != other.m_packs[i])
					return false;
			return true;
		}

		void set(unsigned i)
		{
			assert(i <= (unsigned)m_max_idx);
			unsigned base = i;
			unsigned index = base / 32;
			unsigned offset = base % 32;
			m_packs[index] |= (1 << offset);
		}

		void set(const Bit_Array &other)
		{
			for (unsigned i = 0; i < m_n_packs; i++)
				m_packs[i] |= other.m_packs[i];
		}

		void unset(unsigned i)
		{
			assert(i <= (unsigned)m_max_idx);
			unsigned base = i;
			unsigned index = base / 32;
			unsigned offset = base % 32;
			m_packs[index] &= ~(1 << offset);
		}

		void unset(Bit_Array &other)
		{
			for (unsigned i = 0; i < m_n_packs; i++)
				m_packs[i] &= ~(other.m_packs[i]);
		}

		uint32_t isset(unsigned i) const
		{
			assert(i <= (unsigned)m_max_idx);
			return m_packs[i / 32] & 1 << (i % 32);
		}

		uint32_t operator[](uint32_t i) const
		{
			return m_packs[i / 32] & 1 << (i % 32);
		}

		int count_elements() const
		{
			int count = 0;
			for (unsigned i = 0; i < m_max_idx; i++)
				if (isset(i))
					count++;
			return count;
		}

		bool operator==(const Bit_Array &arr) const
		{
			return equal(arr);
		}

	protected:
		uint32_t *m_packs;
		unsigned m_n_packs;
		unsigned m_pack_sz;
		unsigned m_max_idx;
	};

}

#endif // bitarray.hxx
