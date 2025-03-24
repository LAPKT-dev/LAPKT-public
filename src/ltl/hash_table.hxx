
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

#ifndef __HASH_TABLE__
#define __HASH_TABLE__

#include <vector>
#include <list>
#include <algorithm>
#include <jenkins_12bit.hxx>

namespace aptk
{

	class Hash_Key
	{
	public:
		Hash_Key()
				: m_code(0)
		{
		}

		Hash_Key(const Hash_Key &other)
		{
			m_code = other.m_code;
		}

		Hash_Key(size_t code)
		{
			m_code = code;
		}

		const Hash_Key &operator=(const Hash_Key &other)
		{
			m_code = other.m_code;
			return *this;
		}

		~Hash_Key()
		{
		}

		void add(unsigned k);
		void add(std::vector<unsigned> &k);
		void add(const Bit_Array &bits);

		operator size_t() const
		{
			return m_code;
		}

	protected:
		unsigned m_code;
	};

	inline void Hash_Key::add(unsigned k)
	{
		m_code = jenkins_hash((ub1 *)&k, sizeof(unsigned), m_code);
	}

	inline void Hash_Key::add(std::vector<unsigned> &k)
	{
		if (k.empty())
		{
			unsigned k2 = 0;
			m_code = jenkins_hash((ub1 *)&k2, sizeof(unsigned), m_code);
			return;
		}

		std::sort(k.begin(), k.end());
		m_code = jenkins_hash((ub1 *)(&k[0]), sizeof(unsigned), m_code);
		for (unsigned i = 1; i < k.size(); i++)
		{
			m_code = jenkins_hash((ub1 *)(&k[i]), sizeof(unsigned), m_code);
		}
	}

	inline void Hash_Key::add(const Bit_Array &k)
	{
		m_code = jenkins_hash((ub1 *)(&k.packs()[0]), sizeof(unsigned), m_code);
		for (unsigned i = 1; i < k.npacks(); i++)
		{
			m_code = jenkins_hash((ub1 *)(&k.packs()[i]), sizeof(unsigned), m_code);
		}
	}

	template <typename T>
	class Hash_Table
	{
	public:
		typedef T Object;
		typedef std::list<std::pair<unsigned, Object *>> Node_List;
		typedef std::vector<Node_List> Table;

		Hash_Table(unsigned hash_sz);
		~Hash_Table();

		void setOwner(bool o) { m_owner = o; }
		void clear();

		/*
		size_t compute_hash( std::vector<unsigned>& atoms) const
		{
			if ( atoms.empty() )
			{
				unsigned k = 0;
				unsigned h = jenkins_hash( (ub1*)&k, sizeof(unsigned), 0 );
				return h;
			}

			std::sort( atoms.begin(), atoms.end() );
			unsigned h = jenkins_hash( (ub1*)(&atoms[0]), sizeof(unsigned), 0 );
			for ( unsigned i = 1; i < atoms.size(); i++ )
			{
				h = jenkins_hash( (ub1*)(&atoms[i]), sizeof(unsigned), h );
			}
			return h;
		}
		*/
		Object *get_element(Hash_Key &h, Object *other) { return get_element((size_t)h, other); }
		Object *get_element(unsigned h, Object *other)
		{
			assert(m_buckets.size() > 0);
			unsigned address = h & (m_buckets.size() - 1);

			for (typename Node_List::iterator i = m_buckets[address].begin();
					 i != m_buckets[address].end(); i++)
				if (i->first == h)
				{
					if (*other == *(i->second))
					{
						return i->second;
					}
				}
			return NULL;
		}

		void add_element(Hash_Key &h, Object *obj) { add_element((size_t)h, obj); }
		void add_element(unsigned h, Object *obj)
		{
			unsigned address = h & (m_buckets.size() - 1);
			m_buckets[address].push_back(std::make_pair(h, obj));
		}

		void remove_element(Hash_Key &h, Object *obj) { remove_element((size_t)h, obj); }
		void remove_element(unsigned h, Object *obj)
		{
			unsigned address = h & (m_buckets.size() - 1);

			typename Node_List::iterator p = m_buckets[address].end();
			for (typename Node_List::iterator i = m_buckets[address].begin();
					 i != m_buckets[address].end(); i++)
			{
				if (i->first == h && (*obj == *(i->second))) // element found
				{
					if (m_owner)
						delete i->second;
					p = i;
					break;
				}
			}
			if (p != m_buckets[address].end())
				m_buckets[address].erase(p);
		}

	protected:
		Table m_buckets;

		// delete on clear/remove/etc ?
		bool m_owner;
	};

	// Inlined methods
	template <typename T>
	Hash_Table<T>::Hash_Table(unsigned hash_sz)
	{
		m_owner = true;
		m_buckets.resize(hash_sz);
	}

	template <typename T>
	Hash_Table<T>::~Hash_Table()
	{
		for (unsigned i = 0; i < m_buckets.size(); i++)
		{
			if (m_owner)
				for (typename Node_List::iterator it = m_buckets[i].begin();
						 it != m_buckets[i].end(); it++)
					delete it->second;
			m_buckets[i].clear();
		}
		m_buckets.clear();
	}

	template <typename T>
	void Hash_Table<T>::clear()
	{
		for (unsigned i = 0; i < m_buckets.size(); i++)
		{
			if (m_owner)
				for (typename Node_List::iterator it = m_buckets[i].begin();
						 it != m_buckets[i].end(); it++)
					delete it->second;
			m_buckets[i].clear();
		}
	}

}

#endif
