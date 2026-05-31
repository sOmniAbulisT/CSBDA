# pytest test_a5_q1_basic.py
import pytest

import a5_q1


def test_f_to_c_1():
    actual = a5_q1.convert_f_to_c(32)
    expected = 0
    assert actual == expected


def test_f_to_c_2():
    actual = a5_q1.convert_f_to_others("C", 32)
    expected = 0
    assert actual == expected


def test_f_to_c_3():
    actual = a5_q1.a5_q1("F", "C", 32)
    expected = 0
    assert actual == expected


def test_c_to_f():
    actual = a5_q1.a5_q1("C", "F", 20)
    expected = 68
    assert actual == expected

def test_c_to_k_freezing():
    actual = a5_q1.a5_q1("C", "K", 0)
    excepted = 273.15
    assert actual == excepted

def test_k_to_f_zero():
    actual = a5_q1.a5_q1("K", "F", 0)
    excepted = -459.67
    assert actual == pytest.approx(excepted)