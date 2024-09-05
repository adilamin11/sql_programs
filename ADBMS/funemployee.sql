create or replace function fun2( e_no int) returns int as'
declare
sal int;
begin
select esalary into sal from Employee21 where eno=e_no;
return sal;
End;
'language 'plpgsql';
