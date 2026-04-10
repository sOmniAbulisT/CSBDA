# Assignment 2 Question 3

## Subquestion 3a

**Commit ID** 
* `[8032e95]`

**Git Command Used** 
* `git restore --source=8032e95 legacy_code.md`
* `git restore legacy_code.md`

**Answer**
* **R:** The input parameter is a **list** and the output is a **list**
* **Python:** The input parameter is a **dictionary** and the out put is a **Set**

## Subquestion 3b

**Commit ID**
* `[d7417c9]`

**Git Command Used**
* `git restore --source=d7417c9 legacy_code.md`
* `git restore legacy_code.md`

**Answer** 

Both are calculated the sum of two values indexed by `"x"` and `"y"` from the input container `n`
* **R:** The function returns a list with named elements `"sum"`
* **Python:** The function returns a dictionary with a key `"sum"`

## Subquestion 3c

**Commit ID**
* `[88ffd61]`

**Git Command Used**
* `git restore --source=88ffd61 legacy_code.md`
* `git restore legacy_code.md`

**Answer**

This code attempts to calculate the sum, difference, and product of two values from input `n`, but it contains several errors. 
Such as the `"difference"` is incorrectly calculated using multiplication, the `"product"` is incorrectly calculated using minus. In addition, the `"sum"`
calculation is assigned twice.
* **R:** The function returns a list with elements `"sum"`, `"difference"`, `"product"`, and `"sum"` (but the mathematical opration is wrong)
* **Python:** The function returns a dictionary, while the code attempts `"sum"` twice, the final dictionary contains only three keys `"sum"`, 
`"difference"`, and `"product"` (but the two corresponding value having incorrect mathematical operations)

## Subquestion 3d

**Commit ID**
* `[7baf27a]`

**Git Command Used**
* `git restore --source=7baf27a legacy_code.md`
* `git restore legacy_code.md`

**Answer**

Compared the previous commit, the following changes were made in both R and Python versions:
* The mathematical operations for `"difference"` and `"product"` have been corrected to match theirs keys. 
* The second `"sum"` was removed and replaced with a new key named `"ratio"`
* The `"ratio"` was added, its mathematical operation is incorrected

## Subquestion 3e

**Command ID**
*`[fc04218]`

**Git Command Used**
* `git restore --source=fc04218 legacy_code.md`
* `git restore legacy_code.md`

**Answer**

In R version, the order of operators for `sum` was swapped from `x+y` to `y+x`. Additionally, the order in which keys are assigned to the 
list/dictionary was rearranged in both R and Python. It doesn't matter. Since, additive is commutative.
