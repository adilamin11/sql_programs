drop table if exists bus201 cascade;
drop table if exists route201 cascade;
drop table if exists driver201 cascade;
drop table if exists busdri201 cascade;


create table route201(rno int primary key, source char(20), destination varchar(20), no_of_stations int);
create table bus201(busno int primary key, capacity int NOT NULL, depotname varchar(20), rno int, foreign key(rno) references route201(rno) on delete cascade on update cascade);
create table driver201(dno int primary key, dname varchar(20), lic_no int UNIQUE, address varchar(20),dage int, salary float);
create table busdri201(busno int, foreign key(busno) references bus201(busno) on delete cascade on update cascade, dno int, foreign key(dno) references driver201(dno) on delete cascade on update cascade, date_of_duty_allotted date, shift int);

insert into route201 values(101,'NIGDI','CORPORATION',5);
insert into route201 values(102,'KONDHWA','PULGATE',1);
insert into route201 values(103,'CHINCHWAD','CHIKHALI',4);
insert into route201 values(104,'KHARADI','HADAPSAR',3);
insert into route201 values(105,'JUNNAR','SWARGATE',8);

insert into bus201 values(10,35,'SWARGATE',105);
insert into bus201 values(15,20,'SHIVAJI_NAGAR',104);
insert into bus201 values(13,40,'CHINCHWAD',103);
insert into bus201 values(11,35,'PULGATE',102);
insert into bus201 values(17,35,'HADAPSAR',101);

insert into driver201 values (201,'Kashyap',1234567,'Rasta_peth',48,25000.00);
insert into driver201 values (202,'Ayaz',7654321,'Bhawani_peth',34,15000.00);
insert into driver201 values (203,'Anurag',152634,'Kondhwa',54,30000.00);
insert into driver201 values (204,'Vivek',7584961,'Hadapsar',49,25500.00);
insert into driver201 values (205,'Usaid',8293175,'Narayan_peth',26,10000.00);

insert into busdri201 values(10,204,'12/05/2014',1);
insert into busdri201 values(15,203,'02/10/2001',2);
insert into busdri201 values(13,202,'01/07/2018',1);
insert into busdri201 values(11,201,'10/10/2010',2);
insert into busdri201 values(17,205,'01/12/2022',2);

create view v02 AS
SELECT driver201.*, bus201.*
from driver201,bus201,busdri201
WHERE driver201.dno=busdri201.dno and bus201.busno=busdri201.busno and bus201.busno=17 and shift=2;
create view v102 AS
SELECT*
from route201
WHERE source='NIGDI' and destination='CORPORATION';
