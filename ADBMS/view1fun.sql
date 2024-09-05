create view v1 AS
SELECT sname,class,SUM(marks_scored)
from Student201,studsub201
WHERE student201.rollno=studsub201.rollno group by sname,class order by sname;
