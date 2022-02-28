#!/usr/bin/env python3

import pytest

# Tarski library imports
#-----------------------------------------------------------------------------#
from tarski_lapkt.io import FstripsReader
from tarski_lapkt.reachability.asp import *
from tarski_lapkt.grounding import LPGroundingStrategy, NaiveGroundingStrategy
from tarski_lapkt.syntax.transform.quantifier_elimination import QuantifierElimination
from tarski_lapkt.syntax import (QuantifiedFormula, CompoundFormula, Tautology,
    Function, Quantifier, land, CompoundTerm, Contradiction, symref)
from tarski_lapkt.syntax.builtins import BuiltinPredicateSymbol
from tarski_lapkt.syntax.transform.substitutions import create_substitution
from tarski_lapkt.syntax.transform.errors import TransformationError
from tarski_lapkt.fstrips import (UniversalEffect, AddEffect, DelEffect,
    FunctionalEffect)


def test_Atom():
    print("testing")
    #atom = Atom("test")
    return 0
