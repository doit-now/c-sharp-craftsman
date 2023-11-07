CREATE DATABASE StudentManagement

USE StudentManagement

-- Create the Account table
CREATE TABLE Account (
    Id INT PRIMARY KEY,
    UserName NVARCHAR(20) NOT NULL,
    Password NVARCHAR(15) NOT NULL,
    Role int  -- Role: 1 Admin | 2 Staff | 3 Member 
);

-- Create the Major table
CREATE TABLE Major (
    Id INT PRIMARY KEY,
    MajorName NVARCHAR(30) NOT NULL
);

-- Create the Student table with a foreign key relationship to Major
CREATE TABLE Student (
    Id INT PRIMARY KEY,
    StudentName NVARCHAR(30) NOT NULL,
    Yob INT,
    MajorId INT,
    FOREIGN KEY (MajorId) REFERENCES Major(Id)
);

-- Sample data for Account table
INSERT INTO Account (Id, UserName, Password, Role)
VALUES
    (1, 'ad', 'nt', 1),
    (2, 'staff', '123456', 2),
    (3, 'student', '123456', 3);

-- Sample data for Major table
INSERT INTO Major (id, MajorName)
VALUES
    (1, 'Computer Science'),
    (2, 'Biology'),
    (3, 'Mathematics');

-- Sample data for Student table
INSERT INTO Student (Id, StudentName, Yob, MajorId)
VALUES
    (1, 'Alice', 1998, 1),
    (2, 'Bob', 1999, 1),
    (3, 'Charlie', 2000, 1),
    (4, 'David', 2001, 2),
    (5, 'Jane', 2002, 2),
    (6, 'Kim', 2003, 3),
    (7, 'Joe', 2004, 3);
