lCREATE TABLE Repeat_Student (
    Reg_No VARCHAR(10),
    Repeat_Fee_Status INT,
    Repeat_Semester VARCHAR(10),
    Repeat_Status_Date DATE
);

CREATE TABLE Proper_Student (
    Reg_No VARCHAR(10) PRIMARY KEY,
    First_Enrollment_Date DATE
);

CREATE TABLE Course_Mark (
    Course_Code VARCHAR(7),
    Mark_ID VARCHAR(15),
    PRIMARY KEY (Course_Code, Mark_ID)
);

CREATE TABLE Stu_Course (
    Reg_No VARCHAR(10) NOT NULL,
    Course_Code VARCHAR(7) NOT NULL,
    PRIMARY KEY (Reg_No, Course_Code)
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







