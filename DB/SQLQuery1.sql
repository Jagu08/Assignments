CREATE DATABASE DB;
CREATE TABLE Stu(
id int PRIMARY KEY,
name varchar(20),
age int DEFAULT 18
);
ALTER TABLE Stu
ADD Email varchar(50);

INSERT INTO Stu
VALUES(1,'Jagu',12,'jagruti.suthar@aimdek.com'),
(3,'Esha',15,'esha.devre@aimdek.com')

INSERT INTO Stu(id,name,age)
VALUES(5,'Jagu',13)

SELECT * FROM Stu
WHERE age=19

SELECT * FROM Stu
ORDER BY age

SELECT * FROM Stu
ORDER BY age DESC

SELECT * FROM Stu
WHERE age=19 OR age=18

SELECT * FROM Stu
WHERE Email LIKE '%aimdek.com';

SELECT * FROM Stu
WHERE age LIKE '1_';

SELECT COUNT(*), age FROM Stu GROUP BY age

SELECT DISTINCT age FROM Stu







