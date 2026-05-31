# Report Question 3

## 1. Intertional bugs discovered and fixes

By starter code in `a5_q3.py` against the original specification from Assignment 1, multiple critical intentional vulnerabilities and edge-case gaps were discovered.

### A. Python negative indexing error

The original script used `string.ascii_lowercase[char - 1]` without checking whether char was within the valid range. If an user enters `char = 0,` which is invalid, Python evaluates the index as -1. Since Python supports negative indexing, the program does not reject the input. Instead, it returns the last letter, `'z'`, repeated several times. This is a logic error.

To fix this issue, I added an explicit boundary check, `1 <= char <= 26`, before indexing the string. This ensures that `0` and negative values are rejected before they can produce an incorrect result.

### B. Missing boundary for repetitions

The requires rep to be in the range `1 <= rep <= 50`, but the starter code did not limit this. Values such as `51` or `100` produced strings that were longer than allowed, while negative values silently returned an empty string `""` because of Python's string multiplication behavior.

To prevent this, I added the boundary check `1 <= rep <= 50`, so values outside the allowed range are rejected immediately.

### C. Lack of type defense

The program assumed that the inputs would always be integers. If a user passed a string, such as `"a"`, a float, such as `2.5`, or `None`, the operations `char - 1` or `char * rep` could cause an unhandled TypeError and stop the program.

To fix this issue, I used Python’s `isinstance()` function to check that both inputs are integers. If either input has the wrong type, the error is handled inside a `try...except` block and converted into a clear `ValueError` that the testing framework can capture.

## 2. Test Cases Designed

A total of 11 test cases were arranged.

### A. Basic Tests (`test_a5_q3_basic.py`)
Evaluates the core string multiplication and character mapping correctness, assuming all inputs are perfectly valid:
* `test_a5_q3_one`: Tests the minimum boundary for characters (`char = 1`), verifying it correctly maps to `'a'`.
* `test_a5_q3_two`: Tests the maximum boundary for characters (`char = 26`), verifying it correctly maps to `'z'` without index errors.
* `test_a5_q3_three`: Tests the minimum repetition constraint (`rep = 1`), validating standard single character output.
* `test_a5_q3_four`: Tests the maximum repetition constraint (`rep = 50`), ensuring the algorithm handles the upper limit of the permissible string safely.

### B. Extensive Tests (`test_a5_q3_ext.py`)
Evaluates the program's resilience and error handling capabilities against unexpected or malformed entries:
* `test_a5_q3_ext_one`: Ensures that passing an invalid string type instead of a number for `char` throws a `ValueError`.
* `test_a5_q3_ext_two`: Ensures that a float number repetition triggers the validation defense.
* `test_a5_q3_ext_three`: Refactors the original `test_template` placeholder to confirm that `None` inputs are caught and throw a `ValueError` as expected.
* `test_a5_q3_ext_four` & `test_a5_q3_ext_five`: Validates numerical boundaries outside the specified 1–26 scale (testing `0` and `27`).
* `test_a5_q3_ext_six` & `test_a5_q3_ext_seven`: Validates numerical boundaries outside the specified 1–50 repetition scale (testing `0` and `51`).

