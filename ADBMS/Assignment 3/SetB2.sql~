create or replace function teachs2( )returns int as'

declare 
	count integer := 0;
	rec Teacher201%Rowtype;

Begin 
LOOP


select* from teacher201 into rec where experience in(select MIN(experience) from teacher201);
count=count+1;
raise notice ''% % % %'',rec.tno,rec.tname,rec.qualification,rec.experience; 
exit when found;
END LOOP;


return count;
End;

'Language 'plpgsql';
