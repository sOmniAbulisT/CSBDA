# pytest test_a5_q3_basic.py
import pytest

import a5_q3


def test_a5_q3_one():
    actual = a5_q3.a5_q3(1, 3)
    excepted = "aaa"
    assert actual == excepted

def test_a5_q3_two():
    actual = a5_q3.a5_q3(26, 2)
    excepted = "zz"
    assert actual == excepted

def test_a5_q3_three():
    actual = a5_q3.a5_q3(8, 1)
    excepted = "h"
    assert actual == excepted

def test_a5_q3_four():
    actual = a5_q3.a5_q3(15, 50)
    excepted = "o"*50
    assert actual == excepted

