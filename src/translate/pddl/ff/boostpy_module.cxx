#include<boostpy_strips_interface.hxx>
#include<strips_prob.hxx>
#include<boostpy_ff_to_aptk.hxx>

using namespace boost::python;


BOOST_PYTHON_MODULE(ff_wrapper)
{
    def("gen_problem_description", &aptk::FF_Parser::py_get_problem_description)
    ;
}
