create or replace function sum1(a int,b int) returns
int as'
begin
return a+b;
end;
'language 'plpgsql';

