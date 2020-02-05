

//Enter data

create table department(
dept_id INT UNSIGNED NOT NULL PRIMARY KEY,
dept_name varchar(15) NOT NULL
);




create table course(
course_id INT UNSIGNED NOT NULL PRIMARY KEY,
intake INT UNSIGNED NOT NULL,
course_name varchar(15) NOT NULL,
course_type varchar(10) NOT NULL,
room INT NOT NULL,
dept_id INT UNSIGNED NOT NULL,
since INT NOT NULL,
Foreign key(dept_id) references department(dept_id)
);


create table professor(
prof_id INT UNSIGNED NOT NULL PRIMARY KEY,
prof_name varchar(15),
sex varchar(10),
dept_id INT UNSIGNED NOT NULL,
research_area varchar(20) NOT NULL,
course_id INT NOT NULL,
Foreign key(dept_id) references department(dept_id),
Foreign key(course_id) references course(course_id)
);



create table dependents(
prof_id INT UNSIGNED NOT NULL,
dependents_name varchar(20) NOT NULL,
age INT UNSIGNED NOT NULL ,
primary key(prof_id,age,dependents_name),
Foreign key(prof_id) references professor(prof_id)
);


create table schedule(
day INT NOT NULL,
start_time INT NOT NULL,
end_time INT NOT NULL,
course_id INT UNSIGNED NOT NULL,
Primary key(day,course_id),
Foreign key(course_id) references course(course_id)
);

create table student(
stud_id INT UNSIGNED NOT NULL PRIMARY KEY,
stud_name varchar(20) NOT NULL,
dept_id INT UNSIGNED NOT NULL,
Foreign key(dept_id) references department(dept_id)
);



create table attends(
stud_id INT UNSIGNED NOT NULL,
course_id INT UNSIGNED NOT NULL,
grade INT NOT NULL,
PRIMARY KEY(stud_id,course_id),
Foreign key(stud_id) references student(stud_id),
Foreign key(course_id) references course(course_id)
);


Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/department.csv'
INTO TABLE department FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/attends.csv'
INTO TABLE attends FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/Course_Offered.csv'
INTO TABLE course FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/Prof_Dept_Course.csv'
INTO TABLE professor FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/dependent.csv'
INTO TABLE dependents FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/Scheduled_On.csv'
INTO TABLE schedule FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

Load DATA LOCAL INFILE '/home/aayus170123001/Desktop/Student_Record.csv'
INTO TABLE student FIELDS 
TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


Questions answers;

Q1
create view as 

