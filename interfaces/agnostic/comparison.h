#ifndef COMPARISON_H
#define COMPARISON_H

#include <expression.h>
#include <strips_state.hxx>
#include <memory>

/*
  defines comparison with normal function
 */

namespace aptk {

using namespace aptk;

enum CompareType {
    more,
    more_equal
};

template
<typename T>
class Comparison
{
public:
    Comparison(unsigned bound_fluent_idx, CompareType a_type, Expression<T> & a_expr):
        m_fluent_idx(bound_fluent_idx),
        m_type(a_type),
        m_expr(new Expression<T>(a_expr))
    {}

    void update_fluent(State & s);

    Comparison(const Comparison<T> & other):
        m_fluent_idx(other.m_fluent_idx),
        m_type(other.m_type),
        m_expr(new Expression<T>(*other.m_expr))
    {}

private:
    int m_fluent_idx;
    CompareType m_type;
    std::unique_ptr<Expression<T>> m_expr;
};


}
#endif // COMPARISON_H
