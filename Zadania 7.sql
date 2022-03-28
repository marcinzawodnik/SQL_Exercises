
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

drop table city;

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

drop table Department;

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

drop table employee;

-- 7.1
-- Ustaw, aby kolumny:
-- LastName (tabela Employee) była obowiązkowo podawana

ALTER TABLE employee MODIFY COLUMN LastName VARCHAR(20) NOT NULL;
INSERT INTO employee (LastName) value (NULL); -- zgodnie z założeniem nie działa

-- FirstName (tabela Employee) nie była obowiązkowo podawana
ALTER TABLE employee MODIFY COLUMN FirstName VARCHAR(15);
UPDATE employee SET FirstName = NULL where id = 1;

-- Kolumna name (tabela City) była obowiązkowa
ALTER TABLE city MODIFY COLUMN Name VARCHAR(15) NOT NULL;
UPDATE city SET Name = NULL where id = 1;

-- Kolumna country (tabela City) była nieobowiązkowa
ALTER TABLE city MODIFY COLUMN Country VARCHAR(15);
UPDATE city SET Country = NULL where id = 1;

-- 7.2
-- Ustaw, aby kolumny:
-- Name (tabela City) była unikalna
ALTER TABLE city MODIFY COLUMN Name varchar(15) NOT NULL UNIQUE;
insert into City
(name,country,continent,population_mln)
values
('New York','USA','North America', 8.4 ); -- test ok, wpis sie nie dodał  
  
-- Name (tabela Department) była unikalna
ALTER TABLE Department MODIFY COLUMN Name varchar(15) NOT NULL UNIQUE;
insert into Department
(Name, ManagerId, CityId)
values
('IT', '5', '2'); -- test ok

-- Kolumna Lastname (tabela Employee) nie była unikalna (nawet jeśli nie jest)
ALTER TABLE employee MODIFY COLUMN LastName VARCHAR(20) ;
insert into Employee
(FirstName, SecondName, LastName, Gender, BirthDate, Salary, DepartmentId, HireDate, ReliveDate, Active1)
values
('Mary', null, 'Smith', 'W', '1985-12-18', '2000.00', '1','2011-05-06', null, '1');
delete from employee where id >10; -- usuwa ten test który by kolidował przy następnym poleceniu

-- kombinacja kolumny FirstName i LastName (tabela Employee) były unikalne
ALTER TABLE employee ADD UNIQUE KEY (FirstName, LastName);
insert into Employee
(FirstName, SecondName, LastName, Gender, BirthDate, Salary, DepartmentId, HireDate, ReliveDate, Active1)
values
('Paul', 'Gorge', 'Johnson', 'M', '1990-01-13', '1500.00', '3','2011-10-29', null, '1'); -- test ok

-- kombinacja kolumn name i country (tabela City) były unikalne
ALTER TABLE city ADD UNIQUE KEY (name, country);
insert into City
(name,country,continent,population_mln)
values
('New York','USA','North America', 8.4 ); -- test ok

-- 7.4
-- Ustaw, aby kolumny:
-- country (tabela City) była domyślnie wypełniana wartością 'Poland'
ALTER TABLE city MODIFY COLUMN country varchar(15) DEFAULT 'Poland';

-- continent (tabela City) była domyślnie wypełniana wartością 'Europe'
ALTER TABLE city MODIFY COLUMN continent varchar(15) NOT NULL DEFAULT 'Europe';

-- Active (tabela Employee) była domyślnie wypełniana wartością 1
ALTER TABLE employee MODIFY COLUMN Active1 INT DEFAULT 1; 
  
-- DepartmentID (tabela Employee) nie była domyślnie wypełniana żadną wartością
ALTER TABLE employee MODIFY COLUMN DepartmentId INT DEFAULT NULL;

insert into Employee
( LastName, BirthDate, HireDate ) value  ('Johnson', '1995-05-28', '2012-01-04'); -- test ok
select * from employee; 

insert into city
(name) value ('Kraków');  -- test ok
select * from city;

-- 7.5
-- Ustaw, aby kolumny:
-- ID (tabela Employee) nie była kluczem podstawowym
ALTER TABLE employee MODIFY COLUMN ID INT NOT NULL, DROP PRIMARY KEY;

-- kombinacja FirstName, LastName i DepartmentID (tabela Employee) była kluczem podstawowym
ALTER TABLE employee ADD PRIMARY KEY (FirstName, LastName, DepartmentID);
   
-- przywróć kolumnie ID status klucza podstawowego
ALTER TABLE employee DROP PRIMARY KEY, MODIFY COLUMN ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

-- --------- TEST ---------
insert into Employee
(ID, FirstName, SecondName, LastName, Gender, BirthDate, Salary, DepartmentId, HireDate, ReliveDate, Active1)
values
(11, 'Mary', null, 'Smith', 'W', '1985-12-18', '2000.00', '1','2011-05-06', null, '1');

-- 7.6
-- Ustaw, aby kolumny:
-- DepartmentID (tabela Employee) była kluczem obcym do tabeli Department
ALTER TABLE employee ADD FOREIGN KEY (DepartmentID) REFERENCES department(ID);
   
-- ManagerID (tabela Department) była kluczem obcym do tabeli Employee
ALTER TABLE department ADD FOREIGN KEY (ManagerID) REFERENCES employee(ID);

-- CityID (tabela Department) była kluczem obcym do tabeli City
ALTER TABLE department ADD FOREIGN KEY (CityID) REFERENCES City(ID);

-- Pierwszy klucz obcy powinien zablokować możliwość modyfikacji i usunięcia rekordu (w tabeli Department), 
-- jeżeli w tabeli Employee są osoby przypisane do tego działu 
ALTER TABLE employee ADD CONSTRAINT employee_department_fk FOREIGN KEY (DepartmentID) REFERENCES department(ID);
delete from department where id = 4;
delete from department where id = 4; -- tests ok
  
-- Drugi klucz obcy powinien umożliwiać tzw. kaskadową zmianę wartości ID pracownika (tabela Employee), 
-- wraz ze zmianą ManagerID (w tabeli Department), ale zablokować usunięcie takiego pracownika
ALTER TABLE department ADD CONSTRAINT department_employee_fk FOREIGN KEY (ManagerID) REFERENCES employee(ID) on update cascade;
    
-- Trzeci klucz obcy powinien umożliwiać tzw. kaskadową zmianę wartości ID miasta lub jego usunięcie (tabela City), wraz ze zmianą CityID (w tabeli Department) oraz usunięcie powiązanych oddziałów
ALTER TABLE department ADD CONSTRAINT department_city_fk FOREIGN KEY (CityID) REFERENCES City(ID) on update cascade on delete cascade;

-- 7.7
-- Ustaw indeksy dla kolumn:
-- LastName (tabela Employee)
CREATE INDEX nazwisko on employee (LastName);
   
-- Name (tabela Department)
CREATE INDEX nazwa on department(Name);
    
-- połączonych name i continent (tabela City)
CREATE INDEX miasto_i_kontynent on city (name, continent);


-- Odpowiedz na pytanie jakie korzyści dają indeksy (oczywiście nie na tak małych tabelach)?
Indeksy znacznie usprawniają czas przetwarzania danych zawartych w tabelach. Ma to duże znaczenie, 
zwłaszcza przy bazach zawierających ogromne ilości danych wymagających przetwarzania, gdzie ilość rekordów 
liczona jest często w milionach. Szybki dostęp do danych pozwala na efektywniejszą pracę z danymi, 
ubocznie pozwala też ograniczyć koszty energii oraz koszty pracownicze od kilku do kilkunastokrotnie.

