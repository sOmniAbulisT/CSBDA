# Report Question 4

## 1. Description of the new table
I have implemented a Grade management system by adding a new table called `Grade`. This table acts as an associative entity that connects `Student` and `Course` to store academic performance data.

## 2. Objective
As a teaching assisstant in statistics, I understand that data analysis in an educational context heavily relies on quantitative performance metrics. By introducing the `Grade` table, the database evolves from a simple enrollment system to a comprehensive academic management system capable of tracking GPA and letter grades.

## 3. Design and Constraints
* Data Integrity: I used `DECIMAL(5,2)` for scores to ensure precision for statistical calculations. 
* Relational Integrity: Foreign keys were established to link back to the `Student` and `Course` tables. 
* Usability: I created a SQL `VIEW` named `Student_grade_report`. This allows users to view human readable reports (names and course titles) without writing complex multiple-table JOINs every time.

This design can be further improved by adding triggers to automatically calculate `LetterGrade` based on the `Score` value, or by adding a `Term` column to track historical GPA trends over different semesters.