drop table if exists Student201 cascade;
drop table if exists Teacher201 cascade;
drop table if exists ST201 cascade;

create table Student201(sno int primary key, sname varchar(20), sclass varchar(20), address varchar(20));
create table Teacher201(tno int primary key, tname varchar(20), qualification varchar(20), experience int);
create table ST(sno int, foreign key(sno) references Student201(sno) on delete cascade on update cascade, tno int, foreign key(tno) references Teacher201(tno) on delete cascade on update cascade, Subject varchar(20));

insert into Student201 values(101,'Ali','FYBCA','Pune');
insert into Student201 values(102,'Jay','FYBCA','Deccan');
insert into Student201 values(103,'Huzef','SYBCA','Sangvi');
insert into Student201 values(104,'Sohel','TYBCA','Mumbai');
insert into Student201 values(105,'Omar','SYBCA','Thane');

insert into Teacher201 values(201,'Arif','MCA', 6);
insert into Teacher201 values(202,'Geeta','Mphil', 20);
insert into Teacher201 values(203,'Khalid','BTech', 5);
insert into Teacher201 values(204,'Adnan','Ph.D', 3);
insert into Teacher201 values(205,'Furqan','MCA', 7);

insert into ST values(101,203,'ARDBMS');
insert into ST values(102,202,'Goolang');
insert into ST values(103,205,'Python');
insert into ST values(104,201,'CSS');
insert into ST values(105,204,'DSA');

