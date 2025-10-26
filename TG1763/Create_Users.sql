
USE faculty_of_technology;

--create users and assign roles with appropriate privileges
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL PRIVILEGES ON faculty_of_technology.* TO 'admin_user'@'localhost' WITH GRANT OPTION;

--cresate dean user
CREATE USER 'dean_user'@'localhost' IDENTIFIED BY 'Dean@123';
GRANT ALL PRIVILEGES ON faculty_of_technology.* TO 'dean_user'@'localhost';

--create lecturer user
CREATE USER 'lecturer_user'@'localhost' IDENTIFIED BY 'Lecturer@123';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, INDEX, REFERENCES 
ON faculty_of_technology.* TO 'lecturer_user'@'localhost';

--create to user
CREATE USER 'to_user'@'localhost' IDENTIFIED BY 'TO@123';
GRANT SELECT, INSERT, UPDATE 
ON faculty_of_technology.Attendance TO 'to_user'@'localhost';
GRANT SELECT, INSERT, UPDATE 
ON faculty_of_technology.Stu_Attendance TO 'to_user'@'localhost';

--create student user
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'Student@123';
GRANT SELECT ON faculty_of_technology.Mark TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.ca_eligibility TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.course_eligibility_summary TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.final_mark TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.result_sheet TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.student_attendance_hours TO 'student_user'@'localhost';
GRANT SELECT ON faculty_of_technology.student_grades TO 'student_user'@'localhost';

FLUSH PRIVILEGES;



  