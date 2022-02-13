#!/usr/bin/env python3

import pytest

# Tarski library imports
#-----------------------------------------------------------------------------#
from tarski.io import FstripsReader
from tarski.reachability.asp import *
from tarski.grounding import LPGroundingStrategy, NaiveGroundingStrategy
from tarski.syntax.transform.quantifier_elimination import QuantifierElimination
from tarski.syntax import (QuantifiedFormula, CompoundFormula, Tautology,
    Function, Quantifier, land, CompoundTerm, Contradiction, symref)
from tarski.syntax.builtins import BuiltinPredicateSymbol
from tarski.syntax.transform.substitutions import create_substitution
from tarski.syntax.transform.errors import TransformationError
from tarski.fstrips import (UniversalEffect, AddEffect, DelEffect,
    FunctionalEffect)


def test_Atom():
    print("testing")
    #atom = Atom("test")
    return 0
