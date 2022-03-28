CREATE DATABASE baza_mz1 DEFAULT CHARACTER SET UTF8 COLLATE UTF8_POLISH_CI; 

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

-- 1 Wyświetl dane wszystkich pracowników.; 
select * from employees;
-- 2 Wyświetl pierwsze imię oraz nazwisko każdego pracownika.;
select FirstName, LastName from employees;
-- 3 Wyświetl imię i nazwisko pracownika, który ma nadane Id równe 1.;
select FirstName, LastName from employees where id = 1;
-- 4 Wyświetl wszystkich pracowników, którzy zarabiają przynajmniej 2500 zł.;
select * from employees where Salary >=2500;
-- 5 Wyświetl wszystkich pracowników, którzy pracują w departamencie o identyfikatorze równym 3.;
select * from employees where DepartmentId = 3;
-- 6 Wyświetl wszystkich pracowników, którzy pracują w departamencie o identyfikatorze różnym od 3.;
select * from employees where DepartmentID != 3;
-- 7 Wyświetl wszystkich pracowników, którzy zostali zatrudnieni po dniu 23 lutego 2012 roku.;
select * from employees where HireDate > '2012-02-23';
-- 8 Wyświetl dane wszystkich pracowników, którzy zarabiają 1000 zł oraz pracują w departamencie o identyfikatorze równym 4.;
select * from employees where Salary = 1000 and DepartmentId = 4;
-- 9 Wyświetl wszystkich pracowników, którzy zarabiają 1000 lub 2000 i pracują w departamencie o identyfikatorze równym 4.;
select * from employees where (Salary = 1000 or 2000) and DepartmentId = 4;
-- 10 Wyświetl wszystkich aktywnych pracowników.;
select * from employees where Active1 = 1;
-- 11 Wyświetl wszystkich nieaktywnych pracowników.;
select * from employees where Active1 != 1;
-- 12 Dla każdego z pracowników wyświetl, ile wynosiłaby jego pensja, gdyby dostał podwyżkę o 100 zł.;
select FirstName, Lastname, Salary, Salary+100 from employees;
-- 13 Dla każdego z pracowników wyświetl, ile wynosiłaby jego pensja, gdyby dostał podwyżkę o 10%.;
select FirstName, LastName, Salary, Salary*1.1 as 'Pensja po podwyżce' from employees;
-- 14 Wyświetl dane wszystkich pracowników, którzy po podwyżce 10% będą zarabiać więcej niż 2500 zł.;
select FirstName, LastName, Salary, Salary*1.1 as 'Pensja po podwyżce' from employees where Salary*1.1 >2500;
-- 15 Wyświetl wszystkich pracowników płci męskiej urodzonych po 1 stycznia 1990 r.;
select * from employees where Gender = 'M' and BirthDate > '1990-01-01';
-- 16 Wyświetl wszystkie kobiety urodzone po 1 stycznia 1990 roku, które zarabiają co najwyżej 2000 zł.;
select * from employees where Gender = 'W' and (BirthDate > '1990-01-01') and Salary <= 2000;
-- 17 Wyświetl wszystkich mężczyzn, którzy zarabiają przynajmniej 1000 zł, ale nie więcej niż 2000 zł.;
select * from employees where Gender = 'M' and Salary >= 1000 and Salary <= 2000;
-- 18 Wyświetl wszystkich pracowników zatrudnionych nie wcześniej niż 1 stycznia 2012 roku i nie później niż 31 grudnia 2013 roku.;
select * from employees where HireDate >= '2012-01-01' and HireDate <= '2013-12-31';
-- 19 Wyświetl pracowników, którzy zarabiają mniej niż 1000 zł lub więcej niż 2000 zł.;
select * from employees where Salary < 1000 or Salary > 2000;
-- 20 Wyświetl pracowników o Id równym 1, 2 lub 3.;
select * from employees where Id = 1 or Id = 2 or Id = 3;
-- 21 Wyświetl pracowników o Id różnym od 1, 2 i 3.;
select * from employees where Id !=1 and Id !=2 and Id !=3;
-- 22 Wyświetl wszystkich pracowników, którzy mają na imię John i zarabiają więcej niż 1500 zł.;
select * from employees where FirstName = 'John' and Salary > 1500;
-- 23 Wyświetl wszystkich pracowników, którzy mają na imię inaczej niż John i zarabiają więcej niż 1500 zł.;
select * from employees where FirstName != 'John' and Salary > 1500;
-- 24 Wyświetl wszystkich pracowników o imionach John lub Linda.;
select * from employees where FirstName = 'John' or FirstName = 'Linda';
-- 25 Sprawdź, czy istnieje w tabeli pracowników kobieta o imieniu John.;
select * from employees where Gender = 'W' and FirstName = 'John';
-- 26 Wyświetl wszystkich pracowników, których imię zaczyna się na literę „J”.;
select * from employees where FirstName like 'J%';
-- 27 Znajdź wszystkich pracowników, których nazwiska kończą się na literę „n”.;
select * from employees where LastName like '%n';
-- 28 Znajdź wszystkich pracowników, u których druga litera imienia to „a”.;
select * from employees where LastName like '_a%';
-- 29 Znajdź wszystkich pracowników, których imię rozpoczyna się na „Jo” i kończy na literę „n”.;
select * from employees where Firstname like 'Jo%' '%n';
-- 30 Wyświetl wszystkich pracowników, których nazwisko spełnia wszystkie następujące warunki:
--   pierwsza litera to „a”,
--   trzecia litera to „d”,
--   ostatnia litera to „n”.;
select * from employees where LastName like 'A_d%_%n';
-- 31 Spośród podanych poniżej imion określ, które pasują do wzorca '_a%_a%a': Magdalena, Katarzyna, Agnieszka;
Magdalena;
-- 32 Wyświetl wszystkich pracowników i posortuj ich według nazwiska.;
select * from employees ORDER BY LastName;
-- 33 Wyświetl dane wszystkich pracowników i posortuj je według nazwiska. Jeśli będzie kilku pracowników o takim samym nazwisku, posortuj ich dane według imienia.;
select * from employees ORDER BY LastName, FirstName;
-- 34 Wyświetl dane wszystkich pracowników i posortuj je malejąco według zarobków.;
select * from employees ORDER BY Salary DESC;
-- 35 Wyświetl dane wszystkich pracowników i posortuj ich według nazwiska. Jeśli będzie kilkoro pracowników o takim samym nazwisku, posortuj wyniki malejąco według zarobków.;
select * from employees ORDER BY LastName, Salary DESC;
-- 36 Znajdź dane trzech pracowników o najwyższych zarobkach.;
select * from employees ORDER BY Salary DESC limit 3;
-- 37 Znajdź pięciu pracowników o najwyższych zarobkach. Jeśli jednak istnieje więcej pracowników z taką samą pensją, jak pracownik na piątym miejscu, to również ich wyświetl.;
select * from employees Order By Salary desc limit 5;
-- 38 Wyświetl dane 20% z wszystkich pracowników, którzy zarabiają najmniej.; 
select * from employees Order by Salary asc limit 2;
-- 39 Wyświetl wszystkie unikalne nazwiska pracowników.;
select DISTINCT LastName from employees;
-- 40 Wyświetl wszystkich pracowników, którzy nie mają drugiego imienia.;
select * from employees where SecondName is null;
-- 41 Znajdź dane tych aktywnych pracowników, którzy mają podaną datę zakończenia pracy (RelieveDate).;
select * from employees where Active1 = 1 and ReliveDate is not null;
-- 42 Dla każdego pracownika wyświetl jego pierwsze i drugie imię oraz nazwisko. Jeśli pracownik nie ma podanego drugiego imienia, wyświetl tekst 'nieznane';.;
Select FirstName, IF( SecondName is NULL, 'nieznane', SecondName) as SecondName , LastName from employees;
-- 43 Dla każdego pracownika wyświetl jego pierwsze imię i nazwisko, ale wyświetl je w jednej kolumnie.;
Select Concat(FirstName ,' ', LastName) as Pracownik from employees;
-- 44 Dla każdego pracownika wyświetl jego imię, drugie imię i nazwisko, ale wyświetl je w jednej kolumnie. Uważaj na brakujące drugie imiona.;
Select Concat(FirstName ,' ', IF( SecondName is NULL, '', SecondName), ' ', LastName ) as Pracownik from employees;
-- 45 Znajdź wszystkich pracowników, których płeć to kobieta lub została ona określona jako wartość nieznana.;
Select * from employees where Gender = 'W' or Gender is Null;


