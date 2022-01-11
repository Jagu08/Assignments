Update Stu
SET age= 16
Where id=1;
 
Delete from Stu where id=3

create table person(emp_id int primary key,s_id int,
                      name varchar(20));

insert into person values(11,1, 'Jagu');
insert into person values(12,2, 'kisu');
insert into person values(13,3, 'isha');
insert into person values(14,9, 'shreya');
insert into person values(15,8, 'drashti');

select * from person

create table salarys(s_id int,p_id int, income int);

insert into salarys values(1,22,3500);
insert into salarys values(2,11,3500);
insert into salarys values(3,44,4000);
insert into salarys values(6,22,5700); 
insert into salarys values(7,66,2300);

select * from salarys



Create table info(
s_id int PRIMARY key,
p_id int,
Address varchar(50),
email varchar(50)
)


Insert into info
values(2,22,'anand','isha123@gmail.com');
Insert into info
values(3,33,'baroda','shreya123@gmail.com');
Insert into info
values(9,77,'goa','rahi123@gmail.com');
Insert into info
values(10,66,'anand','kisu123@gmail.com');

select * from info

/* 3 table join */

select person.s_id,person.name,salarys.income,info.address
from ((person inner join salarys on person.s_id=salarys.s_id) 
inner join info on salarys.p_id=info.p_id);

/* joins */
Select person.name,salarys.income from person inner join salarys on person.s_id= salarys.s_id;
Select person.name,salarys.income from person left join salarys on person.s_id=salarys.s_id;
Select person.name,salarys.income from person right join salarys on person.s_id=salarys.s_id;
select * from person full outer join salarys on person.s_id=salarys.s_id;

/* procedure 1*/

CREATE PROCEDURE s1
AS
SELECT * FROM salarys
GO;

EXEC s1;

/* procedure 2*/

CREATE PROCEDURE s(
@dept_id int)
AS
BEGIN
SELECT * FROM info Where p_id=@dept_id
END;

EXEC s @dept_id=22;

/* procedure with output*/

ALTER PROCEDURE s(
@d int,
@count int OUTPUT)
AS
BEGIN
SELECT @count=count(*) FROM info where p_id=@d
END;

DECLARE @count int
EXEC s2 @d =22, @count = @count OUTPUT;
select @count AS 'total';

/* view */

CREATE view v as
select * from person where emp_id>10;

select * from v;

/* diff between view and store procedure */
/*
Stored Procedure:
Accepts parameters
Can perform modifications to one or several tables
Can NOT be used as the target of an INSERT, UPDATE or DELETE statement.

View:
Does NOT accept parameters
Can be used as building block in a larger query
Can contain only one single SELECT query
Can NOT perform modifications to any table
But can (sometimes) be used as the target of an INSERT, UPDATE or DELETE statement.
*/




