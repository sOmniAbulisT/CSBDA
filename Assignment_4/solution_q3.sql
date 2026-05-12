-- Question 3

-- Select Database for Assignment 4
USE r13621207_A4_course;

SHOW TABLES;

DESCRIBE Student; 

SELECT * FROM `r13621207_A4_course`.`Student`;
SELECT * FROM `r13621207_A4_course`.`Gender`;
SELECT * FROM `r13621207_A4_course`.`CourseCatalog`;
SELECT CourseId, CourseCatalogId FROM `r13621207_A4_course`.`Course`;
SELECT CourseID, CourseCatalogId, Year, Semester FROM `r13621207_A4_course`.`Course`;
SELECT c.CourseId, cc.CourseNumber, cc.CourseName, c.Year, c.Semester
FROM Course c
JOIN CourseCatalog cc ON c.CourseCatalogId = cc.CourseCatalogId
WHERE cc.CourseNumber IN (
    'agron5002', 'stat5006', 'agron5097', 
    'agron5003', 'agron7024', 'stat5008', 
    'fin7050', 'stat5013', 'agron5077', 'agron5074'
);

CREATE TABLE IF NOT EXISTS StudentCourse (
    StudentCourseId INT AUTO_INCREMENT PRIMARY KEY,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    IsCompulsory TINYINT NOT NULL,

    CONSTRAINT fk_sc_student FOREIGN KEY (StudentId) REFERENCES Student(StuedentId),
    CONSTRAINT fk_sc_course FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

INSERT INTO StudentCourse (StudentId, CourseId, IsCompulsory) 
VALUES 
    (1, 15, 0),  
    (1, 16, 1);

INSERT INTO Student (NickName, GenderId, CollegeId)
  VALUES ('Kun-Hong Liao', 2, 106);

INSERT INTO StudentCourse (StudentId, CourseId, Iscompulsory)
  VALUES 
    (2, 41, 0),
    (2, 49, 0), 
    (2, 73, 0), 
    (2, 93, 0),
    (2, 103, 0),
    (2, 119, 0),
    (2, 179, 0),
    (2, 197, 0),
    (2, 216, 0), 
    (2, 231, 0);

-- DROP TABLE StudentCourse;