# pytest test_a5_demo.py
import pytest

import a5_demo


def test_basic_one():
    actual = a5_demo.plus_one(1)
    expected = 2
    assert actual == expected


def test_decimal():
    actual = a5_demo.plus_one(1.234)
    expected = 2.234
    assert actual == expected


def test_negative():
    actual = a5_demo.plus_one(-51)
    expected = -50
    assert actual == expected


def test_large_number_fail():
    actual = a5_demo.plus_one(1e6)
    expected = 1000000
    assert actual == expected
