drop table if exists Book201 cascade;
drop table if exists Author201 cascade;
drop table if exists BA201 cascade;

create table Book201(bno int primary key, bname varchar(20), pubname varchar(20), bprice float);
create table Author201(ano int primary key, aname varchar(20), qualification varchar(20), address varchar(20));
create table BA201(bno int, foreign key(bno) references Book201(bno) on update cascade on delete cascade, ano int, foreign key(ano) references Author201(ano) on update cascade on delete cascade);

prepare p1 (int,varchar(20),varchar(20),float) as insert into Book201 values($1,$2,$3,$4);
