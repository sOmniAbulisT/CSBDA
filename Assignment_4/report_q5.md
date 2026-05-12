# Report Question 5

## 1. Identification of data inconsistencies and and errors
Upon reviewing the `A4_full_survey.csv` file, several critical data quality issues were identified that would prevent successful database insertion:

* Character encoding Artifacts: Several course names contain garbled text or "Mojibake" (e.g.,  (瞽繒), 癒G), likely due to incorrect encoding transitions between Big5 and UTF-8.

* Missing fields: Key identifiers, such as CourseNumber, are missing for certain entries like "Production and Operation Scheduling".

* Granularity mismatch: The "College" field occasionally contains department-level information (e.g., DEPARTMENT OF POLITICAL SCIENCE)  rather than the overarching college name required by the schema.

* Casing and formatting inconsistency: Categorical data like college names and semesters exhibit inconsistent casing, such as College of ENGINEERING (all caps) versus College of Engineering, and spring versus Spring.

## 2. Proposed cleaning and preprocessing steps
To ensure the data is directly usable for the database, the following steps should be implemented:

* Standardize encoding: Re-import the raw CSV using `UTF-8-BOM` to resolve Chinese character display issues and manually verify that course names like "Advanced Biometrics" are correctly rendered.

* Value mapping for colleges: 
1. Create a reference dictionary based on the 17 official NTU colleges.
2. Map department-level strings (e.g., DEPARTMENT OF POLITICAL SCIENCE) to their respective parent college (e.g., College of Social Sciences). 

* Text normalization: 
1. Apply `.strip()` to all string fields to remove accidental leading/trailing whitespaces.
2. Convert all college and semester strings to `Title Case` to ensure uniformity across the dataset.

* Handling missing values:
1. For records missing a `CourseNumber`, perform a lookup using the `CourseName` against a main course catalog.
2. If the data remains unrecoverable, exclude the record to prevent `NOT NULL` constraint violations in the database.

* Deduplication: Filter the dataset to keep only unique occurrences based on a composite key of `Student_ID`, `CourseNumber`, `Year`, and `Semester`.

## 3. Reasoning behind the approach
* Standardizing college names is mandatory because `CollegeId` is a FOREIGN KEY. If the string does not match the existing `College` table exactly, the `INSERT` statement will fail.

* Removing useless characters and standardizing casing ensures that SQL queries (e.g., `WHERE Semester = "Spring"`).