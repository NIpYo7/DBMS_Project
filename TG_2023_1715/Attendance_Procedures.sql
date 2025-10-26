1)
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

-- Example Call
-- 1. Get all not eligible students
-- CALL Get_Not_Eligible_Students(NULL, NULL);
-- 2. Get not eligible status for student 'S001'
-- CALL Get_Not_Eligible_Students('S001', NULL);
-- 3. Get not eligible students for course 'ICT1233'
-- CALL Get_Not_Eligible_Students(NULL, 'ICT1233');



2)

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

-- Example Call
-- 1. Get all attendance summaries
-- CALL Get_Attendance_By_Session(NULL, NULL);
-- 2. Get attendance summaries for 'ICT1233'
-- CALL Get_Attendance_By_Session('ICT1233', NULL);
-- 3. Get attendance for 'ICT1233' on a specific date
-- CALL Get_Attendance_By_Session('ICT1233', '2025-11-20');




3)

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

4)

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

-- Example Call
-- 1. Get totals for all courses and types
-- CALL Get_Course_Type_Totals(NULL, NULL);
-- 2. Get totals for course 'ICT1233'
-- CALL Get_Course_Type_Totals('ICT1233', NULL);
-- 3. Get totals for 'Lecture' type across all courses
-- CALL Get_Course_Type_Totals(NULL, 'Lecture');

5)


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

-- Example Call
-- 1. Get all perfect attendance students
-- CALL Get_Perfect_Attendance_Students(NULL, NULL);
-- 2. Check if student 'S002' has perfect attendance
-- CALL Get_Perfect_Attendance_Students('S002', NULL);
-- 3. Get all perfect attendance students in course 'TMS1233'
-- CALL Get_Perfect_Attendance_Students(NULL, 'TMS1233');


-------------------------------------------------All Views related to attendance part-------------------------------------------------------------------------------------------------------


CREATE VIEW Student_Attendance_Hours AS
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






--Course_Eligibility_Summary percentage=(Attended Hours/Total Possible Hours)*100--



CREATE VIEW Course_Eligibility_Summary AS
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

