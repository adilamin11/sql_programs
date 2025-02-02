/*
create table Book(b_no int primary key, b_name varchar(20),pub_name varchar(20) NOT NULL,b_price float);
create table Author(a_no int primary key,a_name varchar(20),quaification varchar(20),address varchar(20));
create table B_A(b_no int, foreign key(b_no) references Book(b_no) on delete cascade on update cascade, a_no int, foreign key(a_no) references Author(a_no) on delete cascade on update cascade);

Prepare Q2Insert1 as insert into Book values($1,$2,$3,$4);
Prepare Q2Insert2 as insert into Author values($1,$2,$3,$4);
Prepare Q2Insert3 as insert into B_A values($1,$2);

Execute Q2Insert1(5201,'Who am I?','bpb',220.00);
Execute Q2Insert1(5202,'Let us C','Niyati Publications',350.00);
Execute Q2Insert1(5203,'How to be..','SRT Publications',480.00);
Execute Q2Insert1(5204,'Go to..','bpb',450.00);
Execute Q2Insert1(5205,'who are you?','Niyati Publications',550.00);

Execute Q2Insert2(551,'Sandeep Maheshwari','MSC','Pune');
Execute Q2Insert2(552,'Kamil khan','MCA','khopoli');
Execute Q2Insert2(553,'Taha Badami','BA','camp');
Execute Q2Insert2(554,'Nirala','BSC','Pune');
Execute Q2Insert2(555,'Farhan','BCA','Jalgaon');

Execute Q2Insert3(5204,551);
Execute Q2Insert3(5205,554);
Execute Q2Insert3(5202,552);
Execute Q2Insert3(5203,553);
Execute Q2Insert3(5201,554);



Select Book.* from Book,Author,B_A where Book.b_no=B_A.b_no and Author.a_no=B_A.a_no and a_name='Nirala';
	b_no |    b_name    |      pub_name       | b_price 
	------+--------------+---------------------+---------
	5205 | who are you? | Niyati Publications |     550
	5201 | Who am I?    | bpb                 |     220
	(2 rows)


Select Book.* from Book,Author,B_A where Book.b_no=B_A.b_no and Author.a_no=B_A.a_no and b_price>=300 and b_price<=500;
	 b_no |   b_name    |      pub_name       | b_price 
	------+-------------+---------------------+---------
	 5204 | Go to..     | bpb                 |     450
	 5202 | Let us C    | Niyati Publications |     350
	 5203 | How to be.. | SRT Publications    |     480
	(3 rows)


Select a_no,a_name,quaification,address from Author group by a_name,a_no order by a_name desc;
	 a_no |       a_name       | quaification | address 
	------+--------------------+--------------+---------
	  553 | Taha Badami        | BA           | camp
	  551 | Sandeep Maheshwari | MSC          | Pune
	  554 | Nirala             | BSC          | Pune
	  552 | Kamil khan         | MCA          | khopoli
	  555 | Farhan             | BCA          | Jalgaon
	(5 rows)

Update Book set pub_name='Jagruti Publications' where pub_name='Niyati Publications';  
	UPDATE 2


select * from book where b_name ilike 'r%';
	 b_no |    b_name     | pub_name | b_price 
	------+---------------+----------+---------
	 5204 | Road to glory | bpb      |     450
	(1 row)


Select a_name,Book.b_no,b_name,pub_name,b_price from Book,Author,B_A where Book.b_no=B_A.b_no and Author.a_no=B_A.a_no group by Book.b_no,a_name order by a_name asc;
	       a_name       | b_no |    b_name     |       pub_name       | b_price 
	--------------------+------+---------------+----------------------+---------
	 Kamil khan         | 5202 | Let us C      | Jagruti Publications |     350
	 Nirala             | 5201 | Who am I?     | bpb                  |     220
	 Nirala             | 5205 | who are you?  | Jagruti Publications |     550
	 Sandeep Maheshwari | 5204 | Road to glory | bpb                  |     450
	 Taha Badami        | 5203 | How to be..   | SRT Publications     |     480
	(5 rows)

Select count(B_A.a_no),a_name,quaification,address from Book,Author,B_A where Book.b_no=B_A.b_no and Author.a_no=B_A.a_no group by B_A.a_no,a_name,quaification,address ;

	--------------------ERROR-------------------------


Select Book.b_no,b_name,pub_name,b_price from Book,Author,B_A where Book.b_no=B_A.b_no and Author.a_no=B_A.a_no and address='Pune';
	 b_no |    b_name     |       pub_name       | b_price 
	------+---------------+----------------------+---------
	 5204 | Road to glory | bpb                  |     450
	 5205 | who are you?  | Jagruti Publications |     550
	 5201 | Who am I?     | bpb                  |     220
	(3 rows)

Select COUNT(B_A.a_no),Author.a_no,a_name,quaification,address from Book,Author,B_A where Book.b_no=B_A.b_no and Author.a_no=B_A.a_no and B_A.a_no in(Select MAX(B_A.a_no) from B_A)group by Author.a_no,a_name,quaification,address;
	 count | a_no | a_name | quaification | address 
	-------+------+--------+--------------+---------
	     2 |  554 | Nirala | BSC          | Pune
	(1 row)
*/
	










