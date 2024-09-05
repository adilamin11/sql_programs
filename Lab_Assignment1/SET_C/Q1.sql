

create table Student_C(sreg_no int primary key,s_name varchar(20), s_class char(10));
create table Competition(c_no int primary key,c_name varchar(20),c_type varchar(10) NOT NULL check(c_type='sport' or c_type='academic'));

create table S_C(sreg_no int,foreign key(sreg_no) references Student_C(sreg_no) on delete cascade on update cascade,c_no int,foreign key(c_no) references Competition(c_no) on delete cascade on update cascade,rank int check(rank>0),year int);

insert into Student_C values(201,'Amit kale','4th');
insert into Student_C values(202,'Subodh Kadam','4th');
insert into Student_C values(203,'Shaikh Farhan','FYBCA');
insert into Student_C values(204,'Haris Shaikh','8th');
insert into Student_C values(205,'Faizan Shaikh','8th');
insert into Student_C values(206,'Sahil Shaikh','4th');

insert into Competition values(51,'Drawing','academic');
insert into Competition values(52,'Dance','academic');
insert into Competition values(53,'Running','sport');
insert into Competition values(54,'Badmintion','sport');

insert into S_C values(201,51,3,2015);
insert into S_C values(202,52,2,2016);
insert into S_C values(203,53,1,2017);










