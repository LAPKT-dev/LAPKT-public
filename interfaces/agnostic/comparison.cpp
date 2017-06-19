#include "comparison.h"
#include <strips_state.hxx>


using namespace aptk;


Comparison::Comparison()
{
}


void Comparison::update_fluent(State & s){
    const Value_Vec & vec = s.value_vec();
    const float f = m_expr.eval(vec);
    if (m_type == CompareType::more){
        if (f >= 0){
            s.set(m_fluent_idx);
        }
    } else {
        if (f > 0) {
            s.set(m_fluent_idx);
        }
    }
}
