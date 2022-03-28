
USE baza_mz1 ;

-- Dla każdego pracownika wyświetl imię, nazwisko oraz rok jego urodzenia.
select FirstName, LastName, Year(BirthDate) from employees;

-- Dla każdego pracownika wyświetl imię, nazwisko oraz rok, miesiąc i dzień jego 
-- urodzenia oraz dzień tygodnia, w jakim się urodził.
select FirstName, LastName, BirthDate, dayname(BirthDate) as DzienTygodnia from employees;

-- Wyświetl wszystkich pracowników urodzonych w 1990 roku.
select * from employees where Year(BirthDate) = 1990;

-- Wyświetl wszystkich pracowników urodzonych w maju 1990 roku.
select * from employees where Year(BirthDate) = 1990 and month(BirthDate)=5;

-- Wyświetl bieżącą datę i godzinę.
select NOW() as Data_i_Godzina;

-- Wyświetl, ile lat minęło od daty 1 stycznia 1990 roku.
select (year(now()) - Year('1990-01-01')) as IlośćLat;

-- Dla każdego pracownika wyświetl jego imię, nazwisko oraz wiek.
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) AS age from employees;

-- Wyświetl wszystkich pracowników, którzy mają więcej niż 25 lat.
SELECT *, TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) as wiek from employees where TIMESTAMPDIFF(YEAR,BirthDate,CURDATE())  > 25 ;

-- Wyświetl dane wszystkich pracowników, którzy mają mniej niż 30 lat i zarabiają mniej niż 2000 zł.
SELECT *, TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) as wiek from employees where TIMESTAMPDIFF(YEAR,BirthDate,CURDATE())  <30 and salary < 2000  ;

-- Dla każdego aktywnego pracownika wyświetl imię, nazwisko oraz informację, ile lat już pracuje w tej firmie.
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR,HireDate,CURDATE()) as Staż from employees where Active1 = 1; 

-- Dla każdego aktywnego pracownika wyświetl imię, nazwisko oraz informację, ile miesięcy już pracuje w tej firmie.
SELECT FirstName, LastName, TIMESTAMPDIFF(month,HireDate,CURDATE()) as StażMiesięcy from employees ; 

-- Wyświetl dane wszystkich pracowników, którzy przepracowali w tej firmie co najmniej 10 miesięcy, ale nie więcej niż 20.
select *, TIMESTAMPDIFF(month,HireDate,CURDATE()) as StażMiesięcy from employees where TIMESTAMPDIFF(month,HireDate,CURDATE()) between 10 and 20;

-- Dla każdego pracownika wyświetl imię, nazwisko, rok urodzenia, rok, w którym został zatrudniony, 
-- oraz liczbę lat, którą miał w momencie zatrudnienia.
SELECT FirstName, LastName, year(BirthDate), year(HireDate), 
TIMESTAMPDIFF(year,BirthDate,HireDate) as Lat_w_chwili_zatrudnienia from employees;

-- Sprawdź, czy istnieją pracownicy, którzy przez pomyłkę mają wpisaną datę zatrudnienia późniejszą niż datę zwolnienia.
select * from employees where HireDate > ReliveDate;

-- Dla każdego byłego pracownika, który nie pracuje już w firmie, wyświetl imię i nazwisko 
-- oraz liczbę miesięcy, którą przepracował w firmie.
select FirstName, LastName , TIMESTAMPDIFF(month,HireDate,ReliveDate) as liczbaMiesiecyPracy from employees where ReliveDate;

-- Dla każdego pracownika wyświetl imię, nazwisko oraz inicjały.
select FirstName, LastName, Concat( Left(FirstName,1),'.',Left(LastName,1),'.') as inicjały from employees;

-- Dla każdego pracownika wyświetl nazwisko oraz liczbę liter w nazwisku.
select LastName, CHAR_LENGTH(LastName) as liczba_liter_w_nazwisku from employees;

-- Wyświetl wszystkich pracowników, których nazwisko jest dłuższe niż 6 liter.
select LastName, CHAR_LENGTH(LastName) as liczba_liter_w_nazwisku from employees where CHAR_LENGTH(LastName)>6;

-- Dla każdego pracownika wyświetl jego imię, ale pisane małymi literami, oraz nazwisko pisane wielkimi literami.
select lower(FirstName), upper(LastName) from employees;

-- Dla każdego pracownika wyświetl jego login. Login jest zbudowany z pierwszej litery imienia i całego nazwiska.
select concat(left(FirstName, 1), LastName) as Login from employees;


-- Dla każdego aktywnego pracownika wyświetl jego login napisany małymi literami. 
-- Login, jak poprzednio, jest zbudowany z pierwszej litery imienia i całego nazwiska.
select lower(concat(left(FirstName, 1), LastName)) as Login from employees where Active1 = 1;

-- Dla każdego pracownika wyświetl krótki login, który jest zbudowany z pierwszej litery imienia oraz 
-- pięciu pierwszych liter nazwiska. Login ten wyświetl przy użyciu wielkich liter. 
-- Przykładowo, dla pracownika John Williams krótki login to JWILLI.
select upper(concat(left(FirstName, 1), left(LastName,5))) as Login from employees;


-- Wyświetl imię, nazwisko oraz wiek wszystkich pracowników. 
-- Posortuj ich dane według wieku, a jeśli istnieje wielu pracowników w tym samym wieku, 
-- posortuj ich według nazwiska. Jeśli istnieje wielu pracowników w tym samym wieku i o tym samym nazwisku, 
-- posortuj ich według imienia.
select FirstName, LastName, TIMESTAMPDIFF(YEAR,BirthDate,CURDATE()) AS age from employees ORDER BY age, LastName, FirstName;
