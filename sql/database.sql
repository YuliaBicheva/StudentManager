# CREATE USER studentmanager@localhost identified by '123123' ;
# GRANT USAGE on  *.* to studentmanager@localhost identified by '123123';

create database if not EXISTS studentmanager;
GRANT ALL PRIVILEGES on studentmanager.* to root@localhost;
USE studentmanager;


DROP TABLE IF EXISTS progress;
DROP TABLE IF EXISTS disciplines_has_semester;
DROP TABLE IF EXISTS disciplines;
DROP TABLE IF EXISTS semester;
DROP TABLE IF EXISTS students;

CREATE TABLE students(
  id int PRIMARY KEY auto_increment,
  first_name VARCHAR(50),
  second_name VARCHAR(50),
  groupe VARCHAR(10),
  entrance_date DATE
) DEFAULT CHARSET=utf8;

-- id = 1;
INSERT INTO studentmanager.students VALUES(default, 'Василий', 'Васильев', 'GF-1', NOW());
-- id = 2;
INSERT INTO studentmanager.students VALUES(default, 'Иван', 'Иванов', 'GF-1', NOW());
-- id = 3;
INSERT INTO studentmanager.students VALUES(default, 'Степан', 'Степанов', 'GF-1', NOW());
-- id = 4;
INSERT INTO studentmanager.students VALUES(default, 'Игорь', 'Крутой', 'GF-1', NOW());
-- id = 5;
INSERT INTO studentmanager.students VALUES(default, 'Antonio', 'Vivaldi', 'GF-1', NOW());

CREATE TABLE semester (
  id int PRIMARY KEY auto_increment,
  name VARCHAR(50),
  duration INT
) DEFAULT CHARSET=utf8;

-- id = 1;
INSERT INTO studentmanager.semester VALUES(default, 'Semester1', 12);
-- id = 2;
INSERT INTO studentmanager.semester VALUES(default, 'Semester2', 15);
-- id = 3;
INSERT INTO studentmanager.semester VALUES(default, 'Semester3', 17);
-- id = 4;
INSERT INTO studentmanager.semester VALUES(default, 'Semester4', 24);
-- id = 5;
INSERT INTO studentmanager.semester VALUES(default, 'Semester5', 3);

CREATE TABLE disciplines (
  id int PRIMARY KEY auto_increment,
  name VARCHAR(50)
) DEFAULT CHARSET=utf8;

-- id = 1;
INSERT INTO studentmanager.disciplines VALUES(default, 'Math');
-- id = 2;
INSERT INTO studentmanager.disciplines VALUES(default, 'History');
-- id = 3;
INSERT INTO studentmanager.disciplines VALUES(default, 'Информатика');
-- id = 4;
INSERT INTO studentmanager.disciplines VALUES(default, 'Геометрия');
-- id = 5;
INSERT INTO studentmanager.disciplines VALUES (default, 'Русский язык');

CREATE TABLE disciplines_has_semester(
  disciplines_id INT,
  semester_id INT,
  idx INT
) DEFAULT CHARSET=utf8;

-- Semester1 -> [History,Геометрия,Русский язык]
INSERT INTO studentmanager.disciplines_has_semester VALUES(2,1,0);
INSERT INTO studentmanager.disciplines_has_semester VALUES(4,1,0);
INSERT INTO studentmanager.disciplines_has_semester VALUES(5,1,0);

-- Semester2 -> [Math,Информатика,Русский язык]
INSERT INTO studentmanager.disciplines_has_semester VALUES(1,2,0);
INSERT INTO studentmanager.disciplines_has_semester VALUES(3,2,0);
INSERT INTO studentmanager.disciplines_has_semester VALUES(5,2,0);

CREATE TABLE progress(
  id int PRIMARY KEY auto_increment,
  value INT,
  students_id INT,
  disciplines_id INT
) DEFAULT CHARSET=utf8;

-- id=1 Васильев -> [History:3,Геометрия:4,Русский язык:5]
INSERT INTO studentmanager.progress VALUES(default,3,1,2);
INSERT INTO studentmanager.progress VALUES(default,4,1,4);
INSERT INTO studentmanager.progress VALUES(default,5,1,5);