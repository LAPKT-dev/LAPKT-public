#ifndef __HEURISTICS_EXAMPLE__
#define __HEURISTICS_EXAMPLE__

#include <py_fod_problem.hxx>


class Heuristics_Example : public FOD_Problem {
	public:

		Heuristics_Example();
		Heuristics_Example( std::string, std::string );
		virtual ~Heuristics_Example();

		void compute();

	private:
};

#endif // heuristics_example.hxx
