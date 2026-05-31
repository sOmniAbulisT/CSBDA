# pytest test_a5_q1_ext.py
import pytest

import a5_q1


def test_invalid_inputs1():
    with pytest.raises(ValueError, match=r"not a valid degree"):
        a5_q1.a5_q1("Z", "K", 100)


def test_invalid_inputs2():
    with pytest.raises(ValueError, match=r"is equal to"):
        a5_q1.a5_q1("K", "K", 100)


def test_absolute_zero1():
    actual = a5_q1.check_absolute_zero("K", 100)
    expected = True
    assert actual == expected


def test_absolute_zero2():
    with pytest.raises(ValueError, match=r"is less than absolute zero"):
        a5_q1.check_absolute_zero("K", -100)


def test_absolute_zero3():
    actual = a5_q1.a5_q1("K", "F", -100)
    expected = None
    assert actual == expected

def test_string_inputs():
    actual = a5_q1.a5_q1("C", "F", "hot")
    excepted = None
    assert actual == excepted

def test_none_inputs():
    actual = a5_q1.a5_q1("C", "F", None)
    excepted = None
    assert actual == excepted