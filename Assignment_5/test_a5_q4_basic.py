# pytest test_a5_q4_basic.py
import pytest

import a5_q4

def test_a5_q4_basic_one():
    input_list = [2, 4, 8, -2, -4, 12]
    actual = a5_q4.a5_q4(input_list)
    expected = {"max": 12, "min": -4, "sum": 20}
    assert actual == expected

def test_a5_q4_basic_two():
    input_list = [10]
    actual = a5_q4.a5_q4(input_list)
    expected = {"max": 10, "min": 10, "sum": 10}
    assert actual == expected

def test_a5_q4_basic_three():
    input_list = [-3, -7, -1, -5]
    actual = a5_q4.a5_q4(input_list)
    expected = {"max": -1, "min": -7, "sum": -16}
    assert actual == expected

def test_a5_q4_basic_four():
    input_list = [1.5, 2.5, -0.5, 4.0]
    actual = a5_q4.a5_q4(input_list)
    expected = {"max": 4.0, "min": -0.5, "sum": pytest.approx(7.5)}
    assert actual == expected
