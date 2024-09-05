drop table if exists student201 cascade;
drop table if exists subject201 cascade;
drop table if exists studsub201 cascade;


create table student201(rollno int primary key,sname varchar(20) NOT NULL,address varchar(25),class varchar(20));
create table subject201(scode varchar(20) primary key, sub_name varchar(20));
create table studsub201(rollno int, foreign key(rollno) references student201(rollno) on delete cascade on update cascade, scode varchar(20), foreign key(scode) references subject201(scode) on delete cascade on update cascade, marks_scored int);

insert into student201 values(101,'Akash','Pune','FyBCA');
insert into student201 values(102,'Soham','Delhi','SyBCS');
insert into student201 values(103,'Qasim','Mumbai','TyBCA');
insert into student201 values(104,'Khalid','Surat','FyBCOM');

insert into subject201 values('SYBUGT','Sociology');
insert into subject201 values('OYFLOT','Economics');
insert into subject201 values('PPFSHJ','Political_Science');
insert into subject201 values('IOTWYV','ADBMS');

insert into studsub201 values(101,'IOTWYV',45);
insert into studsub201 values(102,'PPFSHJ',90);
insert into studsub201 values(103,'OYFLOT',16);
insert into studsub201 values(104,'SYBUGT',64); 


