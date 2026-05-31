# pytest test_a5_q3_ext.py
import pytest

import a5_q3


def test_a5_q3_ext_one():
    with pytest.raises(ValueError):
        a5_q3.a5_q3("a", 5)

def test_a5_q3_ext_two():
    with pytest.raises(ValueError):
        a5_q3.a5_q3(5, 2.5)

def test_a5_q3_ext_three():
    with pytest.raises(ValueError):
        a5_q3.a5_q3(None, None)

def test_a5_q3_ext_four():
    with pytest.raises(ValueError):
        a5_q3.a5_q3(0, 5)

def test_a5_q3_ext_five():
    with pytest.raises(ValueError):
        a5_q3.a5_q3(27, 6)
    
def test_a5_q3_ext_six():
    with pytest.raises(ValueError):
        a5_q3.a5_q3(15, 0)

def test_a5_q3_ext_seven():
    with pytest.raises(ValueError):
        a5_q3.a5_q3(18, 51)