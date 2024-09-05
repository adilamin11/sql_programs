 create or replace function store_stu2(s_name Student201.sname%type)returns int as'

declare 
	count integer := 0;
	--rec Teacher201%Rowtype;
rec rEcord;

Begin 

for rec in select count(Teacher201.tno) as t from Student201,Teacher201,ST where Student201.sno=ST.sno and Teacher201.tno=ST.tno and sname=s_name

Loop


raise notice ''%'',rec.t;
count=count+1;
END Loop;


return count;
End;

'Language 'plpgsql';
