CREATE DATABASE IF NOT EXISTS faculty_of_technology;
USE faculty_of_technology;

CREATE TABLE Admin (
    Admin_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    F_Name VARCHAR(30),
    L_Name VARCHAR(30),
    Email VARCHAR(40)
);

CREATE TABLE Dean (
    Dean_ID VARCHAR(10) PRIMARY KEY NOT NULL,
    F_Name VARCHAR(30),
    L_Name VARCHAR(30),
    Email VARCHAR(40)
);

CREATE TABLE Department (
    Dep_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Name CHAR(150),
    Location VARCHAR(200),
    Dean_ID VARCHAR(10),
    Admin_ID VARCHAR(10)
);

CREATE TABLE Student (
    Reg_No VARCHAR(10) PRIMARY KEY NOT NULL,
    F_Name VARCHAR(30),
    L_Name VARCHAR(30),
    DOB DATE,
    Stu_Email VARCHAR(40),
    Gender VARCHAR(6),
    Dep_ID VARCHAR(20)
);

CREATE TABLE Lecturer (
    Lecturer_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    F_Name VARCHAR(150),
    L_Name VARCHAR(150),
    Gender CHAR(10),
    Contact_Number VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE Technical_Officer (
    TO_ID VARCHAR(25) PRIMARY KEY NOT NULL,
    Email VARCHAR(30),
    F_Name VARCHAR(60),
    L_Name VARCHAR(60),
    Gender CHAR(15),
    Contact_Number VARCHAR(15),
    Dep_ID VARCHAR(20)
);

CREATE TABLE Course (
    Course_Code VARCHAR(7) PRIMARY KEY NOT NULL,
    Course_Name VARCHAR(40),
    Credit INT
);

CREATE TABLE Attendance (
    Attendance_ID VARCHAR(25) PRIMARY KEY NOT NULL,
    Time VARCHAR(15),
    Type VARCHAR(50),
    Hours INT,
    Date DATE,
    Course_Code VARCHAR(7)
);

CREATE TABLE Stu_Course (
    Reg_No VARCHAR(10) NOT NULL,
    Course_Code VARCHAR(7) NOT NULL,
    PRIMARY KEY (Reg_No, Course_Code)
);

CREATE TABLE Stu_Attendance (
    Reg_No VARCHAR(10),
    Attendance_ID VARCHAR(25),
    status VARCHAR(10),
    PRIMARY KEY (Reg_No, Attendance_ID)
);

CREATE TABLE Course_Lecture (
    Lecturer_ID VARCHAR(15),
    Course_Code VARCHAR(7),
    PRIMARY KEY (Lecturer_ID, Course_Code)
);

CREATE TABLE Lecturer_Department (
    Lecturer_ID VARCHAR(15),
    Dep_ID VARCHAR(20),
    PRIMARY KEY (Lecturer_ID, Dep_ID)
);

CREATE TABLE Session (
    Session_ID VARCHAR(10) PRIMARY KEY,
    Component_Type VARCHAR(20),
    Num_Of_Session INT,
    Course_Code VARCHAR(7),
    Lecturer_ID VARCHAR(15)
);

CREATE TABLE Repeat_Student (
    Reg_No VARCHAR(10),
    Repeat_Fee_Status INT,
    Repeat_Semester VARCHAR(10),
    Repeat_Status_Date DATE
);

CREATE TABLE Proper_Student (
    Reg_No VARCHAR(10) PRIMARY KEY,
    First_Enrollment_Date DATE
);

CREATE TABLE Mark (
    Mark_ID VARCHAR(15) PRIMARY KEY,
    Reg_No VARCHAR(10),
    Course_Code VARCHAR(7),
    Mid_Mark INT,
    Assignment1_Mark DECIMAL(3,1),
    Assignment2_Mark DECIMAL(3,1),
    Quiz1_Mark INT,
    Quiz2_Mark INT,
    Quiz3_Mark INT,
    End_Mark INT
);

CREATE TABLE Course_Mark (
    Course_Code VARCHAR(7),
    Mark_ID VARCHAR(15),
    PRIMARY KEY (Course_Code, Mark_ID)
);



ALTER TABLE Department
ADD CONSTRAINT fk_department_dean FOREIGN KEY (Dean_ID) REFERENCES Dean(Dean_ID);

ALTER TABLE Department
ADD CONSTRAINT fk_department_admin FOREIGN KEY (Admin_ID) REFERENCES Admin(Admin_ID);

ALTER TABLE Student
ADD CONSTRAINT fk_student_department FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID);

ALTER TABLE Technical_Officer
ADD CONSTRAINT fk_technical_officer_department FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID);

ALTER TABLE Attendance
ADD CONSTRAINT fk_attendance_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Stu_Course
ADD CONSTRAINT fk_stucourse_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No);

ALTER TABLE Stu_Course
ADD CONSTRAINT fk_stucourse_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Stu_Attendance
ADD CONSTRAINT fk_stuattendance_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No);

ALTER TABLE Stu_Attendance
ADD CONSTRAINT fk_stuattendance_attendance FOREIGN KEY (Attendance_ID) REFERENCES Attendance(Attendance_ID);

ALTER TABLE Course_Lecture
ADD CONSTRAINT fk_courselecture_lecturer FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID);

ALTER TABLE Course_Lecture
ADD CONSTRAINT fk_courselecture_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Lecturer_Department
ADD CONSTRAINT fk_lecturerdepartment_lecturer FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID);

ALTER TABLE Lecturer_Department
ADD CONSTRAINT fk_lecturerdepartment_department FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID);

ALTER TABLE Session
ADD CONSTRAINT fk_session_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Session
ADD CONSTRAINT fk_session_lecturer FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID);

ALTER TABLE Repeat_Student
ADD CONSTRAINT fk_repeatstudent_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No);

ALTER TABLE Proper_Student
ADD CONSTRAINT fk_properstudent_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No);

ALTER TABLE Mark
ADD CONSTRAINT fk_mark_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No);

ALTER TABLE Course_Mark
ADD CONSTRAINT fk_coursemark_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Course_Mark
ADD CONSTRAINT fk_coursemark_mark FOREIGN KEY (Mark_ID) REFERENCES Mark(Mark_ID);




-- 1. STU_ATTENDANCE (Junction Table)
-- Drop constraints linking Stu_Attendance to Student and Attendance
ALTER TABLE Stu_Attendance DROP FOREIGN KEY fk_stuattendance_student;
ALTER TABLE Stu_Attendance DROP FOREIGN KEY fk_stuattendance_attendance;

-- 2. ATTENDANCE (Session Table)
-- Assuming a constraint named fk_attendance_course exists for Course_Code
ALTER TABLE Attendance DROP FOREIGN KEY fk_attendance_course; 

-- 3. STUDENT
-- Assuming a constraint named fk_student_department exists for Dep_ID
ALTER TABLE Student DROP FOREIGN KEY fk_student_department;

-- 4. COURSE
-- Assuming a constraint named fk_course_department exists for Dep_ID


-- 5. DEPARTMENT
-- Drop constraint linking Department to Dean
ALTER TABLE Department DROP FOREIGN KEY fk_department_dean;

-- 6. SESSION
-- Assuming constraints named fk_session_course and fk_session_lecturer exist
ALTER TABLE Session DROP FOREIGN KEY fk_session_course;
ALTER TABLE Session DROP FOREIGN KEY fk_session_lecturer;




-- 1. DEAN -> DEPARTMENT
ALTER TABLE Department
ADD CONSTRAINT fk_department_dean FOREIGN KEY (Dean_ID) REFERENCES Dean(Dean_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 2. DEPARTMENT -> COURSE


-- 3. DEPARTMENT -> STUDENT
ALTER TABLE Student
ADD CONSTRAINT fk_student_department FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 4. COURSE -> ATTENDANCE
ALTER TABLE Attendance
ADD CONSTRAINT fk_attendance_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 5. LECTURER / COURSE -> SESSION
ALTER TABLE Session
ADD CONSTRAINT fk_session_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE Session
ADD CONSTRAINT fk_session_lecturer FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 6. STUDENT -> STU_ATTENDANCE
ALTER TABLE Stu_Attendance
ADD CONSTRAINT fk_stuattendance_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- 7. ATTENDANCE -> STU_ATTENDANCE
ALTER TABLE Stu_Attendance
ADD CONSTRAINT fk_stuattendance_attendance
FOREIGN KEY (Attendance_ID) REFERENCES Attendance(Attendance_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;





















INSERT INTO Admin (Admin_ID, F_Name, L_Name, Email) VALUES
('ADM001', 'Sumith', 'Bandara', 'sumith.b@admin.fot.ruh.ac.lk');

INSERT INTO Dean (Dean_ID, F_Name, L_Name, Email) VALUES
('D001', 'John', 'Perera', 'john.perera@example.com');

INSERT INTO Department (Dep_ID, Name, Location, Dean_ID, Admin_ID) VALUES
('DEP01', 'ICT Department', 'Building A', 'D001', 'ADM001'),
('DEP02', 'BST Department', 'Building B', 'D001', 'ADM001'),
('DEP03', 'ET Department', 'Building C', 'D001', 'ADM001'),
('DEP04', 'Multidisciplinary Department', 'Building D', 'D001', 'ADM001');

INSERT INTO Lecturer (Lecturer_ID, F_Name, L_Name, Gender, Contact_Number, Email) VALUES
('L001', 'Saman', 'Perera', 'Male', '0711234567', 'saman.perera@email.com'),
('L002', 'Nirodha', 'Madusanka', 'Male', '0712345678', 'nirodha.madusanka@email.com'),
('L003', 'Kamal', 'Fernando', 'Male', '0713456789', 'kamal.fernando@email.com'),
('L004', 'Nadeesha', 'Silva', 'Female', '0714567890', 'nadeesha.silva@email.com'),
('L005', 'Chamara', 'Jayasinghe', 'Male', '0715678901', 'chamara.jayasinghe@email.com'),
('L006', 'Sanduni', 'Perera', 'Female', '0716789012', 'sanduni.perera@email.com'),
('L007', 'Amal', 'Gunasekara', 'Male', '0717890123', 'amal.gunasekara@email.com');

INSERT INTO Course (Course_Code, Course_Name, Credit) VALUES
('ENG1222', 'English II', 2),
('ICT1212', 'Database Management Systems', 2),
('ICT1222', 'Database Management Systems Practicum', 2),
('ICT1233', 'Server-Side Web Development', 3),
('ICT1242', 'Computer Architecture', 2),
('ICT1253', 'Computer Networks', 3),
('TCS1212', 'Fundamentals of Management', 2),
('TMS1233', 'Discrete Mathematics', 3);

INSERT INTO Technical_Officer (TO_ID, Email, F_Name, L_Name, Gender, Contact_Number, Dep_ID) VALUES
('TO001', 'alice.tech@email.com', 'Alice', 'Fernando', 'Female', '0712345678', 'DEP01'),
('TO002', 'brian.tech@email.com', 'Brian', 'Perera', 'Male', '0723456789', 'DEP01'),
('TO003', 'carol.tech@email.com', 'Carol', 'Silva', 'Female', '0709876543', 'DEP02'),
('TO004', 'daniel.tech@email.com', 'Daniel', 'Jayawardena', 'Male', '0765432198', 'DEP02'),
('TO005', 'elaine.tech@email.com', 'Elaine', 'Kumar', 'Female', '0771234567', 'DEP03'),
('TO006', 'frank.tech@email.com', 'Frank', 'Dias', 'Male', '0756789123', 'DEP03'),
('TO007', 'grace.tech@email.com', 'Grace', 'Rajapaksa', 'Female', '0782345671', 'DEP04'),
('TO008', 'harry.tech@email.com', 'Harry', 'Senanayake', 'Male', '0793456782', 'DEP04');

INSERT INTO Student (Reg_No, F_Name, L_Name, DOB, Stu_Email, Gender, Dep_ID) VALUES
('S001', 'Nimesh', 'Madusanka', '2002-05-12', 'nimesh@email.com', 'Male', 'DEP01'),
('S002', 'Ayesha', 'Perera', '2003-08-23', 'ayesha@email.com', 'Female', 'DEP02'),
('S003', 'Kamal', 'Silva', '2002-11-15', 'kamal@email.com', 'Male', 'DEP03'),
('S004', 'Praveen', 'Fernando', '2003-01-30', 'praveen@email.com', 'Male', 'DEP01'),
('S005', 'Dilani', 'Kumar', '2002-07-19', 'dilani@email.com', 'Female', 'DEP03'),
('S006', 'Ruwan', 'Jayawardena', '2003-03-05', 'ruwan@email.com', 'Male', 'DEP02'),
('S007', 'Chamari', 'Rajapaksa', '2002-12-10', 'chamari@email.com', 'Female', 'DEP01'),
('S008', 'Malsha', 'Senanayake', '2003-09-21', 'malsha@email.com', 'Female', 'DEP02'),
('S009', 'Tharindu', 'Dias', '2002-06-17', 'tharindu@email.com', 'Male', 'DEP03'),
('S010', 'Hiran', 'Kumara', '2003-04-08', 'hiran@email.com', 'Male', 'DEP01'),
('S011', 'Sanduni', 'Perera', '2002-10-12', 'sanduni@email.com', 'Female', 'DEP02'),
('S012', 'Nadeesha', 'Silva', '2003-02-25', 'nadeesha@email.com', 'Female', 'DEP03'),
('S013', 'Pradeep', 'Fernando', '2002-08-09', 'pradeep@email.com', 'Male', 'DEP02'),
('S014', 'Roshan', 'Kumar', '2003-05-15', 'roshan@email.com', 'Male', 'DEP01'),
('S015', 'Anushka', 'Dias', '2002-11-29', 'anushka@email.com', 'Female', 'DEP03');

INSERT INTO Repeat_Student (Reg_No, Repeat_Fee_Status, Repeat_Semester, Repeat_Status_Date) VALUES
('S003', 1, 'Semester 2', '2023-09-10'),
('S005', 1, 'Semester 1', '2023-09-12'),
('S008', 1, 'Semester 2', '2023-09-15'),
('S011', 1, 'Semester 1', '2023-09-20'),
('S015', 1, 'Semester 2', '2023-09-25');

INSERT INTO Proper_Student (Reg_No, First_Enrollment_Date) VALUES
('S001', '2021-02-15'),
('S002', '2021-02-15'),
('S004', '2021-02-15'),
('S006', '2021-02-15'),
('S007', '2021-02-15'),
('S009', '2021-02-15'),
('S010', '2021-02-15'),
('S012', '2021-02-15'),
('S013', '2021-02-15'),
('S014', '2021-02-15');

INSERT INTO Stu_Course (Reg_No, Course_Code) VALUES
('S001', 'ENG1222'), ('S001', 'ICT1212'), ('S001', 'ICT1222'), ('S001', 'ICT1233'),
('S001', 'ICT1242'), ('S001', 'ICT1253'), ('S001', 'TCS1212'), ('S001', 'TMS1233'),
('S002', 'ENG1222'), ('S002', 'ICT1212'), ('S002', 'ICT1222'), ('S002', 'ICT1233'),
('S002', 'ICT1242'), ('S002', 'ICT1253'), ('S002', 'TCS1212'), ('S002', 'TMS1233'),
('S003', 'ENG1222'), ('S003', 'ICT1212'), ('S003', 'ICT1222'), ('S003', 'ICT1233'),
('S003', 'ICT1242'), ('S003', 'ICT1253'), ('S003', 'TCS1212'), ('S003', 'TMS1233'),
('S004', 'ENG1222'), ('S004', 'ICT1212'), ('S004', 'ICT1222'), ('S004', 'ICT1233'),
('S004', 'ICT1242'), ('S004', 'ICT1253'), ('S004', 'TCS1212'), ('S004', 'TMS1233'),
('S005', 'ENG1222'), ('S005', 'ICT1212'), ('S005', 'ICT1222'), ('S005', 'ICT1233'),
('S005', 'ICT1242'), ('S005', 'ICT1253'), ('S005', 'TCS1212'), ('S005', 'TMS1233'),
('S006', 'ENG1222'), ('S006', 'ICT1212'), ('S006', 'ICT1222'), ('S006', 'ICT1233'),
('S006', 'ICT1242'), ('S006', 'ICT1253'), ('S006', 'TCS1212'), ('S006', 'TMS1233'),
('S007', 'ENG1222'), ('S007', 'ICT1212'), ('S007', 'ICT1222'), ('S007', 'ICT1233'),
('S007', 'ICT1242'), ('S007', 'ICT1253'), ('S007', 'TCS1212'), ('S007', 'TMS1233'),
('S008', 'ENG1222'), ('S008', 'ICT1212'), ('S008', 'ICT1222'), ('S008', 'ICT1233'),
('S008', 'ICT1242'), ('S008', 'ICT1253'), ('S008', 'TCS1212'), ('S008', 'TMS1233'),
('S009', 'ENG1222'), ('S009', 'ICT1212'), ('S009', 'ICT1222'), ('S009', 'ICT1233'),
('S009', 'ICT1242'), ('S009', 'ICT1253'), ('S009', 'TCS1212'), ('S009', 'TMS1233'),
('S010', 'ENG1222'), ('S010', 'ICT1212'), ('S010', 'ICT1222'), ('S010', 'ICT1233'),
('S010', 'ICT1242'), ('S010', 'ICT1253'), ('S010', 'TCS1212'), ('S010', 'TMS1233'),
('S011', 'ENG1222'), ('S011', 'ICT1212'), ('S011', 'ICT1222'), ('S011', 'ICT1233'),
('S011', 'ICT1242'), ('S011', 'ICT1253'), ('S011', 'TCS1212'), ('S011', 'TMS1233'),
('S012', 'ENG1222'), ('S012', 'ICT1212'), ('S012', 'ICT1222'), ('S012', 'ICT1233'),
('S012', 'ICT1242'), ('S012', 'ICT1253'), ('S012', 'TCS1212'), ('S012', 'TMS1233'),
('S013', 'ENG1222'), ('S013', 'ICT1212'), ('S013', 'ICT1222'), ('S013', 'ICT1233'),
('S013', 'ICT1242'), ('S013', 'ICT1253'), ('S013', 'TCS1212'), ('S013', 'TMS1233'),
('S014', 'ENG1222'), ('S014', 'ICT1212'), ('S014', 'ICT1222'), ('S014', 'ICT1233'),
('S014', 'ICT1242'), ('S014', 'ICT1253'), ('S014', 'TCS1212'), ('S014', 'TMS1233'),
('S015', 'ENG1222'), ('S015', 'ICT1212'), ('S015', 'ICT1222'), ('S015', 'ICT1233'),
('S015', 'ICT1242'), ('S015', 'ICT1253'), ('S015', 'TCS1212'), ('S015', 'TMS1233');

INSERT INTO Course_Lecture (Lecturer_ID, Course_Code) VALUES
('L001', 'ENG1222'),
('L002', 'ICT1212'),
('L003', 'ICT1222'),
('L004', 'ICT1233'),
('L005', 'ICT1242'),
('L006', 'ICT1253'),
('L007', 'TCS1212'),
('L001', 'TMS1233');

INSERT INTO Lecturer_Department (Lecturer_ID, Dep_ID) VALUES
('L001', 'DEP01'),
('L002', 'DEP01'),
('L003', 'DEP01'),
('L004', 'DEP01'),
('L005', 'DEP01'),
('L006', 'DEP01'),
('L007', 'DEP01');


INSERT INTO Mark
(Mark_ID, Reg_No, Course_Code, Mid_Mark, Assignment1_Mark, Assignment2_Mark,
 Quiz1_Mark, Quiz2_Mark, Quiz3_Mark, End_Mark)
VALUES
('M001', 'S001', 'ENG1222', 21, 2.2, 2.3, 4, 3, 4, 32),
('M002', 'S001', 'ICT1212', 22, 2.3, 2.0, 4, 3, 4, 10),
('M003', 'S001', 'ICT1222', 20, 2.1, 2.2, 3, 4, 3, 30),
('M004', 'S001', 'ICT1233', 13, 2.4, 2.3, 4, 4, 4, 57),
('M005', 'S001', 'ICT1242', 19, 2.0, 2.1, 3, 3, 4, 48),
('M006', 'S001', 'ICT1253', 22, 2.2, 2.3, 4, 4, 3, 17),
('M007', 'S001', 'TCS1212', 24, 2.4, 2.3, 4, 3, 4, 58),
('M008', 'S001', 'TMS1233', 21, 2.1, 2.2, 3, 4, 4, 53),
('M009', 'S002', 'ENG1222', 20, 2.0, 2.1, 3, 3, 4, 50),
('M010', 'S002', 'ICT1212', 08, 2.2, 2.0, 4, 3, 3, 48),
('M011', 'S002', 'ICT1222', 22, 2.3, 2.2, 4, 4, 3, 55),
('M012', 'S002', 'ICT1233', 09, 2.1, 2.3, 3, 4, 4, 34),
('M013', 'S002', 'ICT1242', 21, 2.4, 2.1, 4, 3, 4, 52),
('M014', 'S002', 'ICT1253', 23, 2.3, 2.2, 4, 4, 3, 56),
('M015', 'S002', 'TCS1212', 11, 2.2, 2.0, 3, 3, 4, 11),
('M016', 'S002', 'TMS1233', 22, 2.1, 2.3, 4, 4, 4, 54),
('M017', 'S003', 'ENG1222', 09, 2.0, 2.2, 3, 4, 3, 09),
('M018', 'S003', 'ICT1212', 21, 2.3, 2.1, 4, 3, 4, 53),
('M019', 'S003', 'ICT1222', 20, 2.2, 2.3, 3, 4, 3, 51),
('M020', 'S003', 'ICT1233', 22, 2.4, 2.2, 4, 4, 4, 25),
('M021', 'S003', 'ICT1242', 18, 2.1, 2.0, 3, 3, 3, 27),
('M022', 'S003', 'ICT1253', 21, 2.3, 2.2, 4, 3, 4, 12),
('M023', 'S003', 'TCS1212', 23, 2.4, 2.3, 4, 4, 3, 27),
('M024', 'S003', 'TMS1233', 20, 2.2, 2.1, 3, 3, 4, 50),
('M025', 'S004', 'ENG1222', 22, 2.3, 2.2, 4, 4, 4, 24),
('M026', 'S004', 'ICT1212', 23, 2.4, 2.3, 4, 3, 4, 56),
('M027', 'S004', 'ICT1222', 21, 2.2, 2.0, 3, 4, 3, 52),
('M028', 'S004', 'ICT1233', 24, 2.5, 2.3, 4, 4, 4, 58),
('M029', 'S004', 'ICT1242', 20, 2.1, 2.2, 3, 3, 4, 51),
('M030', 'S004', 'ICT1253', 22, 2.3, 2.4, 4, 4, 3, 55),
('M031', 'S004', 'TCS1212', 23, 2.4, 2.3, 4, 3, 4, 47),
('M032', 'S004', 'TMS1233', 21, 2.2, 2.1, 3, 4, 4, 53),
('M033', 'S005', 'ENG1222', 20, 2.1, 2.2, 3, 3, 4, 10),
('M034', 'S005', 'ICT1212', 22, 2.3, 2.1, 4, 4, 3, 54),
('M035', 'S005', 'ICT1222', 21, 2.2, 2.0, 3, 4, 4, 52),
('M036', 'S005', 'ICT1233', 23, 2.4, 2.3, 4, 3, 4, 56),
('M037', 'S005', 'ICT1242', 19, 2.0, 2.1, 3, 3, 3, 48),
('M038', 'S005', 'ICT1253', 22, 2.3, 2.2, 4, 4, 3, 15),
('M039', 'S005', 'TCS1212', 21, 2.2, 2.1, 3, 3, 4, 52),
('M040', 'S005', 'TMS1233', 23, 2.4, 2.3, 4, 4, 4, 57),
('M041', 'S006', 'ENG1222', 20, 2.1, 2.2, 3, 3, 4, 50),
('M042', 'S006', 'ICT1212', 21, 2.3, 2.1, 4, 4, 3, 05),
('M043', 'S006', 'ICT1222', 22, 2.2, 2.0, 3, 4, 4, 54),
('M044', 'S006', 'ICT1233', 23, 2.4, 2.3, 4, 3, 4, 26),
('M045', 'S006', 'ICT1242', 20, 2.0, 2.1, 3, 3, 3, 51),
('M046', 'S006', 'ICT1253', 22, 2.3, 2.2, 4, 4, 3, 55),
('M047', 'S006', 'TCS1212', 21, 2.2, 2.1, 3, 3, 4, 53),
('M048', 'S006', 'TMS1233', 23, 2.4, 2.3, 4, 4, 4, 14),
('M049', 'S007', 'ENG1222', 19, 2.0, 2.2, 3, 4, 3, 49),
('M050', 'S007', 'ICT1212', 21, 2.3, 2.1, 4, 3, 4, 53),
('M051', 'S007', 'ICT1222', 20, 2.2, 2.3, 3, 4, 3, 51),
('M052', 'S007', 'ICT1233', 22, 2.4, 2.2, 4, 4, 4, 55),
('M053', 'S007', 'ICT1242', 18, 2.1, 2.0, 3, 3, 3, 47),
('M054', 'S007', 'ICT1253', 21, 2.3, 2.2, 4, 3, 4, 52),
('M055', 'S007', 'TCS1212', 23, 2.4, 2.3, 4, 4, 3, 17),
('M056', 'S007', 'TMS1233', 20, 2.2, 2.1, 3, 3, 4, 50),
('M057', 'S008', 'ENG1222', 21, 2.2, 2.3, 4, 3, 4, 52),
('M058', 'S008', 'ICT1212', 22, 2.3, 2.0, 4, 3, 4, 05),
('M059', 'S008', 'ICT1222', 20, 2.1, 2.2, 3, 4, 3, 50),
('M060', 'S008', 'ICT1233', 23, 2.4, 2.3, 4, 4, 4, 57),
('M061', 'S008', 'ICT1242', 19, 2.0, 2.1, 3, 3, 4, 48),
('M062', 'S008', 'ICT1253', 22, 2.2, 2.3, 4, 4, 3, 54),
('M063', 'S008', 'TCS1212', 24, 2.4, 2.3, 4, 3, 4, 58),
('M064', 'S008', 'TMS1233', 21, 2.1, 2.2, 3, 4, 4, 53),
('M065', 'S009', 'ENG1222', 20, 2.0, 2.1, 3, 3, 4, 50),
('M066', 'S009', 'ICT1212', 18, 2.2, 2.0, 4, 3, 3, 48),
('M067', 'S009', 'ICT1222', 22, 2.3, 2.2, 4, 4, 3, 55),
('M068', 'S009', 'ICT1233', 19, 2.1, 2.3, 3, 4, 4, 49),
('M069', 'S009', 'ICT1242', 21, 2.4, 2.1, 4, 3, 4, 52),
('M070', 'S009', 'ICT1253', 23, 2.3, 2.2, 4, 4, 3, 56),
('M071', 'S009', 'TCS1212', 20, 2.2, 2.0, 3, 3, 4, 51),
('M072', 'S009', 'TMS1233', 22, 2.1, 2.3, 4, 4, 4, 54),
('M073', 'S010', 'ENG1222', 19, 2.0, 2.2, 3, 4, 3, 39),
('M074', 'S010', 'ICT1212', 21, 2.3, 2.1, 4, 3, 4, 53),
('M075', 'S010', 'ICT1222', 20, 2.2, 2.3, 3, 4, 3, 51),
('M076', 'S010', 'ICT1233', 22, 2.4, 2.2, 4, 4, 4, 55),
('M077', 'S010', 'ICT1242', 18, 2.1, 2.0, 3, 3, 3, 41),
('M078', 'S010', 'ICT1253', 21, 2.3, 2.2, 4, 3, 4, 52),
('M079', 'S010', 'TCS1212', 23, 2.4, 2.3, 4, 4, 3, 57),
('M080', 'S010', 'TMS1233', 20, 2.2, 2.1, 3, 3, 4, 50),
('M081', 'S011', 'ENG1222', 21, 2.2, 2.3, 4, 3, 4, 52),
('M082', 'S011', 'ICT1212', 22, 2.3, 2.0, 4, 3, 4, 55),
('M083', 'S011', 'ICT1222', 20, 2.1, 2.2, 3, 4, 3, 30),
('M084', 'S011', 'ICT1233', 23, 2.4, 2.3, 4, 4, 4, 57),
('M085', 'S011', 'ICT1242', 19, 2.0, 2.1, 3, 3, 4, 48),
('M086', 'S011', 'ICT1253', 22, 2.2, 2.3, 4, 4, 3, 54),
('M087', 'S011', 'TCS1212', 24, 2.4, 2.3, 4, 3, 4, 58),
('M088', 'S011', 'TMS1233', 21, 2.1, 2.2, 3, 4, 4, 53),
('M089', 'S012', 'ENG1222', 20, 2.0, 2.1, 3, 3, 4, 50),
('M090', 'S012', 'ICT1212', 18, 2.2, 2.0, 4, 3, 3, 48),
('M091', 'S012', 'ICT1222', 22, 2.3, 2.2, 4, 4, 3, 15),
('M092', 'S012', 'ICT1233', 19, 2.1, 2.3, 3, 4, 4, 49),
('M093', 'S012', 'ICT1242', 21, 2.4, 2.1, 4, 3, 4, 52),
('M094', 'S012', 'ICT1253', 23, 2.3, 2.2, 4, 4, 3, 36),
('M095', 'S012', 'TCS1212', 20, 2.2, 2.0, 3, 3, 4, 51),
('M096', 'S012', 'TMS1233', 22, 2.1, 2.3, 4, 4, 4, 54),
('M097', 'S013', 'ENG1222', 19, 2.0, 2.2, 3, 4, 3, 49),
('M098', 'S013', 'ICT1212', 21, 2.3, 2.1, 4, 3, 4, 53),
('M099', 'S013', 'ICT1222', 20, 2.2, 2.3, 3, 4, 3, 51),
('M100', 'S013', 'ICT1233', 22, 2.4, 2.2, 4, 4, 4, 55),
('M101', 'S013', 'ICT1242', 18, 2.1, 2.0, 3, 3, 3, 47),
('M102', 'S013', 'ICT1253', 21, 2.3, 2.2, 4, 3, 4, 52),
('M103', 'S013', 'TCS1212', 23, 2.4, 2.3, 4, 4, 3, 57),
('M104', 'S013', 'TMS1233', 20, 2.2, 2.1, 3, 3, 4, 50),
('M105', 'S014', 'ENG1222', 21, 2.2, 2.3, 4, 3, 4, 52),
('M106', 'S014', 'ICT1212', 22, 2.3, 2.0, 4, 3, 4, 15),
('M107', 'S014', 'ICT1222', 20, 2.1, 2.2, 3, 4, 3, 20),
('M108', 'S014', 'ICT1233', 18, 2.4, 2.3, 4, 4, 4, 57),
('M109', 'S014', 'ICT1242', 19, 2.0, 2.1, 3, 3, 4, 48),
('M110', 'S014', 'ICT1253', 22, 2.2, 2.3, 4, 4, 3, 54),
('M111', 'S014', 'TCS1212', 24, 2.4, 2.3, 4, 3, 4, 18),
('M112', 'S014', 'TMS1233', 21, 2.1, 2.2, 3, 4, 4, 53),
('M113', 'S015', 'ENG1222', 20, 2.0, 2.1, 3, 3, 4, 50),
('M114', 'S015', 'ICT1212', 18, 2.2, 2.0, 4, 3, 3, 48),
('M115', 'S015', 'ICT1222', 22, 2.3, 2.2, 4, 4, 3, 30),
('M116', 'S015', 'ICT1233', 19, 2.1, 2.3, 3, 4, 4, 09),
('M117', 'S015', 'ICT1242', 21, 2.4, 2.1, 4, 3, 4, 12),
('M118', 'S015', 'ICT1253', 23, 2.3, 2.2, 4, 4, 3, 16),
('M119', 'S015', 'TCS1212', 20, 2.2, 2.0, 3, 3, 4, 11),
('M120', 'S015', 'TMS1233', 22, 2.1, 2.3, 4, 4, 4, 54);


INSERT INTO Attendance (Attendance_ID, Time, Type, Hours, Date, Course_Code) VALUES
('A001','09:00-11:00','Server Side Theory',2,'2025-02-03','ICT1233'),
('A002','13:00-15:00','Server Side Practical',2,'2025-02-03','ICT1233'),
('A003','09:00-11:00','Network Theory',2,'2025-02-04','ICT1253'),
('A004','11:00-13:00','Network Practical',2,'2025-02-04','ICT1253'),
('A005','14:00-16:00','Computer Architecture',2,'2025-02-04','ICT1242'),
('A006','09:00-12:00','Discrete Mathematics',3,'2025-02-05','TMS1233'),
('A007','09:00-11:00','Database Theory',2,'2025-02-06','ICT1212'),
('A008','11:00-13:00','Database Practical',2,'2025-02-06','ICT1222'),
('A009','14:00-16:00','Database Practical',2,'2025-02-06','ICT1222'),
('A010','08:00-10:00','Foundation of Management',2,'2025-02-07','TCS1212'),
('A011','13:00-15:00','English II',2,'2025-02-07','ENG1222'),
('A012','09:00-11:00','Server Side Theory',2,'2025-02-10','ICT1233'),
('A013','13:00-15:00','Server Side Practical',2,'2025-02-10','ICT1233'),
('A014','09:00-11:00','Network Theory',2,'2025-02-11','ICT1253'),
('A015','11:00-13:00','Network Practical',2,'2025-02-11','ICT1253'),
('A016','14:00-16:00','Computer Architecture',2,'2025-02-11','ICT1242'),
('A017','09:00-12:00','Discrete Mathematics',3,'2025-02-12','TMS1233'),
('A018','09:00-11:00','Database Theory',2,'2025-02-13','ICT1212'),
('A019','11:00-13:00','Database Practical',2,'2025-02-13','ICT1222'),
('A020','14:00-16:00','Database Practical',2,'2025-02-13','ICT1222'),
('A021','08:00-10:00','Foundation of Management',2,'2025-02-14','TCS1212'),
('A022','13:00-15:00','English II',2,'2025-02-14','ENG1222'),
('A023','09:00-11:00','Server Side Theory',2,'2025-02-17','ICT1233'),
('A024','13:00-15:00','Server Side Practical',2,'2025-02-17','ICT1233'),
('A025','09:00-11:00','Network Theory',2,'2025-02-18','ICT1253'),
('A026','11:00-13:00','Network Practical',2,'2025-02-18','ICT1253'),
('A027','14:00-16:00','Computer Architecture',2,'2025-02-18','ICT1242'),
('A028','09:00-12:00','Discrete Mathematics',3,'2025-02-19','TMS1233'),
('A029','09:00-11:00','Database Theory',2,'2025-02-20','ICT1212'),
('A030','11:00-13:00','Database Practical',2,'2025-02-20','ICT1222'),
('A031','14:00-16:00','Database Practical',2,'2025-02-20','ICT1222'),
('A032','08:00-10:00','Foundation of Management',2,'2025-02-21','TCS1212'),
('A033','13:00-15:00','English II',2,'2025-02-21','ENG1222'),
('A034','09:00-11:00','Server Side Theory',2,'2025-02-24','ICT1233'),
('A035','13:00-15:00','Server Side Practical',2,'2025-02-24','ICT1233'),
('A036','09:00-11:00','Network Theory',2,'2025-02-25','ICT1253'),
('A037','11:00-13:00','Network Practical',2,'2025-02-25','ICT1253'),
('A038','14:00-16:00','Computer Architecture',2,'2025-02-25','ICT1242'),
('A039','09:00-12:00','Discrete Mathematics',3,'2025-02-26','TMS1233'),
('A040','09:00-11:00','Database Theory',2,'2025-02-27','ICT1212'),
('A041','11:00-13:00','Database Practical',2,'2025-02-27','ICT1222'),
('A042','14:00-16:00','Database Practical',2,'2025-02-27','ICT1222'),
('A043','08:00-10:00','Foundation of Management',2,'2025-02-28','TCS1212'),
('A044','13:00-15:00','English II',2,'2025-02-28','ENG1222'),
('A045','09:00-11:00','Server Side Theory',2,'2025-03-03','ICT1233'),
('A046','13:00-15:00','Server Side Practical',2,'2025-03-03','ICT1233'),
('A047','09:00-11:00','Network Theory',2,'2025-03-04','ICT1253'),
('A048','11:00-13:00','Network Practical',2,'2025-03-04','ICT1253'),
('A049','14:00-16:00','Computer Architecture',2,'2025-03-04','ICT1242'),
('A050','09:00-12:00','Discrete Mathematics',3,'2025-03-05','TMS1233');

INSERT INTO Attendance (Attendance_ID, Time, Type, Hours, Date, Course_Code) VALUES
('A051','09:00-11:00','Database Theory',2,'2025-03-06','ICT1212'),
('A052','11:00-13:00','Database Practical',2,'2025-03-06','ICT1222'),
('A053','14:00-16:00','Database Practical',2,'2025-03-06','ICT1222'),
('A054','08:00-10:00','Foundation of Management',2,'2025-03-07','TCS1212'),
('A055','13:00-15:00','English II',2,'2025-03-07','ENG1222'),
('A056','09:00-11:00','Server Side Theory',2,'2025-03-10','ICT1233'),
('A057','13:00-15:00','Server Side Practical',2,'2025-03-10','ICT1233'),
('A058','09:00-11:00','Network Theory',2,'2025-03-11','ICT1253'),
('A059','11:00-13:00','Network Practical',2,'2025-03-11','ICT1253'),
('A060','14:00-16:00','Computer Architecture',2,'2025-03-11','ICT1242'),
('A061','09:00-12:00','Discrete Mathematics',3,'2025-03-12','TMS1233'),
('A062','09:00-11:00','Database Theory',2,'2025-03-13','ICT1212'),
('A063','11:00-13:00','Database Practical',2,'2025-03-13','ICT1222'),
('A064','14:00-16:00','Database Practical',2,'2025-03-13','ICT1222'),
('A065','08:00-10:00','Foundation of Management',2,'2025-03-14','TCS1212'),
('A066','13:00-15:00','English II',2,'2025-03-14','ENG1222'),
('A067','09:00-11:00','Server Side Theory',2,'2025-03-17','ICT1233'),
('A068','13:00-15:00','Server Side Practical',2,'2025-03-17','ICT1233'),
('A069','09:00-11:00','Network Theory',2,'2025-03-18','ICT1253'),
('A070','11:00-13:00','Network Practical',2,'2025-03-18','ICT1253'),
('A071','14:00-16:00','Computer Architecture',2,'2025-03-18','ICT1242'),
('A072','09:00-12:00','Discrete Mathematics',3,'2025-03-19','TMS1233'),
('A073','09:00-11:00','Database Theory',2,'2025-03-20','ICT1212'),
('A074','11:00-13:00','Database Practical',2,'2025-03-20','ICT1222'),
('A075','14:00-16:00','Database Practical',2,'2025-03-20','ICT1222'),
('A076','08:00-10:00','Foundation of Management',2,'2025-03-21','TCS1212'),
('A077','13:00-15:00','English II',2,'2025-03-21','ENG1222'),
('A078','09:00-11:00','Server Side Theory',2,'2025-03-24','ICT1233'),
('A079','13:00-15:00','Server Side Practical',2,'2025-03-24','ICT1233'),
('A080','09:00-11:00','Network Theory',2,'2025-03-25','ICT1253'),
('A081','11:00-13:00','Network Practical',2,'2025-03-25','ICT1253'),
('A082','14:00-16:00','Computer Architecture',2,'2025-03-25','ICT1242'),
('A083','09:00-12:00','Discrete Mathematics',3,'2025-03-26','TMS1233'),
('A084','09:00-11:00','Database Theory',2,'2025-03-27','ICT1212'),
('A085','11:00-13:00','Database Practical',2,'2025-03-27','ICT1222'),
('A086','14:00-16:00','Database Practical',2,'2025-03-27','ICT1222'),
('A087','08:00-10:00','Foundation of Management',2,'2025-03-28','TCS1212'),
('A088','13:00-15:00','English II',2,'2025-03-28','ENG1222'),
('A089','09:00-11:00','Server Side Theory',2,'2025-03-31','ICT1233'),
('A090','13:00-15:00','Server Side Practical',2,'2025-03-31','ICT1233'),
('A091','09:00-11:00','Network Theory',2,'2025-04-01','ICT1253'),
('A092','11:00-13:00','Network Practical',2,'2025-04-01','ICT1253'),
('A093','14:00-16:00','Computer Architecture',2,'2025-04-01','ICT1242'),
('A094','09:00-12:00','Discrete Mathematics',3,'2025-04-02','TMS1233'),
('A095','09:00-11:00','Database Theory',2,'2025-04-03','ICT1212'),
('A096','11:00-13:00','Database Practical',2,'2025-04-03','ICT1222'),
('A097','14:00-16:00','Database Practical',2,'2025-04-03','ICT1222'),
('A098','08:00-10:00','Foundation of Management',2,'2025-04-04','TCS1212'),
('A099','13:00-15:00','English II',2,'2025-04-04','ENG1222'),
('A100','09:00-11:00','Server Side Theory',2,'2025-04-07','ICT1233');

INSERT INTO Attendance (Attendance_ID, Time, Type, Hours, Date, Course_Code) VALUES
('A101','13:00-15:00','Server Side Practical',2,'2025-04-07','ICT1233'),
('A102','09:00-11:00','Network Theory',2,'2025-04-08','ICT1253'),
('A103','11:00-13:00','Network Practical',2,'2025-04-08','ICT1253'),
('A104','14:00-16:00','Computer Architecture',2,'2025-04-08','ICT1242'),
('A105','09:00-12:00','Discrete Mathematics',3,'2025-04-09','TMS1233'),
('A106','09:00-11:00','Database Theory',2,'2025-04-10','ICT1212'),
('A107','11:00-13:00','Database Practical',2,'2025-04-10','ICT1222'),
('A108','14:00-16:00','Database Practical',2,'2025-04-10','ICT1222'),
('A109','08:00-10:00','Foundation of Management',2,'2025-04-11','TCS1212'),
('A110','13:00-15:00','English II',2,'2025-04-11','ENG1222'),
('A111','09:00-11:00','Server Side Theory',2,'2025-04-14','ICT1233'),
('A112','13:00-15:00','Server Side Practical',2,'2025-04-14','ICT1233'),
('A113','09:00-11:00','Network Theory',2,'2025-04-15','ICT1253'),
('A114','11:00-13:00','Network Practical',2,'2025-04-15','ICT1253'),
('A115','14:00-16:00','Computer Architecture',2,'2025-04-15','ICT1242'),
('A116','09:00-12:00','Discrete Mathematics',3,'2025-04-16','TMS1233'),
('A117','09:00-11:00','Database Theory',2,'2025-04-17','ICT1212'),
('A118','11:00-13:00','Database Practical',2,'2025-04-17','ICT1222'),
('A119','14:00-16:00','Database Practical',2,'2025-04-17','ICT1222'),
('A120','08:00-10:00','Foundation of Management',2,'2025-04-18','TCS1212'),
('A121','13:00-15:00','English II',2,'2025-04-18','ENG1222'),
('A122','09:00-11:00','Server Side Theory',2,'2025-04-21','ICT1233'),
('A123','13:00-15:00','Server Side Practical',2,'2025-04-21','ICT1233'),
('A124','09:00-11:00','Network Theory',2,'2025-04-22','ICT1253'),
('A125','11:00-13:00','Network Practical',2,'2025-04-22','ICT1253'),
('A126','14:00-16:00','Computer Architecture',2,'2025-04-22','ICT1242'),
('A127','09:00-12:00','Discrete Mathematics',3,'2025-04-23','TMS1233'),
('A128','09:00-11:00','Database Theory',2,'2025-04-24','ICT1212'),
('A129','11:00-13:00','Database Practical',2,'2025-04-24','ICT1222'),
('A130','14:00-16:00','Database Practical',2,'2025-04-24','ICT1222'),
('A131','08:00-10:00','Foundation of Management',2,'2025-04-25','TCS1212'),
('A132','13:00-15:00','English II',2,'2025-04-25','ENG1222'),
('A133','09:00-11:00','Server Side Theory',2,'2025-04-28','ICT1233'),
('A134','13:00-15:00','Server Side Practical',2,'2025-04-28','ICT1233'),
('A135','09:00-11:00','Network Theory',2,'2025-04-29','ICT1253'),
('A136','11:00-13:00','Network Practical',2,'2025-04-29','ICT1253'),
('A137','14:00-16:00','Computer Architecture',2,'2025-04-29','ICT1242'),
('A138','09:00-12:00','Discrete Mathematics',3,'2025-04-30','TMS1233'),
('A139','09:00-11:00','Database Theory',2,'2025-05-01','ICT1212'),
('A140','11:00-13:00','Database Practical',2,'2025-05-01','ICT1222'),
('A141','14:00-16:00','Database Practical',2,'2025-05-01','ICT1222'),
('A142','08:00-10:00','Foundation of Management',2,'2025-05-02','TCS1212'),
('A143','13:00-15:00','English II',2,'2025-05-02','ENG1222'),
('A144','09:00-11:00','Server Side Theory',2,'2025-05-05','ICT1233'),
('A145','13:00-15:00','Server Side Practical',2,'2025-05-05','ICT1233'),
('A146','09:00-11:00','Network Theory',2,'2025-05-06','ICT1253'),
('A147','11:00-13:00','Network Practical',2,'2025-05-06','ICT1253'),
('A148','14:00-16:00','Computer Architecture',2,'2025-05-06','ICT1242'),
('A149','09:00-12:00','Discrete Mathematics',3,'2025-05-07','TMS1233'),
('A150','09:00-11:00','Database Theory',2,'2025-05-08','ICT1212');

INSERT INTO Attendance (Attendance_ID, Time, Type, Hours, Date, Course_Code) VALUES
('A151','11:00-13:00','Database Practical',2,'2025-05-08','ICT1222'),
('A152','14:00-16:00','Database Practical',2,'2025-05-08','ICT1222'),
('A153','08:00-10:00','Foundation of Management',2,'2025-05-09','TCS1212'),
('A154','13:00-15:00','English II',2,'2025-05-09','ENG1222'),
('A155','09:00-11:00','Server Side Theory',2,'2025-05-12','ICT1233'),
('A156','13:00-15:00','Server Side Practical',2,'2025-05-12','ICT1233'),
('A157','09:00-11:00','Network Theory',2,'2025-05-13','ICT1253'),
('A158','11:00-13:00','Network Practical',2,'2025-05-13','ICT1253'),
('A159','14:00-16:00','Computer Architecture',2,'2025-05-13','ICT1242'),
('A160','09:00-12:00','Discrete Mathematics',3,'2025-05-14','TMS1233'),
('A161','09:00-11:00','Database Theory',2,'2025-05-15','ICT1212'),
('A162','11:00-13:00','Database Practical',2,'2025-05-15','ICT1222'),
('A163','14:00-16:00','Database Practical',2,'2025-05-15','ICT1222'),
('A164','08:00-10:00','Foundation of Management',2,'2025-05-16','TCS1212'),
('A165','13:00-15:00','English II',2,'2025-05-16','ENG1222');






































INSERT INTO Course_Mark (Course_Code, Mark_ID) VALUES
('ENG1222', 'M001'),
('ICT1212', 'M002'),
('ICT1222', 'M003'),
('ICT1233', 'M004'),
('ICT1242', 'M005'),
('ICT1253', 'M006'),
('TCS1212', 'M007'),
('TMS1233', 'M008'),
('ENG1222', 'M009'),
('ICT1212', 'M010'),
('ICT1222', 'M011'),
('ICT1233', 'M012'),
('ICT1242', 'M013'),
('ICT1253', 'M014'),
('TCS1212', 'M015'),
('TMS1233', 'M016'),
('ENG1222', 'M017'),
('ICT1212', 'M018'),
('ICT1222', 'M019'),
('ICT1233', 'M020'),
('ICT1242', 'M021'),
('ICT1253', 'M022'),
('TCS1212', 'M023'),
('TMS1233', 'M024'),
('ENG1222', 'M025'),
('ICT1212', 'M026'),
('ICT1222', 'M027'),
('ICT1233', 'M028'),
('ICT1242', 'M029'),
('ICT1253', 'M030'),
('TCS1212', 'M031'),
('TMS1233', 'M032'),
('ENG1222', 'M033'),
('ICT1212', 'M034'),
('ICT1222', 'M035'),
('ICT1233', 'M036'),
('ICT1242', 'M037'),
('ICT1253', 'M038'),
('TCS1212', 'M039'),
('TMS1233', 'M040'),
('ENG1222', 'M041'),
('ICT1212', 'M042'),
('ICT1222', 'M043'),
('ICT1233', 'M044'),
('ICT1242', 'M045'),
('ICT1253', 'M046'),
('TCS1212', 'M047'),
('TMS1233', 'M048'),
('ENG1222', 'M049'),
('ICT1212', 'M050'),
('ICT1222', 'M051'),
('ICT1233', 'M052'),
('ICT1242', 'M053'),
('ICT1253', 'M054'),
('TCS1212', 'M055'),
('TMS1233', 'M056'),
('ENG1222', 'M057'),
('ICT1212', 'M058'),
('ICT1222', 'M059'),
('ICT1233', 'M060'),
('ICT1242', 'M061'),
('ICT1253', 'M062'),
('TCS1212', 'M063'),
('TMS1233', 'M064'),
('ENG1222', 'M065'),
('ICT1212', 'M066'),
('ICT1222', 'M067'),
('ICT1233', 'M068'),
('ICT1242', 'M069'),
('ICT1253', 'M070'),
('TCS1212', 'M071'),
('TMS1233', 'M072'),
('ENG1222', 'M073'),
('ICT1212', 'M074'),
('ICT1222', 'M075'),
('ICT1233', 'M076'),
('ICT1242', 'M077'),
('ICT1253', 'M078'),
('TCS1212', 'M079'),
('TMS1233', 'M080'),
('ENG1222', 'M081'),
('ICT1212', 'M082'),
('ICT1222', 'M083'),
('ICT1233', 'M084'),
('ICT1242', 'M085'),
('ICT1253', 'M086'),
('TCS1212', 'M087'),
('TMS1233', 'M088'),
('ENG1222', 'M089'),
('ICT1212', 'M090'),
('ICT1222', 'M091'),
('ICT1233', 'M092'),
('ICT1242', 'M093'),
('ICT1253', 'M094'),
('TCS1212', 'M095'),
('TMS1233', 'M096'),
('ENG1222', 'M097'),
('ICT1212', 'M098'),
('ICT1222', 'M099'),
('ICT1233', 'M100'),
('ICT1242', 'M101'),
('ICT1253', 'M102'),
('TCS1212', 'M103'),
('TMS1233', 'M104'),
('ENG1222', 'M105'),
('ICT1212', 'M106'),
('ICT1222', 'M107'),
('ICT1233', 'M108'),
('ICT1242', 'M109'),
('ICT1253', 'M110'),
('TCS1212', 'M111'),
('TMS1233', 'M112'),
('ENG1222', 'M113'),
('ICT1212', 'M114'),
('ICT1222', 'M115'),
('ICT1233', 'M116'),
('ICT1242', 'M117'),
('ICT1253', 'M118'),
('TCS1212', 'M119'),
('TMS1233', 'M120');



INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S001', 'A001', 'PRESENT'), ('S001', 'A002', 'PRESENT'), ('S001', 'A003', 'PRESENT'), ('S001', 'A004', 'PRESENT'), ('S001', 'A005', 'PRESENT'),
('S001', 'A006', 'ABSENT'), ('S001', 'A007', 'PRESENT'), ('S001', 'A008', 'PRESENT'), ('S001', 'A009', 'PRESENT'), ('S001', 'A010', 'PRESENT'),
('S001', 'A011', 'PRESENT'), ('S001', 'A012', 'PRESENT'), ('S001', 'A013', 'ABSENT'), ('S001', 'A014', 'PRESENT'), ('S001', 'A015', 'PRESENT'),
('S001', 'A016', 'PRESENT'), ('S001', 'A017', 'PRESENT'), ('S001', 'A018', 'PRESENT'), ('S001', 'A019', 'PRESENT'), ('S001', 'A020', 'ABSENT'),
('S001', 'A021', 'PRESENT'), ('S001', 'A022', 'PRESENT'), ('S001', 'A023', 'PRESENT'), ('S001', 'A024', 'PRESENT'), ('S001', 'A025', 'PRESENT'),
('S001', 'A026', 'PRESENT'), ('S001', 'A027', 'ABSENT'), ('S001', 'A028', 'PRESENT'), ('S001', 'A029', 'PRESENT'), ('S001', 'A030', 'PRESENT'),
('S001', 'A031', 'PRESENT'), ('S001', 'A032', 'PRESENT'), ('S001', 'A033', 'PRESENT'), ('S001', 'A034', 'PRESENT'), ('S001', 'A035', 'ABSENT'),
('S001', 'A036', 'PRESENT'), ('S001', 'A037', 'PRESENT'), ('S001', 'A038', 'PRESENT'), ('S001', 'A039', 'PRESENT'), ('S001', 'A040', 'PRESENT'),
('S001', 'A041', 'PRESENT'), ('S001', 'A042', 'PRESENT'), ('S001', 'A043', 'ABSENT'), ('S001', 'A044', 'PRESENT'), ('S001', 'A045', 'PRESENT'),
('S001', 'A046', 'PRESENT'), ('S001', 'A047', 'PRESENT'), ('S001', 'A048', 'PRESENT'), ('S001', 'A049', 'PRESENT'), ('S001', 'A050', 'PRESENT'),
('S001', 'A051', 'ABSENT'), ('S001', 'A052', 'PRESENT'), ('S001', 'A053', 'PRESENT'), ('S001', 'A054', 'PRESENT'), ('S001', 'A055', 'PRESENT'),
('S001', 'A056', 'PRESENT'), ('S001', 'A057', 'PRESENT'), ('S001', 'A058', 'PRESENT'), ('S001', 'A059', 'PRESENT'), ('S001', 'A060', 'ABSENT'),
('S001', 'A061', 'PRESENT'), ('S001', 'A062', 'PRESENT'), ('S001', 'A063', 'PRESENT'), ('S001', 'A064', 'PRESENT'), ('S001', 'A065', 'PRESENT'),
('S001', 'A066', 'PRESENT'), ('S001', 'A067', 'ABSENT'), ('S001', 'A068', 'PRESENT'), ('S001', 'A069', 'PRESENT'), ('S001', 'A070', 'PRESENT'),
('S001', 'A071', 'PRESENT'), ('S001', 'A072', 'PRESENT'), ('S001', 'A073', 'PRESENT'), ('S001', 'A074', 'PRESENT'), ('S001', 'A075', 'PRESENT'),
('S001', 'A076', 'ABSENT'), ('S001', 'A077', 'PRESENT'), ('S001', 'A078', 'PRESENT'), ('S001', 'A079', 'PRESENT'), ('S001', 'A080', 'PRESENT'),
('S001', 'A081', 'PRESENT'), ('S001', 'A082', 'PRESENT'), ('S001', 'A083', 'PRESENT'), ('S001', 'A084', 'PRESENT'), ('S001', 'A085', 'ABSENT'),
('S001', 'A086', 'PRESENT'), ('S001', 'A087', 'PRESENT'), ('S001', 'A088', 'PRESENT'), ('S001', 'A089', 'PRESENT'), ('S001', 'A090', 'PRESENT'),
('S001', 'A091', 'PRESENT'), ('S001', 'A092', 'PRESENT'), ('S001', 'A093', 'ABSENT'), ('S001', 'A094', 'PRESENT'), ('S001', 'A095', 'PRESENT'),
('S001', 'A096', 'PRESENT'), ('S001', 'A097', 'PRESENT'), ('S001', 'A098', 'PRESENT'), ('S001', 'A099', 'PRESENT'), ('S001', 'A100', 'PRESENT'),
('S001', 'A101', 'ABSENT'), ('S001', 'A102', 'PRESENT'), ('S001', 'A103', 'PRESENT'), ('S001', 'A104', 'PRESENT'), ('S001', 'A105', 'PRESENT'),
('S001', 'A106', 'PRESENT'), ('S001', 'A107', 'PRESENT'), ('S001', 'A108', 'PRESENT'), ('S001', 'A109', 'PRESENT'), ('S001', 'A110', 'PRESENT'),
('S001', 'A111', 'PRESENT'), ('S001', 'A112', 'ABSENT'), ('S001', 'A113', 'PRESENT'), ('S001', 'A114', 'PRESENT'), ('S001', 'A115', 'PRESENT'),
('S001', 'A116', 'PRESENT'), ('S001', 'A117', 'PRESENT'), ('S001', 'A118', 'PRESENT'), ('S001', 'A119', 'PRESENT'), ('S001', 'A120', 'ABSENT'),
('S001', 'A121', 'PRESENT'), ('S001', 'A122', 'PRESENT'), ('S001', 'A123', 'PRESENT'), ('S001', 'A124', 'PRESENT'), ('S001', 'A125', 'PRESENT'),
('S001', 'A126', 'PRESENT'), ('S001', 'A127', 'PRESENT'), ('S001', 'A128', 'ABSENT'), ('S001', 'A129', 'PRESENT'), ('S001', 'A130', 'PRESENT'),
('S001', 'A131', 'PRESENT'), ('S001', 'A132', 'PRESENT'), ('S001', 'A133', 'PRESENT'), ('S001', 'A134', 'PRESENT'), ('S001', 'A135', 'PRESENT'),
('S001', 'A136', 'ABSENT'), ('S001', 'A137', 'PRESENT'), ('S001', 'A138', 'PRESENT'), ('S001', 'A139', 'PRESENT'), ('S001', 'A140', 'PRESENT'),
('S001', 'A141', 'PRESENT'), ('S001', 'A142', 'PRESENT'), ('S001', 'A143', 'PRESENT'), ('S001', 'A144', 'PRESENT'), ('S001', 'A145', 'ABSENT'),
('S001', 'A146', 'PRESENT'), ('S001', 'A147', 'PRESENT'), ('S001', 'A148', 'PRESENT'), ('S001', 'A149', 'PRESENT'), ('S001', 'A150', 'PRESENT'),
('S001', 'A151', 'PRESENT'), ('S001', 'A152', 'PRESENT'), ('S001', 'A153', 'ABSENT'), ('S001', 'A154', 'PRESENT'), ('S001', 'A155', 'PRESENT'),
('S001', 'A156', 'PRESENT'), ('S001', 'A157', 'PRESENT'), ('S001', 'A158', 'PRESENT'), ('S001', 'A159', 'PRESENT'), ('S001', 'A160', 'PRESENT'),
('S001', 'A161', 'PRESENT'), ('S001', 'A162', 'ABSENT'), ('S001', 'A163', 'PRESENT'), ('S001', 'A164', 'PRESENT'), ('S001', 'A165', 'PRESENT');


INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S002', 'A001', 'PRESENT'), ('S002', 'A002', 'PRESENT'), ('S002', 'A003', 'PRESENT'), ('S002', 'A004', 'ABSENT'), ('S002', 'A005', 'PRESENT'),
('S002', 'A006', 'PRESENT'), ('S002', 'A007', 'PRESENT'), ('S002', 'A008', 'PRESENT'), ('S002', 'A009', 'PRESENT'), ('S002', 'A010', 'ABSENT'),
('S002', 'A011', 'PRESENT'), ('S002', 'A012', 'PRESENT'), ('S002', 'A013', 'PRESENT'), ('S002', 'A014', 'PRESENT'), ('S002', 'A015', 'PRESENT'),
('S002', 'A016', 'ABSENT'), ('S002', 'A017', 'PRESENT'), ('S002', 'A018', 'PRESENT'), ('S002', 'A019', 'PRESENT'), ('S002', 'A020', 'PRESENT'),
('S002', 'A021', 'PRESENT'), ('S002', 'A022', 'PRESENT'), ('S002', 'A023', 'ABSENT'), ('S002', 'A024', 'PRESENT'), ('S002', 'A025', 'PRESENT'),
('S002', 'A026', 'PRESENT'), ('S002', 'A027', 'PRESENT'), ('S002', 'A028', 'PRESENT'), ('S002', 'A029', 'PRESENT'), ('S002', 'A030', 'ABSENT'),
('S002', 'A031', 'PRESENT'), ('S002', 'A032', 'PRESENT'), ('S002', 'A033', 'PRESENT'), ('S002', 'A034', 'PRESENT'), ('S002', 'A035', 'PRESENT'),
('S002', 'A036', 'PRESENT'), ('S002', 'A037', 'ABSENT'), ('S002', 'A038', 'PRESENT'), ('S002', 'A039', 'PRESENT'), ('S002', 'A040', 'PRESENT'),
('S002', 'A041', 'PRESENT'), ('S002', 'A042', 'PRESENT'), ('S002', 'A043', 'PRESENT'), ('S002', 'A044', 'ABSENT'), ('S002', 'A045', 'PRESENT'),
('S002', 'A046', 'PRESENT'), ('S002', 'A047', 'PRESENT'), ('S002', 'A048', 'PRESENT'), ('S002', 'A049', 'PRESENT'), ('S002', 'A050', 'PRESENT'),
('S002', 'A051', 'ABSENT'), ('S002', 'A052', 'PRESENT'), ('S002', 'A053', 'PRESENT'), ('S002', 'A054', 'PRESENT'), ('S002', 'A055', 'PRESENT'),
('S002', 'A056', 'PRESENT'), ('S002', 'A057', 'PRESENT'), ('S002', 'A058', 'ABSENT'), ('S002', 'A059', 'PRESENT'), ('S002', 'A060', 'PRESENT'),
('S002', 'A061', 'PRESENT'), ('S002', 'A062', 'PRESENT'), ('S002', 'A063', 'PRESENT'), ('S002', 'A064', 'PRESENT'), ('S002', 'A065', 'PRESENT'),
('S002', 'A066', 'PRESENT'), ('S002', 'A067', 'ABSENT'), ('S002', 'A068', 'PRESENT'), ('S002', 'A069', 'PRESENT'), ('S002', 'A070', 'PRESENT'),
('S002', 'A071', 'PRESENT'), ('S002', 'A072', 'PRESENT'), ('S002', 'A073', 'PRESENT'), ('S002', 'A074', 'PRESENT'), ('S002', 'A075', 'ABSENT'),
('S002', 'A076', 'PRESENT'), ('S002', 'A077', 'PRESENT'), ('S002', 'A078', 'PRESENT'), ('S002', 'A079', 'PRESENT'), ('S002', 'A080', 'PRESENT'),
('S002', 'A081', 'PRESENT'), ('S002', 'A082', 'ABSENT'), ('S002', 'A083', 'PRESENT'), ('S002', 'A084', 'PRESENT'), ('S002', 'A085', 'PRESENT'),
('S002', 'A086', 'PRESENT'), ('S002', 'A087', 'PRESENT'), ('S002', 'A088', 'PRESENT'), ('S002', 'A089', 'PRESENT'), ('S002', 'A090', 'ABSENT'),
('S002', 'A091', 'PRESENT'), ('S002', 'A092', 'PRESENT'), ('S002', 'A093', 'PRESENT'), ('S002', 'A094', 'PRESENT'), ('S002', 'A095', 'PRESENT'),
('S002', 'A096', 'PRESENT'), ('S002', 'A097', 'ABSENT'), ('S002', 'A098', 'PRESENT'), ('S002', 'A099', 'PRESENT'), ('S002', 'A100', 'PRESENT'),
('S002', 'A101', 'PRESENT'), ('S002', 'A102', 'PRESENT'), ('S002', 'A103', 'PRESENT'), ('S002', 'A104', 'PRESENT'), ('S002', 'A105', 'ABSENT'),
('S002', 'A106', 'PRESENT'), ('S002', 'A107', 'PRESENT'), ('S002', 'A108', 'PRESENT'), ('S002', 'A109', 'PRESENT'), ('S002', 'A110', 'PRESENT'),
('S002', 'A111', 'PRESENT'), ('S002', 'A112', 'PRESENT'), ('S002', 'A113', 'ABSENT'), ('S002', 'A114', 'PRESENT'), ('S002', 'A115', 'PRESENT'),
('S002', 'A116', 'PRESENT'), ('S002', 'A117', 'PRESENT'), ('S002', 'A118', 'PRESENT'), ('S002', 'A119', 'PRESENT'), ('S002', 'A120', 'PRESENT'),
('S002', 'A121', 'ABSENT'), ('S002', 'A122', 'PRESENT'), ('S002', 'A123', 'PRESENT'), ('S002', 'A124', 'PRESENT'), ('S002', 'A125', 'PRESENT'),
('S002', 'A126', 'PRESENT'), ('S002', 'A127', 'PRESENT'), ('S002', 'A128', 'PRESENT'), ('S002', 'A129', 'PRESENT'), ('S002', 'A130', 'ABSENT'),
('S002', 'A131', 'PRESENT'), ('S002', 'A132', 'PRESENT'), ('S002', 'A133', 'PRESENT'), ('S002', 'A134', 'PRESENT'), ('S002', 'A135', 'PRESENT'),
('S002', 'A136', 'PRESENT'), ('S002', 'A137', 'ABSENT'), ('S002', 'A138', 'PRESENT'), ('S002', 'A139', 'PRESENT'), ('S002', 'A140', 'PRESENT'),
('S002', 'A141', 'PRESENT'), ('S002', 'A142', 'PRESENT'), ('S002', 'A143', 'PRESENT'), ('S002', 'A144', 'PRESENT'), ('S002', 'A145', 'ABSENT'),
('S002', 'A146', 'PRESENT'), ('S002', 'A147', 'PRESENT'), ('S002', 'A148', 'PRESENT'), ('S002', 'A149', 'PRESENT'), ('S002', 'A150', 'PRESENT'),
('S002', 'A151', 'PRESENT'), ('S002', 'A152', 'PRESENT'), ('S002', 'A153', 'ABSENT'), ('S002', 'A154', 'PRESENT'), ('S002', 'A155', 'PRESENT'),
('S002', 'A156', 'PRESENT'), ('S002', 'A157', 'PRESENT'), ('S002', 'A158', 'PRESENT'), ('S002', 'A159', 'PRESENT'), ('S002', 'A160', 'PRESENT'),
('S002', 'A161', 'PRESENT'), ('S002', 'A162', 'ABSENT'), ('S002', 'A163', 'PRESENT'), ('S002', 'A164', 'PRESENT'), ('S002', 'A165', 'PRESENT');

INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S003', 'A001', 'PRESENT'), ('S003', 'A002', 'PRESENT'), ('S003', 'A003', 'PRESENT'), ('S003', 'A004', 'PRESENT'), ('S003', 'A005', 'ABSENT'),
('S003', 'A006', 'PRESENT'), ('S003', 'A007', 'PRESENT'), ('S003', 'A008', 'PRESENT'), ('S003', 'A009', 'PRESENT'), ('S003', 'A010', 'PRESENT'),
('S003', 'A011', 'ABSENT'), ('S003', 'A012', 'PRESENT'), ('S003', 'A013', 'PRESENT'), ('S003', 'A014', 'PRESENT'), ('S003', 'A015', 'PRESENT'),
('S003', 'A016', 'PRESENT'), ('S003', 'A017', 'PRESENT'), ('S003', 'A018', 'PRESENT'), ('S003', 'A019', 'ABSENT'), ('S003', 'A020', 'PRESENT'),
('S003', 'A021', 'PRESENT'), ('S003', 'A022', 'PRESENT'), ('S003', 'A023', 'PRESENT'), ('S003', 'A024', 'PRESENT'), ('S003', 'A025', 'PRESENT'),
('S003', 'A026', 'ABSENT'), ('S003', 'A027', 'PRESENT'), ('S003', 'A028', 'PRESENT'), ('S003', 'A029', 'PRESENT'), ('S003', 'A030', 'PRESENT'),
('S003', 'A031', 'PRESENT'), ('S003', 'A032', 'PRESENT'), ('S003', 'A033', 'PRESENT'), ('S003', 'A034', 'ABSENT'), ('S003', 'A035', 'PRESENT'),
('S003', 'A036', 'PRESENT'), ('S003', 'A037', 'PRESENT'), ('S003', 'A038', 'PRESENT'), ('S003', 'A039', 'PRESENT'), ('S003', 'A040', 'PRESENT'),
('S003', 'A041', 'PRESENT'), ('S003', 'A042', 'ABSENT'), ('S003', 'A043', 'PRESENT'), ('S003', 'A044', 'PRESENT'), ('S003', 'A045', 'PRESENT'),
('S003', 'A046', 'PRESENT'), ('S003', 'A047', 'PRESENT'), ('S003', 'A048', 'PRESENT'), ('S003', 'A049', 'PRESENT'), ('S003', 'A050', 'ABSENT'),
('S003', 'A051', 'PRESENT'), ('S003', 'A052', 'PRESENT'), ('S003', 'A053', 'PRESENT'), ('S003', 'A054', 'PRESENT'), ('S003', 'A055', 'PRESENT'),
('S003', 'A056', 'PRESENT'), ('S003', 'A057', 'PRESENT'), ('S003', 'A058', 'ABSENT'), ('S003', 'A059', 'PRESENT'), ('S003', 'A060', 'PRESENT'),
('S003', 'A061', 'PRESENT'), ('S003', 'A062', 'PRESENT'), ('S003', 'A063', 'PRESENT'), ('S003', 'A064', 'PRESENT'), ('S003', 'A065', 'ABSENT'),
('S003', 'A066', 'PRESENT'), ('S003', 'A067', 'PRESENT'), ('S003', 'A068', 'PRESENT'), ('S003', 'A069', 'PRESENT'), ('S003', 'A070', 'PRESENT'),
('S003', 'A071', 'PRESENT'), ('S003', 'A072', 'PRESENT'), ('S003', 'A073', 'ABSENT'), ('S003', 'A074', 'PRESENT'), ('S003', 'A075', 'PRESENT'),
('S003', 'A076', 'PRESENT'), ('S003', 'A077', 'PRESENT'), ('S003', 'A078', 'PRESENT'), ('S003', 'A079', 'PRESENT'), ('S003', 'A080', 'ABSENT'),
('S003', 'A081', 'PRESENT'), ('S003', 'A082', 'PRESENT'), ('S003', 'A083', 'PRESENT'), ('S003', 'A084', 'PRESENT'), ('S003', 'A085', 'PRESENT'),
('S003', 'A086', 'PRESENT'), ('S003', 'A087', 'ABSENT'), ('S003', 'A088', 'PRESENT'), ('S003', 'A089', 'PRESENT'), ('S003', 'A090', 'PRESENT'),
('S003', 'A091', 'PRESENT'), ('S003', 'A092', 'PRESENT'), ('S003', 'A093', 'PRESENT'), ('S003', 'A094', 'PRESENT'), ('S003', 'A095', 'ABSENT'),
('S003', 'A096', 'PRESENT'), ('S003', 'A097', 'PRESENT'), ('S003', 'A098', 'PRESENT'), ('S003', 'A099', 'PRESENT'), ('S003', 'A100', 'PRESENT'),
('S003', 'A101', 'PRESENT'), ('S003', 'A102', 'ABSENT'), ('S003', 'A103', 'PRESENT'), ('S003', 'A104', 'PRESENT'), ('S003', 'A105', 'PRESENT'),
('S003', 'A106', 'PRESENT'), ('S003', 'A107', 'PRESENT'), ('S003', 'A108', 'PRESENT'), ('S003', 'A109', 'PRESENT'), ('S003', 'A110', 'ABSENT'),
('S003', 'A111', 'PRESENT'), ('S003', 'A112', 'PRESENT'), ('S003', 'A113', 'PRESENT'), ('S003', 'A114', 'PRESENT'), ('S003', 'A115', 'PRESENT'),
('S003', 'A116', 'PRESENT'), ('S003', 'A117', 'ABSENT'), ('S003', 'A118', 'PRESENT'), ('S003', 'A119', 'PRESENT'), ('S003', 'A120', 'PRESENT'),
('S003', 'A121', 'PRESENT'), ('S003', 'A122', 'PRESENT'), ('S003', 'A123', 'PRESENT'), ('S003', 'A124', 'PRESENT'), ('S003', 'A125', 'ABSENT'),
('S003', 'A126', 'PRESENT'), ('S003', 'A127', 'PRESENT'), ('S003', 'A128', 'PRESENT'), ('S003', 'A129', 'PRESENT'), ('S003', 'A130', 'PRESENT'),
('S003', 'A131', 'PRESENT'), ('S003', 'A132', 'ABSENT'), ('S003', 'A133', 'PRESENT'), ('S003', 'A134', 'PRESENT'), ('S003', 'A135', 'PRESENT'),
('S003', 'A136', 'PRESENT'), ('S003', 'A137', 'PRESENT'), ('S003', 'A138', 'PRESENT'), ('S003', 'A139', 'PRESENT'), ('S003', 'A140', 'ABSENT'),
('S003', 'A141', 'PRESENT'), ('S003', 'A142', 'PRESENT'), ('S003', 'A143', 'PRESENT'), ('S003', 'A144', 'PRESENT'), ('S003', 'A145', 'PRESENT'),
('S003', 'A146', 'PRESENT'), ('S003', 'A147', 'ABSENT'), ('S003', 'A148', 'PRESENT'), ('S003', 'A149', 'PRESENT'), ('S003', 'A150', 'PRESENT'),
('S003', 'A151', 'PRESENT'), ('S003', 'A152', 'PRESENT'), ('S003', 'A153', 'PRESENT'), ('S003', 'A154', 'PRESENT'), ('S003', 'A155', 'ABSENT'),
('S003', 'A156', 'PRESENT'), ('S003', 'A157', 'PRESENT'), ('S003', 'A158', 'PRESENT'), ('S003', 'A159', 'PRESENT'), ('S003', 'A160', 'PRESENT'),
('S003', 'A161', 'PRESENT'), ('S003', 'A162', 'PRESENT'), ('S003', 'A163', 'ABSENT'), ('S003', 'A164', 'PRESENT'), ('S003', 'A165', 'PRESENT');

INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S004', 'A001', 'PRESENT'), ('S004', 'A002', 'PRESENT'), ('S004', 'A003', 'PRESENT'), ('S004', 'A004', 'PRESENT'), ('S004', 'A005', 'PRESENT'),
('S004', 'A006', 'PRESENT'), ('S004', 'A007', 'ABSENT'), ('S004', 'A008', 'PRESENT'), ('S004', 'A009', 'PRESENT'), ('S004', 'A010', 'PRESENT'),
('S004', 'A011', 'PRESENT'), ('S004', 'A012', 'PRESENT'), ('S004', 'A013', 'PRESENT'), ('S004', 'A014', 'PRESENT'), ('S004', 'A015', 'ABSENT'),
('S004', 'A016', 'PRESENT'), ('S004', 'A017', 'PRESENT'), ('S004', 'A018', 'PRESENT'), ('S004', 'A019', 'PRESENT'), ('S004', 'A020', 'PRESENT'),
('S004', 'A021', 'PRESENT'), ('S004', 'A022', 'PRESENT'), ('S004', 'A023', 'ABSENT'), ('S004', 'A024', 'PRESENT'), ('S004', 'A025', 'PRESENT'),
('S004', 'A026', 'PRESENT'), ('S004', 'A027', 'PRESENT'), ('S004', 'A028', 'PRESENT'), ('S004', 'A029', 'PRESENT'), ('S004', 'A030', 'PRESENT'),
('S004', 'A031', 'ABSENT'), ('S004', 'A032', 'PRESENT'), ('S004', 'A033', 'PRESENT'), ('S004', 'A034', 'PRESENT'), ('S004', 'A035', 'PRESENT'),
('S004', 'A036', 'PRESENT'), ('S004', 'A037', 'PRESENT'), ('S004', 'A038', 'PRESENT'), ('S004', 'A039', 'PRESENT'), ('S004', 'A040', 'ABSENT'),
('S004', 'A041', 'PRESENT'), ('S004', 'A042', 'PRESENT'), ('S004', 'A043', 'PRESENT'), ('S004', 'A044', 'PRESENT'), ('S004', 'A045', 'PRESENT'),
('S004', 'A046', 'PRESENT'), ('S004', 'A047', 'PRESENT'), ('S004', 'A048', 'ABSENT'), ('S004', 'A049', 'PRESENT'), ('S004', 'A050', 'PRESENT'),
('S004', 'A051', 'PRESENT'), ('S004', 'A052', 'PRESENT'), ('S004', 'A053', 'PRESENT'), ('S004', 'A054', 'PRESENT'), ('S004', 'A055', 'PRESENT'),
('S004', 'A056', 'PRESENT'), ('S004', 'A057', 'ABSENT'), ('S004', 'A058', 'PRESENT'), ('S004', 'A059', 'PRESENT'), ('S004', 'A060', 'PRESENT'),
('S004', 'A061', 'PRESENT'), ('S004', 'A062', 'PRESENT'), ('S004', 'A063', 'PRESENT'), ('S004', 'A064', 'PRESENT'), ('S004', 'A065', 'PRESENT'),
('S004', 'A066', 'ABSENT'), ('S004', 'A067', 'PRESENT'), ('S004', 'A068', 'PRESENT'), ('S004', 'A069', 'PRESENT'), ('S004', 'A070', 'PRESENT'),
('S004', 'A071', 'PRESENT'), ('S004', 'A072', 'PRESENT'), ('S004', 'A073', 'PRESENT'), ('S004', 'A074', 'PRESENT'), ('S004', 'A075', 'ABSENT'),
('S004', 'A076', 'PRESENT'), ('S004', 'A077', 'PRESENT'), ('S004', 'A078', 'PRESENT'), ('S004', 'A079', 'PRESENT'), ('S004', 'A080', 'PRESENT'),
('S004', 'A081', 'PRESENT'), ('S004', 'A082', 'PRESENT'), ('S004', 'A083', 'ABSENT'), ('S004', 'A084', 'PRESENT'), ('S004', 'A085', 'PRESENT'),
('S004', 'A086', 'PRESENT'), ('S004', 'A087', 'PRESENT'), ('S004', 'A088', 'PRESENT'), ('S004', 'A089', 'PRESENT'), ('S004', 'A090', 'PRESENT'),
('S004', 'A091', 'ABSENT'), ('S004', 'A092', 'PRESENT'), ('S004', 'A093', 'PRESENT'), ('S004', 'A094', 'PRESENT'), ('S004', 'A095', 'PRESENT'),
('S004', 'A096', 'PRESENT'), ('S004', 'A097', 'PRESENT'), ('S004', 'A098', 'PRESENT'), ('S004', 'A099', 'PRESENT'), ('S004', 'A100', 'ABSENT'),
('S004', 'A101', 'PRESENT'), ('S004', 'A102', 'PRESENT'), ('S004', 'A103', 'PRESENT'), ('S004', 'A104', 'PRESENT'), ('S004', 'A105', 'PRESENT'),
('S004', 'A106', 'PRESENT'), ('S004', 'A107', 'PRESENT'), ('S004', 'A108', 'ABSENT'), ('S004', 'A109', 'PRESENT'), ('S004', 'A110', 'PRESENT'),
('S004', 'A111', 'PRESENT'), ('S004', 'A112', 'PRESENT'), ('S004', 'A113', 'PRESENT'), ('S004', 'A114', 'PRESENT'), ('S004', 'A115', 'PRESENT'),
('S004', 'A116', 'PRESENT'), ('S004', 'A117', 'ABSENT'), ('S004', 'A118', 'PRESENT'), ('S004', 'A119', 'PRESENT'), ('S004', 'A120', 'PRESENT'),
('S004', 'A121', 'PRESENT'), ('S004', 'A122', 'PRESENT'), ('S004', 'A123', 'PRESENT'), ('S004', 'A124', 'PRESENT'), ('S004', 'A125', 'PRESENT'),
('S004', 'A126', 'ABSENT'), ('S004', 'A127', 'PRESENT'), ('S004', 'A128', 'PRESENT'), ('S004', 'A129', 'PRESENT'), ('S004', 'A130', 'PRESENT'),
('S004', 'A131', 'PRESENT'), ('S004', 'A132', 'PRESENT'), ('S004', 'A133', 'PRESENT'), ('S004', 'A134', 'PRESENT'), ('S004', 'A135', 'ABSENT'),
('S004', 'A136', 'PRESENT'), ('S004', 'A137', 'PRESENT'), ('S004', 'A138', 'PRESENT'), ('S004', 'A139', 'PRESENT'), ('S004', 'A140', 'PRESENT'),
('S004', 'A141', 'PRESENT'), ('S004', 'A142', 'PRESENT'), ('S004', 'A143', 'ABSENT'), ('S004', 'A144', 'PRESENT'), ('S004', 'A145', 'PRESENT'),
('S004', 'A146', 'PRESENT'), ('S004', 'A147', 'PRESENT'), ('S004', 'A148', 'PRESENT'), ('S004', 'A149', 'PRESENT'), ('S004', 'A150', 'PRESENT'),
('S004', 'A151', 'PRESENT'), ('S004', 'A152', 'ABSENT'), ('S004', 'A153', 'PRESENT'), ('S004', 'A154', 'PRESENT'), ('S004', 'A155', 'PRESENT'),
('S004', 'A156', 'PRESENT'), ('S004', 'A157', 'PRESENT'), ('S004', 'A158', 'PRESENT'), ('S004', 'A159', 'PRESENT'), ('S004', 'A160', 'PRESENT'),
('S004', 'A161', 'PRESENT'), ('S004', 'A162', 'PRESENT'), ('S004', 'A163', 'ABSENT'), ('S004', 'A164', 'PRESENT'), ('S004', 'A165', 'PRESENT');



INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S005', 'A001', 'PRESENT'), ('S005', 'A002', 'PRESENT'), ('S005', 'A003', 'PRESENT'), ('S005', 'A004', 'PRESENT'), ('S005', 'A005', 'PRESENT'),
('S005', 'A006', 'PRESENT'), ('S005', 'A007', 'PRESENT'), ('S005', 'A008', 'ABSENT'), ('S005', 'A009', 'PRESENT'), ('S005', 'A010', 'PRESENT'),
('S005', 'A011', 'PRESENT'), ('S005', 'A012', 'PRESENT'), ('S005', 'A013', 'PRESENT'), ('S005', 'A014', 'PRESENT'), ('S005', 'A015', 'PRESENT'),
('S005', 'A016', 'ABSENT'), ('S005', 'A017', 'PRESENT'), ('S005', 'A018', 'PRESENT'), ('S005', 'A019', 'PRESENT'), ('S005', 'A020', 'PRESENT'),
('S005', 'A021', 'PRESENT'), ('S005', 'A022', 'PRESENT'), ('S005', 'A023', 'PRESENT'), ('S005', 'A024', 'ABSENT'), ('S005', 'A025', 'PRESENT'),
('S005', 'A026', 'PRESENT'), ('S005', 'A027', 'PRESENT'), ('S005', 'A028', 'PRESENT'), ('S005', 'A029', 'PRESENT'), ('S005', 'A030', 'PRESENT'),
('S005', 'A031', 'PRESENT'), ('S005', 'A032', 'ABSENT'), ('S005', 'A033', 'PRESENT'), ('S005', 'A034', 'PRESENT'), ('S005', 'A035', 'PRESENT'),
('S005', 'A036', 'PRESENT'), ('S005', 'A037', 'PRESENT'), ('S005', 'A038', 'PRESENT'), ('S005', 'A039', 'PRESENT'), ('S005', 'A040', 'PRESENT'),
('S005', 'A041', 'ABSENT'), ('S005', 'A042', 'PRESENT'), ('S005', 'A043', 'PRESENT'), ('S005', 'A044', 'PRESENT'), ('S005', 'A045', 'PRESENT'),
('S005', 'A046', 'PRESENT'), ('S005', 'A047', 'PRESENT'), ('S005', 'A048', 'PRESENT'), ('S005', 'A049', 'PRESENT'), ('S005', 'A050', 'ABSENT'),
('S005', 'A051', 'PRESENT'), ('S005', 'A052', 'PRESENT'), ('S005', 'A053', 'PRESENT'), ('S005', 'A054', 'PRESENT'), ('S005', 'A055', 'PRESENT'),
('S005', 'A056', 'PRESENT'), ('S005', 'A057', 'ABSENT'), ('S005', 'A058', 'PRESENT'), ('S005', 'A059', 'PRESENT'), ('S005', 'A060', 'PRESENT'),
('S005', 'A061', 'PRESENT'), ('S005', 'A062', 'PRESENT'), ('S005', 'A063', 'PRESENT'), ('S005', 'A064', 'ABSENT'), ('S005', 'A065', 'PRESENT'),
('S005', 'A066', 'PRESENT'), ('S005', 'A067', 'PRESENT'), ('S005', 'A068', 'PRESENT'), ('S005', 'A069', 'PRESENT'), ('S005', 'A070', 'PRESENT'),
('S005', 'A071', 'PRESENT'), ('S005', 'A072', 'ABSENT'), ('S005', 'A073', 'PRESENT'), ('S005', 'A074', 'PRESENT'), ('S005', 'A075', 'PRESENT'),
('S005', 'A076', 'PRESENT'), ('S005', 'A077', 'PRESENT'), ('S005', 'A078', 'PRESENT'), ('S005', 'A079', 'ABSENT'), ('S005', 'A080', 'PRESENT'),
('S005', 'A081', 'PRESENT'), ('S005', 'A082', 'PRESENT'), ('S005', 'A083', 'PRESENT'), ('S005', 'A084', 'PRESENT'), ('S005', 'A085', 'PRESENT'),
('S005', 'A086', 'ABSENT'), ('S005', 'A087', 'PRESENT'), ('S005', 'A088', 'PRESENT'), ('S005', 'A089', 'PRESENT'), ('S005', 'A090', 'PRESENT'),
('S005', 'A091', 'PRESENT'), ('S005', 'A092', 'PRESENT'), ('S005', 'A093', 'PRESENT'), ('S005', 'A094', 'ABSENT'), ('S005', 'A095', 'PRESENT'),
('S005', 'A096', 'PRESENT'), ('S005', 'A097', 'PRESENT'), ('S005', 'A098', 'PRESENT'), ('S005', 'A099', 'PRESENT'), ('S005', 'A100', 'PRESENT'),
('S005', 'A101', 'PRESENT'), ('S005', 'A102', 'ABSENT'), ('S005', 'A103', 'PRESENT'), ('S005', 'A104', 'PRESENT'), ('S005', 'A105', 'PRESENT'),
('S005', 'A106', 'PRESENT'), ('S005', 'A107', 'PRESENT'), ('S005', 'A108', 'PRESENT'), ('S005', 'A109', 'ABSENT'), ('S005', 'A110', 'PRESENT'),
('S005', 'A111', 'PRESENT'), ('S005', 'A112', 'PRESENT'), ('S005', 'A113', 'PRESENT'), ('S005', 'A114', 'PRESENT'), ('S005', 'A115', 'ABSENT'),
('S005', 'A116', 'PRESENT'), ('S005', 'A117', 'PRESENT'), ('S005', 'A118', 'PRESENT'), ('S005', 'A119', 'PRESENT'), ('S005', 'A120', 'PRESENT'),
('S005', 'A121', 'PRESENT'), ('S005', 'A122', 'PRESENT'), ('S005', 'A123', 'ABSENT'), ('S005', 'A124', 'PRESENT'), ('S005', 'A125', 'PRESENT'),
('S005', 'A126', 'PRESENT'), ('S005', 'A127', 'PRESENT'), ('S005', 'A128', 'PRESENT'), ('S005', 'A129', 'PRESENT'), ('S005', 'A130', 'PRESENT'),
('S005', 'A131', 'ABSENT'), ('S005', 'A132', 'PRESENT'), ('S005', 'A133', 'PRESENT'), ('S005', 'A134', 'PRESENT'), ('S005', 'A135', 'PRESENT'),
('S005', 'A136', 'PRESENT'), ('S005', 'A137', 'PRESENT'), ('S005', 'A138', 'PRESENT'), ('S005', 'A139', 'PRESENT'), ('S005', 'A140', 'ABSENT'),
('S005', 'A141', 'PRESENT'), ('S005', 'A142', 'PRESENT'), ('S005', 'A143', 'PRESENT'), ('S005', 'A144', 'PRESENT'), ('S005', 'A145', 'PRESENT'),
('S005', 'A146', 'PRESENT'), ('S005', 'A147', 'ABSENT'), ('S005', 'A148', 'PRESENT'), ('S005', 'A149', 'PRESENT'), ('S005', 'A150', 'PRESENT'),
('S005', 'A151', 'PRESENT'), ('S005', 'A152', 'PRESENT'), ('S005', 'A153', 'PRESENT'), ('S005', 'A154', 'ABSENT'), ('S005', 'A155', 'PRESENT'),
('S005', 'A156', 'PRESENT'), ('S005', 'A157', 'PRESENT'), ('S005', 'A158', 'PRESENT'), ('S005', 'A159', 'PRESENT'), ('S005', 'A160', 'PRESENT'),
('S005', 'A161', 'PRESENT'), ('S005', 'A162', 'PRESENT'), ('S005', 'A163', 'ABSENT'), ('S005', 'A164', 'PRESENT'), ('S005', 'A165', 'PRESENT');

INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S006', 'A001', 'PRESENT'), ('S006', 'A002', 'PRESENT'), ('S006', 'A003', 'ABSENT'), ('S006', 'A004', 'PRESENT'), ('S006', 'A005', 'PRESENT'),
('S006', 'A006', 'PRESENT'), ('S006', 'A007', 'PRESENT'), ('S006', 'A008', 'PRESENT'), ('S006', 'A009', 'ABSENT'), ('S006', 'A010', 'PRESENT'),
('S006', 'A011', 'PRESENT'), ('S006', 'A012', 'ABSENT'), ('S006', 'A013', 'PRESENT'), ('S006', 'A014', 'PRESENT'), ('S006', 'A015', 'PRESENT'),
('S006', 'A016', 'PRESENT'), ('S006', 'A017', 'ABSENT'), ('S006', 'A018', 'PRESENT'), ('S006', 'A019', 'PRESENT'), ('S006', 'A020', 'PRESENT'),
('S006', 'A021', 'PRESENT'), ('S006', 'A022', 'PRESENT'), ('S006', 'A023', 'ABSENT'), ('S006', 'A024', 'PRESENT'), ('S006', 'A025', 'PRESENT'),
('S006', 'A026', 'PRESENT'), ('S006', 'A027', 'PRESENT'), ('S006', 'A028', 'ABSENT'), ('S006', 'A029', 'PRESENT'), ('S006', 'A030', 'PRESENT'),
('S006', 'A031', 'PRESENT'), ('S006', 'A032', 'PRESENT'), ('S006', 'A033', 'ABSENT'), ('S006', 'A034', 'PRESENT'), ('S006', 'A035', 'PRESENT'),
('S006', 'A036', 'PRESENT'), ('S006', 'A037', 'PRESENT'), ('S006', 'A038', 'ABSENT'), ('S006', 'A039', 'PRESENT'), ('S006', 'A040', 'PRESENT'),
('S006', 'A041', 'PRESENT'), ('S006', 'A042', 'ABSENT'), ('S006', 'A043', 'PRESENT'), ('S006', 'A044', 'PRESENT'), ('S006', 'A045', 'PRESENT'),
('S006', 'A046', 'ABSENT'), ('S006', 'A047', 'PRESENT'), ('S006', 'A048', 'PRESENT'), ('S006', 'A049', 'PRESENT'), ('S006', 'A050', 'PRESENT'),
('S006', 'A051', 'PRESENT'), ('S006', 'A052', 'ABSENT'), ('S006', 'A053', 'PRESENT'), ('S006', 'A054', 'PRESENT'), ('S006', 'A055', 'PRESENT'),
('S006', 'A056', 'PRESENT'), ('S006', 'A057', 'PRESENT'), ('S006', 'A058', 'ABSENT'), ('S006', 'A059', 'PRESENT'), ('S006', 'A060', 'PRESENT'),
('S006', 'A061', 'PRESENT'), ('S006', 'A062', 'ABSENT'), ('S006', 'A063', 'PRESENT'), ('S006', 'A064', 'PRESENT'), ('S006', 'A065', 'PRESENT'),
('S006', 'A066', 'PRESENT'), ('S006', 'A067', 'PRESENT'), ('S006', 'A068', 'ABSENT'), ('S006', 'A069', 'PRESENT'), ('S006', 'A070', 'PRESENT'),
('S006', 'A071', 'PRESENT'), ('S006', 'A072', 'PRESENT'), ('S006', 'A073', 'ABSENT'), ('S006', 'A074', 'PRESENT'), ('S006', 'A075', 'PRESENT'),
('S006', 'A076', 'PRESENT'), ('S006', 'A077', 'ABSENT'), ('S006', 'A078', 'PRESENT'), ('S006', 'A079', 'PRESENT'), ('S006', 'A080', 'PRESENT'),
('S006', 'A081', 'PRESENT'), ('S006', 'A082', 'PRESENT'), ('S006', 'A083', 'ABSENT'), ('S006', 'A084', 'PRESENT'), ('S006', 'A085', 'PRESENT'),
('S006', 'A086', 'PRESENT'), ('S006', 'A087', 'ABSENT'), ('S006', 'A088', 'PRESENT'), ('S006', 'A089', 'PRESENT'), ('S006', 'A090', 'PRESENT'),
('S006', 'A091', 'PRESENT'), ('S006', 'A092', 'ABSENT'), ('S006', 'A093', 'PRESENT'), ('S006', 'A094', 'PRESENT'), ('S006', 'A095', 'PRESENT'),
('S006', 'A096', 'PRESENT'), ('S006', 'A097', 'PRESENT'), ('S006', 'A098', 'ABSENT'), ('S006', 'A099', 'PRESENT'), ('S006', 'A100', 'PRESENT'),
('S006', 'A101', 'PRESENT'), ('S006', 'A102', 'ABSENT'), ('S006', 'A103', 'PRESENT'), ('S006', 'A104', 'PRESENT'), ('S006', 'A105', 'PRESENT'),
('S006', 'A106', 'PRESENT'), ('S006', 'A107', 'ABSENT'), ('S006', 'A108', 'PRESENT'), ('S006', 'A109', 'PRESENT'), ('S006', 'A110', 'PRESENT'),
('S006', 'A111', 'PRESENT'), ('S006', 'A112', 'ABSENT'), ('S006', 'A113', 'PRESENT'), ('S006', 'A114', 'PRESENT'), ('S006', 'A115', 'PRESENT'),
('S006', 'A116', 'PRESENT'), ('S006', 'A117', 'ABSENT'), ('S006', 'A118', 'PRESENT'), ('S006', 'A119', 'PRESENT'), ('S006', 'A120', 'PRESENT'),
('S006', 'A121', 'PRESENT'), ('S006', 'A122', 'ABSENT'), ('S006', 'A123', 'PRESENT'), ('S006', 'A124', 'PRESENT'), ('S006', 'A125', 'PRESENT'),
('S006', 'A126', 'PRESENT'), ('S006', 'A127', 'ABSENT'), ('S006', 'A128', 'PRESENT'), ('S006', 'A129', 'PRESENT'), ('S006', 'A130', 'PRESENT'),
('S006', 'A131', 'PRESENT'), ('S006', 'A132', 'ABSENT'), ('S006', 'A133', 'PRESENT'), ('S006', 'A134', 'PRESENT'), ('S006', 'A135', 'PRESENT'),
('S006', 'A136', 'PRESENT'), ('S006', 'A137', 'ABSENT'), ('S006', 'A138', 'PRESENT'), ('S006', 'A139', 'PRESENT'), ('S006', 'A140', 'PRESENT'),
('S006', 'A141', 'PRESENT'), ('S006', 'A142', 'ABSENT'), ('S006', 'A143', 'PRESENT'), ('S006', 'A144', 'PRESENT'), ('S006', 'A145', 'PRESENT'),
('S006', 'A146', 'PRESENT'), ('S006', 'A147', 'ABSENT'), ('S006', 'A148', 'PRESENT'), ('S006', 'A149', 'PRESENT'), ('S006', 'A150', 'PRESENT'),
('S006', 'A151', 'PRESENT'), ('S006', 'A152', 'ABSENT'), ('S006', 'A153', 'PRESENT'), ('S006', 'A154', 'PRESENT'), ('S006', 'A155', 'PRESENT'),
('S006', 'A156', 'PRESENT'), ('S006', 'A157', 'ABSENT'), ('S006', 'A158', 'PRESENT'), ('S006', 'A159', 'PRESENT'), ('S006', 'A160', 'PRESENT'),
('S006', 'A161', 'PRESENT'), ('S006', 'A162', 'ABSENT'), ('S006', 'A163', 'PRESENT'), ('S006', 'A164', 'PRESENT'), ('S006', 'A165', 'PRESENT');


INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S007', 'A001', 'PRESENT'), ('S007', 'A002', 'PRESENT'), ('S007', 'A003', 'PRESENT'), ('S007', 'A004', 'ABSENT'), ('S007', 'A005', 'PRESENT'),
('S007', 'A006', 'PRESENT'), ('S007', 'A007', 'PRESENT'), ('S007', 'A008', 'PRESENT'), ('S007', 'A009', 'PRESENT'), ('S007', 'A010', 'ABSENT'),
('S007', 'A011', 'PRESENT'), ('S007', 'A012', 'PRESENT'), ('S007', 'A013', 'PRESENT'), ('S007', 'A014', 'ABSENT'), ('S007', 'A015', 'PRESENT'),
('S007', 'A016', 'PRESENT'), ('S007', 'A017', 'PRESENT'), ('S007', 'A018', 'ABSENT'), ('S007', 'A019', 'PRESENT'), ('S007', 'A020', 'PRESENT'),
('S007', 'A021', 'PRESENT'), ('S007', 'A022', 'PRESENT'), ('S007', 'A023', 'PRESENT'), ('S007', 'A024', 'ABSENT'), ('S007', 'A025', 'PRESENT'),
('S007', 'A026', 'PRESENT'), ('S007', 'A027', 'PRESENT'), ('S007', 'A028', 'PRESENT'), ('S007', 'A029', 'ABSENT'), ('S007', 'A030', 'PRESENT'),
('S007', 'A031', 'PRESENT'), ('S007', 'A032', 'PRESENT'), ('S007', 'A033', 'PRESENT'), ('S007', 'A034', 'ABSENT'), ('S007', 'A035', 'PRESENT'),
('S007', 'A036', 'PRESENT'), ('S007', 'A037', 'PRESENT'), ('S007', 'A038', 'PRESENT'), ('S007', 'A039', 'ABSENT'), ('S007', 'A040', 'PRESENT'),
('S007', 'A041', 'PRESENT'), ('S007', 'A042', 'PRESENT'), ('S007', 'A043', 'ABSENT'), ('S007', 'A044', 'PRESENT'), ('S007', 'A045', 'PRESENT'),
('S007', 'A046', 'PRESENT'), ('S007', 'A047', 'PRESENT'), ('S007', 'A048', 'ABSENT'), ('S007', 'A049', 'PRESENT'), ('S007', 'A050', 'PRESENT'),
('S007', 'A051', 'PRESENT'), ('S007', 'A052', 'PRESENT'), ('S007', 'A053', 'ABSENT'), ('S007', 'A054', 'PRESENT'), ('S007', 'A055', 'PRESENT'),
('S007', 'A056', 'PRESENT'), ('S007', 'A057', 'PRESENT'), ('S007', 'A058', 'ABSENT'), ('S007', 'A059', 'PRESENT'), ('S007', 'A060', 'PRESENT'),
('S007', 'A061', 'PRESENT'), ('S007', 'A062', 'PRESENT'), ('S007', 'A063', 'ABSENT'), ('S007', 'A064', 'PRESENT'), ('S007', 'A065', 'PRESENT'),
('S007', 'A066', 'PRESENT'), ('S007', 'A067', 'PRESENT'), ('S007', 'A068', 'ABSENT'), ('S007', 'A069', 'PRESENT'), ('S007', 'A070', 'PRESENT'),
('S007', 'A071', 'PRESENT'), ('S007', 'A072', 'PRESENT'), ('S007', 'A073', 'ABSENT'), ('S007', 'A074', 'PRESENT'), ('S007', 'A075', 'PRESENT'),
('S007', 'A076', 'PRESENT'), ('S007', 'A077', 'PRESENT'), ('S007', 'A078', 'ABSENT'), ('S007', 'A079', 'PRESENT'), ('S007', 'A080', 'PRESENT'),
('S007', 'A081', 'PRESENT'), ('S007', 'A082', 'PRESENT'), ('S007', 'A083', 'ABSENT'), ('S007', 'A084', 'PRESENT'), ('S007', 'A085', 'PRESENT'),
('S007', 'A086', 'PRESENT'), ('S007', 'A087', 'PRESENT'), ('S007', 'A088', 'ABSENT'), ('S007', 'A089', 'PRESENT'), ('S007', 'A090', 'PRESENT'),
('S007', 'A091', 'PRESENT'), ('S007', 'A092', 'PRESENT'), ('S007', 'A093', 'ABSENT'), ('S007', 'A094', 'PRESENT'), ('S007', 'A095', 'PRESENT'),
('S007', 'A096', 'PRESENT'), ('S007', 'A097', 'PRESENT'), ('S007', 'A098', 'ABSENT'), ('S007', 'A099', 'PRESENT'), ('S007', 'A100', 'PRESENT'),
('S007', 'A101', 'PRESENT'), ('S007', 'A102', 'PRESENT'), ('S007', 'A103', 'ABSENT'), ('S007', 'A104', 'PRESENT'), ('S007', 'A105', 'PRESENT'),
('S007', 'A106', 'PRESENT'), ('S007', 'A107', 'PRESENT'), ('S007', 'A108', 'ABSENT'), ('S007', 'A109', 'PRESENT'), ('S007', 'A110', 'PRESENT'),
('S007', 'A111', 'PRESENT'), ('S007', 'A112', 'PRESENT'), ('S007', 'A113', 'ABSENT'), ('S007', 'A114', 'PRESENT'), ('S007', 'A115', 'PRESENT'),
('S007', 'A116', 'PRESENT'), ('S007', 'A117', 'PRESENT'), ('S007', 'A118', 'ABSENT'), ('S007', 'A119', 'PRESENT'), ('S007', 'A120', 'PRESENT'),
('S007', 'A121', 'PRESENT'), ('S007', 'A122', 'PRESENT'), ('S007', 'A123', 'ABSENT'), ('S007', 'A124', 'PRESENT'), ('S007', 'A125', 'PRESENT'),
('S007', 'A126', 'PRESENT'), ('S007', 'A127', 'PRESENT'), ('S007', 'A128', 'ABSENT'), ('S007', 'A129', 'PRESENT'), ('S007', 'A130', 'PRESENT'),
('S007', 'A131', 'PRESENT'), ('S007', 'A132', 'PRESENT'), ('S007', 'A133', 'ABSENT'), ('S007', 'A134', 'PRESENT'), ('S007', 'A135', 'PRESENT'),
('S007', 'A136', 'PRESENT'), ('S007', 'A137', 'PRESENT'), ('S007', 'A138', 'ABSENT'), ('S007', 'A139', 'PRESENT'), ('S007', 'A140', 'PRESENT'),
('S007', 'A141', 'PRESENT'), ('S007', 'A142', 'PRESENT'), ('S007', 'A143', 'ABSENT'), ('S007', 'A144', 'PRESENT'), ('S007', 'A145', 'PRESENT'),
('S007', 'A146', 'PRESENT'), ('S007', 'A147', 'PRESENT'), ('S007', 'A148', 'ABSENT'), ('S007', 'A149', 'PRESENT'), ('S007', 'A150', 'PRESENT'),
('S007', 'A151', 'PRESENT'), ('S007', 'A152', 'PRESENT'), ('S007', 'A153', 'ABSENT'), ('S007', 'A154', 'PRESENT'), ('S007', 'A155', 'PRESENT'),
('S007', 'A156', 'PRESENT'), ('S007', 'A157', 'PRESENT'), ('S007', 'A158', 'ABSENT'), ('S007', 'A159', 'PRESENT'), ('S007', 'A160', 'PRESENT'),
('S007', 'A161', 'PRESENT'), ('S007', 'A162', 'PRESENT'), ('S007', 'A163', 'ABSENT'), ('S007', 'A164', 'PRESENT'), ('S007', 'A165', 'PRESENT');


INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S008', 'A001', 'ABSENT'), ('S008', 'A002', 'PRESENT'), ('S008', 'A003', 'PRESENT'), ('S008', 'A004', 'PRESENT'), ('S008', 'A005', 'PRESENT'),
('S008', 'A006', 'ABSENT'), ('S008', 'A007', 'PRESENT'), ('S008', 'A008', 'PRESENT'), ('S008', 'A009', 'PRESENT'), ('S008', 'A010', 'PRESENT'),
('S008', 'A011', 'ABSENT'), ('S008', 'A012', 'PRESENT'), ('S008', 'A013', 'PRESENT'), ('S008', 'A014', 'PRESENT'), ('S008', 'A015', 'ABSENT'),
('S008', 'A016', 'PRESENT'), ('S008', 'A017', 'PRESENT'), ('S008', 'A018', 'PRESENT'), ('S008', 'A019', 'ABSENT'), ('S008', 'A020', 'PRESENT'),
('S008', 'A021', 'PRESENT'), ('S008', 'A022', 'ABSENT'), ('S008', 'A023', 'PRESENT'), ('S008', 'A024', 'PRESENT'), ('S008', 'A025', 'PRESENT'),
('S008', 'A026', 'ABSENT'), ('S008', 'A027', 'PRESENT'), ('S008', 'A028', 'PRESENT'), ('S008', 'A029', 'PRESENT'), ('S008', 'A030', 'ABSENT'),
('S008', 'A031', 'PRESENT'), ('S008', 'A032', 'PRESENT'), ('S008', 'A033', 'ABSENT'), ('S008', 'A034', 'PRESENT'), ('S008', 'A035', 'PRESENT'),
('S008', 'A036', 'PRESENT'), ('S008', 'A037', 'ABSENT'), ('S008', 'A038', 'PRESENT'), ('S008', 'A039', 'PRESENT'), ('S008', 'A040', 'PRESENT'),
('S008', 'A041', 'ABSENT'), ('S008', 'A042', 'PRESENT'), ('S008', 'A043', 'PRESENT'), ('S008', 'A044', 'ABSENT'), ('S008', 'A045', 'PRESENT'),
('S008', 'A046', 'PRESENT'), ('S008', 'A047', 'PRESENT'), ('S008', 'A048', 'ABSENT'), ('S008', 'A049', 'PRESENT'), ('S008', 'A050', 'PRESENT'),
('S008', 'A051', 'ABSENT'), ('S008', 'A052', 'PRESENT'), ('S008', 'A053', 'PRESENT'), ('S008', 'A054', 'ABSENT'), ('S008', 'A055', 'PRESENT'),
('S008', 'A056', 'PRESENT'), ('S008', 'A057', 'PRESENT'), ('S008', 'A058', 'ABSENT'), ('S008', 'A059', 'PRESENT'), ('S008', 'A060', 'PRESENT'),
('S008', 'A061', 'PRESENT'), ('S008', 'A062', 'ABSENT'), ('S008', 'A063', 'PRESENT'), ('S008', 'A064', 'PRESENT'), ('S008', 'A065', 'ABSENT'),
('S008', 'A066', 'PRESENT'), ('S008', 'A067', 'PRESENT'), ('S008', 'A068', 'ABSENT'), ('S008', 'A069', 'PRESENT'), ('S008', 'A070', 'PRESENT'),
('S008', 'A071', 'ABSENT'), ('S008', 'A072', 'PRESENT'), ('S008', 'A073', 'PRESENT'), ('S008', 'A074', 'ABSENT'), ('S008', 'A075', 'PRESENT'),
('S008', 'A076', 'PRESENT'), ('S008', 'A077', 'ABSENT'), ('S008', 'A078', 'PRESENT'), ('S008', 'A079', 'PRESENT'), ('S008', 'A080', 'ABSENT'),
('S008', 'A081', 'PRESENT'), ('S008', 'A082', 'PRESENT'), ('S008', 'A083', 'ABSENT'), ('S008', 'A084', 'PRESENT'), ('S008', 'A085', 'PRESENT'),
('S008', 'A086', 'ABSENT'), ('S008', 'A087', 'PRESENT'), ('S008', 'A088', 'PRESENT'), ('S008', 'A089', 'ABSENT'), ('S008', 'A090', 'PRESENT'),
('S008', 'A091', 'PRESENT'), ('S008', 'A092', 'ABSENT'), ('S008', 'A093', 'PRESENT'), ('S008', 'A094', 'PRESENT'), ('S008', 'A095', 'ABSENT'),
('S008', 'A096', 'PRESENT'), ('S008', 'A097', 'PRESENT'), ('S008', 'A098', 'ABSENT'), ('S008', 'A099', 'PRESENT'), ('S008', 'A100', 'PRESENT'),
('S008', 'A101', 'ABSENT'), ('S008', 'A102', 'PRESENT'), ('S008', 'A103', 'PRESENT'), ('S008', 'A104', 'ABSENT'), ('S008', 'A105', 'PRESENT'),
('S008', 'A106', 'PRESENT'), ('S008', 'A107', 'ABSENT'), ('S008', 'A108', 'PRESENT'), ('S008', 'A109', 'PRESENT'), ('S008', 'A110', 'ABSENT'),
('S008', 'A111', 'PRESENT'), ('S008', 'A112', 'PRESENT'), ('S008', 'A113', 'ABSENT'), ('S008', 'A114', 'PRESENT'), ('S008', 'A115', 'PRESENT'),
('S008', 'A116', 'ABSENT'), ('S008', 'A117', 'PRESENT'), ('S008', 'A118', 'PRESENT'), ('S008', 'A119', 'ABSENT'), ('S008', 'A120', 'PRESENT'),
('S008', 'A121', 'PRESENT'), ('S008', 'A122', 'ABSENT'), ('S008', 'A123', 'PRESENT'), ('S008', 'A124', 'PRESENT'), ('S008', 'A125', 'ABSENT'),
('S008', 'A126', 'PRESENT'), ('S008', 'A127', 'PRESENT'), ('S008', 'A128', 'ABSENT'), ('S008', 'A129', 'PRESENT'), ('S008', 'A130', 'PRESENT'),
('S008', 'A131', 'ABSENT'), ('S008', 'A132', 'PRESENT'), ('S008', 'A133', 'PRESENT'), ('S008', 'A134', 'ABSENT'), ('S008', 'A135', 'PRESENT'),
('S008', 'A136', 'PRESENT'), ('S008', 'A137', 'ABSENT'), ('S008', 'A138', 'PRESENT'), ('S008', 'A139', 'PRESENT'), ('S008', 'A140', 'ABSENT'),
('S008', 'A141', 'PRESENT'), ('S008', 'A142', 'PRESENT'), ('S008', 'A143', 'ABSENT'), ('S008', 'A144', 'PRESENT'), ('S008', 'A145', 'PRESENT'),
('S008', 'A146', 'ABSENT'), ('S008', 'A147', 'PRESENT'), ('S008', 'A148', 'PRESENT'), ('S008', 'A149', 'ABSENT'), ('S008', 'A150', 'PRESENT'),
('S008', 'A151', 'PRESENT'), ('S008', 'A152', 'ABSENT'), ('S008', 'A153', 'PRESENT'), ('S008', 'A154', 'PRESENT'), ('S008', 'A155', 'ABSENT'),
('S008', 'A156', 'PRESENT'), ('S008', 'A157', 'PRESENT'), ('S008', 'A158', 'ABSENT'), ('S008', 'A159', 'PRESENT'), ('S008', 'A160', 'PRESENT'),
('S008', 'A161', 'ABSENT'), ('S008', 'A162', 'PRESENT'), ('S008', 'A163', 'PRESENT'), ('S008', 'A164', 'ABSENT'), ('S008', 'A165', 'PRESENT');



INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S009', 'A001', 'PRESENT'), ('S009', 'A002', 'PRESENT'), ('S009', 'A003', 'PRESENT'), ('S009', 'A004', 'PRESENT'), ('S009', 'A005', 'PRESENT'),
('S009', 'A006', 'PRESENT'), ('S009', 'A007', 'ABSENT'), ('S009', 'A008', 'PRESENT'), ('S009', 'A009', 'PRESENT'), ('S009', 'A010', 'PRESENT'),
('S009', 'A011', 'PRESENT'), ('S009', 'A012', 'PRESENT'), ('S009', 'A013', 'ABSENT'), ('S009', 'A014', 'PRESENT'), ('S009', 'A015', 'PRESENT'),
('S009', 'A016', 'PRESENT'), ('S009', 'A017', 'PRESENT'), ('S009', 'A018', 'PRESENT'), ('S009', 'A019', 'ABSENT'), ('S009', 'A020', 'PRESENT'),
('S009', 'A021', 'PRESENT'), ('S009', 'A022', 'PRESENT'), ('S009', 'A023', 'PRESENT'), ('S009', 'A024', 'PRESENT'), ('S009', 'A025', 'ABSENT'),
('S009', 'A026', 'PRESENT'), ('S009', 'A027', 'PRESENT'), ('S009', 'A028', 'PRESENT'), ('S009', 'A029', 'PRESENT'), ('S009', 'A030', 'PRESENT'),
('S009', 'A031', 'PRESENT'), ('S009', 'A032', 'ABSENT'), ('S009', 'A033', 'PRESENT'), ('S009', 'A034', 'PRESENT'), ('S009', 'A035', 'PRESENT'),
('S009', 'A036', 'PRESENT'), ('S009', 'A037', 'PRESENT'), ('S009', 'A038', 'PRESENT'), ('S009', 'A039', 'ABSENT'), ('S009', 'A040', 'PRESENT'),
('S009', 'A041', 'PRESENT'), ('S009', 'A042', 'PRESENT'), ('S009', 'A043', 'PRESENT'), ('S009', 'A044', 'PRESENT'), ('S009', 'A045', 'ABSENT'),
('S009', 'A046', 'PRESENT'), ('S009', 'A047', 'PRESENT'), ('S009', 'A048', 'PRESENT'), ('S009', 'A049', 'PRESENT'), ('S009', 'A050', 'PRESENT'),
('S009', 'A051', 'ABSENT'), ('S009', 'A052', 'PRESENT'), ('S009', 'A053', 'PRESENT'), ('S009', 'A054', 'PRESENT'), ('S009', 'A055', 'PRESENT'),
('S009', 'A056', 'PRESENT'), ('S009', 'A057', 'PRESENT'), ('S009', 'A058', 'ABSENT'), ('S009', 'A059', 'PRESENT'), ('S009', 'A060', 'PRESENT'),
('S009', 'A061', 'PRESENT'), ('S009', 'A062', 'PRESENT'), ('S009', 'A063', 'PRESENT'), ('S009', 'A064', 'ABSENT'), ('S009', 'A065', 'PRESENT'),
('S009', 'A066', 'PRESENT'), ('S009', 'A067', 'PRESENT'), ('S009', 'A068', 'PRESENT'), ('S009', 'A069', 'PRESENT'), ('S009', 'A070', 'ABSENT'),
('S009', 'A071', 'PRESENT'), ('S009', 'A072', 'PRESENT'), ('S009', 'A073', 'PRESENT'), ('S009', 'A074', 'PRESENT'), ('S009', 'A075', 'PRESENT'),
('S009', 'A076', 'ABSENT'), ('S009', 'A077', 'PRESENT'), ('S009', 'A078', 'PRESENT'), ('S009', 'A079', 'PRESENT'), ('S009', 'A080', 'PRESENT'),
('S009', 'A081', 'PRESENT'), ('S009', 'A082', 'PRESENT'), ('S009', 'A083', 'ABSENT'), ('S009', 'A084', 'PRESENT'), ('S009', 'A085', 'PRESENT'),
('S009', 'A086', 'PRESENT'), ('S009', 'A087', 'PRESENT'), ('S009', 'A088', 'PRESENT'), ('S009', 'A089', 'ABSENT'), ('S009', 'A090', 'PRESENT'),
('S009', 'A091', 'PRESENT'), ('S009', 'A092', 'PRESENT'), ('S009', 'A093', 'PRESENT'), ('S009', 'A094', 'PRESENT'), ('S009', 'A095', 'ABSENT'),
('S009', 'A096', 'PRESENT'), ('S009', 'A097', 'PRESENT'), ('S009', 'A098', 'PRESENT'), ('S009', 'A099', 'PRESENT'), ('S009', 'A100', 'PRESENT'),
('S009', 'A101', 'ABSENT'), ('S009', 'A102', 'PRESENT'), ('S009', 'A103', 'PRESENT'), ('S009', 'A104', 'PRESENT'), ('S009', 'A105', 'PRESENT'),
('S009', 'A106', 'PRESENT'), ('S009', 'A107', 'PRESENT'), ('S009', 'A108', 'ABSENT'), ('S009', 'A109', 'PRESENT'), ('S009', 'A110', 'PRESENT'),
('S009', 'A111', 'PRESENT'), ('S009', 'A112', 'PRESENT'), ('S009', 'A113', 'PRESENT'), ('S009', 'A114', 'ABSENT'), ('S009', 'A115', 'PRESENT'),
('S009', 'A116', 'PRESENT'), ('S009', 'A117', 'PRESENT'), ('S009', 'A118', 'PRESENT'), ('S009', 'A119', 'PRESENT'), ('S009', 'A120', 'ABSENT'),
('S009', 'A121', 'PRESENT'), ('S009', 'A122', 'PRESENT'), ('S009', 'A123', 'PRESENT'), ('S009', 'A124', 'PRESENT'), ('S009', 'A125', 'PRESENT'),
('S009', 'A126', 'ABSENT'), ('S009', 'A127', 'PRESENT'), ('S009', 'A128', 'PRESENT'), ('S009', 'A129', 'PRESENT'), ('S009', 'A130', 'PRESENT'),
('S009', 'A131', 'PRESENT'), ('S009', 'A132', 'PRESENT'), ('S009', 'A133', 'ABSENT'), ('S009', 'A134', 'PRESENT'), ('S009', 'A135', 'PRESENT'),
('S009', 'A136', 'PRESENT'), ('S009', 'A137', 'PRESENT'), ('S009', 'A138', 'PRESENT'), ('S009', 'A139', 'ABSENT'), ('S009', 'A140', 'PRESENT'),
('S009', 'A141', 'PRESENT'), ('S009', 'A142', 'PRESENT'), ('S009', 'A143', 'PRESENT'), ('S009', 'A144', 'PRESENT'), ('S009', 'A145', 'ABSENT'),
('S009', 'A146', 'PRESENT'), ('S009', 'A147', 'PRESENT'), ('S009', 'A148', 'PRESENT'), ('S009', 'A149', 'PRESENT'), ('S009', 'A150', 'PRESENT'),
('S009', 'A151', 'PRESENT'), ('S009', 'A152', 'ABSENT'), ('S009', 'A153', 'PRESENT'), ('S009', 'A154', 'PRESENT'), ('S009', 'A155', 'PRESENT'),
('S009', 'A156', 'PRESENT'), ('S009', 'A157', 'PRESENT'), ('S009', 'A158', 'PRESENT'), ('S009', 'A159', 'PRESENT'), ('S009', 'A160', 'PRESENT'),
('S009', 'A161', 'PRESENT'), ('S009', 'A162', 'PRESENT'), ('S009', 'A163', 'ABSENT'), ('S009', 'A164', 'PRESENT'), ('S009', 'A165', 'PRESENT');


INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S010', 'A001', 'ABSENT'), ('S010', 'A002', 'PRESENT'), ('S010', 'A003', 'PRESENT'), ('S010', 'A004', 'PRESENT'), ('S010', 'A005', 'ABSENT'),
('S010', 'A006', 'PRESENT'), ('S010', 'A007', 'PRESENT'), ('S010', 'A008', 'ABSENT'), ('S010', 'A009', 'PRESENT'), ('S010', 'A010', 'PRESENT'),
('S010', 'A011', 'PRESENT'), ('S010', 'A012', 'ABSENT'), ('S010', 'A013', 'PRESENT'), ('S010', 'A014', 'PRESENT'), ('S010', 'A015', 'ABSENT'),
('S010', 'A016', 'PRESENT'), ('S010', 'A017', 'PRESENT'), ('S010', 'A018', 'ABSENT'), ('S010', 'A019', 'PRESENT'), ('S010', 'A020', 'PRESENT'),
('S010', 'A021', 'ABSENT'), ('S010', 'A022', 'PRESENT'), ('S010', 'A023', 'PRESENT'), ('S010', 'A024', 'ABSENT'), ('S010', 'A025', 'PRESENT'),
('S010', 'A026', 'PRESENT'), ('S010', 'A027', 'ABSENT'), ('S010', 'A028', 'PRESENT'), ('S010', 'A029', 'PRESENT'), ('S010', 'A030', 'ABSENT'),
('S010', 'A031', 'PRESENT'), ('S010', 'A032', 'ABSENT'), ('S010', 'A033', 'PRESENT'), ('S010', 'A034', 'PRESENT'), ('S010', 'A035', 'ABSENT'),
('S010', 'A036', 'PRESENT'), ('S010', 'A037', 'PRESENT'), ('S010', 'A038', 'ABSENT'), ('S010', 'A039', 'PRESENT'), ('S010', 'A040', 'PRESENT'),
('S010', 'A041', 'ABSENT'), ('S010', 'A042', 'PRESENT'), ('S010', 'A043', 'PRESENT'), ('S010', 'A044', 'ABSENT'), ('S010', 'A045', 'PRESENT'),
('S010', 'A046', 'PRESENT'), ('S010', 'A047', 'ABSENT'), ('S010', 'A048', 'PRESENT'), ('S010', 'A049', 'PRESENT'), ('S010', 'A050', 'ABSENT'),
('S010', 'A051', 'PRESENT'), ('S010', 'A052', 'ABSENT'), ('S010', 'A053', 'PRESENT'), ('S010', 'A054', 'PRESENT'), ('S010', 'A055', 'ABSENT'),
('S010', 'A056', 'PRESENT'), ('S010', 'A057', 'PRESENT'), ('S010', 'A058', 'ABSENT'), ('S010', 'A059', 'PRESENT'), ('S010', 'A060', 'PRESENT'),
('S010', 'A061', 'ABSENT'), ('S010', 'A062', 'PRESENT'), ('S010', 'A063', 'PRESENT'), ('S010', 'A064', 'ABSENT'), ('S010', 'A065', 'PRESENT'),
('S010', 'A066', 'PRESENT'), ('S010', 'A067', 'ABSENT'), ('S010', 'A068', 'PRESENT'), ('S010', 'A069', 'PRESENT'), ('S010', 'A070', 'ABSENT'),
('S010', 'A071', 'PRESENT'), ('S010', 'A072', 'PRESENT'), ('S010', 'A073', 'ABSENT'), ('S010', 'A074', 'PRESENT'), ('S010', 'A075', 'ABSENT'),
('S010', 'A076', 'PRESENT'), ('S010', 'A077', 'ABSENT'), ('S010', 'A078', 'PRESENT'), ('S010', 'A079', 'PRESENT'), ('S010', 'A080', 'ABSENT'),
('S010', 'A081', 'PRESENT'), ('S010', 'A082', 'ABSENT'), ('S010', 'A083', 'PRESENT'), ('S010', 'A084', 'PRESENT'), ('S010', 'A085', 'ABSENT'),
('S010', 'A086', 'PRESENT'), ('S010', 'A087', 'ABSENT'), ('S010', 'A088', 'PRESENT'), ('S010', 'A089', 'PRESENT'), ('S010', 'A090', 'ABSENT'),
('S010', 'A091', 'PRESENT'), ('S010', 'A092', 'ABSENT'), ('S010', 'A093', 'PRESENT'), ('S010', 'A094', 'PRESENT'), ('S010', 'A095', 'ABSENT'),
('S010', 'A096', 'PRESENT'), ('S010', 'A097', 'ABSENT'), ('S010', 'A098', 'PRESENT'), ('S010', 'A099', 'PRESENT'), ('S010', 'A100', 'ABSENT'),
('S010', 'A101', 'PRESENT'), ('S010', 'A102', 'ABSENT'), ('S010', 'A103', 'PRESENT'), ('S010', 'A104', 'PRESENT'), ('S010', 'A105', 'ABSENT'),
('S010', 'A106', 'PRESENT'), ('S010', 'A107', 'ABSENT'), ('S010', 'A108', 'PRESENT'), ('S010', 'A109', 'PRESENT'), ('S010', 'A110', 'ABSENT'),
('S010', 'A111', 'PRESENT'), ('S010', 'A112', 'ABSENT'), ('S010', 'A113', 'PRESENT'), ('S010', 'A114', 'PRESENT'), ('S010', 'A115', 'ABSENT'),
('S010', 'A116', 'PRESENT'), ('S010', 'A117', 'ABSENT'), ('S010', 'A118', 'PRESENT'), ('S010', 'A119', 'PRESENT'), ('S010', 'A120', 'ABSENT'),
('S010', 'A121', 'PRESENT'), ('S010', 'A122', 'ABSENT'), ('S010', 'A123', 'PRESENT'), ('S010', 'A124', 'PRESENT'), ('S010', 'A125', 'ABSENT'),
('S010', 'A126', 'PRESENT'), ('S010', 'A127', 'ABSENT'), ('S010', 'A128', 'PRESENT'), ('S010', 'A129', 'PRESENT'), ('S010', 'A130', 'ABSENT'),
('S010', 'A131', 'PRESENT'), ('S010', 'A132', 'ABSENT'), ('S010', 'A133', 'PRESENT'), ('S010', 'A134', 'PRESENT'), ('S010', 'A135', 'ABSENT'),
('S010', 'A136', 'PRESENT'), ('S010', 'A137', 'ABSENT'), ('S010', 'A138', 'PRESENT'), ('S010', 'A139', 'PRESENT'), ('S010', 'A140', 'ABSENT'),
('S010', 'A141', 'PRESENT'), ('S010', 'A142', 'ABSENT'), ('S010', 'A143', 'PRESENT'), ('S010', 'A144', 'PRESENT'), ('S010', 'A145', 'ABSENT'),
('S010', 'A146', 'PRESENT'), ('S010', 'A147', 'ABSENT'), ('S010', 'A148', 'PRESENT'), ('S010', 'A149', 'PRESENT'), ('S010', 'A150', 'ABSENT'),
('S010', 'A151', 'PRESENT'), ('S010', 'A152', 'ABSENT'), ('S010', 'A153', 'PRESENT'), ('S010', 'A154', 'PRESENT'), ('S010', 'A155', 'ABSENT'),
('S010', 'A156', 'PRESENT'), ('S010', 'A157', 'ABSENT'), ('S010', 'A158', 'PRESENT'), ('S010', 'A159', 'PRESENT'), ('S010', 'A160', 'ABSENT'),
('S010', 'A161', 'PRESENT'), ('S010', 'A162', 'ABSENT'), ('S010', 'A163', 'PRESENT'), ('S010', 'A164', 'PRESENT'), ('S010', 'A165', 'ABSENT');



INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S011', 'A001', 'PRESENT'), ('S011', 'A002', 'PRESENT'), ('S011', 'A003', 'PRESENT'), ('S011', 'A004', 'ABSENT'), ('S011', 'A005', 'PRESENT'),
('S011', 'A006', 'PRESENT'), ('S011', 'A007', 'PRESENT'), ('S011', 'A008', 'PRESENT'), ('S011', 'A009', 'ABSENT'), ('S011', 'A010', 'PRESENT'),
('S011', 'A011', 'PRESENT'), ('S011', 'A012', 'PRESENT'), ('S011', 'A013', 'PRESENT'), ('S011', 'A014', 'ABSENT'), ('S011', 'A015', 'PRESENT'),
('S011', 'A016', 'PRESENT'), ('S011', 'A017', 'PRESENT'), ('S011', 'A018', 'PRESENT'), ('S011', 'A019', 'ABSENT'), ('S011', 'A020', 'PRESENT'),
('S011', 'A021', 'PRESENT'), ('S011', 'A022', 'ABSENT'), ('S011', 'A023', 'PRESENT'), ('S011', 'A024', 'PRESENT'), ('S011', 'A025', 'PRESENT'),
('S011', 'A026', 'PRESENT'), ('S011', 'A027', 'PRESENT'), ('S011', 'A028', 'ABSENT'), ('S011', 'A029', 'PRESENT'), ('S011', 'A030', 'PRESENT'),
('S011', 'A031', 'PRESENT'), ('S011', 'A032', 'PRESENT'), ('S011', 'A033', 'ABSENT'), ('S011', 'A034', 'PRESENT'), ('S011', 'A035', 'PRESENT'),
('S011', 'A036', 'PRESENT'), ('S011', 'A037', 'PRESENT'), ('S011', 'A038', 'ABSENT'), ('S011', 'A039', 'PRESENT'), ('S011', 'A040', 'PRESENT'),
('S011', 'A041', 'PRESENT'), ('S011', 'A042', 'PRESENT'), ('S011', 'A043', 'ABSENT'), ('S011', 'A044', 'PRESENT'), ('S011', 'A045', 'PRESENT'),
('S011', 'A046', 'PRESENT'), ('S011', 'A047', 'ABSENT'), ('S011', 'A048', 'PRESENT'), ('S011', 'A049', 'PRESENT'), ('S011', 'A050', 'PRESENT'),
('S011', 'A051', 'PRESENT'), ('S011', 'A052', 'PRESENT'), ('S011', 'A053', 'ABSENT'), ('S011', 'A054', 'PRESENT'), ('S011', 'A055', 'PRESENT'),
('S011', 'A056', 'PRESENT'), ('S011', 'A057', 'PRESENT'), ('S011', 'A058', 'ABSENT'), ('S011', 'A059', 'PRESENT'), ('S011', 'A060', 'PRESENT'),
('S011', 'A061', 'PRESENT'), ('S011', 'A062', 'ABSENT'), ('S011', 'A063', 'PRESENT'), ('S011', 'A064', 'PRESENT'), ('S011', 'A065', 'PRESENT'),
('S011', 'A066', 'PRESENT'), ('S011', 'A067', 'PRESENT'), ('S011', 'A068', 'ABSENT'), ('S011', 'A069', 'PRESENT'), ('S011', 'A070', 'PRESENT'),
('S011', 'A071', 'PRESENT'), ('S011', 'A072', 'PRESENT'), ('S011', 'A073', 'ABSENT'), ('S011', 'A074', 'PRESENT'), ('S011', 'A075', 'PRESENT'),
('S011', 'A076', 'PRESENT'), ('S011', 'A077', 'ABSENT'), ('S011', 'A078', 'PRESENT'), ('S011', 'A079', 'PRESENT'), ('S011', 'A080', 'PRESENT'),
('S011', 'A081', 'PRESENT'), ('S011', 'A082', 'PRESENT'), ('S011', 'A083', 'ABSENT'), ('S011', 'A084', 'PRESENT'), ('S011', 'A085', 'PRESENT'),
('S011', 'A086', 'PRESENT'), ('S011', 'A087', 'ABSENT'), ('S011', 'A088', 'PRESENT'), ('S011', 'A089', 'PRESENT'), ('S011', 'A090', 'PRESENT'),
('S011', 'A091', 'PRESENT'), ('S011', 'A092', 'ABSENT'), ('S011', 'A093', 'PRESENT'), ('S011', 'A094', 'PRESENT'), ('S011', 'A095', 'PRESENT'),
('S011', 'A096', 'PRESENT'), ('S011', 'A097', 'ABSENT'), ('S011', 'A098', 'PRESENT'), ('S011', 'A099', 'PRESENT'), ('S011', 'A100', 'PRESENT'),
('S011', 'A101', 'PRESENT'), ('S011', 'A102', 'ABSENT'), ('S011', 'A103', 'PRESENT'), ('S011', 'A104', 'PRESENT'), ('S011', 'A105', 'PRESENT'),
('S011', 'A106', 'PRESENT'), ('S011', 'A107', 'ABSENT'), ('S011', 'A108', 'PRESENT'), ('S011', 'A109', 'PRESENT'), ('S011', 'A110', 'PRESENT'),
('S011', 'A111', 'PRESENT'), ('S011', 'A112', 'ABSENT'), ('S011', 'A113', 'PRESENT'), ('S011', 'A114', 'PRESENT'), ('S011', 'A115', 'PRESENT'),
('S011', 'A116', 'PRESENT'), ('S011', 'A117', 'ABSENT'), ('S011', 'A118', 'PRESENT'), ('S011', 'A119', 'PRESENT'), ('S011', 'A120', 'PRESENT'),
('S011', 'A121', 'PRESENT'), ('S011', 'A122', 'ABSENT'), ('S011', 'A123', 'PRESENT'), ('S011', 'A124', 'PRESENT'), ('S011', 'A125', 'PRESENT'),
('S011', 'A126', 'PRESENT'), ('S011', 'A127', 'ABSENT'), ('S011', 'A128', 'PRESENT'), ('S011', 'A129', 'PRESENT'), ('S011', 'A130', 'PRESENT'),
('S011', 'A131', 'PRESENT'), ('S011', 'A132', 'ABSENT'), ('S011', 'A133', 'PRESENT'), ('S011', 'A134', 'PRESENT'), ('S011', 'A135', 'PRESENT'),
('S011', 'A136', 'PRESENT'), ('S011', 'A137', 'ABSENT'), ('S011', 'A138', 'PRESENT'), ('S011', 'A139', 'PRESENT'), ('S011', 'A140', 'PRESENT'),
('S011', 'A141', 'PRESENT'), ('S011', 'A142', 'ABSENT'), ('S011', 'A143', 'PRESENT'), ('S011', 'A144', 'PRESENT'), ('S011', 'A145', 'PRESENT'),
('S011', 'A146', 'PRESENT'), ('S011', 'A147', 'ABSENT'), ('S011', 'A148', 'PRESENT'), ('S011', 'A149', 'PRESENT'), ('S011', 'A150', 'PRESENT'),
('S011', 'A151', 'PRESENT'), ('S011', 'A152', 'ABSENT'), ('S011', 'A153', 'PRESENT'), ('S011', 'A154', 'PRESENT'), ('S011', 'A155', 'PRESENT'),
('S011', 'A156', 'PRESENT'), ('S011', 'A157', 'ABSENT'), ('S011', 'A158', 'PRESENT'), ('S011', 'A159', 'PRESENT'), ('S011', 'A160', 'PRESENT'),
('S011', 'A161', 'PRESENT'), ('S011', 'A162', 'ABSENT'), ('S011', 'A163', 'PRESENT'), ('S011', 'A164', 'PRESENT'), ('S011', 'A165', 'PRESENT');



INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S012', 'A001', 'PRESENT'), ('S012', 'A002', 'PRESENT'), ('S012', 'A003', 'PRESENT'), ('S012', 'A004', 'PRESENT'), ('S012', 'A005', 'ABSENT'),
('S012', 'A006', 'PRESENT'), ('S012', 'A007', 'PRESENT'), ('S012', 'A008', 'PRESENT'), ('S012', 'A009', 'PRESENT'), ('S012', 'A010', 'PRESENT'),
('S012', 'A011', 'PRESENT'), ('S012', 'A012', 'ABSENT'), ('S012', 'A013', 'PRESENT'), ('S012', 'A014', 'PRESENT'), ('S012', 'A015', 'PRESENT'),
('S012', 'A016', 'PRESENT'), ('S012', 'A017', 'PRESENT'), ('S012', 'A018', 'ABSENT'), ('S012', 'A019', 'PRESENT'), ('S012', 'A020', 'PRESENT'),
('S012', 'A021', 'PRESENT'), ('S012', 'A022', 'PRESENT'), ('S012', 'A023', 'PRESENT'), ('S012', 'A024', 'PRESENT'), ('S012', 'A025', 'ABSENT'),
('S012', 'A026', 'PRESENT'), ('S012', 'A027', 'PRESENT'), ('S012', 'A028', 'PRESENT'), ('S012', 'A029', 'PRESENT'), ('S012', 'A030', 'PRESENT'),
('S012', 'A031', 'ABSENT'), ('S012', 'A032', 'PRESENT'), ('S012', 'A033', 'PRESENT'), ('S012', 'A034', 'PRESENT'), ('S012', 'A035', 'PRESENT'),
('S012', 'A036', 'PRESENT'), ('S012', 'A037', 'PRESENT'), ('S012', 'A038', 'PRESENT'), ('S012', 'A039', 'ABSENT'), ('S012', 'A040', 'PRESENT'),
('S012', 'A041', 'PRESENT'), ('S012', 'A042', 'PRESENT'), ('S012', 'A043', 'PRESENT'), ('S012', 'A044', 'ABSENT'), ('S012', 'A045', 'PRESENT'),
('S012', 'A046', 'PRESENT'), ('S012', 'A047', 'PRESENT'), ('S012', 'A048', 'PRESENT'), ('S012', 'A049', 'PRESENT'), ('S012', 'A050', 'PRESENT'),
('S012', 'A051', 'ABSENT'), ('S012', 'A052', 'PRESENT'), ('S012', 'A053', 'PRESENT'), ('S012', 'A054', 'PRESENT'), ('S012', 'A055', 'PRESENT'),
('S012', 'A056', 'PRESENT'), ('S012', 'A057', 'PRESENT'), ('S012', 'A058', 'ABSENT'), ('S012', 'A059', 'PRESENT'), ('S012', 'A060', 'PRESENT'),
('S012', 'A061', 'PRESENT'), ('S012', 'A062', 'PRESENT'), ('S012', 'A063', 'PRESENT'), ('S012', 'A064', 'ABSENT'), ('S012', 'A065', 'PRESENT'),
('S012', 'A066', 'PRESENT'), ('S012', 'A067', 'PRESENT'), ('S012', 'A068', 'PRESENT'), ('S012', 'A069', 'PRESENT'), ('S012', 'A070', 'PRESENT'),
('S012', 'A071', 'ABSENT'), ('S012', 'A072', 'PRESENT'), ('S012', 'A073', 'PRESENT'), ('S012', 'A074', 'PRESENT'), ('S012', 'A075', 'PRESENT'),
('S012', 'A076', 'PRESENT'), ('S012', 'A077', 'PRESENT'), ('S012', 'A078', 'ABSENT'), ('S012', 'A079', 'PRESENT'), ('S012', 'A080', 'PRESENT'),
('S012', 'A081', 'PRESENT'), ('S012', 'A082', 'PRESENT'), ('S012', 'A083', 'PRESENT'), ('S012', 'A084', 'ABSENT'), ('S012', 'A085', 'PRESENT'),
('S012', 'A086', 'PRESENT'), ('S012', 'A087', 'PRESENT'), ('S012', 'A088', 'PRESENT'), ('S012', 'A089', 'PRESENT'), ('S012', 'A090', 'ABSENT'),
('S012', 'A091', 'PRESENT'), ('S012', 'A092', 'PRESENT'), ('S012', 'A093', 'PRESENT'), ('S012', 'A094', 'ABSENT'), ('S012', 'A095', 'PRESENT'),
('S012', 'A096', 'PRESENT'), ('S012', 'A097', 'PRESENT'), ('S012', 'A098', 'PRESENT'), ('S012', 'A099', 'ABSENT'), ('S012', 'A100', 'PRESENT'),
('S012', 'A101', 'PRESENT'), ('S012', 'A102', 'PRESENT'), ('S012', 'A103', 'PRESENT'), ('S012', 'A104', 'ABSENT'), ('S012', 'A105', 'PRESENT'),
('S012', 'A106', 'PRESENT'), ('S012', 'A107', 'PRESENT'), ('S012', 'A108', 'PRESENT'), ('S012', 'A109', 'PRESENT'), ('S012', 'A110', 'ABSENT'),
('S012', 'A111', 'PRESENT'), ('S012', 'A112', 'PRESENT'), ('S012', 'A113', 'ABSENT'), ('S012', 'A114', 'PRESENT'), ('S012', 'A115', 'PRESENT'),
('S012', 'A116', 'PRESENT'), ('S012', 'A117', 'PRESENT'), ('S012', 'A118', 'ABSENT'), ('S012', 'A119', 'PRESENT'), ('S012', 'A120', 'PRESENT'),
('S012', 'A121', 'PRESENT'), ('S012', 'A122', 'PRESENT'), ('S012', 'A123', 'PRESENT'), ('S012', 'A124', 'ABSENT'), ('S012', 'A125', 'PRESENT'),
('S012', 'A126', 'PRESENT'), ('S012', 'A127', 'PRESENT'), ('S012', 'A128', 'PRESENT'), ('S012', 'A129', 'ABSENT'), ('S012', 'A130', 'PRESENT'),
('S012', 'A131', 'PRESENT'), ('S012', 'A132', 'PRESENT'), ('S012', 'A133', 'PRESENT'), ('S012', 'A134', 'ABSENT'), ('S012', 'A135', 'PRESENT'),
('S012', 'A136', 'PRESENT'), ('S012', 'A137', 'PRESENT'), ('S012', 'A138', 'PRESENT'), ('S012', 'A139', 'PRESENT'), ('S012', 'A140', 'ABSENT'),
('S012', 'A141', 'PRESENT'), ('S012', 'A142', 'PRESENT'), ('S012', 'A143', 'PRESENT'), ('S012', 'A144', 'ABSENT'), ('S012', 'A145', 'PRESENT'),
('S012', 'A146', 'PRESENT'), ('S012', 'A147', 'PRESENT'), ('S012', 'A148', 'PRESENT'), ('S012', 'A149', 'ABSENT'), ('S012', 'A150', 'PRESENT'),
('S012', 'A151', 'PRESENT'), ('S012', 'A152', 'PRESENT'), ('S012', 'A153', 'PRESENT'), ('S012', 'A154', 'ABSENT'), ('S012', 'A155', 'PRESENT'),
('S012', 'A156', 'PRESENT'), ('S012', 'A157', 'PRESENT'), ('S012', 'A158', 'PRESENT'), ('S012', 'A159', 'ABSENT'), ('S012', 'A160', 'PRESENT'),
('S012', 'A161', 'PRESENT'), ('S012', 'A162', 'PRESENT'), ('S012', 'A163', 'PRESENT'), ('S012', 'A164', 'ABSENT'), ('S012', 'A165', 'PRESENT');


INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S013', 'A001', 'PRESENT'), ('S013', 'A002', 'PRESENT'), ('S013', 'A003', 'PRESENT'), ('S013', 'A004', 'PRESENT'), ('S013', 'A005', 'PRESENT'),
('S013', 'A006', 'PRESENT'), ('S013', 'A007', 'PRESENT'), ('S013', 'A008', 'PRESENT'), ('S013', 'A009', 'PRESENT'), ('S013', 'A010', 'ABSENT'),
('S013', 'A011', 'PRESENT'), ('S013', 'A012', 'PRESENT'), ('S013', 'A013', 'PRESENT'), ('S013', 'A014', 'PRESENT'), ('S013', 'A015', 'PRESENT'),
('S013', 'A016', 'PRESENT'), ('S013', 'A017', 'PRESENT'), ('S013', 'A018', 'PRESENT'), ('S013', 'A019', 'PRESENT'), ('S013', 'A020', 'ABSENT'),
('S013', 'A021', 'PRESENT'), ('S013', 'A022', 'PRESENT'), ('S013', 'A023', 'PRESENT'), ('S013', 'A024', 'PRESENT'), ('S013', 'A025', 'PRESENT'),
('S013', 'A026', 'PRESENT'), ('S013', 'A027', 'PRESENT'), ('S013', 'A028', 'PRESENT'), ('S013', 'A029', 'ABSENT'), ('S013', 'A030', 'PRESENT'),
('S013', 'A031', 'PRESENT'), ('S013', 'A032', 'PRESENT'), ('S013', 'A033', 'PRESENT'), ('S013', 'A034', 'PRESENT'), ('S013', 'A035', 'PRESENT'),
('S013', 'A036', 'PRESENT'), ('S013', 'A037', 'ABSENT'), ('S013', 'A038', 'PRESENT'), ('S013', 'A039', 'PRESENT'), ('S013', 'A040', 'PRESENT'),
('S013', 'A041', 'PRESENT'), ('S013', 'A042', 'PRESENT'), ('S013', 'A043', 'PRESENT'), ('S013', 'A044', 'PRESENT'), ('S013', 'A045', 'PRESENT'),
('S013', 'A046', 'PRESENT'), ('S013', 'A047', 'PRESENT'), ('S013', 'A048', 'PRESENT'), ('S013', 'A049', 'ABSENT'), ('S013', 'A050', 'PRESENT'),
('S013', 'A051', 'PRESENT'), ('S013', 'A052', 'PRESENT'), ('S013', 'A053', 'PRESENT'), ('S013', 'A054', 'PRESENT'), ('S013', 'A055', 'PRESENT'),
('S013', 'A056', 'PRESENT'), ('S013', 'A057', 'PRESENT'), ('S013', 'A058', 'PRESENT'), ('S013', 'A059', 'ABSENT'), ('S013', 'A060', 'PRESENT'),
('S013', 'A061', 'PRESENT'), ('S013', 'A062', 'PRESENT'), ('S013', 'A063', 'PRESENT'), ('S013', 'A064', 'PRESENT'), ('S013', 'A065', 'PRESENT'),
('S013', 'A066', 'PRESENT'), ('S013', 'A067', 'PRESENT'), ('S013', 'A068', 'PRESENT'), ('S013', 'A069', 'PRESENT'), ('S013', 'A070', 'ABSENT'),
('S013', 'A071', 'PRESENT'), ('S013', 'A072', 'PRESENT'), ('S013', 'A073', 'PRESENT'), ('S013', 'A074', 'PRESENT'), ('S013', 'A075', 'PRESENT'),
('S013', 'A076', 'PRESENT'), ('S013', 'A077', 'PRESENT'), ('S013', 'A078', 'PRESENT'), ('S013', 'A079', 'ABSENT'), ('S013', 'A080', 'PRESENT'),
('S013', 'A081', 'PRESENT'), ('S013', 'A082', 'PRESENT'), ('S013', 'A083', 'PRESENT'), ('S013', 'A084', 'PRESENT'), ('S013', 'A085', 'PRESENT'),
('S013', 'A086', 'PRESENT'), ('S013', 'A087', 'PRESENT'), ('S013', 'A088', 'PRESENT'), ('S013', 'A089', 'PRESENT'), ('S013', 'A090', 'ABSENT'),
('S013', 'A091', 'PRESENT'), ('S013', 'A092', 'PRESENT'), ('S013', 'A093', 'PRESENT'), ('S013', 'A094', 'PRESENT'), ('S013', 'A095', 'PRESENT'),
('S013', 'A096', 'PRESENT'), ('S013', 'A097', 'PRESENT'), ('S013', 'A098', 'PRESENT'), ('S013', 'A099', 'ABSENT'), ('S013', 'A100', 'PRESENT'),
('S013', 'A101', 'PRESENT'), ('S013', 'A102', 'PRESENT'), ('S013', 'A103', 'PRESENT'), ('S013', 'A104', 'PRESENT'), ('S013', 'A105', 'PRESENT'),
('S013', 'A106', 'PRESENT'), ('S013', 'A107', 'PRESENT'), ('S013', 'A108', 'PRESENT'), ('S013', 'A109', 'PRESENT'), ('S013', 'A110', 'ABSENT'),
('S013', 'A111', 'PRESENT'), ('S013', 'A112', 'PRESENT'), ('S013', 'A113', 'PRESENT'), ('S013', 'A114', 'PRESENT'), ('S013', 'A115', 'PRESENT'),
('S013', 'A116', 'PRESENT'), ('S013', 'A117', 'PRESENT'), ('S013', 'A118', 'PRESENT'), ('S013', 'A119', 'ABSENT'), ('S013', 'A120', 'PRESENT'),
('S013', 'A121', 'PRESENT'), ('S013', 'A122', 'PRESENT'), ('S013', 'A123', 'PRESENT'), ('S013', 'A124', 'PRESENT'), ('S013', 'A125', 'PRESENT'),
('S013', 'A126', 'PRESENT'), ('S013', 'A127', 'PRESENT'), ('S013', 'A128', 'PRESENT'), ('S013', 'A129', 'ABSENT'), ('S013', 'A130', 'PRESENT'),
('S013', 'A131', 'PRESENT'), ('S013', 'A132', 'PRESENT'), ('S013', 'A133', 'PRESENT'), ('S013', 'A134', 'PRESENT'), ('S013', 'A135', 'PRESENT'),
('S013', 'A136', 'PRESENT'), ('S013', 'A137', 'PRESENT'), ('S013', 'A138', 'PRESENT'), ('S013', 'A139', 'PRESENT'), ('S013', 'A140', 'ABSENT'),
('S013', 'A141', 'PRESENT'), ('S013', 'A142', 'PRESENT'), ('S013', 'A143', 'PRESENT'), ('S013', 'A144', 'PRESENT'), ('S013', 'A145', 'PRESENT'),
('S013', 'A146', 'PRESENT'), ('S013', 'A147', 'PRESENT'), ('S013', 'A148', 'PRESENT'), ('S013', 'A149', 'ABSENT'), ('S013', 'A150', 'PRESENT'),
('S013', 'A151', 'PRESENT'), ('S013', 'A152', 'PRESENT'), ('S013', 'A153', 'PRESENT'), ('S013', 'A154', 'PRESENT'), ('S013', 'A155', 'PRESENT'),
('S013', 'A156', 'PRESENT'), ('S013', 'A157', 'PRESENT'), ('S013', 'A158', 'PRESENT'), ('S013', 'A159', 'ABSENT'), ('S013', 'A160', 'PRESENT'),
('S013', 'A161', 'PRESENT'), ('S013', 'A162', 'PRESENT'), ('S013', 'A163', 'PRESENT'), ('S013', 'A164', 'PRESENT'), ('S013', 'A165', 'ABSENT');

INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S014', 'A001', 'PRESENT'), ('S014', 'A002', 'PRESENT'), ('S014', 'A003', 'PRESENT'), ('S014', 'A004', 'PRESENT'), ('S014', 'A005', 'PRESENT'),
('S014', 'A006', 'PRESENT'), ('S014', 'A007', 'PRESENT'), ('S014', 'A008', 'PRESENT'), ('S014', 'A009', 'PRESENT'), ('S014', 'A010', 'ABSENT'),
('S014', 'A011', 'PRESENT'), ('S014', 'A012', 'PRESENT'), ('S014', 'A013', 'PRESENT'), ('S014', 'A014', 'PRESENT'), ('S014', 'A015', 'PRESENT'),
('S014', 'A016', 'PRESENT'), ('S014', 'A017', 'PRESENT'), ('S014', 'A018', 'PRESENT'), ('S014', 'A019', 'PRESENT'), ('S014', 'A020', 'ABSENT'),
('S014', 'A021', 'PRESENT'), ('S014', 'A022', 'PRESENT'), ('S014', 'A023', 'PRESENT'), ('S014', 'A024', 'PRESENT'), ('S014', 'A025', 'PRESENT'),
('S014', 'A026', 'PRESENT'), ('S014', 'A027', 'PRESENT'), ('S014', 'A028', 'PRESENT'), ('S014', 'A029', 'ABSENT'), ('S014', 'A030', 'PRESENT'),
('S014', 'A031', 'PRESENT'), ('S014', 'A032', 'PRESENT'), ('S014', 'A033', 'PRESENT'), ('S014', 'A034', 'PRESENT'), ('S014', 'A035', 'PRESENT'),
('S014', 'A036', 'PRESENT'), ('S014', 'A037', 'ABSENT'), ('S014', 'A038', 'PRESENT'), ('S014', 'A039', 'PRESENT'), ('S014', 'A040', 'PRESENT'),
('S014', 'A041', 'PRESENT'), ('S014', 'A042', 'PRESENT'), ('S014', 'A043', 'PRESENT'), ('S014', 'A044', 'PRESENT'), ('S014', 'A045', 'PRESENT'),
('S014', 'A046', 'PRESENT'), ('S014', 'A047', 'PRESENT'), ('S014', 'A048', 'PRESENT'), ('S014', 'A049', 'ABSENT'), ('S014', 'A050', 'PRESENT'),
('S014', 'A051', 'PRESENT'), ('S014', 'A052', 'PRESENT'), ('S014', 'A053', 'PRESENT'), ('S014', 'A054', 'PRESENT'), ('S014', 'A055', 'PRESENT'),
('S014', 'A056', 'PRESENT'), ('S014', 'A057', 'PRESENT'), ('S014', 'A058', 'PRESENT'), ('S014', 'A059', 'ABSENT'), ('S014', 'A060', 'PRESENT'),
('S014', 'A061', 'PRESENT'), ('S014', 'A062', 'PRESENT'), ('S014', 'A063', 'PRESENT'), ('S014', 'A064', 'PRESENT'), ('S014', 'A065', 'PRESENT'),
('S014', 'A066', 'PRESENT'), ('S014', 'A067', 'PRESENT'), ('S014', 'A068', 'PRESENT'), ('S014', 'A069', 'PRESENT'), ('S014', 'A070', 'ABSENT'),
('S014', 'A071', 'PRESENT'), ('S014', 'A072', 'PRESENT'), ('S014', 'A073', 'PRESENT'), ('S014', 'A074', 'PRESENT'), ('S014', 'A075', 'PRESENT'),
('S014', 'A076', 'PRESENT'), ('S014', 'A077', 'PRESENT'), ('S014', 'A078', 'PRESENT'), ('S014', 'A079', 'ABSENT'), ('S014', 'A080', 'PRESENT'),
('S014', 'A081', 'PRESENT'), ('S014', 'A082', 'PRESENT'), ('S014', 'A083', 'PRESENT'), ('S014', 'A084', 'PRESENT'), ('S014', 'A085', 'PRESENT'),
('S014', 'A086', 'PRESENT'), ('S014', 'A087', 'PRESENT'), ('S014', 'A088', 'PRESENT'), ('S014', 'A089', 'PRESENT'), ('S014', 'A090', 'ABSENT'),
('S014', 'A091', 'PRESENT'), ('S014', 'A092', 'PRESENT'), ('S014', 'A093', 'PRESENT'), ('S014', 'A094', 'PRESENT'), ('S014', 'A095', 'PRESENT'),
('S014', 'A096', 'PRESENT'), ('S014', 'A097', 'PRESENT'), ('S014', 'A098', 'PRESENT'), ('S014', 'A099', 'ABSENT'), ('S014', 'A100', 'PRESENT'),
('S014', 'A101', 'PRESENT'), ('S014', 'A102', 'PRESENT'), ('S014', 'A103', 'PRESENT'), ('S014', 'A104', 'PRESENT'), ('S014', 'A105', 'PRESENT'),
('S014', 'A106', 'PRESENT'), ('S014', 'A107', 'PRESENT'), ('S014', 'A108', 'PRESENT'), ('S014', 'A109', 'PRESENT'), ('S014', 'A110', 'ABSENT'),
('S014', 'A111', 'PRESENT'), ('S014', 'A112', 'PRESENT'), ('S014', 'A113', 'PRESENT'), ('S014', 'A114', 'PRESENT'), ('S014', 'A115', 'PRESENT'),
('S014', 'A116', 'PRESENT'), ('S014', 'A117', 'PRESENT'), ('S014', 'A118', 'PRESENT'), ('S014', 'A119', 'ABSENT'), ('S014', 'A120', 'PRESENT'),
('S014', 'A121', 'PRESENT'), ('S014', 'A122', 'PRESENT'), ('S014', 'A123', 'PRESENT'), ('S014', 'A124', 'PRESENT'), ('S014', 'A125', 'PRESENT'),
('S014', 'A126', 'PRESENT'), ('S014', 'A127', 'PRESENT'), ('S014', 'A128', 'PRESENT'), ('S014', 'A129', 'ABSENT'), ('S014', 'A130', 'PRESENT'),
('S014', 'A131', 'PRESENT'), ('S014', 'A132', 'PRESENT'), ('S014', 'A133', 'PRESENT'), ('S014', 'A134', 'PRESENT'), ('S014', 'A135', 'PRESENT'),
('S014', 'A136', 'PRESENT'), ('S014', 'A137', 'PRESENT'), ('S014', 'A138', 'PRESENT'), ('S014', 'A139', 'PRESENT'), ('S014', 'A140', 'ABSENT'),
('S014', 'A141', 'PRESENT'), ('S014', 'A142', 'PRESENT'), ('S014', 'A143', 'PRESENT'), ('S014', 'A144', 'PRESENT'), ('S014', 'A145', 'PRESENT'),
('S014', 'A146', 'PRESENT'), ('S014', 'A147', 'PRESENT'), ('S014', 'A148', 'PRESENT'), ('S014', 'A149', 'ABSENT'), ('S014', 'A150', 'PRESENT'),
('S014', 'A151', 'PRESENT'), ('S014', 'A152', 'PRESENT'), ('S014', 'A153', 'PRESENT'), ('S014', 'A154', 'PRESENT'), ('S014', 'A155', 'PRESENT'),
('S014', 'A156', 'PRESENT'), ('S014', 'A157', 'PRESENT'), ('S014', 'A158', 'PRESENT'), ('S014', 'A159', 'ABSENT'), ('S014', 'A160', 'PRESENT'),
('S014', 'A161', 'PRESENT'), ('S014', 'A162', 'PRESENT'), ('S014', 'A163', 'PRESENT'), ('S014', 'A164', 'PRESENT'), ('S014', 'A165', 'ABSENT');


INSERT INTO Stu_Attendance (Reg_No, Attendance_ID, status) VALUES
('S015', 'A001', 'PRESENT'),
('S015', 'A002', 'ABSENT'),
('S015', 'A003', 'PRESENT'),
('S015', 'A004', 'ABSENT'),
('S015', 'A005', 'PRESENT'),
('S015', 'A006', 'PRESENT'),
('S015', 'A007', 'PRESENT'),
('S015', 'A008', 'ABSENT'),
('S015', 'A009', 'PRESENT'),
('S015', 'A010', 'ABSENT'),
('S015', 'A011', 'PRESENT'),
('S015', 'A012', 'PRESENT'),
('S015', 'A013', 'PRESENT'),
('S015', 'A014', 'ABSENT'),
('S015', 'A015', 'PRESENT'),
('S015', 'A016', 'PRESENT'),
('S015', 'A017', 'PRESENT'),
('S015', 'A018', 'PRESENT'),
('S015', 'A019', 'PRESENT'),
('S015', 'A020', 'PRESENT'),
('S015', 'A021', 'ABSENT'),
('S015', 'A022', 'ABSENT'),
('S015', 'A023', 'ABSENT'),
('S015', 'A024', 'PRESENT'),
('S015', 'A025', 'PRESENT'),
('S015', 'A026', 'ABSENT'),
('S015', 'A027', 'ABSENT'),
('S015', 'A028', 'ABSENT'),
('S015', 'A029', 'ABSENT'),
('S015', 'A030', 'PRESENT'),
('S015', 'A031', 'PRESENT'),
('S015', 'A032', 'PRESENT'),
('S015', 'A033', 'PRESENT'),
('S015', 'A034', 'ABSENT'),
('S015', 'A035', 'ABSENT'),
('S015', 'A036', 'ABSENT'),
('S015', 'A037', 'ABSENT'),
('S015', 'A038', 'ABSENT'),
('S015', 'A039', 'PRESENT'),
('S015', 'A040', 'ABSENT'),
('S015', 'A041', 'PRESENT'),
('S015', 'A042', 'PRESENT'),
('S015', 'A043', 'PRESENT'),
('S015', 'A044', 'PRESENT'),
('S015', 'A045', 'ABSENT'),
('S015', 'A046', 'PRESENT'),
('S015', 'A047', 'ABSENT'),
('S015', 'A048', 'PRESENT'),
('S015', 'A049', 'PRESENT'),
('S015', 'A050', 'ABSENT'),
('S015', 'A051', 'ABSENT'),
('S015', 'A052', 'ABSENT'),
('S015', 'A053', 'ABSENT'),
('S015', 'A054', 'PRESENT'),
('S015', 'A055', 'PRESENT'),
('S015', 'A056', 'PRESENT'),
('S015', 'A057', 'ABSENT'),
('S015', 'A058', 'PRESENT'),
('S015', 'A059', 'ABSENT'),
('S015', 'A060', 'PRESENT'),
('S015', 'A061', 'PRESENT'),
('S015', 'A062', 'ABSENT'),
('S015', 'A063', 'ABSENT'),
('S015', 'A064', 'PRESENT'),
('S015', 'A065', 'PRESENT'),
('S015', 'A066', 'PRESENT'),
('S015', 'A067', 'ABSENT'),
('S015', 'A068', 'ABSENT'),
('S015', 'A069', 'PRESENT'),
('S015', 'A070', 'PRESENT'),
('S015', 'A071', 'ABSENT'),
('S015', 'A072', 'ABSENT'),
('S015', 'A073', 'PRESENT'),
('S015', 'A074', 'PRESENT'),
('S015', 'A075', 'PRESENT'),
('S015', 'A076', 'PRESENT'),
('S015', 'A077', 'ABSENT'),
('S015', 'A078', 'ABSENT'),
('S015', 'A079', 'PRESENT'),
('S015', 'A080', 'ABSENT'),
('S015', 'A081', 'ABSENT'),
('S015', 'A082', 'PRESENT'),
('S015', 'A083', 'ABSENT'),
('S015', 'A084', 'PRESENT'),
('S015', 'A085', 'ABSENT'),
('S015', 'A086', 'ABSENT'),
('S015', 'A087', 'ABSENT'),
('S015', 'A088', 'ABSENT'),
('S015', 'A089', 'PRESENT'),
('S015', 'A090', 'PRESENT'),
('S015', 'A091', 'PRESENT'),
('S015', 'A092', 'ABSENT'),
('S015', 'A093', 'ABSENT'),
('S015', 'A094', 'ABSENT'),
('S015', 'A095', 'PRESENT'),
('S015', 'A096', 'PRESENT'),
('S015', 'A097', 'ABSENT'),
('S015', 'A098', 'PRESENT'),
('S015', 'A099', 'ABSENT'),
('S015', 'A100', 'ABSENT'),
('S015', 'A101', 'ABSENT'),
('S015', 'A102', 'ABSENT'),
('S015', 'A103', 'PRESENT'),
('S015', 'A104', 'PRESENT'),
('S015', 'A105', 'PRESENT'),
('S015', 'A106', 'ABSENT'),
('S015', 'A107', 'PRESENT'),
('S015', 'A108', 'ABSENT'),
('S015', 'A109', 'ABSENT'),
('S015', 'A110', 'ABSENT'),
('S015', 'A111', 'PRESENT'),
('S015', 'A112', 'ABSENT'),
('S015', 'A113', 'PRESENT'),
('S015', 'A114', 'PRESENT'),
('S015', 'A115', 'PRESENT'),
('S015', 'A116', 'PRESENT'),
('S015', 'A117', 'PRESENT'),
('S015', 'A118', 'ABSENT'),
('S015', 'A119', 'ABSENT'),
('S015', 'A120', 'PRESENT'),
('S015', 'A121', 'ABSENT'),
('S015', 'A122', 'PRESENT'),
('S015', 'A123', 'ABSENT'),
('S015', 'A124', 'PRESENT'),
('S015', 'A125', 'PRESENT'),
('S015', 'A126', 'ABSENT'),
('S015', 'A127', 'ABSENT'),
('S015', 'A128', 'PRESENT'),
('S015', 'A129', 'ABSENT'),
('S015', 'A130', 'PRESENT'),
('S015', 'A131', 'ABSENT'),
('S015', 'A132', 'ABSENT'),
('S015', 'A133', 'PRESENT'),
('S015', 'A134', 'PRESENT'),
('S015', 'A135', 'PRESENT'),
('S015', 'A136', 'PRESENT'),
('S015', 'A137', 'ABSENT'),
('S015', 'A138', 'ABSENT'),
('S015', 'A139', 'ABSENT'),
('S015', 'A140', 'ABSENT'),
('S015', 'A141', 'PRESENT'),
('S015', 'A142', 'ABSENT'),
('S015', 'A143', 'PRESENT'),
('S015', 'A144', 'ABSENT'),
('S015', 'A145', 'ABSENT'),
('S015', 'A146', 'PRESENT'),
('S015', 'A147', 'ABSENT'),
('S015', 'A148', 'PRESENT'),
('S015', 'A149', 'ABSENT'),
('S015', 'A150', 'ABSENT'),
('S015', 'A151', 'ABSENT'),
('S015', 'A152', 'ABSENT'),
('S015', 'A153', 'ABSENT'),
('S015', 'A154', 'ABSENT'),
('S015', 'A155', 'ABSENT'),
('S015', 'A156', 'ABSENT'),
('S015', 'A157', 'PRESENT'),
('S015', 'A158', 'PRESENT'),
('S015', 'A159', 'ABSENT'),
('S015', 'A160', 'PRESENT'),
('S015', 'A161', 'ABSENT'),
('S015', 'A162', 'PRESENT'),
('S015', 'A163', 'ABSENT'),
('S015', 'A164', 'ABSENT'),
('S015', 'A165', 'ABSENT');

INSERT INTO session (Session_ID, Component_Type, Num_Of_Session, Course_Code, Lecturer_ID) VALUES
('SESS001', 'Lecture', 1, 'ICT1212', 'L005'),
('SESS002', 'Lab', 1, 'ICT1212', 'L005'),
('SESS003', 'Tutorial', 1, 'ICT1212', 'L004'),
('SESS004', 'Lecture', 1, 'ENG1222', 'L001'),
('SESS005', 'Tutorial', 1, 'TMS1233', 'L002'),
('SESS008', 'Lecture', 2, 'TMS1233', 'L002'),
('SESS009', 'Lecture', 1, 'ICT1233', 'L007'),
('SESS010', 'Lab', 1, 'ICT1233', 'L006');




CREATE OR REPLACE VIEW ca_eligibility AS
SELECT
    Mark_ID,
    Reg_No,
    Course_Code,
    (Mid_Mark + Assignment1_Mark + Assignment2_Mark +
     (Quiz1_Mark + Quiz2_Mark + Quiz3_Mark - LEAST(Quiz1_Mark, Quiz2_Mark, Quiz3_Mark))
    ) AS Total_CA_Score,
    (Quiz1_Mark + Quiz2_Mark + Quiz3_Mark - LEAST(Quiz1_Mark, Quiz2_Mark, Quiz3_Mark)) AS best_two_Quizzes_mark,
    CASE
        WHEN (Mid_Mark + Assignment1_Mark + Assignment2_Mark +
              (Quiz1_Mark + Quiz2_Mark + Quiz3_Mark - LEAST(Quiz1_Mark, Quiz2_Mark, Quiz3_Mark))
             ) >= 20
        THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS CA_Eligibility_Status
FROM mark;

CREATE OR REPLACE VIEW student_grades AS
SELECT
    m.Mark_ID,
    m.Reg_No,
    m.Course_Code,
    m.End_Mark,
    (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
     (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark))
    ) AS Total_CA_Score,
    (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) AS Best_Two_Quizzes_Mark,
    (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
     (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark
    ) AS Final_Mark,
    CASE 
        WHEN r.Reg_No IS NULL THEN
            CASE
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 80 THEN 'A+'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 75 THEN 'A'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 70 THEN 'A-'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 65 THEN 'B+'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 60 THEN 'B'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 55 THEN 'B-'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 50 THEN 'C+'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 45 THEN 'C'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 40 THEN 'C-'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 35 THEN 'D+'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 30 THEN 'D'
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 25 THEN 'E'
                ELSE 'F'
            END
        ELSE
            CASE
                WHEN (m.Mid_Mark + m.Assignment1_Mark + m.Assignment2_Mark +
                      (m.Quiz1_Mark + m.Quiz2_Mark + m.Quiz3_Mark - LEAST(m.Quiz1_Mark, m.Quiz2_Mark, m.Quiz3_Mark)) + m.End_Mark) >= 45 THEN 'C'
                ELSE 'F'
            END
    END AS Grade
FROM mark m
LEFT JOIN `repeat_STUDENT` r ON m.Reg_No = r.Reg_No;

CREATE OR REPLACE VIEW FINAL_MARK AS
SELECT
    Reg_No,
    Course_Code,
    (Mid_Mark + Assignment1_Mark + Assignment2_Mark +
     (Quiz1_Mark + Quiz2_Mark + Quiz3_Mark - LEAST(Quiz1_Mark, Quiz2_Mark, Quiz3_Mark)) + End_Mark
    ) AS Final_Mark
FROM mark;

CREATE OR REPLACE VIEW semester_gpa AS
SELECT 
    m.Reg_No,
    ROUND(SUM(
        CASE
            WHEN m.Grade = 'A+' THEN 4.00 * c.Credit
            WHEN m.Grade = 'A'  THEN 4.00 * c.Credit
            WHEN m.Grade = 'A-' THEN 3.70 * c.Credit
            WHEN m.Grade = 'B+' THEN 3.30 * c.Credit
            WHEN m.Grade = 'B'  THEN 3.00 * c.Credit
            WHEN m.Grade = 'B-' THEN 2.70 * c.Credit
            WHEN m.Grade = 'C+' THEN 2.30 * c.Credit
            WHEN m.Grade = 'C'  THEN 2.00 * c.Credit
            WHEN m.Grade = 'C-' THEN 1.70 * c.Credit
            WHEN m.Grade = 'D+' THEN 1.30 * c.Credit
            WHEN m.Grade = 'D'  THEN 1.00 * c.Credit
            WHEN m.Grade = 'E'  THEN 0.70 * c.Credit
            ELSE 0.00
        END
    ) / SUM(c.Credit), 2) AS GPA
FROM student_grades m
JOIN course c ON m.Course_Code = c.Course_Code
GROUP BY m.Reg_No;

CREATE OR REPLACE VIEW student_cgpa AS
SELECT 
    m.Reg_No,
    ROUND(
        SUM(
            CASE
                WHEN m.Course_Code <> 'ENG1222' THEN
                    CASE
                        WHEN m.Grade = 'A+' THEN 4.00 * c.Credit
                        WHEN m.Grade = 'A'  THEN 4.00 * c.Credit
                        WHEN m.Grade = 'A-' THEN 3.70 * c.Credit
                        WHEN m.Grade = 'B+' THEN 3.30 * c.Credit
                        WHEN m.Grade = 'B'  THEN 3.00 * c.Credit
                        WHEN m.Grade = 'B-' THEN 2.70 * c.Credit
                        WHEN m.Grade = 'C+' THEN 2.30 * c.Credit
                        WHEN m.Grade = 'C'  THEN 2.00 * c.Credit
                        WHEN m.Grade = 'C-' THEN 1.70 * c.Credit
                        WHEN m.Grade = 'D+' THEN 1.30 * c.Credit
                        WHEN m.Grade = 'D'  THEN 1.00 * c.Credit
                        WHEN m.Grade = 'E'  THEN 0.70 * c.Credit
                        ELSE 0.00
                    END
                ELSE 0
            END
        ) / SUM(CASE WHEN m.Course_Code <> 'ENG1222' THEN c.Credit ELSE 0 END), 2
    ) AS CGPA
FROM student_grades m
JOIN course c ON m.Course_Code = c.Course_Code
GROUP BY m.Reg_No;

CREATE OR REPLACE VIEW result_sheet AS
SELECT
    sg.Reg_No,
    MAX(CASE WHEN sg.Course_Code = 'ENG1222' THEN sg.Grade END) AS ENG1222_Grade,
    MAX(CASE WHEN sg.Course_Code = 'ICT1212' THEN sg.Grade END) AS ICT1212_Grade,
    MAX(CASE WHEN sg.Course_Code = 'ICT1222' THEN sg.Grade END) AS ICT1222_Grade,
    MAX(CASE WHEN sg.Course_Code = 'ICT1233' THEN sg.Grade END) AS ICT1233_Grade,
    MAX(CASE WHEN sg.Course_Code = 'ICT1242' THEN sg.Grade END) AS ICT1242_Grade,
    MAX(CASE WHEN sg.Course_Code = 'ICT1253' THEN sg.Grade END) AS ICT1253_Grade,
    MAX(CASE WHEN sg.Course_Code = 'TCS1212' THEN sg.Grade END) AS TCS1212_Grade,
    MAX(CASE WHEN sg.Course_Code = 'TMS1233' THEN sg.Grade END) AS TMS1233_Grade,
    MAX(sem.GPA) AS SGPA,
    MAX(cg.CGPA) AS CGPA
FROM student_grades sg
JOIN FINAL_MARK fm 
    ON sg.Reg_No = fm.Reg_No AND sg.Course_Code = fm.Course_Code
LEFT JOIN semester_gpa sem ON sg.Reg_No = sem.Reg_No
LEFT JOIN student_cgpa cg ON sg.Reg_No = cg.Reg_No
GROUP BY sg.Reg_No;



CREATE or replace  VIEW Student_Attendance_Hours AS
SELECT
    s.Reg_No,
    a.Course_Code,
    a.Type, -- Include type to allow filtering
    SUM(a.Hours) AS Total_Possible_Hours,
    SUM(CASE
        WHEN s.status IN ('Present', 'Medical') THEN a.Hours 
        ELSE 0
    END) AS Attended_Hours,
    SUM(CASE
        WHEN s.status = 'Medical' THEN a.Hours 
        ELSE 0
    END) AS Medical_Hours
FROM
    stu_attendance s
JOIN
    attendance a ON s.Attendance_ID = a.Attendance_ID
GROUP BY
    s.Reg_No, a.Course_Code, a.Type;







CREATE or replace VIEW final_exam_eligibility AS
SELECT
    Reg_No,
    Course_Code,
    SUM(Total_Possible_Hours) AS Grand_Total_Hours,
    SUM(Attended_Hours) AS Grand_Attended_Hours,
    SUM(Medical_Hours) AS Grand_Medical_Hours,
    -- Calculate attendance percentage
    (SUM(Attended_Hours) / NULLIF(SUM(Total_Possible_Hours), 0)) * 100 AS Attendance_Percentage,
    -- Determine final eligibility status (using NULLIF for safety)
    CASE
        WHEN (SUM(Attended_Hours) / NULLIF(SUM(Total_Possible_Hours), 0)) * 100 >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Eligibility_Status
FROM
    Student_Attendance_Hours
GROUP BY
    Reg_No, Course_Code;



CREATE or replace VIEW Student_Attendance_Hours AS
SELECT
    s.Reg_No,
    a.Course_Code,
    a.Type, -- Include type to allow filtering
    SUM(a.Hours) AS Total_Possible_Hours,
    SUM(CASE
        WHEN s.status IN ('Present', 'Medical') THEN a.Hours 
        ELSE 0
    END) AS Attended_Hours,
    SUM(CASE
        WHEN s.status = 'Medical' THEN a.Hours 
        ELSE 0
    END) AS Medical_Hours
FROM
    stu_attendance s
JOIN
    attendance a ON s.Attendance_ID = a.Attendance_ID
GROUP BY
    s.Reg_No, a.Course_Code, a.Type;










CREATE or replace VIEW Course_Eligibility_Summary AS
SELECT
    Reg_No,
    Course_Code,
    SUM(Total_Possible_Hours) AS Grand_Total_Hours,
    SUM(Attended_Hours) AS Grand_Attended_Hours,
    SUM(Medical_Hours) AS Grand_Medical_Hours,
    -- Calculate attendance percentage
    (SUM(Attended_Hours) / NULLIF(SUM(Total_Possible_Hours), 0)) * 100 AS Attendance_Percentage,
    -- Determine final eligibility status (using NULLIF for safety)
    CASE
        WHEN (SUM(Attended_Hours) / NULLIF(SUM(Total_Possible_Hours), 0)) * 100 >= 80 THEN 'Eligible'
        ELSE 'Not Eligible'
    END AS Eligibility_Status
FROM
    Student_Attendance_Hours
GROUP BY
    Reg_No, Course_Code;










DELIMITER $$

CREATE PROCEDURE Calculate_Student_individual_gpa(IN p_RegNo VARCHAR(10))
BEGIN
    SELECT * 
    FROM ca_eligibility
    WHERE Reg_No = p_RegNo;

    SELECT 
        Reg_No, 
        Course_Code, 
        Final_Mark, 
        Grade
    FROM student_grades
    WHERE Reg_No = p_RegNo;

    SELECT 
        Reg_No, 
        Course_Code, 
        Final_Mark
    FROM FINAL_MARK
    WHERE Reg_No = p_RegNo;

    SELECT 
        sem.Reg_No, 
        sem.GPA AS Semester_GPA,
        cg.CGPA AS CGPA
    FROM semester_gpa sem
    LEFT JOIN student_cgpa cg ON sem.Reg_No = cg.Reg_No
    WHERE sem.Reg_No = p_RegNo;
END$$

DELIMITER ;





DELIMITER $$

CREATE PROCEDURE Calculate_allStudent_gpa()
BEGIN
    SELECT * 
    FROM ca_eligibility;

    SELECT 
        Reg_No, 
        Course_Code, 
        Final_Mark, 
        Grade
    FROM student_grades;

    SELECT 
        Reg_No, 
        Course_Code, 
        Final_Mark
    FROM FINAL_MARK;

    SELECT 
        sem.Reg_No, 
        sem.GPA AS Semester_GPA,
        cg.CGPA AS CGPA
    FROM semester_gpa sem
    LEFT JOIN student_cgpa cg ON sem.Reg_No = cg.Reg_No;
END$$

DELIMITER ;






DELIMITER $$

CREATE PROCEDURE Get_CA_Eligibility_By_Course(IN p_CourseCode VARCHAR(10))
BEGIN
    SELECT * 
    FROM ca_eligibility
    WHERE Course_Code = p_CourseCode;
END$$

DELIMITER ;











DELIMITER $$

CREATE PROCEDURE Get_CA_Eligibility(
    IN p_RegNo VARCHAR(10),
    IN p_CourseCode VARCHAR(10)
)
BEGIN
    IF p_RegNo IS NOT NULL AND p_CourseCode IS NOT NULL THEN
        SELECT * 
        FROM ca_eligibility
        WHERE Reg_No = p_RegNo
          AND Course_Code = p_CourseCode;

    ELSEIF p_RegNo IS NOT NULL AND p_CourseCode IS NULL THEN
        SELECT Reg_No,
               COUNT(Course_Code) AS Total_Courses,
               SUM(CASE WHEN CA_Eligibility_Status='Eligible' THEN 1 ELSE 0 END) AS Eligible_Courses,
               SUM(CASE WHEN CA_Eligibility_Status='Not Eligible' THEN 1 ELSE 0 END) AS Not_Eligible_Courses
        FROM ca_eligibility
        WHERE Reg_No = p_RegNo
        GROUP BY Reg_No;

    ELSE
        SELECT * 
        FROM ca_eligibility;
    END IF;
END$$

DELIMITER ;




DELIMITER $$

CREATE PROCEDURE Get_Final_Marks(
    IN p_RegNo VARCHAR(10)
)
BEGIN
    IF p_RegNo IS NOT NULL THEN
        SELECT 
            Reg_No,
            Course_Code,
            (Mid_Mark + Assignment1_Mark + Assignment2_Mark +
             (Quiz1_Mark + Quiz2_Mark + Quiz3_Mark - LEAST(Quiz1_Mark, Quiz2_Mark, Quiz3_Mark)) +
             End_Mark) AS Final_Mark
        FROM mark
        WHERE Reg_No = p_RegNo;
    ELSE
        SELECT 
            Reg_No,
            Course_Code,
            (Mid_Mark + Assignment1_Mark + Assignment2_Mark +
             (Quiz1_Mark + Quiz2_Mark + Quiz3_Mark - LEAST(Quiz1_Mark, Quiz2_Mark, Quiz3_Mark)) +
             End_Mark) AS Final_Mark
        FROM mark
        ORDER BY Reg_No, Course_Code;
    END IF;
END$$

DELIMITER ;








DELIMITER $$

CREATE PROCEDURE Generate_Result_Sheet(IN p_RegNo VARCHAR(10))
BEGIN
    IF p_RegNo IS NOT NULL THEN
        SELECT * 
        FROM result_sheet
        WHERE Reg_No = p_RegNo;
    ELSE
        SELECT * 
        FROM result_sheet;
    END IF;
END$$

DELIMITER ;





DELIMITER $$

CREATE PROCEDURE Student_Grades(IN p_RegNo VARCHAR(10))
BEGIN
    IF p_RegNo IS NOT NULL THEN
        SELECT 
            sg.Reg_No,
            MAX(CASE WHEN sg.Course_Code = 'ENG1222' THEN sg.Grade END) AS ENG1222_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1212' THEN sg.Grade END) AS ICT1212_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1222' THEN sg.Grade END) AS ICT1222_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1233' THEN sg.Grade END) AS ICT1233_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1242' THEN sg.Grade END) AS ICT1242_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1253' THEN sg.Grade END) AS ICT1253_Grade,
            MAX(CASE WHEN sg.Course_Code = 'TCS1212' THEN sg.Grade END) AS TCS1212_Grade,
            MAX(CASE WHEN sg.Course_Code = 'TMS1233' THEN sg.Grade END) AS TMS1233_Grade
        FROM student_grades sg
        WHERE sg.Reg_No = p_RegNo
        GROUP BY sg.Reg_No;
    ELSE
        SELECT 
            sg.Reg_No,
            MAX(CASE WHEN sg.Course_Code = 'ENG1222' THEN sg.Grade END) AS ENG1222_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1212' THEN sg.Grade END) AS ICT1212_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1222' THEN sg.Grade END) AS ICT1222_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1233' THEN sg.Grade END) AS ICT1233_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1242' THEN sg.Grade END) AS ICT1242_Grade,
            MAX(CASE WHEN sg.Course_Code = 'ICT1253' THEN sg.Grade END) AS ICT1253_Grade,
            MAX(CASE WHEN sg.Course_Code = 'TCS1212' THEN sg.Grade END) AS TCS1212_Grade,
            MAX(CASE WHEN sg.Course_Code = 'TMS1233' THEN sg.Grade END) AS TMS1233_Grade
        FROM student_grades sg
        GROUP BY sg.Reg_No;
    END IF;
END$$

DELIMITER ;





 DELIMITER //

CREATE PROCEDURE Get_Not_Eligible_Students (
    IN p_Reg_No VARCHAR(20),
    IN p_Course_Code VARCHAR(10)
)
BEGIN
    SELECT
        Reg_No,
        Course_Code,
        Attendance_Percentage,
        Grand_Total_Hours
    FROM
        Course_Eligibility_Summary
    WHERE
        Eligibility_Status = 'Not Eligible'
        AND (p_Reg_No IS NULL OR Reg_No = p_Reg_No)
        AND (p_Course_Code IS NULL OR Course_Code = p_Course_Code);
END //

DELIMITER ;





DELIMITER //

CREATE PROCEDURE Get_Attendance_By_Session (
    IN p_Course_Code VARCHAR(10),
    IN p_Date DATE
)
BEGIN
    SELECT
        sa.Attendance_ID,
        a.Course_Code,
        a.Date,
        sa.status,
        COUNT(sa.Reg_No) AS Student_Count
    FROM
        Stu_Attendance sa
    JOIN
        Attendance a ON sa.Attendance_ID = a.Attendance_ID
    WHERE
        (p_Course_Code IS NULL OR a.Course_Code = p_Course_Code)
        AND (p_Date IS NULL OR a.Date = p_Date)
    GROUP BY
        sa.Attendance_ID, a.Course_Code, a.Date, sa.status
    ORDER BY
        a.Date, a.Course_Code, sa.Attendance_ID;
END //

DELIMITER ;





DELIMITER //

CREATE PROCEDURE Get_Total_Medical_Hours (
    IN p_Min_Medical_Hours INT
)
BEGIN
    SELECT
        Reg_No,
        Course_Code,
        Grand_Medical_Hours
    FROM
        Course_Eligibility_Summary
    WHERE
        Grand_Medical_Hours > 0
        AND Grand_Medical_Hours >= IFNULL(p_Min_Medical_Hours, 0)
    ORDER BY
        Grand_Medical_Hours DESC;
END //

DELIMITER ;

-- Example Call
-- 1. Get all medical hour summaries (minimum 0 hours)
-- CALL Get_Total_Medical_Hours(NULL);
-- 2. Get summaries for students with at least 5 medical hours
-- CALL Get_Total_Medical_Hours(5);



DELIMITER //

CREATE PROCEDURE Get_Course_Type_Totals (
    IN p_Course_Code VARCHAR(10),
    IN p_Type VARCHAR(20)
)
BEGIN
    SELECT
        Course_Code,
        Type,
        SUM(Total_Possible_Hours) AS Course_Total_Hours,
        SUM(Attended_Hours) AS Course_Attended_Hours,
        (SUM(Attended_Hours) / NULLIF(SUM(Total_Possible_Hours), 0)) * 100 AS Course_Type_Percentage
    FROM
        Student_Attendance_Hours
    WHERE
        (p_Course_Code IS NULL OR Course_Code = p_Course_Code)
        AND (p_Type IS NULL OR Type = p_Type)
    GROUP BY
        Course_Code, Type
    ORDER BY
        Course_Code, Type;
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE Get_Perfect_Attendance_Students (
    IN p_Reg_No VARCHAR(20),
    IN p_Course_Code VARCHAR(10)
)
BEGIN
    SELECT
        Reg_No,
        Course_Code,
        Grand_Total_Hours
    FROM
        Course_Eligibility_Summary
    WHERE
        Attendance_Percentage = 100.00
        AND Grand_Total_Hours > 0 
        AND (p_Reg_No IS NULL OR Reg_No = p_Reg_No)
        AND (p_Course_Code IS NULL OR Course_Code = p_Course_Code)
    ORDER BY
        Reg_No, Course_Code;
END //

DELIMITER ;




USE faculty_of_technology;


CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON faculty_of_technology.* TO 'admin_user'@'localhost' WITH GRANT OPTION;


CREATE USER 'dean_user'@'localhost' IDENTIFIED BY 'Dean@123';
GRANT ALL PRIVILEGES ON faculty_of_technology.* TO 'dean_user'@'localhost';


CREATE USER 'lecturer_user'@'localhost' IDENTIFIED BY 'Lecturer@123';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, REFERENCES 
ON faculty_of_technology.* TO 'lecturer_user'@'localhost';


CREATE USER 'to_user'@'localhost' IDENTIFIED BY 'TO@123';
GRANT SELECT, INSERT, UPDATE 
ON faculty_of_technology.Attendance TO 'to_user'@'localhost';
GRANT SELECT, INSERT, UPDATE 
ON faculty_of_technology.Stu_Attendance TO 'to_user'@'localhost';


CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'Student@123';
GRANT SELECT ON faculty_of_technology.Mark TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.ca_eligibility TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.course_eligibility_summary TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.final_mark TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.result_sheet TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.student_attendance_hours TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.student_grades TO 'student_user'@'localhost';

FLUSH PRIVILEGES;



  
  























































