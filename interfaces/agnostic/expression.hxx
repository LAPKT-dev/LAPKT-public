#ifndef EXPRESSION_H
#define EXPRESSION_H
#include <set>
#include <vector>
#include <string>
#include <memory>


namespace aptk {

template <typename T>
class Expression
{
public:
    typedef T value_type;
    virtual T eval(const std::vector<T> & table) = 0;
    virtual std::set<std::size_t> fluent_indices() const = 0;
};


template <typename T>
class ExprWithArgs: public Expression<T> {
public:
    typedef std::vector< std::shared_ptr<Expression<T> > > ExpVec;

    ExprWithArgs(const ExpVec & args):
        m_args(args){}


    std::set<std::size_t> fluent_indices() const {
        std::set<std::size_t> result{};
        for(auto const & expr: m_args){
            std::set<std::size_t> tmp = expr->fluent_indices();
            result.insert(tmp.begin(), tmp.end());
        }
        return result;
    }


protected:
    std::vector< std::shared_ptr<Expression<T>> > m_args;
};


template <typename T>
class Add: public ExprWithArgs<T> {
public:
    using ExprWithArgs<T>::m_args;
    using ExprWithArgs<T>::ExpVec;

    Add(const typename ExprWithArgs<T>::ExpVec & args):
        ExprWithArgs<T>(args){}

    T eval(const std::vector<T> &table){
        T result = 0;
        for(std::shared_ptr<Expression<T>> & arg: m_args){
            result += arg->eval(table);
        }
        return result;
    }
};


template <typename T>
class Sub: public ExprWithArgs<T> {
public:
    using ExprWithArgs<T>::m_args;
    using ExprWithArgs<T>::ExpVec;

    Sub(const typename ExprWithArgs<T>::ExpVec & args):
        ExprWithArgs<T>(args){}

    T eval(const std::vector<T> & table){
        T result = m_args[0]->eval(table);
        for(auto it=++(m_args.begin()); it != m_args.end(); it++){
            result -= (*it)->eval(table);
        }
        return result;
    }

};


template <typename T>
class Mul: public ExprWithArgs<T>  {
public:
    using ExprWithArgs<T>::m_args;
    using ExprWithArgs<T>::ExpVec;

    Mul(const typename ExprWithArgs<T>::ExpVec & args):
        ExprWithArgs<T>(args){}

    T eval(const std::vector<T> & table){
        T result = m_args[0]->eval(table);
        for(auto it=++(m_args.begin()); it != m_args.end(); it++){
            result *= (*it)->eval(table);
        }
        return result;
    }

};


template <typename T>
class Div: public ExprWithArgs<T>  {
public:
    using ExprWithArgs<T>::m_args;
    using ExprWithArgs<T>::ExpVec;

    Div(const typename ExprWithArgs<T>::ExpVec & args):
        ExprWithArgs<T>(args){}

    T eval(const std::vector<T> &table){
        T result = m_args[0]->eval(table);
        for(auto it=++(m_args.begin()); it != m_args.end(); it++){
            result /= (*it)->eval(table);
        }
        return result;
    }

    static std::shared_ptr< Expression<T> > make_shared(const typename ExprWithArgs<T>::ExpVec & args){
        return std::make_shared< Div<T> >(args);
    }

};


template <typename T>
class Const: public Expression<T> {
public:

    Const(T value): m_value(value) {}

    T eval(const std::vector<T> &table){
        return m_value;
    }

    static std::shared_ptr< Expression<T> > make_shared(T value){
        return std::make_shared< Const<T> >(value);
    }

    std::set<std::size_t> fluent_indices() const {
        return std::set<std::size_t>{};
    }

protected:
    T m_value;
};


template <typename T>
class Variable: public Expression<T> {
public:
    Variable(std::string name, size_t idx): m_name(name), m_idx(idx){

    }

    T eval(const std::vector<T> &table){
        return table[m_idx];
    }

    std::set<std::size_t> fluent_indices() const {
        std::set<std::size_t>  result = std::set<size_t>{};
        result.insert(m_idx);
        return result;
    }


    static std::shared_ptr< Expression<T> > make_shared(std::string name, size_t idx){
        return std::make_shared< Variable<T> >(name, idx);
    }

protected:
    std::string m_name;
    size_t m_idx;

};


}

#endif // EXPRESSION_H
