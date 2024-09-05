create or replace function arr5(a_name area201.aname%type )returns text as'

declare 
	count integer := 0;
	--rec Area201.aname%type;
	--reco Person201.pname%type;
	rec Record;
Begin 



for rec in select pname,count(area201.ano) from person201,area201 where area201.ano=person201.ano and aname=a_name group by pname
loop

raise notice ''% '',rec.pname; 

--raise notice ''%  %'',reco.pname;
count=count+1;
end loop;

return count;
End;

'Language 'plpgsql';
