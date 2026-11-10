
IF DB_ID('StudentPlacementDB') IS NULL
BEGIN
    CREATE DATABASE StudentPlacementDB;
END;
GO
USE StudentPlacementDB;
GO

CREATE TABLE students (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    Gender VARCHAR(10),
    CGPA DECIMAL(4,2),
    Internship VARCHAR(10),
    Skills VARCHAR(100)
);
GO
CREATE TABLE placements (
    Placement_ID INT IDENTITY(1,1) PRIMARY KEY,
    Student_ID INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Salary DECIMAL(12,2) DEFAULT 0,

    FOREIGN KEY (Student_ID)
    REFERENCES students(Student_ID),

    CHECK (Status IN ('PLACED', 'NOT PLACED'))
);
GO

USE StudentPlacementDB;
GO

-- Insert student records
INSERT INTO students
(Student_ID, Name, Department, Gender, CGPA, Internship, Skills)
SELECT v.Student_ID, v.Name, v.Department, v.Gender,
       v.CGPA, v.Internship, v.Skills
FROM (VALUES
(101, 'Arun', 'CSE', 'Male', 8.50, 'Yes', 'Python'),
(102, 'Divya', 'CSE', 'Female', 9.10, 'Yes', 'Java'),
(103, 'Kiran', 'ECE', 'Male', 7.20, 'No', 'Python'),
(104, 'Priya', 'IT', 'Female', 8.80, 'Yes', 'SQL'),
(105, 'Rahul', 'CSE', 'Male', 6.90, 'No', 'Java'),
(106, 'Anjali', 'IT', 'Female', 9.30, 'Yes', 'Python'),
(107, 'Suresh', 'ECE', 'Male', 7.80, 'Yes', 'SQL'),
(108, 'Meena', 'CSE', 'Female', 6.50, 'No', 'Java'),
(109, 'Vikram', 'IT', 'Male', 8.20, 'Yes', 'Python'),
(110, 'Sneha', 'ECE', 'Female', 7.50, 'No', 'SQL')
) AS v(Student_ID, Name, Department, Gender, CGPA, Internship, Skills)
WHERE NOT EXISTS (
    SELECT 1 FROM students s
    WHERE s.Student_ID = v.Student_ID
);
GO

-- Insert placement records
INSERT INTO placements (Student_ID, Status, Salary)
SELECT v.Student_ID, v.Status, v.Salary
FROM (VALUES
(101, 'PLACED', 600000),
(102, 'PLACED', 750000),
(103, 'NOT PLACED', 0),
(104, 'PLACED', 650000),
(105, 'NOT PLACED', 0),
(106, 'PLACED', 900000),
(107, 'PLACED', 500000),
(108, 'NOT PLACED', 0),
(109, 'PLACED', 700000),
(110, 'NOT PLACED', 0)
) AS v(Student_ID, Status, Salary)
WHERE NOT EXISTS (
    SELECT 1 FROM placements p
    WHERE p.Student_ID = v.Student_ID
);
GO
USE StudentPlacementDB;
GO

SELECT * FROM students;

SELECT * FROM placements;