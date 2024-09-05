create or replace function sum(int,int) returns int as' 
begin
return $1+$2;
end;
'language 'plpgsql';
