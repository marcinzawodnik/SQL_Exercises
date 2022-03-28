Ćwiczenie 8.1;
-- Policz wszystkich pracowników;
SELECT count(id) as IloscPracownikow from employee;

Ćwiczenie 8.2;
-- Policz wszystkich pracowników, którzy nie mają drugiego imienia;
SELECT count(id) as Pracownicy_Bez_Drugiego_Imienia from employee where SecondName is null;

Ćwiczenie 8.3;
-- Policz wszystkich aktywnych pracowników.
SELECT count(id) as Pracownicy_Aktywni from employee where Active1 > 0;

Ćwiczenie 8.4;
-- Policz, ilu pracowników pracuje w dziale IT.
SELECT count(id) as Pracownicy_IT from employee where DepartmentID = 1;

Ćwiczenie 8.5;
-- Policz wszystkich pracowników, którzy pracują w działach znajdujących się w Warszawie.
SELECT count(id) as Pracownicy_Warszawa from employee where DepartmentID = 2;

Ćwiczenie 8.6;
-- Policz, ile pracodawca wydaje miesięcznie na pensje. Zauważ, że pracodawca płaci pensje tylko aktywnym pracownikom.
SELECT SUM(Salary) as Miesieczne_Place from employee where Active1 = 1;

Ćwiczenie 8.7;
-- Policz, ile pracodawca wydaje rocznie na pensje.
SELECT SUM(Salary * 12) as Roczne_Place from employee where Active1 = 1;

Ćwiczenie 8.8;
-- Znajdź minimalne zarobki spośród wszystkich pracowników.
SELECT MIN(salary) as Minimalne_Wynagrodzenie from employee;

Ćwiczenie 8.9;
-- Policz, z ilu liter składa się najkrótsze imię pracownika spośród zatrudnionych.
SELECT MIN(length(FirstName)) as Najkrotsze_Imie_Ma_Liter from employee;

Ćwiczenie 8.10;
-- Policz, ile lat łącznie przepracowali w firmie aktywni pracownicy.
SELECT sum(datediff(curdate(), HireDate) /365.4) from employee where Active1 = 1 ;

Ćwiczenie 8.11;
-- Sprawdź, jaka jest różnica pomiędzy minimalną a maksymalną pensją.
SELECT Max(salary) - MIN(salary) as Max_Różnica_w_Płacy from employee;

Ćwiczenie 8.12;
-- Policz średnią, minimalną i maksymalną wysokość pensji pracowników w dziale IT.
SELECT AVG(Salary), Min(Salary), Max(Salary) from employee where DepartmentID = 1;

Ćwiczenie 8.13;
-- O ile należałoby podnieść pensję pracownikowi, który zarabia najmniej, żeby jego pensja wynosiła tyle, ile średnia pensja?
SELECT AVG(Salary) - Min(Salary) from employee;

Ćwiczenie 8.14;
-- Policz średni wiek wszystkich pracowników.
SELECT AVG(TIMESTAMPDIFF(YEAR,BirthDate,CURDATE())) from employee;

Ćwiczenie 8.15;
-- Policz średnią liczbę miesięcy przepracowanych przez tych pracowników, którzy już w firmie nie pracują.
SELECT AVG(TIMESTAMPDIFF(month,HireDate,ReliveDate)) from employee where active1 = 0;

Ćwiczenie 8.16;
-- Znajdź najpóźniejszą datę urodzenia spośród wszystkich pracowników.
SELECT MAX(BirthDate) from employee;

Ćwiczenie 8.17;
-- Wyświetl wszystkie unikalne wysokości płac w firmie i dla każdej z tych wartości policz, ilu pracowników zarabia taką właśnie kwotę.
SELECT DISTINCT Salary, count(id) from employee GROUP BY Salary;

Ćwiczenie 8.18;
-- Wyświetl wszystkie unikalne wysokości płac w firmie.
SELECT DISTINCT Salary from employee;

Ćwiczenie 8.19;
-- Wyświetl, ilu pracowników pracuje w poszczególnych działach.
select D.Name, count(employee.departmentid) as Ilosc_Pracownikow from employee join Department as D on  employee.DepartmentID = D.ID GROUP BY D.ID ;

Ćwiczenie 8.20;
-- Wyświetl, ilu pracowników pracuje w poszczególnych działach. Wyniki rozszerz również o te działy, które nie mają przypisanego żadnego pracownika.
select D.Name, count(employee.departmentid) as Ilosc_Pracownikow from employee right join Department as D on  employee.DepartmentID = D.ID GROUP BY D.ID ;
