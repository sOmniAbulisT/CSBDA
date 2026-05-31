# Report Question 1

## 1. Intertional bugs discovered and fixes

After analysis the starer code previded in `a5_q1.py` and the testing context within `test_a5_q1_basic.py` and `test_a5_q1_ext.py`, two critical vulnerabilities were identified and resolved:

### A. `TypeError` causing program crash

The assignment specifications explicitly mandate testing for string inputs instead of numbers. However, the original `try...except` syntax in `a5_q1` only guarded against `ValueError`. When the `temperature` parameter receives a string (e.g., `"hot"`) or `None`, the underlying `check_absolute_zero` function triggers a `TypeError`, leading to an unhandled exception and a program crashing.

I Refactored the exception handling structure in the `a5_q1` function to `except (ValueError, TypeError) as e:`, safely bringing type-related errors under the same defense.

### B. Discrepancy between exception propagation and test exception

At first, raising the exception seemed like a good way to enforce strict validation. When the program catches a `ValueError` for temperatures below absolute zero or a `TypeError` for string or `None` inputs, it prints an error message and returns `None`. This helps the program keep running smoothly without stopping because of uncaught errors.

## 2. Test cases designed
A total of 13 test cases were implemented.

### A. Basic Tests (`test_a5_q1_basic.py`)

Aims to verify the mathematical accuracy of the core conversion algorithms and the routing mechanics under perfectly valid inputs:
* `test_f_to_c_1` ~ `3`: Validates Fahrenheit to Celsius conversion across the underlying formula, the internal routing function, and the primary main function.
* `test_c_to_f`: Validates Celsius to Fahrenheit routing.
* `test_c_to_k_freezing`: Validates Celsius to Kelvin routing.
* `test_k_to_f_zero`: Validates Kelvin to Fahrenheit routing at the extreme boundary, utilizing `pytest.approx` to safely handle precision discrepancies in floating point arithmetic.

### B. Extensive Tests (`test_a5_q1_ext.py`)
Aims to evaluate the program's defensive capabilities against adversarial inputs, physical boundaries, and invalid configurations:
* `test_invalid_inputs1`: Assures that an invalid source unit (e.g., `"Z"`) correctly raises a `ValueError`.
* `test_invalid_inputs2`: Assures that identical source and target units (e.g., `"K"` to `"K"`) correctly raise a `ValueError`.
* `test_absolute_zero1`: Assures that a perfectly valid physical temperature boundary (100 K) returns `True`.
* `test_absolute_zero2`: Assures that the standalone `check_absolute_zero` function properly throws a `ValueError` given an invalid low temperature (-100 K).
* `test_absolute_zero3`: Assures that the main function catches the physical boundary error and safely returns `None`.
* `test_string_inputs`: Assures that illegal string types (e.g., `"hot"`) are trapped by the `TypeError` handling logic and return `None`.
* `test_none_inputs`: Assures that an omitted or empty value (`None`) is elegantly caught and safely handled by returning `None`.

