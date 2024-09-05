create or replace function arr7(p_name person201.pname%type )returns int as'

declare 
	count integer := 0;
	rec Person201%Rowtype;

Begin 



update person201 set pincome=pincome+0.2 where aname in(select aname from area201 where aname201.ano=person201.ano and p_name=pname);
count=count+1;
raise notice ''%'',rec.ano; 

return count;
End;

'Language 'plpgsql';
