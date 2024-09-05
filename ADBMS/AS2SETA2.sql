drop table if exists bus201 cascade;
drop table if exists route201 cascade;
drop table if exists driver201 cascade;


create table route201(rno int primary key, source char(20), destination varchar(20), no_of_stations int);
create table bus201(busno int primary key, capacity int NOT NULL, depotname varchar(20), rno int, foreign key(rno) references route201(rno) on delete cascade on update cascade);
create table driver201(dno int primary key, dname varchar(20), lic_no int UNIQUE, address varchar(20),dage int, salary float);
create table busdri201(busno int, foreign key(busno) references bus201(busno) on delete cascade on update cascade, dno int, foreign key(dno) references driver201(dno) on delete cascade on update cascade, date_of_duty_allotted date, shift int);
