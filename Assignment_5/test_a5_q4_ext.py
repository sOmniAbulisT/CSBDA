# pytest test_a5_q4_ext.py
import pytest

import a5_q4


def test_a5_q4_ext_one():
    with pytest.raises(ValueError):
        a5_q4.a5_q4([])

def test_a5_q4_ext_two():
    with pytest.raises(ValueError):
        a5_q4.a5_q4(123546)

def test_a5_q4_ext_three():
    with pytest.raises(ValueError):
        a5_q4.a5_q4("string")

def test_a5_q4_ext_four():
    with pytest.raises(ValueError):
        a5_q4.a5_q4([1, 2, "bb", 4])

def test_a5_q4_ext_five():
    with pytest.raises(ValueError):
        a5_q4.a5_q4([3, 6, True])

def test_a5_q4_ext_six():
    with pytest.raises(ValueError):
        a5_q4.a5_q4([1.3, 4.8, float("Inf")])

def test_a5_q4_ext_seven():
    with pytest.raises(ValueError):
        a5_q4.a5_q4([1.3, 4.8, float("Inf")])