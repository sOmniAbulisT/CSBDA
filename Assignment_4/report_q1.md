# Report Question 1

# 1. Implementation logic
The primary goal of this task was to transform raw course data from `a4_table1.csv` into a SQL script, `autogen_q1.sql`, that is compatible with the existing MySQL database. 

First, I used Python's `csv.DicReader` to parse the CSV file. This approach allowed intuitive data access to the data through column headers such as `"Course number"` and `"Course name"`. Next, by implementing a Python script with f-string formatting, I automated the generation of hundreds of `INSERT INTO` statements. This improved efficiency and minimized potential errors caused by manual input.

# 2. Data cleaning and preprecessing
To handle dirty data commonly found in real-world datasets, I implemented several preprecessing steps:

## A. String normalization
To standardize human input errors, I implemented a `clean_string` function. This step performans string normalization by:

* Removing meaningless empty parenthness `()`. 
* Converting full-width characters to half-width for consistency.
* Eliminating redundant whitespace using Python’s `.split()` and `.join()` methods.

## B. Majority vote and tie-breaking
Instead of simply skipping duplicates, the scrip uses a majority vote strategy using `collections.Counter`. 

* For each course number, the script counts all occurrences of names and colleges, selecting the most frequent one as the grounf truth.
* In cases of a tie (e.g., 1:1), the script prioritizes the longest string.

## C. Domain knowledge & manual overrides
Despite automated logic, some edge cases (e.g., different courses sharing a number or cross-college ties) require human intervation. I implemented `override_name` and `override_college` functions to:

* Resolve 1:1 ties that automated logic cannot safely decide such as `agron2013` belonging to bio-resources and life science at same time.
* Protect critical suffixes like `(1)` or `(2)` from being outvoted by incorrect "empty parenthesis" entries.
* Correct "Invalid entry" values based on known academic structures.

Rows that remain "Invalid" even after the override process are intentionally excluded to prevent Foreign Key Constraint violations during database population such as

```
+-----+---------------+----------------------------------------+--------------------+
|     | Course number | Course name                            | Course.in.College  |
+-----+---------------+----------------------------------------+--------------------+
|26   | ntldev5336    | contemporary taiwanese politics        | Invalid entry      |
|222  | ptcsl7909     | general chinese language course (ii)   | Invalid entry      |
|230  | mhi7110       | ai in genomic and epigenomic medicine  | Invalid entry      |
+-----+---------------+----------------------------------------+--------------------+

```