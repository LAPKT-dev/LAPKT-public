#include "numeric_eff.hpp"

using namespace aptk;

Numeric_Effect::Numeric_Effect(std::shared_ptr<Expression<float>> expr, size_t num_fluent_idx):
        m_fluent_idx(num_fluent_idx),
        m_expr(expr)
{}

void Numeric_Effect::apply(State & s){
    s.set_value(m_fluent_idx, m_expr->eval(s.value_vec()));
}
