
//
//Lab3




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
()


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



//Enter data

insert into schedule values('9:00:00','12:00:00','Tuesday');
insert into schedule values('9:00:00','10:00:00','Wedday');
insert into schedule values('14:00:00','15:00:00','Friday');

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

insert into research_area values(4,'VLSI');
insert into research_area values(5,'VLSI');
insert into research_area values(2,'VLSI');
insert into research_area values(4,'Signal');
insert into research_area values(2,'Signal');

insert into dependents values(1,45,'Rajesh');
insert into dependents values(2,31,'Rajesh');
insert into dependents values(1,40,'Suresh');

insert into course values(3,24,'MA355','class','4012',3,'9:00:00','10:00:00','Wedday','2010-04-21',12);
insert into course values(4,10,'EC124','lab','Dept Lab',7,'9:00:00','12:00:00','Monday','2006-10-10',4);



Ques 1
Select prof_name from professor where prof_id IN (Select prof_id from dependents where dependents_name = 'Rajesh');

Ques 2
Select prof_name from professor where prof_id IN (Select prof_id from research_area where research='VLSI') AND prof_id IN (Select prof_id from research_area where research='Signal');

Ques 3
Select prof_name from professor where prof_id IN (Select prof_id from course where intake <= 30);

Ques 4
Select prof_id from course where course_name='CS345' AND prof_id NOT IN (Select prof_id from course where course_name='CS428');

Ques 5
Select course_id from course where st_time ='14:00:00' AND end_time ='17:00:00' AND day ='Monday' AND course_type='Lab'; 

