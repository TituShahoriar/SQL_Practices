week-2
Ac1:
SELECT lname, salary as 'Weakly Salary', dno
FROM employee
WHERE salary/4

Ac2:
1)
SELECT fname, lname
FROM employee
WHERE ssn='888665555'
2)
SELECT fname, lname
FROM employee
JOIN dependent
WHERE employee.sex="F" AND dependent.dependent_name = employee.fname
or==>
SELECT fname, lname
FROM employee
JOIN dependent
ON dependent.essn = employee.ssn
WHERE employee.sex="F" AND dependent.dependent_name = employee.fname

3)
SELECT lname, mgrstartdate, dependent_name
FROM employee, department, dependent
WHERE employee.superssn = department.mgrssn

or==>
SELECT lname, mgrstartdate
FROM employee
JOIN department
ON employee.superssn = department.mgrssn
LEFT JOIN dependent
ON employee.ssn=dependent.essn

4)
SELECT lname, fname, project.pname, department.dname
FROM employee
LEFT JOIN works_on
ON employee.ssn=works_on.essn
LEFT JOIN project
ON works_on.pno=project.pnumber
LEFT JOIN department
on project.dnum=department.dnumber

week-3
Ac1:
SELECT Last_Name, Job_Id, Hire_Date
FROM emps
WHERE Hire_Date BETWEEN "2008-05-12" AND "2010-06-12"
ORDER BY Hire_Date DESC
Ac2:
SELECT Last_Name, Department_Id
FROM emps
WHERE Department_Id in (20, 50)
ORDER BY Department_Id ASC

Ac1.1:
SELECT Last_Name, Hire_Date
FROM emps
WHERE YEAR(Hire_Date) IN ("2006")

Ac2.1:
SELECT Last_Name, Salary, Commission_pct
FROM emps
WHERE Commission_pct!= 0 
ORDER BY Salary DESC, Commission_pct DESC

Ac3.1:
SELECT Last_Name
FROM emps
WHERE Last_Name like '%a%e%'

Week-4:

Ac1.1:
SELECT emps.Last_Name, depts.Department_id, emps.Department_Id, depts.Department_Name
FROM emps
JOIN depts
ON emps.Department_Id=depts.Department_id

Ac2.1:
SELECT emps.Last_Name, depts.Department_Name, locs.Location_id, locs.City
FROM emps
JOIN depts
ON emps.Department_Id=depts.Department_id
JOIN locs
ON depts.Location_id=locs.Location_id
WHERE emps.Commission_pct != 0

Ac1.2:
SELECT emps.Last_Name, emps.Job_Id, depts.Department_Name, emps.Department_Id
FROM emps
JOIN depts
ON emps.Department_Id=depts.Department_id
JOIN locs
ON depts.Location_id=locs.Location_id
WHERE locs.City="Toronto"

Ac2.2:
SELECT Last_Name, Salary, Commission_pct
FROM emps
WHERE Commission_pct !=0
ORDER BY Salary DESC, Commission_pct ASC

Ac3.2:
SELECT a.Last_Name as 'Employee', a.Employee_Id as 'EMP#',b.Last_Name as 'Manager', b.Manager_id as 'Mgr#'
FROM emps a
JOIN emps b
ON a.Employee_Id=b.Employee_Id
ORDER BY a.Employee_Id ASC, b.Employee_Id ASC

Ac1.3:
SELECT AVG(Salary) as 'AVG', MAX(Salary) as 'MAX', MIN(Salary) as 'MIN', SUM(Salary) as 'SUM'
FROM emps

Ac2.3:
SELECT emps.Job_Id, AVG(Salary) as 'AVG', MAX(Salary) as 'MAX', MIN(Salary) as 'MIN', SUM(Salary) as 'SUM'
FROM emps
GROUP BY emps.Job_Id
ORDER BY emps.Job_Id ASC, Salary ASC

Ac3.1:
SELECT emps.Job_Id, COUNT(emps.Job_Id) as 'COUNT'
FROM emps
GROUP BY emps.Job_Id

Ac3.2:
SELECT emps.Manager_id, MIN(emps.Salary) as 'Salary'
FROM emps
WHERE emps.Manager_id != 0
GROUP BY emps.Manager_id
HAVING MIN(emps.Salary) >= "6000"
ORDER BY emps.Salary DESC

week-5:
Ac1:
SELECT emps.Last_Name, emps.Hire_Date
FROM emps
JOIN depts ON emps.Department_Id=depts.Department_id
WHERE depts.Department_Name='Zlotkey'

Ac2:
SELECT emps.Employee_Id, emps.Last_Name, emps.Salary
FROM emps
WHERE emps.Salary> (SELECT AVG(emps.Salary) FROM emps)
ORDER BY emps.Salary ASC

Ac1.1
Ac1.2
Ac2.1

