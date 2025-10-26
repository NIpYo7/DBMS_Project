CREATE TABLE Session (
    Session_ID VARCHAR(10) PRIMARY KEY,
    Component_Type VARCHAR(20),
    Num_Of_Session INT,
    Course_Code VARCHAR(7),
    Lecturer_ID VARCHAR(15)
);

INSERT INTO session (Session_ID, Component_Type, Num_Of_Session, Course_Code, Lecturer_ID) VALUES
('SESS001', 'Lecture', 1, 'ICT1212', 'L005'),
('SESS002', 'Lab', 1, 'ICT1212', 'L005'),
('SESS003', 'Tutorial', 1, 'ICT1212', 'L004'),
('SESS004', 'Lecture', 1, 'ENG1222', 'L001'),
('SESS005', 'Tutorial', 1, 'TMS1233', 'L002'),
('SESS008', 'Lecture', 2, 'TMS1233', 'L002'),
('SESS009', 'Lecture', 1, 'ICT1233', 'L007'),
('SESS010', 'Lab', 1, 'ICT1233', 'L006');

ALTER TABLE Session
ADD CONSTRAINT fk_session_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Session
ADD CONSTRAINT fk_session_lecturer FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID);
