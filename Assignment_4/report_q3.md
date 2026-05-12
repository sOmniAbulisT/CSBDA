# Report Question 3

## 1. Table Design Decisions
I created the `StudentCourse` table to represent the many-to-many relationship between students and courses. 
* Primary Key: `StudentCourseId` (Auto-increment).
* Foreign Keys: `StudentId` and `CourseId` to link the respective tables.

## 2. Handling Schema Inconsistencies
During implementation, I noticed the `Student` table uses the column name `StuedentId`. My `CREATE TABLE` script accounts for this typo to ensure the foreign key constraint is valid.

## 3. Data Population
* Student_dummy: Assigned 2 sample courses to verify table functionality.
* Self-registration: Inserted my record ('Kun-Hong Liao') into the `Student` table.
* Course Enrollment: Linked 10 courses from my survey using their respective `CourseId` values retrieved from the `Course` table.