DELIMITER $$
CREATE PROCEDURE Calculate_Student_individual_gpa(IN p_RegNo VARCHAR(10))
BEGIN
    SELECT * 
    FROM ca_eligibility
    WHERE Reg_No = p_RegNo;

    ELECT 
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













