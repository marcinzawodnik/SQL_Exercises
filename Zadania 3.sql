USE baza_mz1;

CREATE TABLE tabela1 (id INT PRIMARY KEY AUTO_INCREMENT, c1 CHAR(20) NOT NULL, c2 VARCHAR(30), number1 FLOAT, number2 INT, date1 DATE, date2 DATETIME);

DESCRIBE tabela1 ;

INSERT INTO tabela1 (c1, c2, number1, number2, date1, date2)
VALUES
('Rafał', 'Kowalski', 123.12, 22, '2015-01-01', '2015-01-10 22:15:00'),
('Marcin', 'Nowakowski', 12.5, 554, '2015-10-10', '2015-12-31 23:59:59'),
('Monika', 'Chołuj', 333.333, 1000, '2016-02-01', '2016-03-22 14:15:25'),
('Agnieszka', 'Ziemkiewicz', 14.14, 100,  '2016-05-01', '2016-05-31 15:30:00'),
('Robert', 'Brzęczyszczykiewicz', 3.14, 2, '2017-04-24', '2017-08-08 08:08:08');

SELECT * FROM tabela1;

-- wyznaczających liczbę znaków z wybranej kolumny tekstowej 
Select c1, length(c1) from tabela1 ;

-- wyszukującej rekordy o imionach co najwyżej 6 literowych i nazwiskach co najmniej 10 literowych
select * from tabela1 where length(c1)<=6 AND length(c2)>=10;

-- wyświetlających jedną kolumnę tekstową pisaną dużymi literami, a drugą małymi literami
select upper(c1), lower(c2) from tabela1;

-- wyświetlające ostatnią literę z pierwszej kolumny tekstowej i pierwszą literę z drugiej kolumny tekstowej
SELECT right(c1, 1), left(c2, 1) from tabela1; 

-- łączącą dwie kolumny tekstowe w jedną wartość oddzieloną spacją 
select concat(c1 , ' ' , c2) AS 'Imię i nazwisko' from tabela1;

-- usuwające zbędne spacje początkowe, końcowe i wszystkie
-- polecenia TRIM(), RTRIM(), LTRIM() - nie mam w tabeli tekstów ze spacjami;
select trim('R' from c1 ) AS Bez_R from tabela1;

-- określającą czy litera „a” występuje w pierwszej kolumnie tekstowej
select c1 as TAK from tabela1 where left(c1,1) = 'a';

-- zamieniającą w pierwszej kolumnie tekstowej literę „a” na „A”

select REPLACE(c1, 'a', 'A') FROM tabela1 ;

-- zamieniającą tekst z pierwszej kolumny rozpoczynającą się dużą literą, a pozostałe małymi --- to polecenie jest niejasne

select REPLACE(c1, left(c1, 1), lower(left(c1,1))) from tabela1; 

-- wyszukującą imiona zaczynające się na literę „R” i nazwiska kończące się tekstem „ki”

select c1, c2 from tabela1 where c1 like 'R%' and c2 like '%ki';

-- sumę dwóch kolumn liczbowych
select sum(number1 + number2) as 'suma 3 i 4'  from tabela1;

-- zaokrąglenie liczby rzeczywistej do najbliższej liczby całkowitej oraz zaokrąglenia do najbliższej liczby całkowitej do dołu i do góry
-- polecenia ceil(),floor(),round(),truncate() np:

select ceil(number1) from tabela1;

-- pierwiastek z liczby całkowitej

select sqrt(number2) from tabela1;

-- wartość logarytmu naturalnego i dziesiętnego z liczb w kolumnie z wartościami całkowitymi

select ln(number2), log10(number2) from tabela1;

-- wartość sinusa i cosinusa z wybranej kolumny z wartościami liczbowymi
-- zwracają wartość funkcji dla liczby wyrażonej w radianach

select sin(number2), cos(number2) from tabela1;

-- obliczające miesiąc z kolumny z datą

select month(date2) from tabela1;

-- wyznaczające wyłącznie datę z kolumny z datą z częścią godzinową 

select date(date2) from tabela1;

-- wyznaczające okres mierzony w dniach między datami w obu kolumnach

SELECT DATEDIFF(date2,date1) days from tabela1;

-- wyznaczające daty miesiąc przed i miesiąc po datach określonych w kolumnach

select DATE_ADD(date1, INTERVAL 1 MONTH) 'one month later', DATE_SUB(date1, INTERVAL 1 MONTH) 'one month before' from tabela1;

-- konwertujące tekst na datę

SELECT STR_TO_DATE('21,5,2013','%d,%m,%Y') as Data;

-- wyznaczające pierwszy i ostatni dzień miesiąca dla daty określonej w pierwszej kolumnie z datami

select date_sub(date_add(LAST_DAY(date1), interval 1 day), interval 1 month) as Pierwszy, LAST_DAY(date1)  as ostatni from tabela1;

-- wyznaczające pierwszy i ostatni dzień roku dla daty określonej w pierwszej kolumnie z datami

select date_sub(date_add(LAST_DAY(date1), interval 1 day), interval month(date1) month) as Pierwszy, 
       concat(year(date1),'-12-31') as Ostatni from tabela1;

drop table tabela1;


