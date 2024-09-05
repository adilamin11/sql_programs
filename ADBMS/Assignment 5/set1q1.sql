drop table if exists mov201 cascade;
drop table if exists act201 cascade;

create table act201(ano int primary key,aname varchar(20), hometown varchar(20));
create table mov201(mno int primary key,mname varchar(20),myear int,ano int, foreign key(ano) references act201(ano) on delete cascade on update cascade);

insert into act201 values(101,'Harry','LA');
insert into act201 values(102,'Jimmy','NYC');
insert into act201 values(103,'Vinci','LS');
insert into act201 values(104,'Brad','LV');

insert into mov201 values(201,'Titanic',2011,103);
insert into mov201 values(202,'Oppenheimer',2023,101);
insert into mov201 values(203,'Conjuring',2017,102);
insert into mov201 values(204,'Contagion',2017,101);
insert into mov201 values(205,'Logan',2018,104);
insert into mov201 values(206,'Spiderman',2001,102);
insert into mov201 values(207,'Batman',2017,102);


create or replace function myr()
	returns void as'
	declare
	c1 cursor for select * from mov201 where myear=2017;
	rec1 record;
	begin
		open c1;
		raise notice ''movies in year 2017 are'';
		loop
			fetch c1 into rec1;
			exit when not found;
			raise notice ''%'',rec1.mname;
		end loop;
		close c1;
		end;'	
		language 'plpgsql';

create or replace function mact()
	returns void as'
	declare
	c1 cursor for select* from act201 where ano in (select act201.ano from act201,mov201 where act201.ano=mov201.ano group by act201.ano having count(aname)>=2);

	rec1 record;
		begin
		open c1;
			raise notice''name of actors acted in more than 2 movies'';
			loop
				fetch c1 into rec1;
				exit when not found;
				raise notice ''%'',rec1.aname;
			end loop;
			close c1;
	end;
	'language'plpgsql';

select* from act201 where ano in (select act201.ano from act201,mov201 where act201.ano=mov201.ano group by act201.ano having count(aname)>=2);
