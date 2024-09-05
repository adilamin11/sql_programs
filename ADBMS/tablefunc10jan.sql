create table department(depno int primary key, depname varchar(20));

create table employee21(eno int primary key, ename varchar(20), esalary int, eadd varchar(20), depno int, foreign key(depno) references department(depno) on delete cascade on update cascade);

insert into department values(1001,'Software');
insert into department values(1002,'Accounts');
insert into department values(1003,'Sales');
insert into department values(1004,'Human Resources');

insert into employee21 values(201,'Salman',50000,'Pune',1003);
insert into employee21 values(202,'Aayan',25000,'Kolkata',1001);
insert into employee21 values(203,'Khalid',36000,'Bombay',1002);
insert into employee21 values(204,'Ranbir',10000,'Delhi',1004);
