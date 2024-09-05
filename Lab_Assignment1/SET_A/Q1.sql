drop table if exist student cascade;
create table student(s_no int primary key ,s_name varchar(20), s_class varchar(10) NOT NULL, s_addr varchar(30));
create table Teacher(t_no int primary key ,t_name varchar(20),qualification varchar(15), experience int);

drop table S_T;
create table S_T(s_no int, foreign key(s_no) references student(s_no) on delete cascade on update cascade,t_no int, foreign key(t_no) references teacher(t_no) on delete cascade on update cascade,subject varchar(20));

prepare Q1Insert1 as insert into student values($1,$2,$3,$4);
prepare Q1Insert2 as insert into Teacher values($1,$2,$3,$4);
prepare Q1Insert3 as insert into S_T values($1,$2,$3);


Execute Q1Insert1(201,'Farhan','FYBCA','Deccan');
Execute Q1Insert1(202,'Arfat','SYBCA','Sangvi');
Execute Q1Insert1(203,'Taha','SYBCA','Deccan');
Execute Q1Insert1(204,'Saad','SYBCA','Sangvi');
Execute Q1Insert1(205,'Adiy','FYBCA','Deccan');


Execute Q1Insert2(51,'Sumaiyya mam','Ph.D.',5);
Execute Q1Insert2(52,'Sameena mam','M.C.S',2);
Execute Q1Insert2(53,'Kamil Sir','Ph.D.',4);

Execute Q1Insert3(201,51,'ARDBMS');
Execute Q1Insert3(202,52,'WEB');
Execute Q1Insert3(203,53,'C');
Execute Q1Insert3(202,51,'ARDBMS');
Execute Q1Insert3(204,51,'ARDBMS');


select s_name from student where s_class='FYBCA';
 s_name 
--------
 Farhan
 Adiy
(2 rows)

select s_name from student,teacher,S_T where student.s_no=S_T.s_no and teacher.t_no=S_T.t_no and t_name='Sumaiyya mam';
 s_name 
--------
 Farhan
 Arfat
 Saad
(3 rows)


select t_name from teacher where  t_name like 'S%';
   t_name    
--------------
 Sumaiyya mam
 Sameena mam
(2 rows)


select t_name from student,teacher,S_T where student.s_no=S_T.s_no and teacher.t_no=S_T.t_no and subject='ARDBMS';
    t_name    
--------------
 Sumaiyya mam
 Sumaiyya mam
 Sumaiyya mam
(3 rows)


select t_name from teacher where  qualification='Ph.D.';
    t_name    
--------------
 Sumaiyya mam
 Kamil Sir
(2 rows)


select s_name from student where s_addr='Deccan' ;
 s_name 
--------
 Farhan
 Taha
 Adiy
(3 rows)

select  count(s_name) from student where s_addr='Deccan';
 count 
-------
     3


select MAX(experience),t_name from teacher group by t_name limit 1;
 max |    t_name    
-----+--------------
   5 | Sumaiyya mam
(1 row)


select s_name from student where s_addr='Sangvi' and s_class='SYBCA';
 s_name 
--------
 Arfat
 Saad
(2 rows)


select t_name,subject,count(S_T.s_no) from student,teacher,S_T where student.s_no=S_T.s_no and teacher.t_no=S_T.t_no group by t_name,subject;
    t_name    | subject | count 
--------------+---------+-------
 Sameena mam  | WEB     |     1
 Sumaiyya mam | ARDBMS  |     3
 Kamil Sir    | C       |     1
(3 rows)


select s_name from student,teacher,S_T where student.s_no=S_T.s_no and teacher.t_no=S_T.t_no and experience in (select MAX(experience) from Teacher);
 s_name 
--------
 Farhan
 Arfat
 Saad
(3 rows)

*/











