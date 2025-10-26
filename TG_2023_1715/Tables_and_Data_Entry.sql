
CREATE TABLE Attendance (
    Attendance_ID VARCHAR(25) PRIMARY KEY NOT NULL,
    Time VARCHAR(15),
    Type VARCHAR(50),
    Hours INT,
    Date DATE,
    Course_Code VARCHAR(7)
);

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




CREATE TABLE Stu_Attendance (
    Reg_No VARCHAR(10),
    Attendance_ID VARCHAR(25),
    status VARCHAR(10),
    PRIMARY KEY (Reg_No, Attendance_ID)
);


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





CREATE TABLE Department (
    Dep_ID VARCHAR(20) PRIMARY KEY NOT NULL,
    Name CHAR(150),
    Location VARCHAR(200),
    Dean_ID VARCHAR(10),
    Admin_ID VARCHAR(10)
);

INSERT INTO Department (Dep_ID, Name, Location, Dean_ID, Admin_ID) VALUES
('DEP01', 'ICT Department', 'Building A', 'D001', 'ADM001'),
('DEP02', 'BST Department', 'Building B', 'D001', 'ADM001'),
('DEP03', 'ET Department', 'Building C', 'D001', 'ADM001'),
('DEP04', 'Multidisciplinary Department', 'Building D', 'D001', 'ADM001');



CREATE TABLE Lecturer (
    Lecturer_ID VARCHAR(15) PRIMARY KEY NOT NULL,
    F_Name VARCHAR(150),
    L_Name VARCHAR(150),
    Gender CHAR(10),
    Contact_Number VARCHAR(15),
    Email VARCHAR(50)
);

INSERT INTO Lecturer (Lecturer_ID, F_Name, L_Name, Gender, Contact_Number, Email) VALUES
('L001', 'Saman', 'Perera', 'Male', '0711234567', 'saman.perera@email.com'),
('L002', 'Nirodha', 'Madusanka', 'Male', '0712345678', 'nirodha.madusanka@email.com'),
('L003', 'Kamal', 'Fernando', 'Male', '0713456789', 'kamal.fernando@email.com'),
('L004', 'Nadeesha', 'Silva', 'Female', '0714567890', 'nadeesha.silva@email.com'),
('L005', 'Chamara', 'Jayasinghe', 'Male', '0715678901', 'chamara.jayasinghe@email.com'),
('L006', 'Sanduni', 'Perera', 'Female', '0716789012', 'sanduni.perera@email.com'),
('L007', 'Amal', 'Gunasekara', 'Male', '0717890123', 'amal.gunasekara@email.com');



CREATE TABLE Technical_Officer (
    TO_ID VARCHAR(25) PRIMARY KEY NOT NULL,
    Email VARCHAR(30),
    F_Name VARCHAR(60),
    L_Name VARCHAR(60),
    Gender CHAR(15),
    Contact_Number VARCHAR(15),
    Dep_ID VARCHAR(20)
);

INSERT INTO Technical_Officer (TO_ID, Email, F_Name, L_Name, Gender, Contact_Number, Dep_ID) VALUES
('TO001', 'alice.tech@email.com', 'Alice', 'Fernando', 'Female', '0712345678', 'DEP01'),
('TO002', 'brian.tech@email.com', 'Brian', 'Perera', 'Male', '0723456789', 'DEP01'),
('TO003', 'carol.tech@email.com', 'Carol', 'Silva', 'Female', '0709876543', 'DEP02'),
('TO004', 'daniel.tech@email.com', 'Daniel', 'Jayawardena', 'Male', '0765432198', 'DEP02'),
('TO005', 'elaine.tech@email.com', 'Elaine', 'Kumar', 'Female', '0771234567', 'DEP03'),
('TO006', 'frank.tech@email.com', 'Frank', 'Dias', 'Male', '0756789123', 'DEP03'),
('TO007', 'grace.tech@email.com', 'Grace', 'Rajapaksa', 'Female', '0782345671', 'DEP04'),
('TO008', 'harry.tech@email.com', 'Harry', 'Senanayake', 'Male', '0793456782', 'DEP04');


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

-----Foreign_Keys-Related to above tables----

ALTER TABLE Stu_Attendance
ADD CONSTRAINT fk_stuattendance_student FOREIGN KEY (Reg_No) REFERENCES Student(Reg_No);

ALTER TABLE Stu_Attendance
ADD CONSTRAINT fk_stuattendance_attendance FOREIGN KEY (Attendance_ID) REFERENCES Attendance(Attendance_ID);


ALTER TABLE Department
ADD CONSTRAINT fk_department_dean FOREIGN KEY (Dean_ID) REFERENCES Dean(Dean_ID);

ALTER TABLE Department
ADD CONSTRAINT fk_department_admin FOREIGN KEY (Admin_ID) REFERENCES Admin(Admin_ID);

ALTER TABLE Technical_Officer
ADD CONSTRAINT fk_technical_officer_department FOREIGN KEY (Dep_ID) REFERENCES Department(Dep_ID);

ALTER TABLE Attendance
ADD CONSTRAINT fk_attendance_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Session
ADD CONSTRAINT fk_session_course FOREIGN KEY (Course_Code) REFERENCES Course(Course_Code);

ALTER TABLE Session
ADD CONSTRAINT fk_session_lecturer FOREIGN KEY (Lecturer_ID) REFERENCES Lecturer(Lecturer_ID);



