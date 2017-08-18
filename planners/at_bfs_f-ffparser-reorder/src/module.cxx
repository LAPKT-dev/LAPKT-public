#include <py_strips_prob.hxx>
#include <helpers.hxx>



using namespace boost::python;


class ATSolver: public Solver{
public:
   ATSolver(aptk::STRIPS_Problem * problem, bool enable_siw, bool enable_bfs,
            std::string out):
       m_problem(problem), m_enable_siw(enable_siw),
       m_enable_bfs_f(enable_bfs),
       m_output_path(out){}
   void solve(){
       run_planners(*m_problem, m_enable_siw, m_enable_bfs_f, m_output_path, 2, 2);
   }

private:
   aptk::STRIPS_Problem * m_problem;
   bool m_enable_siw;
   bool m_enable_bfs_f;
   std::string m_output_path;
};


class ATFactory: public SolverFactory {
public:
    ATFactory(std::string out, bool enable_siw, bool enable_bfs):
        output_path(out), m_enable_siw(enable_siw), m_enable_bfs(enable_bfs){}

    virtual Solver * build( aptk::STRIPS_Problem * problem) const {
        return new ATSolver(problem, m_enable_siw, m_enable_bfs, output_path);
    }
private:
    std::string output_path;
    bool m_enable_siw;
    bool m_enable_bfs;
};


BOOST_PYTHON_MODULE( libatbfsf )
{
    class_<Solver, boost::noncopyable>("Solver", no_init);

    class_<SolverFactory, boost::noncopyable>("SolverFactory", no_init);

    class_<STRIPS_Problem>("STRIPS_Problem")
         .def( init<>() )
		.def( init< std::string, std::string >() )
        .def( "add_atom", &STRIPS_Problem::add_atom )
        .def( "add_action", &STRIPS_Problem::add_action )
        .def( "add_mutex_group", &STRIPS_Problem::add_mutex_group )
        .def( "num_atoms", &STRIPS_Problem::n_atoms )
        .def( "num_actions", &STRIPS_Problem::n_actions )
        .def( "get_atom_name", &STRIPS_Problem::get_atom_name )
        .def( "get_domain_name", &STRIPS_Problem::get_domain_name )
        .def( "get_problem_name", &STRIPS_Problem::get_problem_name )
        .def( "add_precondition", &STRIPS_Problem::add_precondition )
        .def( "add_function",  &STRIPS_Problem::add_function)
        .def( "define_action", &STRIPS_Problem::define_action)
        .def( "add_comparison", &STRIPS_Problem::add_comparison)
        .def( "add_effect", &STRIPS_Problem::add_effect )
        .def( "add_cond_effect", &STRIPS_Problem::add_cond_effect )
        .def( "set_cost", &STRIPS_Problem::set_cost )
        .def( "notify_negated_conditions", &STRIPS_Problem::notify_negated_conditions )
        .def( "create_negated_fluents", &STRIPS_Problem::create_negated_fluents )
        .def( "add_negated_conditions", &STRIPS_Problem::add_negated_conditions)
        .def( "set_init", &STRIPS_Problem::set_init )
        .def( "set_init_num", &STRIPS_Problem::set_init_num )
        .def( "set_goal", &STRIPS_Problem::set_goal )
        .def( "set_domain_name", &STRIPS_Problem::set_domain_name )
        .def( "set_problem_name", &STRIPS_Problem::set_problem_name )
        .def( "write_ground_pddl", &STRIPS_Problem::write_ground_pddl )
        .def( "print_action", &STRIPS_Problem::print_action )
        .def( "setup", &STRIPS_Problem::setup )
        .def( "solve", &STRIPS_Problem::solve )
        .def( "set_metric_expression", &STRIPS_Problem::set_metric_expression)
        .def( "set_add_cost", &STRIPS_Problem::set_add_cost)
	;

    class_<ATSolver, bases<Solver> >("ATSolver", no_init);

    class_<ATFactory,  bases<SolverFactory> >("ATFactory", init<std::string, bool, bool>() );

}
