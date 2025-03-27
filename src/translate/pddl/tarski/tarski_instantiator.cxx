/**
 * @file tarski_instantiator.cxx
 * @author Anubhav Singh (anubhav.singh.er@protonmail.com)
 * @brief
 * @version 0.1
 * @date 2019-10-10
 *
 * @copyright Copyright (c) 2019
 *
 */
#include <tarski_instantiator.hxx>

using namespace tarski;

// Definitions for Identifier Class

//----Constructors
//----------------------------------------------------------------------------//
Identifier::Identifier() {}
// ############################################################################//

//---- Copy Constructor
Identifier::Identifier(const Identifier &other) : m_type(other.m_type), m_name(other.m_name) {}
// #################a###########################################################//

//---- Constructor
//==== Arguments ====//
//---- 1. type - char - 'v' => variable, 'c' => constant
//---- 2. name - string representing the identifier
Identifier::Identifier(char type, std::string name) : m_type(type), m_name(name) {}
// #################a###########################################################//

//---- inplace_copy
//----------------------------------------------------------------------------//
void Identifier::inplace_copy(const Identifier &other)
{
    m_type = other.m_type;
    m_name = other.m_name;
}
// ############################################################################//

// Anu -  This compiles fine, but causes issue when in python imports
//          Workaround-  Define friend function in the class itself
//          Root Cause-  Unknown(Most likely caused by Boost library)
//---- Overload '<' comparison operator
//----------------------------------------------------------------------------//
// bool operator<(const tarski::Identifier& lhs,
//        const tarski::Identifier& rhs)
//{ return std::tie(lhs.get_type(), lhs.get_name()) <
//            std::tie(rhs.get_type(), rhs.get_name()); }
// ############################################################################//

//---- Get m_name
//----------------------------------------------------------------------------//
const std::string &Identifier::get_name() const
{
    return m_name;
}
// ############################################################################//

//---- Get m_type
//----------------------------------------------------------------------------//
const char &Identifier::get_type() const
{
    return m_type;
}
// ############################################################################//

// Definitions for Atom Class

//----Constructors
//----------------------------------------------------------------------------//
Atom::Atom() {}
// ############################################################################//

//---- Constructor
//==== Arguments ====//
//---- 1. subterms: Python list of Atom variables/constants
//----------------------------------------------------------------------------//
Atom::Atom(std::string symbol, py::list &subterms)
{
    m_symbol = std::move(symbol);
    m_term.reserve(py::len(subterms));
    for (int i = 0; i < py::len(subterms); i++)
    {
        m_term.push_back(subterms[i].cast<Identifier>());
    }
}
// ############################################################################//

//---- Constructor
//==== Arguments ====//
//---- 1. subterms: Vector of Atom variables/constants
//----------------------------------------------------------------------------//
Atom::Atom(std::string symbol, std::vector<Identifier> &subterms)
{
    m_symbol = std::move(symbol);
    m_term = subterms;
}
// ############################################################################//

//---- Get m_symbol (Atom name)
//----------------------------------------------------------------------------//
std::string Atom::get_symbol()
{
    return m_symbol;
}
// ############################################################################//

//==== Return: String representation of atom
//----------------------------------------------------------------------------//
std::string Atom::publish()
{
    std::string output;
    // output.reserve(100);
    output.append(m_symbol);
    output.append("(");
    for (auto term = m_term.begin(); term != m_term.end();)
    {
        output.append(term->get_name());
        if (++term != m_term.end())
        {
            output.append(",");
        }
    }
    output.append(")");
    return output;
}
// ############################################################################//

//---- Instantiate atom's variable subterms with constants
//==== Arguments ====//
//---- 1. var_map:  variable to constant mapping
//==== Return: String representation of instantiated atom
//----------------------------------------------------------------------------//
std::string Atom::instantiate(std::map<Identifier, std::string> &var_map)
{
    std::map<Identifier, std::string>::iterator it;
    std::vector<std::string> new_term(m_term.size());
    for (size_t i = 0; i < m_term.size(); i++)
    {
        it = var_map.find(m_term[i]);
        if (it != var_map.end())
        {
            new_term[i] = it->second;
        }
        else
        {
            new_term[i] = m_term[i].get_name();
        }
    }
    std::string atom;
    // atom.reserve(100);
    atom.append(m_symbol);
    atom.append("(");
    for (auto term = new_term.begin(); term != new_term.end();)
    {
        atom.append(*term);
        if (++term != new_term.end())
        {
            atom.append(",");
        }
    }
    atom.append(")");
    return atom;
}
// ############################################################################//

//---- Extract atom's index. Compile away in case of non-fluent atoms
//==== Arguments ====//
//---- 1. var_map:  variable to constant mapping
//---- 2. init:     vector of init atoms(Atom represented by string)
//---- 3. fluent:   map of fluent-atoms(represented by string) to atom-index
//----------------------------------------------------------------------------//
std::pair<int, bool> Atom::compile(std::map<Identifier, std::string> &var_map,
                                   std::vector<std::string> &init, std::map<std::string, int> &fluent)
{
    if (m_symbol == "=")
    {
        size_t count = 0;
        std::map<Identifier, std::string>::iterator it;
        std::vector<std::string> new_term(m_term.size());
        for (size_t i = 0; i < m_term.size(); i++)
        {
            it = var_map.find(m_term[i]);
            if (it != var_map.end())
            {
                new_term[i] = it->second;
            }
            else
            {
                // std::cout << "Error: Attempted to instantiate Atom without" <<
                //         " appropriate variable mapping" << std::endl;
                // throw "Attempted to instantiate Atom without appropriate variable mapping";
                new_term[i] = m_term[i].get_name();
            }
        }
        std::string check = new_term[0];
        for (auto t : new_term)
        {
            if (check == t)
            {
                count++;
            }
        }
        if (count == new_term.size())
        {
            return std::make_pair(-1, true);
        }
        else
        {
            return std::make_pair(-1, false);
        }
    }
    std::string atom(instantiate(var_map));
    std::map<std::string, int>::iterator it;

    it = fluent.find(atom);
    if (it != fluent.end())
    {
        return std::make_pair(it->second, false);
    }
    else
    {
        if (std::find(init.begin(), init.end(), atom) != init.end())
        {
            return std::make_pair(-1, true);
        }
        else
        {
            return std::make_pair(-1, false);
        }
    }
}

// Definitions for Formula Class

//---- Constructor
//----------------------------------------------------------------------------//
Formula::Formula() {}
// ############################################################################//

//---- Constructor
//==== Arguments ====//
//---- 1. atom: Python list of subformulas which are single atoms
//---- 2. formula: Python list of subformulas which are CompoundFormula
//---- 3. dnf_check: true if no OR in any of the subformulas or false
// Anu: dnf_check flag turned out to be unncessary, TO BE REMOVED
//----------------------------------------------------------------------------//
Formula::Formula(std::string symbol, py::list &atom,
                 py::list &formula, bool dnf_check)
{
    m_symbol = symbol;
    m_dnf_check = dnf_check;
    m_subatom.reserve(py::len(atom));
    m_subformula.reserve(py::len(formula));

    for (int i = 0; i < py::len(atom); i++)
    {
        m_subatom.push_back(atom[i].cast<Atom>());
    }
    for (int i = 0; i < py::len(formula); i++)
    {
        m_subformula.push_back(formula[i].cast<Formula>());
    }

    assert(((m_symbol == "not" || m_symbol == "and" || m_symbol == "or") &&
            ((m_subatom.size() + m_subformula.size()) > 0)) ||
           ((m_symbol == "T" || m_symbol == "F" || m_symbol == "not") &&
            ((m_subatom.size() + m_subformula.size()) < 1)));

    m_connective_map["not"] = &Formula::process_not;
    m_connective_map["or"] = &Formula::process_or;
    m_connective_map["and"] = &Formula::process_and;
    m_connective_map["T"] = &Formula::process_tautology;
    m_connective_map["F"] = &Formula::process_contradiction;
}
// ############################################################################//

//==== Return: String representation of Formula
//----------------------------------------------------------------------------//
std::string Formula::publish()
{
    std::string output;
    // output.reserve(200);
    output.append(m_symbol);
    output.append("(");
    for (auto term = m_subformula.begin(); term != m_subformula.end();)
    {
        output.append((*term).publish());
        if (++term != m_subformula.end())
        {
            output.append(",");
        }
    }
    if (output.size() > 1)
    {
        output.append(",");
    }
    for (auto term = m_subatom.begin(); term != m_subatom.end();)
    {
        output.append((*term).publish());
        if (++term != m_subatom.end())
        {
            output.append(",");
        }
    }
    output.append(")");
    return output;
}
// ############################################################################//

//---- COMPILE based on CONNECTIVE string of formula (m_symbol)
//==== Arguments ====//
//---- 1. var_map:  variable to constant mapping
//---- 2. init:     vector of init atoms(Atom represented by string)
//---- 3. fluent:   map of fluent-atoms(represented by string) to atom-index
//---- 4. out_task: LAPKT planner object
//==== Return: Encoded precondition and effects (condition and effect atoms
///================ Applies to all CONNECTIVE: XXX methods ===================//

//----CONNECTIVE: NOT---------------------------------------------------------//
std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool>
Formula::process_not(std::map<Identifier, std::string> &var_map,
                     std::vector<std::string> &init, std::map<std::string, int> &fluent,
                     STRIPS_Interface *out_task)
{
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> ret_val;
    // Check with reserve later
    std::map<std::string, std::string>::iterator it;
    // for(auto atom : m_subatom)
    // for(auto f : m_subformula)

    // only atoms accepted inside "not" formula
    assert(m_subatom.size() == 1);

    std::pair<int, bool> x(m_subatom[0].compile(var_map, init, fluent));
    x.second = !x.second; // Reverse the boolean
    // if idx NOT found just apply the boolean value
    if (x.first == -1)
    {
        ret_val.first.clear();
        ret_val.second = x.second;
    }
    else
    {
        std::vector<std::pair<int, bool>> temp;
        temp.push_back(std::move(x));
        ret_val.first.push_back(std::move(temp));
        unsigned index = x.first;
        // Add a negated atom to STRIPS Problem
        out_task->notify_negated_atom(index);
    }

    return ret_val;
}
// ############################################################################//

//----CONNECTIVE: OR----------------------------------------------------------//
std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool>
Formula::process_or(std::map<Identifier, std::string> &var_map,
                    std::vector<std::string> &init, std::map<std::string, int> &fluent,
                    STRIPS_Interface *out_task)
{
    /*
    std::cout<< "OR CONNECTIVE DETECTED!!" << std::endl;
    std::cout<< this->publish()<<std::endl;
    */
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> ret_val;
    // Check with reserve later
    // process subatoms
    for (size_t i = 0; i < m_subatom.size(); i++)
    {
        // Anu - OPTIMIZATION- Move semantic should be automatic here since
        //                     passing rvalue to contructor- CONFIRM THIS!
        std::pair<int, bool> x(m_subatom[i].compile(var_map, init, fluent));
        if (x.first == -1)
        {
            if (x.second == true)
            {
                ret_val.second = true;
                ret_val.first.clear();
                return ret_val;
            }
            else
            {
                ret_val.second = false;
            }
        }
        else
        {
            ret_val.first.push_back(std::vector<std::pair<int, bool>>{std::move(x)});
        }
    }
    // process subformulas
    for (size_t i = 0; i < m_subformula.size(); i++)
    {
        std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> x(
            m_subformula[i].instantiate(var_map, init, fluent, out_task));
        if (x.first.size() > 0)
        {
            for (size_t j = 0; j < x.first.size(); j++)
            {
                ret_val.first.push_back(x.first[j]);
            }
        }
        else if (x.second == true)
        {
            ret_val.first.clear();
            ret_val.second = true;
            break;
        }
    } // loop-i

    if (ret_val.first.size() > 0 && ret_val.first[0].size() == 0)
    {
        ret_val.first.clear();
        ret_val.second = false;
    }
    return ret_val;
}
// ############################################################################//

//----CONNECTIVE: AND---------------------------------------------------------//
std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool>
Formula::process_and(std::map<Identifier, std::string> &var_map,
                     std::vector<std::string> &init, std::map<std::string, int> &fluent,
                     STRIPS_Interface *out_task)
{
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> ret_val;
    ret_val.first.push_back(std::vector<std::pair<int, bool>>{});
    // Check with reserve later
    // process subatoms
    for (size_t i = 0; i < m_subatom.size(); i++)
    {
        std::pair<int, bool> x(m_subatom[i].compile(var_map,
                                                    init, fluent));
        if (x.first == -1)
        {
            ret_val.second = false;
            if (x.second == false)
            {
                ret_val.first.clear();
                return ret_val;
            }
        }
        else
        {
            ret_val.first[0].push_back(std::move(x));
        }
    }
    // process subformulas
    for (size_t i = 0; i < m_subformula.size(); i++)
    {
        std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> x(
            m_subformula[i].instantiate(var_map, init, fluent, out_task));
        if (x.first.size() > 0)
        {
            size_t n = ret_val.first.size();
            ret_val.first.reserve(n * x.first.size());
            for (size_t j = 0; j < x.first.size(); j++)
            {
                for (size_t k = 0; k < n; k++)
                {
                    size_t index = (j * n) + k;
                    if (j < x.first.size() - 1)
                    { // Skip this for last outer-loop
                        ret_val.first.push_back(ret_val.first[index]);
                    }
                    else
                    {
                        ret_val.first[index].reserve(
                            ret_val.first[index].size() + x.first[j].size());
                        ret_val.first[index].insert(ret_val.first[index].end(),
                                                    x.first[j].begin(), x.first[j].end());
                    }
                } // loop - k
            }     // loop - j
        }
        else if (x.second == false)
        {
            ret_val.first.clear();
            ret_val.second = false;
            return ret_val;
        }
    } // loop-i
    if (ret_val.first.size() > 0 && ret_val.first[0].size() == 0)
    {
        ret_val.first.clear();
        ret_val.second = true;
    }
    return ret_val;
}
// ############################################################################//

//----TAUTOLOGY---------------------------------------------------------------//
std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool>
Formula::process_tautology(std::map<Identifier, std::string> &var_map,
                           std::vector<std::string> &init, std::map<std::string, int> &fluent,
                           STRIPS_Interface *out_task)
{
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> ret_val;

    ret_val.second = true;
    return ret_val;
}
// ############################################################################//

//----CONTRADICTION-----------------------------------------------------------//
std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool>
Formula::process_contradiction(std::map<Identifier,
                                        std::string> &var_map,
                               std::vector<std::string> &init,
                               std::map<std::string, int> &fluent, STRIPS_Interface *out_task)
{
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> ret_val;

    ret_val.second = false;
    return ret_val;
}
// ############################################################################//

//---- Instantiate -----------------------------------------------------------//

std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool>
Formula::instantiate(std::map<Identifier, std::string> &var_map,
                     std::vector<std::string> &init,
                     std::map<std::string, int> &fluent, STRIPS_Interface *out_task)
{
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> ret_val;
    std::map<std::string, functionpointer>::iterator it;

    it = m_connective_map.find(m_symbol);
    if (it != m_connective_map.end())
    {
        ret_val = (this->*it->second)(var_map, init, fluent, out_task);
    }
    else
    {
        std::cout << "Only AND and OR Formulas can be instantiated" << std::endl;
        exit(-1);
    }
    return ret_val;
}
// ############################################################################//

//---- Definitions for Action Class ------------------------------------------//

//---- Constructor
//----------------------------------------------------------------------------//
Action::Action() {}
// ############################################################################//

//---- Constructor
//==== Arguments ====//
//---- 1. name:     Action name
//---- 2. params:   Python list of variable parameters
//---- 3. pre:      Formula representation of precondition
//---- 4. effect:   Python List of effects <condition and effect atoms>
//---- 5. cost:     Python tuple: either (Atom, cost-val)
//---- NOTE-  cost atom is either empty or stores a function call
//----        cost-val is only valid when atom is empty(""), else -1(default)
//----------------------------------------------------------------------------//
Action::Action(std::string name, py::list &var, Formula *pre,
               py::list &effect, py::tuple &cost)
{
    m_name = std::move(name);
    m_pre = pre;
    m_var.reserve(py::len(var));
    for (int i = 0; i < py::len(var); i++)
    {
        Identifier s = var[i].cast<Identifier>();
        m_var.push_back(std::move(s));
    }
    m_effect.reserve(py::len(effect));
    for (int i = 0; i < py::len(effect); i++)
    {
        py::tuple ceff = effect[i];
        Formula &cond = ceff[0].cast<Formula &>();
        py::list ceff_l = ceff[1];

        std::vector<std::pair<Atom, bool>> x;
        x.reserve(py::len(ceff_l));

        for (int j = 0; j < py::len(ceff_l); j++)
        {
            py::tuple eff = ceff_l[j];
            Atom &y = eff[0].cast<Atom &>();
            bool z = eff[1].cast<bool>();

            x.push_back(std::make_pair(y, z));
        }
        m_effect.push_back(std::make_pair(cond, x));
    }
    Atom &x = cost[0].cast<Atom &>();
    float y = cost[1].cast<float>();
    m_cost.push_back(std::make_pair(x, y));
}
// ############################################################################//

//==== Return: String representation of atom
//----------------------------------------------------------------------------//
std::string Action::publish()
{
    std::string output;
    output.append("Action (");
    output.append(m_name);
    for (auto var = m_var.begin(); var != m_var.end();)
    {
        output.append(var->get_name());
        if (++var != m_var.end())
        {
            output.append(" ");
        }
    }
    output.append(")\n");
    output.append("  Pre = ");
    output.append(m_pre->publish());
    output.append("\n  Effects: \n");
    for (auto eff = m_effect.begin(); eff != m_effect.end();)
    {
        output.append("    Condition = ");
        output.append(eff->first.publish());
        output.append("\n");

        output.append("    Effect = {");
        for (auto e = eff->second.begin(); e != eff->second.end();)
        {
            output.append(e->first.publish());
            output.append(" - ");
            output.append(std::to_string(e->second));
            if (++e != eff->second.end())
            {
                output.append(", ");
            }
        }
        output.append("}");
        if (++eff != m_effect.end())
        {
            output.append("\n");
        }
    }
    output.append("\n");
    output.append("  Cost = {");
    for (auto c = m_cost.begin(); c != m_cost.end();)
    {
        output.append(c->first.publish());
        output.append(" - ");
        output.append(std::to_string(c->second));
        if (++c != m_cost.end())
        {
            output.append(", ");
        }
    }
    output.append("}");
    output.append("\n");
    return output;
}
// ############################################################################//
//---- Instantiate Action
//==== Arguments ====//
//---- 1. out_task:         LAPKT planner object pointer
//---- 2. params:           Python tuple of constant parameters
//---- 3. next_action_id :  integer index of action to be set in STRIPS_Problem
//---- 4. fluent:           Mapping of Fluent atoms <string-to-index>
//---- 5. fval:             Mapping of functions <string-to-index>
//----------------------------------------------------------------------------//
void Action::instantiate(STRIPS_Interface *out_task, py::tuple &params,
                         long &next_action_id, std::map<std::string, int> &fluent,
                         std::vector<std::string> &init, std::map<std::string, float> &fval)
{
    std::map<Identifier, std::string> var_map;
    std::vector<std::pair<int, bool>> effect;
    std::vector<std::string> v_params(py::len(params));
    float cost;
    std::vector<std::pair<
        std::vector<std::pair<int, bool>>,
        std::vector<std::pair<int, bool>>>>
        c_effect;

    // create a variable map
    assert(py::len(params) == m_var.size());
    for (int i = 0; i < py::len(params); i++)
    {
        std::string x((params[i].cast<std::string>()));
        var_map[m_var[i]] = x;
        v_params[i] = std::move(x);
    }

    // compute cost
    if (m_cost[0].first.get_symbol() == "")
    {
        // the value is constant and hence function was not passed
        cost = m_cost[0].second;
    }
    else
    {
        // allocate function value
        cost = fval[m_cost[0].first.instantiate(var_map)];
    }
    // compile preconditions
    std::pair<std::vector<std::vector<std::pair<int, bool>>>, bool> pre(
        m_pre->instantiate(var_map, init, fluent, out_task));
    // if pre-condition not-false
    if (((pre.first.size() > 0) && pre.first[0].size() > 0) || (pre.second == true))
    {
        for (auto e : m_effect)
        {
            // condition - formula
            std::pair<std::vector<std::vector<std::pair<int,
                                                        bool>>>,
                      bool>
                cond(e.first.instantiate(
                    var_map, init, fluent, out_task));

            if (cond.first.size() > 0 || cond.second == true)
            {
                std::vector<std::pair<int, bool>> c_effect_atoms;
                for (auto a : e.second)
                {
                    int atom_id = -1;
                    // effect - atom
                    std::string atom = a.first.instantiate(var_map);
                    std::map<std::string, int>::iterator it =
                        fluent.find(atom);
                    if (it != fluent.end())
                    {
                        atom_id = it->second;
                    }
                    else
                    {
                        /*
                        std::cout<<
                            "Warning: effect atoms does not exit in fluents- "
                            << atom <<" Action: "<< m_name << std::endl;
                        */
                        continue;
                    }
                    if (cond.first.size() > 0)
                    {
                        c_effect_atoms.push_back(std::make_pair(
                            atom_id, a.second));
                    }
                    else
                    {
                        effect.push_back(std::make_pair(atom_id, a.second));
                    }
                }
                for (auto c : cond.first)
                {
                    c_effect.push_back(std::make_pair(c, c_effect_atoms));
                }
            } // cond.size>0
        }     // loop over m_effect
        // add actions for all precondition(s), more than 1 if OR in prec
        if (effect.size() > 0 || c_effect.size() > 0)
        {
            std::string name;
            // name.reserve(100);
            name.append("(");
            name.append(m_name);
            for (auto p : v_params)
            {
                name.append(" ");
                name.append(p);
            }
            name.append(")");
            if (pre.second == true)
            {
                out_task->add_action(name, true);
                if (effect.size() > 0)
                {
                    out_task->add_effect(next_action_id, effect);
                }
                for (auto c_e : c_effect)
                {
                    out_task->add_cond_effect(next_action_id, c_e.first,
                                              c_e.second);
                }
                out_task->set_cost(next_action_id, cost);
                next_action_id++;
            }
            else
            {
                for (size_t i = 0; i < pre.first.size(); i++)
                {
                    // Anu - How to correctly split action with OR precond.?
                    // Anu - Add a "-#" at the end of action signature.
                    //          However, then plan can't be validated
                    /*
                    if (i > 0) {
                        name.append("-");
                        name.append(std::to_string(i));
                    }
                    */
                    out_task->add_action(name, true);
                    out_task->add_precondition(next_action_id, pre.first[i]);
                    if (effect.size() > 0)
                    {
                        out_task->add_effect(next_action_id, effect);
                    }
                    for (auto c_e : c_effect)
                    {
                        out_task->add_cond_effect(next_action_id, c_e.first,
                                                  c_e.second);
                    }
                    out_task->set_cost(next_action_id, cost);
                    next_action_id++;
                }
            } // pre.second == true
        }     // effect.size > 0
    }         // pre exists and is not false
}
// ############################################################################//

//---- Definitions for Tarski_Initiator Class --------------------------------//

//---- Constructor
//----------------------------------------------------------------------------//
Tarski_Instantiator::Tarski_Instantiator() {}
// ############################################################################//

//---- Constructor
//----------------------------------------------------------------------------//
Tarski_Instantiator::Tarski_Instantiator(STRIPS_Interface *strips_problem)
{
    m_task = strips_problem;
    m_next_action_id = 0;
}
// ############################################################################//

//---- Constructor
//==== Arguments ====//
//---- 1. task:      LAPKT planner object pointer
//---- 2. init:      Python list of init atoms(Atom represented as string)
//---- 3. goal:      equivapy::lent Formula representation
//---- 4. fluent:    Python list of fluent atoms(Atom represented as string)
//---- 5. f_value:   Python list of tuple of cost specific functions and values
//----------------------------------------------------------------------------//
Tarski_Instantiator::Tarski_Instantiator(STRIPS_Interface *task,
                                         py::list &init, Formula &goal, py::list &fluent,
                                         py::list &f_value)
{
    m_task = task;
    m_next_action_id = 0;

    // notify atoms to task
    add_fluents(fluent);
    // Initialize init
    add_init(init);

    // Initialize goal
    add_goal(goal);

    // Set function values
    add_functions(f_value);
}
// ############################################################################//

//---- Populate m_func (Used to extact action cost)
//==== Arguments ====//
//---- 1. func: Python list of tuple of cost specific functions and values
//----------------------------------------------------------------------------//
void Tarski_Instantiator::add_functions(py::list &func)
{
    for (int i = 0; i < py::len(func); i++)
    {
        py::tuple func_t = func[i];
        m_fval[func_t[0].cast<std::string>()] = func_t[1].cast<float>();
    }
}
// ############################################################################//

//---- Populate m_init
//==== Arguments ====//
//---- 1. init: Python list of init atoms(Atom represented as string)
//----------------------------------------------------------------------------//
void Tarski_Instantiator::add_init(py::list &init)
{
    m_init.reserve(py::len(init));
    for (int i = 0; i < py::len(init); i++)
    {
        std::string atom(init[i].cast<std::string>());
        m_init.push_back(atom);
    }
}
// ############################################################################//

//---- NOTE - call set_init after notifying the negated conditions + add_init
//----------------------------------------------------------------------------//
void Tarski_Instantiator::set_init()
{
    std::map<std::string, int>::iterator it;
    std::vector<std::pair<int, bool>> enc_init;

    for (auto atom : m_init)
    {
        it = m_fluent.find(atom);
        if (it != m_fluent.end())
        {
            enc_init.push_back(std::make_pair(m_fluent[atom], false));
        }
    }
    m_task->set_init(enc_init);
    // for(auto i : m_task->instance()->init()){
    //     std::cout << m_task->instance()->fluents()[i]->signature()<<std::endl;
    // }
}

// ############################################################################//

//---- Populate m_goal
//==== Arguments ====//
//---- 1. goal: equivapy::lent Formula representation
//----------------------------------------------------------------------------//
void Tarski_Instantiator::add_goal(Formula &goal)
{
    std::map<Identifier, std::string> var_map;
    m_goal = goal.instantiate(var_map, m_init, m_fluent, m_task);
}
// ############################################################################//

//---- Set goal in LAPKT planner object
//----------------------------------------------------------------------------//
//---- NOTE - call set_init after notifying the negated conditions + add_goal
void Tarski_Instantiator::set_goal()
{
    if (m_goal.first.size() > 0)
    {
        for (size_t i = 0; i < m_goal.first.size(); i++)
        {
            m_task->set_goal(m_goal.first[i]);
        }
    }
    else
    {
        if (m_goal.second)
        {
            std::cout << " GOAL ALREADY ACHIEVED IN START STATE " << std::endl;
        }
        else
        {
            std::cout << " GOAL NOT REACHABLE " << std::endl;
        }
        exit(-1);
    }
}
// ############################################################################//

//---- Instantiate actions using constant paramaters and push to STRIPS_Problem
//==== Arguments ====//
//---- 1. action: Action object to be instantiated
//---- 2. reachable_params: Python list of action parameters(Constants)
//----------------------------------------------------------------------------//
void Tarski_Instantiator::instantiate_action(tarski::Action &action,
                                             py::list &reachable_params)
{
    for (int i = 0; i < py::len(reachable_params); i++)
    {
        py::tuple x = reachable_params[i];
        action.instantiate(m_task, x, m_next_action_id,
                           m_fluent, m_init, m_fval);
    }
}
// ############################################################################//

//----------------------------------------------------------------------------//
//---- FINALIZE actions would set Fluent_set objects in Actions
void Tarski_Instantiator::finalize_actions()
{
    m_task->finalize_actions();
}
// ############################################################################//

//---- ADD Fluents to STRIPS_Problem object in m_task
//==== Arguments ====//
//---- 1. fluent: Python list of fluent atoms(Atom represented as string)
//----------------------------------------------------------------------------//
void Tarski_Instantiator::add_fluents(py::list &fluent)
{
    for (int i = 0; i < py::len(fluent); i++)
    {
        std::string atom(fluent[i].cast<std::string>());
        m_fluent[atom] = i;
        m_task->add_atom(atom);
    }
    // initialize negated fluent data-structures
    m_task->set_size_negated_fluents(py::len(fluent));
}
// ############################################################################//
