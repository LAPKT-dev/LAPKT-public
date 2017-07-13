#ifndef NUMERIC_EFF_H
#define NUMERIC_EFF_H

#include <types.hxx>
#include <strips_prob.hxx>
#include <strips_state.hxx>


namespace aptk
{

class Numeric_Effect
{
public:
    Numeric_Effect(std::shared_ptr<Expression<float>> expr, int num_fluent_idx);
    void apply(State & s);
    size_t fluentId() const {
        return m_fluent_idx;
    }

private:
    size_t m_fluent_idx;
    std::shared_ptr<Expression<float>> m_expr;
};

}

#endif // NUMERIC_EFF_H
