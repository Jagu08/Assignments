/* TCL command */
Begin TRANSACTION
INSERT INTO person(emp_id,s_id,name)
values(16,5,'abc')
insert into person(emp_id,s_id,name)
values(17,7,'xyz')
if(@@error>0)
begin
rollback transaction
end
begin
commit transaction
end

select * from person

/* autoincrement by creating new table*/
CREATE TABLE sales(
ID int IDENTITY(1,1) PRIMARY KEY,
Name varchar(255),
Age int);

INSERT INTO sales(Name,Age)
VALUES ('Abhay','25');
INSERT INTO sales(Name,Age)
VALUES ('Sonal','22');
INSERT INTO sales(Name,Age)
VALUES ('Anuj','19');
INSERT INTO sales(Name,Age)
VALUES ('Mona','24');
INSERT INTO sales(Name,Age)
VALUES ('Sanjay','31');

select * from sales
/* autoincreament in existing table*/
ALTER TABLE person DROP COLUMN s_id
ALTER TABLE person ADD IDCol INT IDENTITY(11,1)
insert into person(emp_id,name) values(22,'bcc');
insert into person(emp_id,name) values(23,'bdc');
select * from person

/*functions : Aggregate*/
select avg(emp_id) from person

select max(emp_id) from person

select min(emp_id) from person

select sum(emp_id) from person

select count(emp_id) from person

/*scalar function*/

select LOWER(emp_id) from person

select LOWER(emp_id) from person

SELECT ROUND(180.42000,2)







