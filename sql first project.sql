CREATE DATABASE newproject1;
USE newproject1;

CREATE TABLE studentmanagement(
ROLL_NO INT AUTO_INCREMENT PRIMARY KEY,
STU_NAME VARCHAR(50),
STU_DOB DATE,
STU_GENDER ENUM('M','F','OTHER'),
STU_CONTECT VARCHAR(15),
STU_MAIL VARCHAR(30)
);

CREATE TABLE subjectMarks(
suj_id INT AUTO_INCREMENT PRIMARY KEY,
suj_name VARCHAR(20)
);

CREATE TABLE marks(
marks_id INT AUTO_INCREMENT PRIMARY KEY,
ROLL_NO INT,
suj_id INT,
marks INT,
FOREIGN KEY (ROLL_NO) REFERENCES studentmanagement(ROLL_NO),
FOREIGN KEY (suj_id) REFERENCES subjectMarks(suj_id)
);

SELECT * from  marks;

DELIMITER $$

CREATE PROCEDURE addstudent(
    student_name VARCHAR(50),
    student_gender ENUM('M','F','OTHER'),
    student_contact VARCHAR(15),
    student_email VARCHAR(50)
)

BEGIN

INSERT INTO studentmanagement(
    STU_NAME,
    STU_GENDER,
    STU_CONTECT,
    STU_MAIL
)

VALUES(
    student_name,
    student_gender,
    student_contact,
    student_email
);

END $$

DELIMITER ;

CALL addstudent("ashwini","F","9178458967","latha9@gmail.com");


SELECT * FROM studentmanagement;

insert into subjectMarks(suj_name)
values("Telugu"),("hindi"),("English"),("Maths");

SELECT * FROM subjectMarks;

SET SQL_SAFE_UPDATES = 0;

DELETE s1
FROM subjectMarks s1
JOIN subjectMarks s2
ON s1.suj_name = s2.suj_name
AND s1.suj_id > s2.suj_id;

SET SQL_SAFE_UPDATES = 1;


insert into marks (ROLL_NO ,suj_id ,marks)
values (1,1,45),(1,2,36),(1,3,46),(1,4,46);

insert into marks (ROLL_NO ,suj_id ,marks)
values (2,1,44),(2,2,40),(2,3,46),(2,4,45);

insert into marks (ROLL_NO ,suj_id ,marks)
values (3,1,45),(3,2,36),(3,3,46),(3,4,46);

insert into marks (ROLL_NO ,suj_id ,marks)
values (4,1,45),(4,2,36),(4,3,46),(4,4,49);


insert into marks (ROLL_NO ,suj_id ,marks)
values (5,1,45),(5,2,36),(5,3,46),(5,4,46);


insert into marks (ROLL_NO ,suj_id ,marks)
values (6,1,45),(6,2,36),(6,3,46),(6,4,46);

select * from marks;

truncate table marks;

SELECT m.marks_id,m.marks,s.suj_name,st.STU_NAME
FROM marks as m
join subjectMarks s
on m.suj_id=s.suj_id
join studentmanagement st
on m.suj_id=st.ROLL_NO
order by marks_id;

select s.ROLL_NO,
s.STU_NAME,
sum(m.marks) as sum, avg(m.marks) as avgvalue
from studentmanagement s
JOIN marks m
on s.ROLL_NO=m.suj_id
group by s.ROLL_NO,s.STU_NAME 
order by sum desc limit 3;

view 
















