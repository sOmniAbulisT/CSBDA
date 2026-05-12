-- Question 2

-- Select Database for Assignment 4
USE r13621207_A4_course;

SHOW TABLES;
DESCRIBE CourseCatalog;
DESCRIBE Course;
SELECT * FROM `r13621207_A4_course`.`Day`;
SELECT * FROM `r13621207_A4_course`.`Period`;
SELECT * FROM `r13621207_A4_course`.`Course`;
SELECT*FROM `r13621207_A4_course`.`TimeSlot`; 
-- Modify the stucture of the Course table
ALTER TABLE `r13621207_A4_course`.`Course`
    ADD Year INT NOT NULL, 
    ADD Semester VARCHAR(10) NOT NULL,
    ADD Credit INT NOT NULL,
    ADD TimeSlotTwoId INT;

ALTER TABLE `r13621207_A4_course`.`Course` 
ADD TimeSlotThreeId INT;

ALTER TABLE `r13621207_A4_course`.`Course` 
ADD TimeSlotFourId INT;

-- Set constraints and foreigin keys
ALTER TABLE `r13621207_A4_course`.`Course`
    ADD CONSTRAINT fk_timeslot_two
    FOREIGN KEY (TimeSlotTwoId) REFERENCES TimeSlot(TimeSlotId);

ALTER TABLE `r13621207_A4_course`.`Course` 
ADD CONSTRAINT fk_timeslot_three 
FOREIGN KEY (TimeSlotThreeId) REFERENCES TimeSlot(TimeSlotId);

ALTER TABLE `r13621207_A4_course`.`Course` 
ADD CONSTRAINT fk_timeslot_four 
FOREIGN KEY (TimeSlotFourId) REFERENCES TimeSlot(TimeSlotId);

ALTER TABLE `r13621207_A4_course`.`Course`
    ADD CONSTRAINT positive
    CHECK (Credit > 0);
