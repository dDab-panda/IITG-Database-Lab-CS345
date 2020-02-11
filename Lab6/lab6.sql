//Lab6

//Q1

DELIMITER $$
 
CREATE PROCEDURE display_name(IN b INT)
BEGIN

IF b=1 THEN
Select prof_name from professor WHERE sex='M';
END IF;

IF b=0 THEN 
Select prof_name from professor WHERE sex='F';
END IF;

END$$
DELIMITER ;

//Q2
DELIMITER $$
 
CREATE PROCEDURE fac(IN n INT)
BEGIN

DECLARE ANS INT;
DECLARE og INT;
SET ANS=1;
SET og=n;
factorial : LOOP
IF n=1 THEN 
LEAVE factorial;
END IF;

SET ANS = ANS*n;
SET n=n-1;

END LOOP;

Select og as Number,ANS as Result;

END$$
DELIMITER ;

//Q3

DELIMITER $$
 
CREATE PROCEDURE gift(IN id INT)
BEGIN
DECLARE result INT Default 0;
DECLARE total INT Default 0;
Select count(*) from dependents where prof_id = id INTO total;


if total = 1  then
set result = 2000;

elseif total = 2  then
set result = 3000;

elseif total = 3 then
set result = 4000;

elseif total = 4 then
set result = 5000;

elseif total = 5 then
set result = 6000;

ELSE
set result = 7000;
END IF;

Select id,result;
END$$
DELIMITER ;

//Q4

set @temp=7;
set @step =1;
DELIMITER $$
CREATE PROCEDURE ques4a(IN temp INT,IN step INT)
BEGIN
Set temp =temp+step;
END$$
DELIMITER ;

call ques4a(@temp,@step);
Select @temp;


set @temp=7;
set @step =1;
DELIMITER $$
CREATE PROCEDURE ques4b(INOUT temp INT,IN step INT)
BEGIN
Set temp =temp+step;
END$$
DELIMITER ;

call ques4b(@temp,@step);
Select @temp;

set @temp=7;
set @step =1;
DELIMITER $$
CREATE PROCEDURE ques4c(OUT temp INT,IN step INT)
BEGIN
Set temp =temp+step;
END$$
DELIMITER ;

call ques4c(@temp,@step);
Select @temp;

//ques5



set @temp=4;
set @step =1;
DELIMITER $$
CREATE PROCEDURE ques5a(IN temp INT,IN step INT)
BEGIN
declare new_grade INT;
Set new_grade = temp+step;
Select grade, count(*) from attends group by grade;
update attends set grade = new_grade where grade = temp;
Select grade, count(*) from attends group by grade;

Set temp = new_grade;
END$$
DELIMITER ;
call ques5a(@temp,@step);


set @temp=7;
set @step =1;
DELIMITER $$
CREATE PROCEDURE ques5b(OUT temp INT,IN step INT)
BEGIN
declare new_grade INT;
declare init int;
set init = 7;
Set new_grade = init+step;
Select grade, count(*) from attends group by grade;
update attends set grade = new_grade where grade = init;
Select grade, count(*) from attends group by grade;
Set temp = new_grade;
END$$
DELIMITER ;
call ques5b(@temp,@step);

set @temp=9;
set @step =1;
DELIMITER $$
CREATE PROCEDURE ques5c(INOUT temp INT,IN step INT)
BEGIN
declare new_grade INT;
Set new_grade = temp+step;
Select grade, count(*) from attends group by grade;
update attends set grade = new_grade where grade = temp;
Select grade, count(*) from attends group by grade;

Set temp = new_grade;
END$$
DELIMITER ;
call ques5c(@temp,@step);

//ques6

set @cnt=0;

DELIMITER $$
CREATE PROCEDURE ques6(IN research varchar(20), INOUT cnt INT)
BEGIN
DECLARE no INT DEFAULT 0;
select count(*) from professor where research_area = research INTO no;

set cnt = no;

END$$
DELIMITER ;

call ques6('DS',@cnt);
Select @cnt;


