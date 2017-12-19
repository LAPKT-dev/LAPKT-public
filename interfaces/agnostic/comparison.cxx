#include <comparison.hxx>
#include <strips_state.hxx>


const aptk::Value_Vec & aptk::get_vec(aptk::State & s){
    return s.value_vec();
}

void aptk::_update_fluent(aptk::State & s, aptk::CompareType m_type, float f, size_t m_fluent_idx) {
    if (m_type == aptk::CompareType::more_equal){
        if (f >= 0){
            s.set(m_fluent_idx);
        } else {
            s.unset(m_fluent_idx);
        }
    } else {
        if (f > 0) {
            s.set(m_fluent_idx);
        } else {
            s.unset(m_fluent_idx);
        }
    }
}
