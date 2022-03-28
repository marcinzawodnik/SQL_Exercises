-- Ćwiczenie 6.1
-- Przywróć zawartość tabeli Employee za pomocą skryptu do stanu jak powyżej (po wykonaniu ćwiczeń 5)
-- Usuń wybranej osobie identyfikator oddziału.
-- Utwórz brakujące tabele Department i City. Zapisz skrypty, przy pomocy których można je późnej przywrócić.

USE baza_mz1 ;
 show tables;

create table City
(
id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
name varchar(15) NOT NULL,
country varchar(15) NOT NULL,
continent varchar(15) NOT NULL,
population_mln float
);

insert into City
(name,country,continent,population_mln)
values
('New York','USA','North America', 8.4 ),
('Warsaw','Poland', 'Europe', 1.78 ),
('London','UK', 'Europe', 8.79),
('Paris','France','Europe',2.15),
('Rome','Italy','Europe',2.87),
('Tokyo','Japan','Asia', 13.94)
;

select * from City;

-- drop table city;

USE baza_mz1 ;

create table Department
(
Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
Name varchar(15) NOT NULL,
ManagerId int,
CityId int
);

insert into Department
(Name, ManagerId, CityId)
values
('IT', '5', '2'),
('Accounting', '4', null),
('HR', '8', '2'),
('Marketing', '3', '1'),
('Controlling', '10', '3'),
('Data Warehouse', '5', '4');

select * from Department;

-- drop table Department;

show databases;
-- create database student;
USE baza_mz1 ;
create table Employee
( 
Id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
FirstName VARCHAR(15) NOT NULL, 
SecondName VARCHAR(15), 
LastName VARCHAR(20) NOT NULL, 
Gender ENUM('W', 'M'),
BirthDate DATE NOT NULL, 
Salary FLOAT,
DepartmentId INT NOT NULL,
HireDate DATE NOT NULL,
ReliveDate DATE,
Active1 INT
);

insert into Employee
(FirstName, SecondName, LastName, Gender, BirthDate, Salary, DepartmentId, HireDate, ReliveDate, Active1)
values
('Mary', null, 'Smith', 'W', '1985-12-18', '2000.00', '1','2011-05-06', null, '1'),
('Paul', 'Gorge', 'Johnson', 'M', '1990-01-13', '1500.00', '3','2011-10-29', null, '1'),
('Patricia', null, 'Wilson', 'W', '1995-05-28', '1000.00', '4','2012-01-04', '2013-11-25', '0'),
('Linda', 'Lisa', 'Brown', 'W', '1983-07-11', '2700.00', '2','2012-06-15', null, '1'),
('Johnatan', null, 'Davis', 'M', '1978-01-24', '1200.00', '1','2013-01-15', null, '1'),
('John', null, 'Miller', null, '1993-10-20', '2000.00', '4','2013-03-27', '2014-10-06', '0'),
('Elizabeth', 'Dorothy', 'Taylor', 'W', '1992-09-09', '2110.00', '1','2013-05-01', null, '1'),
('James', null, 'Wilson', 'M', '1987-03-19', '1000.00', '3','2013-10-09', '2014-03-01', '1'),
('Robert', null, 'Anderson', 'M', '1989-12-13', '2900.00', '2','2013-12-20', '2014-05-05', '0'),
('John', 'Mark', 'Smith', 'M', '1990-05-24', '2500.00', '1','2014-01-24', null, '1'); 

select * from employee;

-- drop table employee;

-- Ćwiczenie 6.2
-- Dla każdego pracownika wyświetl jego imię, nazwisko oraz nazwę działu, do którego dany pracownik należy.
select FirstName, LastName, Name as DepartmentName from employee inner join Department on employee.DepartmentId = Department.Id;

-- Ćwiczenie 6.3
-- Zmodyfikuj poprzednie zapytanie tak, aby uwzględniało również pracowników bez przypisanego działu. Zamiast nazwy działu wypisz słowo BRAK.
select FirstName, LastName, ifnull(Name , '--BRAK--') as DepartmentName from employee left join Department on employee.DepartmentId = Department.Id;

-- Ćwiczenie 6.4
-- Dla każdego działu wyświetl jego nazwę i nazwę miasta, w którym się znajduje.
Select City.Name as CityName, Department.Name as DepartmentName from Department join City on City.id = Department.CityId; 

-- Ćwiczenie 6.5
-- Zmodyfikuj poprzednie zapytanie tak, aby uwzględniało również oddziały, w których nie ma podanego miasta. 
-- Zamiast nazwy miejscowości wypisz słowo NIEZNANE.
Select Department.Name as DepartmentName, ifnull(City.Name, '--NIEZNANE--') as CityName from Department left join City on City.id = Department.CityId; 

-- Ćwiczenie 6.6
-- Zmodyfikuj poprzednie zapytanie tak, aby uwzględniało  wszystkie miasta, w których nie ma oddziału. 
-- Zamiast nazwy działu wypisz słowo BRAK.
Select ifnull(Department.Name, '--BRAK') as DepartmentName, City.Name as CityName from Department right join City on City.id = Department.CityId;

-- Ćwiczenie 6.7
-- Zmodyfikuj poprzednie zapytanie tak, aby uwzględniało również wszystkie miasta, w których nie ma oddziału oraz wszystkie oddziały, dla których nie ma podanej miejscowości. 
-- Zamiast nazwy działu wypisz słowo BRAK. Zamiast nazwy miejscowości wypisz słowo NIEZNANE.
Select ifnull(Department.Name, '--BRAK') as DepartmentName, ifnull(City.Name, '--NIEZNANE--') as CityName from Department left join City on City.id = Department.CityId 
union 
Select ifnull(Department.Name, '--BRAK') as DepartmentName, ifnull(City.Name, '--NIEZNANE--') as CityName from Department right join City on City.id = Department.CityId; 

-- Ćwiczenie 6.8
-- Dla każdego działu wyświetl jego nazwę, imię i nazwisko menedżera.
select name as DepartmentName, ManagerId, FirstName, LastName from Department join employee on Department.ManagerID = employee.Id;

-- Ćwiczenie 6.9
-- Dla każdego pracownika wyświetl identyfikator, imię i nazwisko (złączone), nazwę oddziału, 
-- imię i nazwisko (złączony inicjał imienia i nazwisko) menedżera działu.

select 
employee.id, 
concat(FirstName, ' ', LastName) as Imie_i_Nazwisko,  
d1.name as DepartmentName, 
d1.ManagerId, 
concat(left(FirstName,1), '.', LastName) as Manager
from employee 
left join Department d1 on employee.DepartmentId = d1.Id
left join Department d2 on d2.ManagerID = employee.Id
ORDER BY employee.id;

-- Ćwiczenie 6.10
-- Dla każdego pracownika wyświetl identyfikator, imię i nazwisko (złączone), 
-- nazwę oddziału, imię i nazwisko (złączony inicjał imienia i nazwisko) menedżera działu, nazwę miejscowości.

select 
employee.id, 
concat(FirstName, ' ', LastName) as Imie_i_Nazwisko,  
d1.name as DepartmentName, 
d1.ManagerId, 
concat(left(FirstName,1), '.', LastName) as Manager,
City.name
from employee 
left join Department d1 on employee.DepartmentId = d1.Id
left join Department d2 on d2.ManagerID = employee.Id
left join City on d1.CityId = City.id
ORDER BY employee.id;


-- Ćwiczenie 6.11
-- Zmodyfikuj zapytanie tak, aby na liście wyświetliły się także miejscowości, w których nie ma żadnych oddziałów. W miejsce brakujących danych wstaw myślniki.
select 
employee.id, 
concat(FirstName, ' ', LastName) as Imie_i_Nazwisko,  
d1.name as DepartmentName, 
d1.ManagerId, 
concat(left(FirstName,1), '.', LastName) as Manager,
ifnull(City.name, '-------') as CityName
from employee 
left join Department d1 on employee.DepartmentId = d1.Id
left join Department d2 on d2.ManagerID = employee.Id
left join City on d1.CityId = City.id
ORDER BY employee.id;

-- Ćwiczenie 6.12
-- Napisz zapytanie, które wyświetli pracowników (id, imię, nazwisko) pracujących w miejscowościach położonych w Europie.
select employee.id, FirstName, LastName, City.name, Department.Id as Department, CityID from employee
left join Department on Department.Id = employee.DepartmentID
left join City on Department.CityId = City.Id
where continent = 'Europe';

-- Ćwiczenie 6.13
-- Napisz zapytanie, które wyświetli pracowników (id, imię, nazwisko) o stażu co najmniej 7 lat, 
-- pracujących w miejscowościach mających co najmniej 1 mln mieszkańców.
select employee.id, FirstName, LastName, City.Name from employee
left join Department on Department.Id = employee.DepartmentID
left join City on Department.CityId = City.Id
where city.population_mln > 1 and TIMESTAMPDIFF(YEAR,HireDate,CURDATE()) >= 7;

-- Ćwiczenie 6.14
-- Napisz zapytanie, które pracownikom o wieku co najmniej 30 lat, położonych w Europie i ludności co najwyżej 5 mln mieszkańców, podniesie pensję o 5%.
-- Wskazówka: spróbuj najpierw napisać zapytanie wybierające
select FirstName, LastName, City.Name from employee
left join Department on Department.Id = employee.DepartmentID
left join City on Department.CityId = City.Id
where continent = 'Europe' and population_mln <= 5 and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) >= 30;

update employee 
left join Department on Department.Id = employee.DepartmentID
left join City on Department.CityId = City.Id
set Salary = Salary * 1.05 
where continent = 'Europe' and population_mln <= 5 and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) >= 30;

-- Ćwiczenie 6.15
-- Napisz zapytanie, które usunie wszystkich mężczyzn o wieku między 20 i 30 lat, 
-- pracujących w oddziałach położonych w Europie i ludności co najwyżej 5 mln mieszkańców
-- Wskazówka: spróbuj najpierw napisać zapytanie wybierające.

select employee.id, FirstName, LastName, City.Name from employee 
left join Department on Department.Id = employee.DepartmentID
left join City on Department.CityId = City.Id
where Gender = 'M' and continent = 'Europe' 
and population_mln <= 5 and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) BETWEEN 20 and 30;

delete * from employee
left join Department on Department.Id = employee.DepartmentID
left join City on Department.CityId = City.Id
where Gender = 'M' and continent = 'Europe' 
and population_mln <= 5 and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) BETWEEN 20 and 30;