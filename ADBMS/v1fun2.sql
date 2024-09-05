create view v20 AS
SELECT sname,sub_name,marks_scored
from Student201,studsub201,subject201
WHERE student201.rollno=studsub201.rollno and subject201.scode=studsub201.scode and marks_scored>80;
