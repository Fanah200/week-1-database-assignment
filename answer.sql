-- 1. Create the Database
DROP DATABASE IF EXISTS SchoolManagement;
CREATE DATABASE SchoolManagement;
USE SchoolManagement;
-- 2. Create the Tables

-- Table 1: Students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    enrollment_date DATE NOT NULL
);

-- Table 2: Courses
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

-- Table 3: Enrollments (The bridge table linking Students and Courses)
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade_letter CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- 3. Check Table Structures
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
-- 4. Insert Sample Data (Updated Names)

-- Clean out previous tests (Optional safety net)
TRUNCATE TABLE enrollments;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE students;
TRUNCATE TABLE courses;
SET FOREIGN_KEY_CHECKS = 1;

-- Add Students
INSERT INTO students (first_name, last_name, enrollment_date) VALUES 
('Mohamed', 'Ali', '2026-09-01'),
('Farah', 'Ahmed', '2026-09-02'),
('Ali', 'Omar', '2026-09-03'),
('Halimo', 'Aden', '2026-09-04');

-- Add Courses
INSERT INTO courses (course_name, credits) VALUES 
('Introduction to MySQL', 3),
('Web Development Basics', 4),
('Data Analytics 101', 3);

-- Add Enrollments (Linking Students to Courses)
-- Student 1 (Mohamed) takes Course 1 (MySQL)
-- Student 2 (Farah) takes Course 2 (Web Dev)
-- Student 4 (Halimo) takes Course 1 (MySQL)
INSERT INTO enrollments (student_id, course_id, grade_letter) VALUES 
(1, 1, 'A'),
(2, 2, 'B+'),
(4, 1, 'A');
SELECT * FROM students;
-- ========================================================
-- Week 1 Database Assignment
-- Topic: School Management System
-- File: answer.sql
-- ========================================================

-- 1. Create and Initialize the Database
DROP DATABASE IF EXISTS SchoolManagement;
CREATE DATABASE SchoolManagement;
USE SchoolManagement;

-- 2. Create the Database Tables
-- Table 1: Students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    enrollment_date DATE NOT NULL
);

-- Table 2: Courses
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
);

-- Table 3: Enrollments (Bridge Table linking Students and Courses)
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade_letter CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- 3. Insert Sample Data
-- Add Students
INSERT INTO students (first_name, last_name, enrollment_date) VALUES 
('Mohamed', 'Ali', '2026-09-01'),
('Farah', 'Ahmed', '2026-09-02'),
('Ali', 'Omar', '2026-09-03'),
('Halimo', 'Aden', '2026-09-04');

-- Add Courses
INSERT INTO courses (course_name, credits) VALUES 
('Introduction to MySQL', 3),
('Web Development Basics', 4),
('Data Analytics 101', 3);

-- Add Enrollments
INSERT INTO enrollments (student_id, course_id, grade_letter) VALUES 
(1, 1, 'A'),
(2, 2, 'B+'),
(4, 1, 'A');

-- 4. Verify Data Insertion
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollments;
