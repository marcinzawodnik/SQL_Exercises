Ćwiczenie 9.1;
-- Wyświetl liczbę wszystkich pracowników aktywnych w podziale na płeć.
Select count(gender = 'M') as liczba_mezczyzn, count(gender = 'W') as liczba_kobiet  from employee where gender = 'M' and Active1 = 1;

Ćwiczenie 9.2;
-- Wyświetl liczbę pracowników, którzy mają drugie imię.
Select count(SecondName) from employee;

Ćwiczenie 9.3;
-- Wyświetl liczbę pracowników dla każdego nazwiska.
SELECT LastName, count(*) from employee GROUP BY LastName;

Ćwiczenie 9.4;
-- Wyświetl liczbę pracowników aktywnych i nieaktywnych w każdym dziale.
Select DepartmentId, count(Active1 = 1) from employee GROUP BY DepartmentID;

Ćwiczenie 9.5;
-- Wyświetl sumę potrzebnych pieniędzy na wypłaty w podziale na DepartmentID (pamiętaj, że nie wszyscy już pracują).
SELECT DepartmentID, sum(salary) as Kwota_na_wypłaty from employee where Active1 = 1 GROUP BY DepartmentID;

Ćwiczenie 9.6;
-- Wyświetl w sumę potrzebnych pieniędzy na wypłaty w podziale na oddziały, ale zamiast ID oddziału wyświetl jego nazwę.
SELECT D.Name, sum(salary) as Kwota_na_wypłaty from employee  join Department as D on d.id = employee.departmentId where Active1 = 1 GROUP BY DepartmentID;

Ćwiczenie 9.7;
-- Wyświetl liczbę pracowników rozpoczynających się na poszczególne litery alfabetu.
SELECT LEFT(LastName, 1) as Nazwisko_na_litere,
count(LEFT(LastName, 1)) as Ilość_Pracowników_na_Litere
FROM
employee Group by LastName;

Ćwiczenie 9.8;
-- Wyświetl liczbę pracowników w poszczególnych działach (tylko te działy, w których są pracownicy).
SELECT departmentID, count(*) from employee as Ilość_Pracowników_działu where Active1 = 1 GROUP BY DepartmentID ;

Ćwiczenie 9.9;
-- Zmodyfikuj poprzednie zapytanie, aby wyświetlało liczbę pracowników we wszystkich działach. 
-- Dla działów, które nie mają pracowników powinna pojawić się liczba 0.
SELECT name, 
case when Active1 = 0 then count(employee.departmentid) = 0 else count(employee.departmentid) end as Ilość_Pracowników_Działu
from department 
left join employee on department.id = employee.DepartmentId 
GROUP BY department.id ;

Ćwiczenie 9.10;
-- Wyświetl liczbę pracowników z poszczególnych miast. Dla miast, w których firma nie ma pracowników powinna pojawić się liczba 0.
Select City.name, 
case when Active1 = 0 then count(employee.departmentid) = 0 else count(employee.departmentid) end as Ilość_Pracowników
from department 
left join employee on department.id = employee.DepartmentId 
join city on department.CityId = city.id
Group By department.id;

Ćwiczenie 9.11;
-- Wyświetl liczbę miast z poszczególnych kontynentów, w których firma ma oddziały. Dla kontynentów, w których firma nie ma odziałów powinna pojawić się wartość 'Brak'.
Select city.continent, 
case when count(department.id) = 0 then 'Brak' else count(department.id) end as liczba_departamentów
from city left join department on city.id = department.cityId group by city.continent;

Ćwiczenie 9.12;
-- Wyświetl liczbę pracowników z poszczególnych kontynentów. Dla kontynentów, w których firma nie ma pracowników powinna pojawić się liczba 0.
SELECT city.continent,
count(employee.id) 
from city left join department on city.id = department.cityId
left join employee on employee.departmentId = department.id
group by city.continent;

Ćwiczenie 9.13;
-- Wyświetl listę nazw tych oddziałów, w których pracuje obecnie co najmniej 2 pracowników.
Select department.name,  count(employee.departmentId) from department join employee on department.id = employee.departmentid 
where Active1 = 1
group by department.name HAVING count(employee.departmentId)>1;

Ćwiczenie 9.14;
-- Wyświetl listę nazw tych oddziałów, w których obecnie pracują co najmniej 2 kobiety.
Select department.name,  count(employee.gender = 'W') as ilość_Kobiet from department join employee on department.id = employee.departmentid 
where Active1 = 1
group by department.name HAVING count(employee.departmentId)>1;

Ćwiczenie 9.15;
-- Wyświetl najmniejszą, największą i średnią pensję dla każdego działu w podziale na płeć.
select  DepartmentId, Gender, 
Min(salary), Max(salary), avg(salary)
from employee where gender = 'M'
Group By DepartmentId
union
select  DepartmentId, Gender, 
Min(salary), Max(salary), avg(salary)
from employee where gender != 'M'
Group By DepartmentId;
