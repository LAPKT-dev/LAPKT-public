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

#ifndef __NEW_NODE_COMPARARER__
#define __NEW_NODE_COMPARARER__

namespace aptk
{

	namespace search
	{

		template <typename Node>
		class Node_Comparer_4H
		{
		public:
			bool operator()(Node *a, Node *b) const
			{
				if (dless(b->h1n(), a->h1n()))
					return true;
				if (dequal(b->h1n(), a->h1n()))
				{
					if (dless(b->h2n(), a->h2n()))
						return true;
					if (dequal(b->h2n(), a->h2n()))
					{
						if (dless(b->h3n(), a->h3n()))
							return true;
						if (dequal(b->h3n(), a->h3n()))
						{
							if (dless(b->h4n(), a->h4n()))
								return true;
						}
					}
				}
				// if ( dless( b->gn(), a->gn() ) )  return true;
				return false;
			}
		};

		template <typename Node>
		class Node_Comparer_2H
		{
		public:
			bool operator()(Node *a, Node *b) const
			{
				if (dless(b->h1n(), a->h1n()))
					return true; // novelty(goalcount,rel_plan)
				if (dequal(b->h1n(), a->h1n()))
				{
					if (dless(b->h2n(), a->h2n()))
						return true; // goalcount
					if (dequal(b->h2n(), a->h2n()))
					{

						if (dless(b->gn(), a->gn()))
							return true; //	BRFS
					}
				}
				return false;
			}
		};

		template <typename Node>
		class Node_Comparer_2H_gn_unit
		{
		public:
			bool operator()(Node *a, Node *b) const
			{
				if (dless(b->h1n(), a->h1n()))
					return true; // novelty(goalcount,rel_plan)
				if (dequal(b->h1n(), a->h1n()))
				{
					if (dless(b->h2n(), a->h2n()))
						return true; // goalcount
					if (dequal(b->h2n(), a->h2n()))
					{

						if (dless(b->gn_unit(), a->gn_unit()))
							return true; //	BRFS
					}
				}
				return false;
			}
		};

	}

}

#endif //
