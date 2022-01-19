/*Use your database*/
USE DB;
GO

/*Create 'STUDENTS' table*/
CREATE TABLE STUDENTS(
StudentId INT IDENTITY PRIMARY KEY, --auto-increment primary key
StudentName VARCHAR(30),
Age VARCHAR(10),
Address VARCHAR(3)
);

/*Create 'LECTURE' table*/
CREATE TABLE LECTURE(
LectureId INT PRIMARY KEY,
LectureName VARCHAR(10),
StudentId INT FOREIGN KEY REFERENCES dbo.Students(StudentId),
);

/*Create 'SUBJECT' table*/
CREATE TABLE SUBJECT(
SubjectID INT PRIMARY KEY,
SubjectName VARCHAR(20) NOT NULL,
LectureId INT FOREIGN KEY REFERENCES dbo.LECTURE (LectureId) NULL
);

/*Create 'COURSE' table*/
CREATE TABLE COURSE(
CourseId INT NOT NULL,
SubjectId INT REFERENCES SUBJECT(SubjectId),
AccessType VARCHAR(5) NULL
);
