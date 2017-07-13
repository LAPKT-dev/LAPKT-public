#include <boost/python.hpp>
#include <action.hxx>
#include <expression.hxx>
#include <numeric_eff.hxx>
#include <fwd_search_prob.hxx>
#include <boost/python/stl_iterator.hpp>

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

typedef Expression<float> Expr;
typedef Add<float> SumExpr;
typedef Sub<float> SubExpr;
typedef Mul<float> MulExpr;
typedef Div<float> DivExpr;
typedef Const<float> ConstExpr;
typedef Variable<float> VarExpr;
typedef ExprWithArgs<float> ExprWithArgsF;
typedef std::shared_ptr<Expr> PointerToExpr;

template<typename T>
PointerToExpr exp_vec_constructible(const typename T::ExpVec& arg){
    return std::make_shared<T>(arg);
}

//http://bazaar.launchpad.net/~yade-dev/yade/trunk/view/head:/py/wrapper/customConverters.cpp#L127
template<typename containedType>
struct custom_vector_from_seq{

    custom_vector_from_seq(){ converter::registry::push_back(&convertible,&construct,type_id<std::vector<containedType> >()); }

    static void* convertible(PyObject* obj_ptr){
        // the second condition is important, for some reason otherwise there were attempted conversions of Body to list which failed afterwards.
        if(!PySequence_Check(obj_ptr) || !PyObject_HasAttrString(obj_ptr,"__len__")) return 0;
        return obj_ptr;
    }
    static void construct(PyObject* obj_ptr, converter::rvalue_from_python_stage1_data* data){
         void* storage=((converter::rvalue_from_python_storage<std::vector<containedType> >*)(data))->storage.bytes;
         new (storage) std::vector<containedType>();
         std::vector<containedType>* v=(std::vector<containedType>*)(storage);
         int l=PySequence_Size(obj_ptr); if(l<0) abort(); /*std::cerr<<"l="<<l<<"; "<<typeid(containedType).name()<<std::endl;*/ v->reserve(l); for(int i=0; i<l; i++) { v->push_back(extract<containedType>(PySequence_GetItem(obj_ptr,i))); }
         data->convertible=storage;
    }
};


BOOST_PYTHON_MODULE(liblapkt)
{

    custom_vector_from_seq<PointerToExpr>();
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


    class_<Expr> ("Expr", no_init);

    class_<ExprWithArgsF, bases<Expr> > ("ExprWithArgs", no_init);




    //class_<SumExpr, PointerToExpr >("Sum", init<const SumExpr::ExpVec&>());
    class_<SumExpr, std::shared_ptr<SumExpr>, bases<ExprWithArgsF> >("Sum", no_init)
            .def("__init__", make_constructor(&exp_vec_constructible<SumExpr>));

    //class_<SubExpr, PointerToExpr >("Sub", init<const SubExpr::ExpVec&>());
    class_<SubExpr, std::shared_ptr<SubExpr>, bases<ExprWithArgsF> >("Sub", no_init)
            .def("__init__", make_constructor(&exp_vec_constructible<SubExpr>));

    //class_<MulExpr, PointerToExpr >("Mul", init<const MulExpr::ExpVec&>());
    class_<MulExpr, std::shared_ptr<MulExpr>, bases<ExprWithArgsF> >("Mul", no_init)
            .def("__init__", make_constructor(&exp_vec_constructible<MulExpr>));

    //class_<DivExpr, PointerToExpr >("Div", init<const DivExpr::ExpVec&>());
    class_<DivExpr, std::shared_ptr<DivExpr>, bases<ExprWithArgsF> >("Div", no_init)
            .def("__init__", make_constructor(&exp_vec_constructible<MulExpr>));

    class_<ConstExpr, std::shared_ptr<ConstExpr>, bases<Expr> >("Const", no_init)
            .def("__init__", make_constructor(&ConstExpr::make_shared));

    class_<VarExpr, std::shared_ptr<VarExpr>, bases<Expr> >("Var", no_init)
            .def("__init__", make_constructor(&VarExpr::make_shared));

    class_<Numeric_Effect>("NumericEffect", init<PointerToExpr, int>());

    enum_<CompareType>("CompareType")
            .value("more", CompareType::more)
            .value("more_equal", CompareType::more_equal);

    class_<aptk::Comparison<float> >("Comparision", boost::python::init<unsigned , CompareType , Expression<float> &>());

}
