CREATE DATABASE baza_mz DEFAULT CHARACTER SET UTF8 COLLATE UTF8_POLISH_CI; 

USE baza_mz ;

CREATE TABLE address (
    address INT PRIMARY KEY,
    city VARCHAR(50),
    street VARCHAR(50),
    zip VARCHAR(6)
);
INSERT INTO address (address, city , street, zip) VALUES 
('1', 'Radom', 'Sienkiewicza', '26-600'),
(2, 'Warszawa', 'Woronicza', '00-950'),
(3, 'Poznań', 'Słowackiego', '05-350'),
(4, 'Lublin', 'Narutowicza', '11-111'),
(5, 'Wrocław', 'Sienkiewicza', '44-543'),
(6, 'Gdańsk', 'Marynarska', '20-312'),
(7, 'Zakopane', 'Góralska', '89-200'),
(8, 'Opole', 'Wspólna', '55-555'),
(9, 'Tarnów', 'Bliska', '99-501'),
(10, 'Bydgoszcz', 'Warszawska', '36-130');

SELECT 
    *
FROM
    address;

CREATE TABLE personal_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(30) NOT NULL,
    age INT NOT NULL
);  
INSERT INTO personal_data (firstname, lastname, age) VALUES
('Jan', 'Kowalski', 28),
('Adam', 'Nowak', 56),
('Janina', 'Wróbel', 85),
('Wiesława', 'Szymborska', 66),
('Mirosław', 'Mróz', 40),
('Bartłomiej', 'Wolski', 20),
('Eliza', 'Orzeszkowa', 33),
('Zygmunt', 'Waza', 37),
('Celina', 'Czerska', 90),
('Tomasz', 'Abramowicz', 39);

SELECT 
    *
FROM
    personal_data;

CREATE TABLE phones (
    phone_id INT PRIMARY KEY,
    number VARCHAR(15) NOT NULL,
    lastname VARCHAR(30)
);
INSERT INTO phones (phone_id, number, lastname) VALUES
(1, '555-324-864', 'Nowak'), 
(2, '555-26-62', 'Kowalski'),
(3, '800-333-666', 'Bezos'),
(4, '994-123-351', 'Kozakiewicz'),
(5, '502-645-799', 'Borowski'),
(6, '555-321-456', 'Adams'),
(7, '546-555-221', 'Wieczorek'),
(8, '111-234-795', 'Bogusławska'),
(9, '444-343-342', 'Fabacki'),
(10, '777-777-777', 'Wierzbicki');

SELECT 
    *
FROM
    phones;

CREATE TABLE events (
    event_id INT NOT NULL,
    name VARCHAR(45) NOT NULL,
    category VARCHAR(45),
    country VARCHAR(20),
    city VARCHAR(20)
);

INSERT INTO events (event_id, name, category, country, city) VALUES
(1, 'Lemon akustycznie', 'koncert', 'Polska', 'Warszawa'),
(2, 'Anna Maria Jopek', 'koncert', 'Polska', 'Lublin'),
(3, 'Maryla Rodowicz show', 'koncert', 'Polska', 'Opole'),
(4, 'Wielka Gala Operowa', 'Opera', 'Polska', 'Warszawa'),
(5, 'Deep Purple', 'Koncert', 'Francja', 'Paryż'),
(6, 'Ani mru mru', 'Kabaret', 'Polska', 'Radom'),
(7, 'Mały książe', 'Teatr', 'Polska', 'Białystok'),
(8, 'Legia - Widzew', 'Sport', 'Polska', 'Warszawa'),
(9, 'Cezary Pazura show', 'Kabaret', 'USA', 'Chicago'),
(10, 'Smolik', 'Koncert', 'Polska', 'Sopot');

SELECT 
    *
FROM
    events;

CREATE TABLE dates (
    date_name VARCHAR(255) PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

INSERT INTO dates (date_name, start_date, end_date) VALUES
( 'Pierwsza kadencja sejmu', '1989-06-18', '1993-05-31'),
( 'Druga kadencja sejmu', '1993-09-19', '1997-10-20'),
( 'Trzecia kadencja sejmu', '1997-10-20', '2001-10-18'),
( 'Czwarta kadencja sejmu', '2001-10-19', '2005-10-18'),
( 'Piąta kadencja sejmu', '2005-10-19', '2007-11-04'),
( 'Szósta kadencja sejmu', '2007-11-05', '2011-11-07'),
( 'Siódma kadencja sejmu', '2011-11-08', '2015-10-09'),
( 'Ósma kadencja sejmu', '2015-10-12', '2019-11-12'),
( 'Dziewiąta kadencja sejmu', ' 2019-11-12', '2023-11-12'),
( 'Dziesiąta kadencja sejmu', '2023-11-12','2027-11-12');

SELECT 
    *
FROM
    dates;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    kierunek VARCHAR(35) NOT NULL,
    tryb VARCHAR(15) NOT NULL,
    data_rozpoczęcia DATE NOT NULL
);

INSERT INTO students (student_id, kierunek, tryb, data_rozpoczęcia) VALUES
(351, 'Informatyka', 'dzienne', '2019-10-01'),
(224, 'Filozofia', 'zaoczne', '2016-10-01'),
(12, 'Psychologia', 'dzienne', '2018-10-01'),
(55346, 'Prawo', 'dzienne', '2017-10-01'),
(5534, 'Informatyka', 'zaoczne', '2017-10-01'),
(111, 'Fizyka', 'dzienne', '2016-10-01'),
(3, 'Medycyna', 'dzienne', '2017-10-01'),
(1221, 'Biologia', 'zaoczne', '2015-10-01'),
(2132, 'Matematyka', 'dzienne', '2019-10-01'),
(10, 'Informatyka', 'zaoczne', '2018-10-01');

SELECT 
    *
FROM
    students;

CREATE TABLE notes (
    note_id FLOAT PRIMARY KEY,
    note INT NOT NULL
);

INSERT INTO notes (note_id, note) VALUES
(1, 5),
(2, 2),
(3, 4),
(4, 0),
(5, 3),
(6, 5),
(7, 3),
(8, 4),
(9, 5),
(10, 0);

SELECT 
    *
FROM
    NOTES;

CREATE TABLE countries (
    country_id VARCHAR(3) PRIMARY KEY,
    country VARCHAR(50) NOT NULL,
    telephone_code VARCHAR(5),
    capital VARCHAR(30),
    language VARCHAR(15),
    currency VARCHAR(15),
    area_km2 INT
);

INSERT INTO countries (country_id, country, telephone_code, capital, language, currency, area_km2) VALUES
(1, 'Polska', '048', 'Warszawa', 'polski', 'złoty', 312000),
(2, 'Niemcy', '049', 'Berlin', 'niemiecki', 'euro', 360000),
(3, 'Holandia', '050', 'Haga', 'holenderski', 'euro', 40000),
(4, 'Belgia', '051', 'Bruksela', 'francuski', 'euro', 30000),
(5, 'Bułgaria', '053', 'Sofia', 'bułgarski' ,'lew', 111000),
(6, 'Chorwacja', '054', 'Zagrzeb', 'chorwacki', 'euro', 56000),
(7, 'Dania', '055', 'Kopenhaga', 'duński', 'euro', 43000),
(8, 'Estonia', '056', 'Tallin', 'estoński', 'euro', 45000), 
(9,  'Grecja', '057', 'Ateny', 'grecki', 'euro', 132000),
(10, 'Finlandia', '058', 'Helsinki', 'fiński', 'euro', 338000);

SELECT 
    *
FROM
    countries;

CREATE TABLE cars (
    id INT PRIMARY KEY,
    brand VARCHAR(20),
    model VARCHAR(20),
    production_year INT,
    capacity FLOAT
); 

INSERT INTO cars (id, brand, model, production_year, capacity) VALUES
(1, 'Opel', 'Astra', 2015, 1330),
(2,'Renault', 'Megane', 2019, 999),
(3, 'Peugeot', '508', 2014, 1998),
(4, 'Fiat', 'Punto', 2002, 1599),
(5, 'Seat', 'Toledo', 2010, 1499),
(6, 'Opel', 'Insignia', 2013, 2500),
(7, 'Toyota', 'Yaris', 2018, 1099),
(8, 'Skoda', 'Octavia', 2005, 1599),
(9, 'Skoda', 'Superb', 2020, 1999),
(10, 'Honda', 'Civic', 2017, 1545);

SELECT 
    *
FROM
    cars;

