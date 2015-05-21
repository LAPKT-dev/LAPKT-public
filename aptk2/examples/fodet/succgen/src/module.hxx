#ifndef _SUCC_GEN_PY_MODULE_
#define _SUCC_GEN_PY_MODULE_

#include <py_fod_problem.hxx>

class SuccGen_Example : public FOD_Problem {

public:

	SuccGen_Example();
	SuccGen_Example( std::string, std::string );
	~SuccGen_Example();

	void	execute();

protected:

}; 

#endif // module.hxx
