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
