-- Question 4

-- Select Database for Assignment 4
USE r13621207_A4_course;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS Grade (
    GradeId INT AUTO_INCREMENT PRIMARY KEY, 
    StudentId INT NOT NULL, 
    CourseId INT NOT NULL, 
    Score DECIMAL(5, 2), 
    LetterGrade VARCHAR(2), 
    GPA DECIMAL(3, 2),

    CONSTRAINT fk_grade_student FOREIGN KEY (StudentId) REFERENCES Student(StuedentId), 
    CONSTRAINT fk_grade_course FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

INSERT INTO Grade (StudentId, CourseId, Score, LetterGrade, GPA)
VALUES 
    (2, 41, 98, 'A+', 4.3),
    (2, 49, 92.5, 'A+', 4.3),
    (2, 73, 89, 'A', 4.),
    (2, 93, 95, 'A+', 4.3),
    (2, 103, 85, 'A-', 3.7);

CREATE OR REPLACE VIEW Student_grade_report AS 
    SELECT 
        s.NickName AS Student_name,
        cc.CourseName,
        g.Score,
        g.LetterGrade,
        g.GPA
    FROM Grade g
    JOIN Student s ON g.StudentId = s.StuedentId
    JOIN Course c ON g.CourseId = c.CourseId
    JOIN CourseCatalog cc ON c.CourseCatalogId = cc.CourseCatalogId;

SELECT * FROM `r13621207_A4_course`.`Student_grade_report`;