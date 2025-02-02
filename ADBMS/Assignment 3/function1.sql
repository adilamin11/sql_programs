drop table if exists person201 cascade;
drop table if exists area201 cascade;

create table area201(ano int primary key, aname  varchar(20));
create table person201(pno int primary key,pname varchar(20),pincome float, ano int, foreign key(ano) references area201(ano) on delete cascade on update cascade);

insert into area201 values(101,'Kondhwa');
insert into area201 values(102,'Camp');
insert into area201 values(103,'Hadapsar');
insert into area201 values(104,'Kharadi');

insert into person201 values(201,'Moiz',20000.00,104);
insert into person201 values(202,'Sohel',54000.00,103);
insert into person201 values(203,'Adnan',60000.00,102);
insert into person201 values(204,'Kais',10000.00,101);
insert into person201 values(205,'Saif',1000.00,102);
