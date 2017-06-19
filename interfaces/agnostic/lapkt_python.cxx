#include <boost/python.hpp>
#include <action.hxx>
#include <expression.h>
#include <numeric_eff.hpp>


using namespace boost::python;
using namespace aptk;

Fluent_Vec& (Action::* pointer_name)() = &Action::prec_vec;

template <typename T>
struct W{
    T operator()(T p) {
        return p;
    }
};

typedef W<Fluent_Vec& (Action::*)()> WFl;
typedef W<Conditional_Effect_Vec& (Action::*)()> WFc;
typedef W<Numeric_Effect_Vec& (Action::*)()> WFn;
typedef W<Fluent_Set& (Action::*)()> WFs;
typedef W<VarVal_Vec& (Action::*)()> WFvv;

void (Action::* define_ptr)(const Fluent_Vec&, const Fluent_Vec&, const Fluent_Vec&) = &Action::define;
// void Action::define( const Fluent_Vec& precs, const Fluent_Vec& adds, const Fluent_Vec& dels )

BOOST_PYTHON_MODULE(liblapkt)
{
    class_<Action>("Action", no_init)
        .def("prec_vec", WFl()(&Action::prec_vec), return_internal_reference<>())
        .def("add_vec", WFl()(&Action::add_vec), return_internal_reference<>())
        .def("add_set", WFs()(&Action::add_set), return_internal_reference<>())
        .def("del_vec", WFl()(&Action::del_vec), return_internal_reference<>())
        .def("del_set", WFs()(&Action::del_set), return_internal_reference<>())
        .def("edel_vec", WFl()(&Action::edel_vec), return_internal_reference<>())
        .def("edel_set", WFs()(&Action::edel_set), return_internal_reference<>())
        //.def("ceff_vec", WFc()(&Action::ceff_vec))
        .def("num_vec", WFn()(&Action::num_vec), return_internal_reference<>())
        .def("prec_set", WFs()(&Action::prec_set), return_internal_reference<>())
        .def("has_ceff", &Action::has_ceff)
        .def("has_num_eff", &Action::has_num_eff)
        .def("prec_varval", WFvv()(&Action::prec_varval), return_internal_reference<>())
        .def("signature", &Action::signature)
        .def("set_signature", &Action::set_signature)
        .def("name", &Action::name)
        .def("set_name", &Action::set_name)
        .def("index", &Action::index)
        .def("set_index", &Action::set_index)
        .def("define", define_ptr)
        //.def("define", &Action::define)
        .def("define_fluent_list", &Action::define_fluent_list)
        .def("requires", &Action::requires)
        .def("asserts", &Action::asserts)
        .def("retracts", &Action::retracts)
        .def("consumes", &Action::consumes)
        .def("edeletes", &Action::edeletes)
        //.def("can_be_applied_on", &Action::can_be_applied_on)
        //.def("can_be_regressed_from", &Action::can_be_regressed_from)
        .def("set_cost", &Action::set_cost)
        .def("cost", &Action::cost)
        .def("active", &Action::active)
        .def("activate", &Action::activate)
        .def("deactivate", &Action::deactivate)
        //.def("print", &Action::print)
        //.def("are_effect_interfering", &Action::are_effect_interfering)
        //.def("deletes_precondition_of", &Action::deletes_precondition_of)
        //.def("possible_supporter", &Action::possible_supporter)

        //https://stackoverflow.com/questions/26033781/converting-python-io-object-to-stdostream-when-using-boostpython
        //void				print( const STRIPS_Problem& prob, std::ostream& ) const;

    ;

    typedef Expression<float> Expr;
    typedef Add<float> SumExpr;
    typedef Sub<float> SubExpr;
    typedef Mul<float> MulExpr;
    typedef Div<float> DivExpr;
    typedef Const<float> ConstExpr;
    typedef Variable<float> VarExpr;

    class_<SumExpr>("Sum", init<const SumExpr::ExpVec&>());
    class_<SubExpr>("Sub", init<const SubExpr::ExpVec&>());
    class_<MulExpr>("Mul", init<const MulExpr::ExpVec&>());
    class_<DivExpr>("Div", init<const DivExpr::ExpVec&>());
    class_<ConstExpr>("Const", init<ConstExpr::value_type>());
    class_<VarExpr>("Var", init<std::string, size_t>());

    class_<Numeric_Effect>("NumericEffect", init<std::shared_ptr<Expr>, size_t>());

    enum_<CompareType>("CompareType")
            .value("more", CompareType::more)
            .value("more_equal", CompareType::more_equal);

    class_<aptk::Comparison<float> >("Comparision", boost::python::init<unsigned , CompareType , Expression<float> &>());
}
