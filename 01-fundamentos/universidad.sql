create database universidad;
use universidad;

CREATE TABLE Course (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100) not null,
    Credits INT
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    EnrollmentDate DATE
);

CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    HireDate DATE
);

-- Tabla intermedia para Course-Instructor
CREATE TABLE CourseInstructors (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- Tabla intermedia para Student-Course
CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insertar cursos
INSERT INTO Course (CourseName, Credits) VALUES
('Matemáticas', 3),
('Programación', 4);

-- Insertar estudiantes
INSERT INTO Student (Name, EnrollmentDate) VALUES
('Juan Perez', '2023-09-01'),
('Ana Gomez', '2023-09-01');

-- Insertar profesores
INSERT INTO Instructor (Name, HireDate) VALUES
('Dr. Smith', '2020-01-10'),
('Prof. Johnson', '2019-02-15');

-- Asociar profesores a cursos
INSERT INTO CourseInstructors (CourseID, InstructorID) VALUES
(1, 1), (2, 2);

-- Matricular estudiantes en cursos
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1), (1, 2), (2, 2);

SELECT * from course;
SELECT * from Student;
SELECT * from Instructor;
