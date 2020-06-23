#include <py_ff_to_aptk.hxx>
#include <boost/python.hpp>

using namespace boost::python;

BOOST_PYTHON_MODULE(libff_py_interface)
{
    def("gen_problem_description", &aptk::FF_Parser::py_get_problem_description)
    ;
}
