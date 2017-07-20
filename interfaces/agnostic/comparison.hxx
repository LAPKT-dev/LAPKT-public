#ifndef COMPARISON_H
#define COMPARISON_H

#include <expression.hxx>
#include <memory>
#include <types.hxx>

/*
  defines comparison with normal function
 */

namespace aptk {
class State;

using namespace aptk;

enum CompareType {
    more,
    more_equal
};

const Value_Vec & get_vec(aptk::State & s);
void _update_fluent(aptk::State & s, aptk::CompareType m_type, float f, size_t m_fluent_idx);


template
<typename T>
class Comparison
{
public:
    Comparison(unsigned bound_fluent_idx, CompareType a_type, std::shared_ptr<Expression<T>> & a_expr):
        m_fluent_idx(bound_fluent_idx),
        m_type(a_type),
        m_expr(a_expr)
    {
        assert(m_expr);
    }


    void update_fluent(State & s) const {
        const Value_Vec & vec = get_vec(s);
        const float f = m_expr->eval(vec);
        _update_fluent(s, m_type, f, m_fluent_idx);
    }

    Comparison(const Comparison & other):
        m_fluent_idx(other.m_fluent_idx),
        m_type(other.m_type),
        m_expr(other.m_expr)
    {
        assert(m_expr);
    }

private:
    int m_fluent_idx;
    CompareType m_type;
    std::shared_ptr<Expression<T>> m_expr;
};


}
#endif // COMPARISON_H
