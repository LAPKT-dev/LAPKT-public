from __future__ import print_function
from fd.pddl import pddl_types


def construct(functionsymbol, args):
    m = {'-': Substract,
         '*': Multiply,
         '+': Sum,
         '/': Divide}
    if functionsymbol in ('-', '+', '/', '*', 'increase', 'decrease', 'assign'):
        return m[functionsymbol](args)
    args = [x.name for x in pddl_types.parse_typed_list(args)]
    return PrimitiveNumericExpression(functionsymbol, args)


def parse_expression(exp):
    if isinstance(exp, list):
        functionsymbol = exp[0]
        if all(isinstance(x, str) for x in exp):
            return construct(functionsymbol, exp[1:])
        return construct(functionsymbol, tuple(parse_expression(e) for e in exp[1:]))
    elif exp.replace(".", "").isdigit():
        return NumericConstant(float(exp))
    elif exp[0] == "-":
        raise ValueError("Negative numbers are not supported")
    else:
        return PrimitiveNumericExpression(exp, [])


def parse_assignment(alist):
    assert len(alist) == 3
    op = alist[0]
    head = parse_expression(alist[1])
    exp = parse_expression(alist[2])
    if op == "=":
        return Assign(head, exp)
    elif op == "increase":
        return Increase(head, exp)
    if op == "assign" or op == "=":
        return Assign(head, exp)
    elif op == "decrease":
        return Decrease(head, exp)
    else:
        assert False, "Assignment operator not supported."


class FunctionalExpression(object):
    def __init__(self, parts):
        self.parts = tuple(parts)

    def dump(self, indent="  "):
        print("%s%s" % (indent, self._dump()))
        for part in self.parts:
            part.dump(indent + "  ")

    def _dump(self):
        return self.__class__.__name__

    def instantiate(self, var_mapping, init_facts):
        raise ValueError("Cannot instantiate condition: not normalized")

    def pddl(self):
        return ' '.join(x.pddl() for x in self.parts)

    def _postorder_visit(self, method_name, *args):
        part_results = [part._postorder_visit(method_name, *args)
                        for part in self.parts]
        method = getattr(self, method_name)
        return method(part_results, *args)

    def rename_variables(self, renamings):
        return self

    def get_functions(self):
        return set(self)


class NumericConstant(FunctionalExpression):
    parts = ()

    def __init__(self, value):
        if value != int(value):
            raise ValueError("Fractional numbers are not supported")
        self.value = int(value)

    def __eq__(self, other):
        return (self.__class__ == other.__class__ and self.value == other.value)

    def __str__(self):
        return "%s %s" % (self.__class__.__name__, self.value)

    def _dump(self):
        return str(self)

    def _simplified(self, _):
        return self

    def instantiate(self, var_mapping, init_facts):
        return self

    def pddl(self):
        return str(self.value)

    def get_functions(self):
        return set()

    def __hash__(self):
        return self.value


class PrimitiveNumericExpression(FunctionalExpression):
    parts = ()
    def __init__(self, symbol, args):
        self.symbol = symbol
        self.args = tuple(args)
        self.hash = hash((self.__class__, self.symbol, self.args))
        self.initial_value = None
    def __hash__(self):
        return self.hash
    def __eq__(self, other):
        return (self.__class__ == other.__class__ and self.symbol == other.symbol
                and self.args == other.args)
    def __str__(self):
        return "%s %s(%s)" % ("PNE", self.symbol, ", ".join(map(str, self.args)))

    def pddl(self):
        return "({0} {1})".format(self.symbol, ' '.join(x if isinstance(x, str) else x.pddl() for x in self.args))

    def dump(self, indent="  "):
        print("%s%s" % (indent, self._dump()))
        for arg in self.args:
            arg.dump(indent + "  ")

    def _dump(self):
        return str(self)

    def instantiate(self, var_mapping, init_facts):
        args = [var_mapping.get(arg, arg) for arg in self.args]
        pne = PrimitiveNumericExpression(self.symbol, args)
        assert self.symbol != "total-cost"
        found = False
        for fact in init_facts:
            if isinstance(fact, FunctionAssignment):
                if fact.fluent == pne:
                    pne.initial_value = fact.expression.value
                    found = True
                    break
        if not found:
            raise RuntimeError("not found function {0} in init".format(self.symbol))
        return pne

    def rename_variables(self, renamings):
        new_args = [renamings.get(arg, arg) for arg in self.args]
        return self.__class__(self.symbol, new_args)

    def _propagate(self, parts, *args):
        return self.change_parts(parts)

    def change_parts(self, parts):
        return self

    def _simplified(self, _):
        return self

    def get_functions(self):
        return {self}


class Arithmetic(FunctionalExpression):
    def __init__(self, parts):
        self.parts = tuple(parts)

    def pddl(self):
        return '({0} {1})'.format(self.__class__.symbol, ' '.join([x.pddl() for x in self.parts]))

    def instantiate(self, var_mapping, init_facts):
        return self.__class__([x.instantiate(var_mapping, init_facts) for x in self.parts])

    def _simplified(self, part_results, *args):
        return self

    def get_functions(self):
        result = set()
        for part in self.parts:
            result = result.union(part.get_functions())
        return result


class Substract(Arithmetic):
    symbol = '-'


class Sum(Arithmetic):
    symbol = '+'


class Multiply(Arithmetic):
    symbol = '*'


class Divide(Arithmetic):
    symbol = '/'


class FunctionAssignment(object):
    def __init__(self, fluent, expression):
        self.fluent = fluent
        self.expression = expression
    def __str__(self):
        return "%s %s %s" % (self.__class__.__name__, self.fluent, self.expression)
    def dump(self, indent="  "):
        print("%s%s" % (indent, self._dump()))
        self.fluent.dump(indent + "  ")
        self.expression.dump(indent + "  ")
    def _dump(self):
        return self.__class__.__name__
    def instantiate(self, var_mapping, init_facts):
        if not (isinstance(self.expression, (PrimitiveNumericExpression,
                                             NumericConstant,
                                             Substract,
                                             Sum))):
            raise ValueError("Cannot instantiate assignment: not normalized")
        if self.fluent.symbol == "total-cost":
            fluent = self.fluent
            expression = self.expression.instantiate(var_mapping, init_facts)
            return self.__class__(fluent, expression)

        return self.__class__(self.fluent.instantiate(var_mapping, init_facts), self.expression.instantiate(var_mapping, init_facts))
    def __repr__(self):
        return "< {0} {1} {2} >".format(self.symbol, self.fluent, self.expression)
    def pddl(self):
        return "({0} {1} {2})".format(self.symbol, self.fluent.pddl(), self.expression.pddl())


class Assign(FunctionAssignment):
    symbol = "="
    def __str__(self):
        return "%s := %s" % (self.fluent, self.expression)


class Increase(FunctionAssignment):
    symbol = "increase"
    def pddl(self):
        return "(increase {0} {1})".format(self.fluent.pddl(), self.expression.pddl())


class Decrease(FunctionAssignment):
    symbol = "decrease"

