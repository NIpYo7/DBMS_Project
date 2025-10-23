SHOW DATABASES;

CREATE DATABASE FOT_Management;

USE FOT_Management;

--Creating Users

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'Admin@123';
CREATE USER 'dean'@'localhost' IDENTIFIED BY 'Dean@123';
CREATE USER 'lecturer'@'localhost' IDENTIFIED BY 'Lecturer@123';
CREATE USER 'technical_officer'@'localhost' IDENTIFIED BY 'Tech@123';
CREATE USER 'student'@'localhost' IDENTIFIED BY 'Student@123';

--Granting Privileges to Users

--admin User Privileges
GRANT ALL PRIVILEGES ON FOT_Management.* TO 'admin'@'localhost' WITH GRANT OPTION;

--dean User Privileges
GRANT ALL PRIVILEGES ON FOT_Management.* TO 'dean'@'localhost';

--lecturer User Privileges
GRANT ALL PRIVILEGES ON FOT_Management.* TO 'lecturer'@'localhost';
REVOKE GRANT OPTION ON FOT_Management.* FROM 'lecturer'@'localhost';
REVOKE CREATE USER ON *.* FROM 'lecturer'@'localhost';

--technical_officer User Privileges

--student User Privileges

