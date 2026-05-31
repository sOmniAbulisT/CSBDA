# Report Question 4

## 1. Intentional bugs discovered & fixes

The starter code in `a5_q4.py` contained several serious logic errors and robustness issues.

### A. Destructive inner loop reset
The provided script initialized `max`, `min`, and `sum` to `0` at the beginning, but these variables were incorrectly reset to `0` inside the loop on every iteration. As a result, all accumulated values were lost, and the function could return incorrect zero values regardless of the input data.

To correct this issue, I moved the initializations outside the loop so that the tracking variables could be preserved and updated throughout the iteration.

### B. Unsafe zero-initialization for extreme values
The code initialized `max` and `min` as `0`, which can produce incorrect results when all values are negative or all values are positive. For example, for `[-3, -7, -1]`, the true maximum is `-1`, but the faulty logic may return `0` instead.

To fix this issue, I used Python’s built-in `max(n)` and `min(n)` functions after validating the input. This ensures that the maximum and minimum values are calculated correctly from the actual data.

### C. Lack of type and numeric value control
The function did not check whether the input was valid. Non-list inputs, empty lists `[]`, or lists containing strings, booleans, or infinite values (`inf`) could cause the program to crash or return invalid results.

To prevent this, I added explicit validation checks using `isinstance(n, list)`, rejected boolean values with `isinstance(i, bool)`, and used `math.isinf()` to reject infinite values. All invalid cases are handled with `try...except` and converted into a clear `ValueError`.

## 2. Test Cases Designed

A total of 11 test cases were structured across the dual testing suites to maintain a sufficient.

### Basic Tests (`test_a5_q4_basic.py`)
Verifies calculation precision across legal numeric arrays:
* `test_a5_q4_basic_one`: Tests a standard mixed array (matching the spec example) to verify fundamental tracking.
* `test_a5_q4_basic_two`: Tests a single-element list (`[10]`), ensuring the minimum legal boundary maps perfectly across max, min, and sum.
* `test_a5_q4_basic_three`: Tests a uniform negative cluster (`[-3, -7, -1, -5]`) to ensure zero-initialization bugs do not occur.
* `test_a5_q4_basic_four`: Evaluates float handling using `pytest.approx` to counteract binary fractional precision discrepancies.

### Extensive Tests (`test_a5_q4_ext.py`)
Ensures structural resilience against irregular, or mathematically volatile inputs:
* `test_a5_q4_ext_one`: Validates edge cases by verifying that empty arrays `[]` raise a ValueError
* `test_a5_q4_ext_two` & `test_a5_q4_ext_three`: Rejects invalid input types, such as numbers or raw strings, when a list is required.
* `test_a5_q4_ext_four`: Checks list elements to reject invalid string values.
* `test_a5_q4_ext_five`: Explicitly rejects boolean values (`True`/`False`) to prevent them from being treated as integers `1` and `0`.
* `test_a5_q4_ext_six`: Rejects positive infinity values, such as `float("inf")`.
* `test_a5_q4_ext_seven`: Rejects negative infinity values, such as `float("-inf")`.
