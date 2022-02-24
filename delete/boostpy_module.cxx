#include <boostpy_strips_interface.hxx>
#include <boostpy_tarski_instantiator.hxx>
#include <strips_prob.hxx>
#include <boost/python.hpp>

using namespace boost::python;
using namespace tarski;

BOOST_PYTHON_MODULE(pddl)
{
    boost::python::class_<Tarski_Instantiator>("Tarski_Instantiator")
        .def( init< STRIPS_Interface* >() )
        .def( init< STRIPS_Interface* , boost::python::list&, Formula&,
                boost::python::list&, boost::python::list& >() )
        .def( "instantiate_action", &Tarski_Instantiator::instantiate_action)
        .def( "add_fluents", &Tarski_Instantiator::add_fluents )
        .def( "add_init", &Tarski_Instantiator::add_init )
        .def( "add_goal", &Tarski_Instantiator::add_goal )
        .def( "set_init", &Tarski_Instantiator::set_init )
        .def( "add_goal", &Tarski_Instantiator::add_goal )
        .def( "set_goal", &Tarski_Instantiator::set_goal )
        .def( "add_functions", &Tarski_Instantiator::add_functions )
        .def( "finalize_actions", &Tarski_Instantiator::finalize_actions )
    ;

    boost::python::class_<Identifier>("TI_Identifier")
        .def( init< char, std::string >() )
    ;

    boost::python::class_<Atom>("TI_Atom")
        .def( init< std::string, boost::python::list& >() )
        .def( "publish", &Atom::publish)
    ;
    
    boost::python::class_<Formula>("TI_Formula")
        .def( init<std::string, boost::python::list&, 
                boost::python::list&, bool >() )
    ;

    boost::python::class_<Action>("TI_Action")
        .def(  init< std::string,  boost::python::list&, Formula*,
                boost::python::list&, boost::python::tuple& >() )
        .def( "publish", &Action::publish)
    ;
}
