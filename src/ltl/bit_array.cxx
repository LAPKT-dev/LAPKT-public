
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
#include <bit_array.hxx>
#include <iostream>

namespace aptk
{

	Bit_Array::Bit_Array()
			: m_packs(NULL), m_n_packs(0), m_pack_sz(32), m_max_idx(0)
	{
	}

	Bit_Array::Bit_Array(unsigned dim)
			: m_packs(NULL), m_pack_sz(32)
	{
		m_max_idx = dim + 1;
		unsigned nbits = (dim + 1);
		m_n_packs = (nbits + 31) / 32;
		m_packs = new unsigned[m_n_packs];
		memset(m_packs, 0, m_n_packs * sizeof(unsigned));
	}

	Bit_Array::Bit_Array(const Bit_Array &other)
	{
		m_pack_sz = 32;
		m_n_packs = other.m_n_packs;
		m_max_idx = other.m_max_idx;
		if (m_n_packs)
		{
			m_packs = new unsigned[m_n_packs];
			memcpy(m_packs, other.m_packs, m_n_packs * sizeof(unsigned));
		}
	}

	Bit_Array::Bit_Array(Bit_Array &&other)
	{
		m_pack_sz = sizeof(unsigned);
		m_n_packs = other.m_n_packs;
		m_packs = other.m_packs;
		m_max_idx = other.m_max_idx;
		other.m_packs = nullptr;
	}

	const Bit_Array &Bit_Array::operator=(Bit_Array &&other)
	{
		m_pack_sz = sizeof(unsigned);
		m_n_packs = other.m_n_packs;
		if (m_packs != nullptr)
			delete m_packs;
		m_packs = other.m_packs;
		m_max_idx = other.m_max_idx;
		other.m_packs = nullptr;
		return *this;
	}

	const Bit_Array &Bit_Array::operator=(const Bit_Array &other)
	{
		m_pack_sz = sizeof(unsigned);
		m_n_packs = other.m_n_packs;
		if (m_packs != nullptr)
			delete m_packs;
		m_packs = new unsigned[m_n_packs];
		m_max_idx = other.m_max_idx;
		memcpy(m_packs, other.m_packs, m_n_packs * sizeof(unsigned));
		return *this;
	}

	void Bit_Array::resize(unsigned dim)
	{
		m_max_idx = dim + 1;
		unsigned nbits = (dim + 1);
		m_n_packs = (nbits / 32) + 1;
		m_packs = new unsigned[m_n_packs];
		memset(m_packs, 0, m_n_packs * sizeof(unsigned));
	}

	Bit_Array::~Bit_Array()
	{
		if (m_packs != NULL)
			delete[] m_packs;
	}

}
