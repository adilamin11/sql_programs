create or replace function sum3(int,int) returns int as'
declare 
a Alias for $1;
b Alias for $2;
begin
return a+b;
end;
'language 'plpgsql';
