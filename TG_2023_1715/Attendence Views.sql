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


