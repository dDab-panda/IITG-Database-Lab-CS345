
//
//Lab4



create table schedule(
st_time TIME NOT NULL,
end_time TIME NOT NULL,
day varchar(10) NOT NULL,
Primary key(st_time,end_time,day)
);

create table department(
dept_id INT UNSIGNED NOT NULL PRIMARY KEY,
dept_name varchar(15) NOT NULL
);


create table professor(
prof_id INT UNSIGNED NOT NULL PRIMARY KEY,
prof_name varchar(15),
sex varchar(10),
dept_id INT UNSIGNED NOT NULL,
Foreign key(dept_id) references department(dept_id)
);



create table course(
course_id INT UNSIGNED NOT NULL PRIMARY KEY,
intake INT UNSIGNED NOT NULL,
course_name varchar(15) NOT NULL,
course_type varchar(10) NOT NULL,
room varchar(10) NOT NULL,
prof_id INT UNSIGNED NOT NULL,
st_time TIME NOT NULL,
end_time TIME NOT NULL,
day varchar(10) NOT NULL,
since date NOT NULL,
dept_id INT UNSIGNED NOT NULL,
Foreign key(dept_id) references department(dept_id),
Foreign key(prof_id) references professor(prof_id),
Foreign key(st_time) references schedule(st_time),
Foreign key(end_time) references schedule(end_time),
Foreign key(day) references schedule(day)
);

create table research_area(
prof_id INT UNSIGNED NOT NULL,
research varchar(20) NOT NULL,
primary key(prof_id,research),
foreign key(prof_id) references professor(prof_id)
);


create table dependents(
prof_id INT UNSIGNED NOT NULL,
age INT UNSIGNED NOT NULL ,
dependents_name varchar(20) NOT NULL,
primary key(prof_id,age,dependents_name),
Foreign key(prof_id) references professor(prof_id)
);

create table student(
stud_id INT UNSIGNED NOT NULL PRIMARY KEY,
name varchar(15) NOT NULL,
dept_id INT UNSIGNED NOT NULL,
Foreign key(dept_id) references department(dept_id)
);

create table attends(
stud_id INT UNSIGNED NOT NULL,
course_id INT UNSIGNED NOT NULL,
grade varchar(2) NOT NULL,
PRIMARY KEY(stud_id,course_id),
Foreign key(stud_id) references student(stud_id),
Foreign key(course_id) references course(course_id)
);

//Enter data

insert into schedule values('9:00:00','12:00:00','Tuesday');
insert into schedule values('9:00:00','10:00:00','Wedday');
insert into schedule values('14:00:00','15:00:00','Friday');

insert into schedule values('09:00:00','10:00:00','Monday');
insert into schedule values('10:00:00','11:00:00','Monday');
insert into schedule values('11:00:00','12:00:00','Monday');
insert into schedule values('14:00:00','15:00:00','Monday');
insert into schedule values('15:00:00','16:00:00','Monday');
insert into schedule values('16:00:00','17:00:00','Monday');

insert into schedule values('09:00:00','10:00:00','Tuesday');
insert into schedule values('10:00:00','11:00:00','Tuesday');
insert into schedule values('11:00:00','12:00:00','Tuesday');
insert into schedule values('14:00:00','15:00:00','Tuesday');
insert into schedule values('15:00:00','16:00:00','Tuesday');
insert into schedule values('16:00:00','17:00:00','Tuesday');

insert into schedule values('10:00:00','11:00:00','Wedday');
insert into schedule values('11:00:00','12:00:00','Wedday');
insert into schedule values('14:00:00','15:00:00','Wedday');
insert into schedule values('15:00:00','16:00:00','Wedday');
insert into schedule values('16:00:00','17:00:00','Wedday');

insert into schedule values('09:00:00','10:00:00','Thursday');
insert into schedule values('10:00:00','11:00:00','Thursday');
insert into schedule values('11:00:00','12:00:00','Thursday');
insert into schedule values('14:00:00','15:00:00','Thursday');
insert into schedule values('15:00:00','16:00:00','Thursday');
insert into schedule values('16:00:00','17:00:00','Thursday');

insert into schedule values('09:00:00','10:00:00','Friday');
insert into schedule values('10:00:00','11:00:00','Friday');
insert into schedule values('11:00:00','12:00:00','Friday');
insert into schedule values('15:00:00','16:00:00','Friday');
insert into schedule values('16:00:00','17:00:00','Friday');

insert into department values(1,'Computer science');
insert into department values(12,'MnC');
insert into department values(4,'ECE');
insert into department values(45,'Biotech');
insert into department values(5,'Chemistry');

insert into professor values(1,'Vijay','Male',1);
insert into professor values(2,'Bansal','Male',12);
insert into professor values(3,'abhinav','Male',4);
insert into professor values(4,'shalini','Female',45);
insert into professor values(5,'Ankur','Male',5);
insert into professor values(6,'tanvi','Female',12);
insert into professor values(7,'matrix','Male',1);


insert into course values(1,40,'CS345','Lab','Dept Lab',7,'14:00:00','17:00:00','Monday','2005-12-3',1);

insert into course values(2,31,'CS428','class','5001',1,'14:00:00','15:00:00','Friday','2012-1-32',1);

insert into course values(3,24,'MA355','class','4012',3,'9:00:00','10:00:00','Wedday','2010-04-21',12);

insert into course values(4,10,'EC124','lab','Dept Lab',7,'9:00:00','12:00:00','Monday','2006-10-10',4);

insert into course values(5,30,'MA374','lab','Dept Lab',6,'9:00:00','12:00:00','Tuesday','2004-04-10',12);
insert into course values(6,61,'MA373','Class','5102',3,'16:00:00','17:00:00','Wedday','2006-10-10',4);
insert into course values(7,61,'MA321','Class','5102',3,'16:00:00','17:00:00','Wedday','2006-12-10',12);
insert into course values(8,61,'MA373','Class','5102',3,'16:00:00','17:00:00','Friday','2006-10-10',4);
insert into course values(9,10,'EC124','lab','Dept Lab',7,'9:00:00','12:00:00','Monday','2006-10-10',4);

insert into research_area values(4,'VLSI');
insert into research_area values(5,'VLSI');
insert into research_area values(2,'VLSI');
insert into research_area values(4,'Signal');
insert into research_area values(2,'Signal');
insert into research_area values(4,'Machine Learning');
insert into research_area values(5,'Data mining');
insert into research_area values(2,'Data mining');

insert into dependents values(1,45,'Rajesh');
insert into dependents values(2,31,'Rajesh');
insert into dependents values(1,40,'Suresh');
insert into dependents values(3,54,'Gayatri');
insert into dependents values(3,50,'Mehul');
insert into dependents values(4,50,'Piyush');
insert into dependents values(5,50,'Mehra');
insert into dependents values(1,45,'Sharma');

insert into student values(221,'Garvit',12);
insert into student values(214,'Hema',12);
insert into student values(201,'Teju',12);
insert into student values(251,'Sethi',12);

insert into student values(101,'Lavish',1;
insert into student values(120,'Dalal',1);
insert into student values(145,'Vakul',1);
insert into student values(143,'Chirag',1);

insert into student values(523,'Saish',5);
insert into student values(544,'Sourdip',5);
insert into student values(517,'Nandini',5);
insert into student values(568,'Abhishek',5);

insert into student values(418,'Reet',4);
insert into student values(485,'Sanskar',4);
insert into student values(425,'Ayul',4);

insert into student values(946,'Sejal',45);
insert into student values(925,'Param',45);
insert into student values(991,'Bishnoi',45);

insert into attends values(201,5,6);
insert into attends values(201,6,7);
insert into attends values(201,7,6);
insert into attends values(201,1,8);

insert into attends values(120,1,10);
insert into attends values(120,2,8);
insert into attends values(120,7,7);

insert into attends values(418,4,10);
insert into attends values(418,7,5);

insert into attends values(221,5,8);
insert into attends values(221,6,9);
insert into attends values(221,7,6);
insert into attends values(221,1,10);


//Lab4
Ques 1
Select day, dept_name,count(*) as No_of_courses from course INNER JOIN department ON course.dept_id = department.dept_id group by day,dept_name order by day;

Ques 2
Select age,count(age) as No_of_dependents from dependents group by age  having age>40;

Ques 3
Select name,sum(grade) as grades from student INNER JOIN attends ON student.stud_id = attends.stud_id group by name having grades>20 AND grades<30;

Ques 4
Select course_id from course order by since limit 1;

Ques 5
select course_id,name from student NATURAL JOIN (select course_id,stud_id from attends NATURAL JOIN  (select course_id,max(grade) as grade from attends group by course_id) AS B) AS C GROUP BY course_id,name;

Ques 6
Select Name, course_name from student INNER JOIN course ON student.dept_id = course.dept_id;

Ques 7
Select dependents_name as Name,age from professor INNER JOIN dependents ON professor.prof_id=dependents.prof_id where prof_name = 'Vijay';

Ques 8
Select prof_name from professor where prof_id IN (Select prof_id from research_area where research='Machine Learning') OR prof_id IN (Select prof_id from research_area where research='Data mining');

