create or replace function sum2(int,int) returns int as'
declare
a Alias for $1;
begin
return a+$2;
end;
'language 'plpgsql';
