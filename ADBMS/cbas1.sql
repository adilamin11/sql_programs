drop table if exists Student201 cascade;
drop table if exists Teacher201 cascade;
drop table if exists ST201 cascade;

create table Student201(sno int primary key, sname varchar(20), sclass varchar(20), address varchar(20));
create table Teacher201(tno int primary key, tname varchar(20), qualification varchar(20), experience int);
create table ST(sno int, foreign key(sno) references Student201(sno) on delete cascade on update cascade, tno int, foreign key(tno) references Teacher201(tno) on delete cascade on update cascade, Subject varchar(20));
