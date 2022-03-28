-- Ćwiczenie 5.1
-- Sprawdź czy w twojej bazie jest już powyższa tabela (powinna być z poprzednich zajęć). Jeżeli nie utwórz ją. 
-- Zapisz skrypt, przy pomocy którego ta tabela została utworzona. Przed kontynuacją ćwiczeń sprawdź też, czy masz skrypt, 
-- przy pomocy którego będzie można tę tabelę odtworzyć. Jeśli nie wykonaj zrzut tabeli (dump) do skryptu sql.
-- Dane będziemy modyfikować i usuwać, więc być może zajdzie konieczność przywrócenia zawartości tabeli.

USE baza_mz1 ;

Create table employees (id int primary key AUTO_INCREMENT , FirstName varchar(15) not null, SecondName varchar(15), 
LastName varchar(15) not null, Gender varchar(1) , BirthDate date not null, Salary int not null, DepartmentId int not null, 
HireDate date not null, ReliveDate date, Active1 int not null);

insert into employees( FirstName, SecondName, LastName , Gender , BirthDate , Salary , DepartmentId , HireDate , ReliveDate , Active1 ) values
('Mary', null, 'Smith', 'W', '1985-12-18', 2000, 1, '2011-05-06', null, 1),
('Paul', 'George','Johnson', 'M', '1990-01-13', 1500, 3, '2011-10-29', null, 1),
('Patricia', null, 'Wilson', 'W', '1995-05-28', 1000, 4,'2012-01-04', '2013-11-25', 0),
('Linda', 'Lisa', 'Brown', 'W', '1983-07-11', 2700, 2, '2012-06-15', null, 1),
('Johnatan', null, 'Davis', 'M', '1978-01-24', 1200, 1, '2013-01-15' , null, 1),
('John', null, 'Miller', null, '1993-10-20', 2000, 4, '2013-03-27', '2014-10-06', 0),
('Elizabeth', 'Dorothy', 'Taylor', 'W', '1992-09-09', 2110, 1, '2013-05-01', null, 1),
('James', null, 'Wilson', 'M', '1987-03-19', 1000, 3, '2013-10-09', '2014-03-01', 1),
('Robert', null, 'Anderson', 'M', '1989-12-13', 2900, 2, '2013-12-20', '2014-05-05', 0),
('John', 'Mark', 'Smith', 'M', '1990-05-24', 2500, 1, '2014-01-24', null, 1);

-- Ćwiczenie 5.2 
-- Napisz zapytanie, które wszystkim aktywnym osobom podniesie pobory o 5%.
-- Wskazówka: w tym i następnych poleceniach, najpierw napisz zapytanie wybierające (select) i zweryfikuj, czy właściwe rekordy są wybierane. 
-- Jeśli poprawnie zamień instrukcję select na update i wykonaj polecenie, aby dokonać zmian w tabeli.
Select Salary from employees for update;
update employees set Salary = Salary * 1.05; 
Select Salary from employees;     -- updated

-- Ćwiczenie 5.3
-- Napisz zapytane, które wszystkim aktywnym osobom z działu 1 podniesie pobory o 2%.
update employees set Salary = Salary * 1.02 where Active1 = 1;

-- Ćwiczenie 5.4
-- Napisz zapytane, które wszystkim aktywnym osobom, których staż pracy wynosi co najmniej 20 lat podniesie pobory o 4%.
update employees set Salary=Salary * 1.04 where Active1 = 1 and TIMESTAMPDIFF(YEAR,HireDate,CURDATE()) >= 20;

-- Ćwiczenie 5.5
-- Napisz zapytane, które wszystkim mężczyznom o statusie aktywnym, którzy ukończyli 35 lat, ustawi daty końca pracy na 1 miesiąc do przodu.
UPDATE employees set ReliveDate = DATE_ADD(ReliveDate, INTERVAL 1 MONTH) where Active1 = 1 and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) >= 35 and Gender = 'M';
select ReliveDate from employees;

-- Ćwiczenie 5.6
-- Napisz zapytane, które wszystkim kobietom o statusie aktywnym, które ukończyły 30 lat, jeśli nie mają daty końca pracy, to ustawi ją na pół roku do przodu
update employees set ReliveDate = DATE_ADD(curdate(), INTERVAL 6 MONTH) where ReliveDate = NULL and Gender = 'W' and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) >= 30  ;

-- Ćwiczenie 5.7
-- Napisz zapytanie, które uaktywni wszystkie osoby z działów 2 i 4, jeżeli ich wiek nie przekracza 30 lat (usuń też datę końca zatrudnienia).
update employees set ReliveDate = NULL, Active1 = 1 where TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) < 30 and DepartmentID = 2 or DepartmentID = 4;
select * from employees;

-- Ćwiczenie 5.8
-- Napisz zapytanie, które przeniesie wszystkie aktywne osoby z działu 3 do 1, jeżeli ich wiek nie przekracza 40 lat, a staż pracy mają co najmniej 10 lat.
update employees set DepartmentID = 1 where DepartmentID = 3 and TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) < 40 and TIMESTAMPDIFF(YEAR,HireDate,CURDATE()) >= 10;

-- Ćwiczenie 5.9
-- Napisz zapytanie, które usunie z tabeli wszystkie osoby nieaktywne.
delete from employees where Active1 = 0;

-- Ćwiczenie 5.10
-- Napisz zapytanie, które usunie z tabeli wszystkich mężczyzn urodzonych przed rokiem 1990.
delete from employees where Gender = 'M' and year(BirthDate) < 1990;

-- Ćwiczenie 5.11
-- Napisz zapytanie, które usunie z tabeli wszystkie kobiety z działu 2 o stażu pracy mniejszym niż 5 lat.
delete from employees where Gender =  'W' and TIMESTAMPDIFF(YEAR,HireDate,CURDATE()) < 5;

drop table employees;
