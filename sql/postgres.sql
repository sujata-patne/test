-- https://www.mockaroo.com/ - Download dummy data

-- Create database
CREATE DATABASE peopledb;

-- List database
\l

-- Select database
\c peopledb;

-- Drop(Delete) database
DROP DATABASE peopledb;

-- Create table, insert records from sql file
\i /Users/jitendra/Workspace/Jitendra/interview/Postgres/person.sql

-- Create table
CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(15) NOT NULL,
	date_of_birth DATE,
	country VARCHAR(20) NOT NULL
);

-- List tables;
\dt

-- Insert row into person table
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country) 
VALUES (1, 'Joelynn', 'Wison', 'jwison0@delicious.com', 'Female', '2023-05-22', 'Russia');

-- Fetch only 10 records
SELECT * FROM person LIMIT 10;

-- Fetch 10 record and skip first 10 records, Pagination
SELECT * FROM person OFFSET 10 LIMIT 10;

-- Fetch distinct(unique) country from person table in ascending order;
SELECT DISTINCT country FROM person ORDER BY country ASC;

-- Fetch distinct(unique) country from person table in descending order;
SELECT DISTINCT country FROM person ORDER BY country DESC;

-- Fetch persons who belongs to chinda and finland
SELECT * FROM PERSON WHERE COUNTRY IN ('China', 'Finland');

-- Fetch record who's email addess matching with given strings
SELECT * FROM person WHERE EMAIL LIKE '%google.c%';

-- Fetch country alongs with their person total count
SELECT country, count(*) FROM person GROUP BY country ORDER BY country;

-- Fetch country who's population count more than 5
SELECT country, count(*) FROM person GROUP BY country HAVING COUNT(*) > 5 ORDER BY country;

-- Get age
SELECT id, first_name, gender, AGE(NOW(), date_of_birth) as age from person;

-- If column does not have value, use default value using coalesce
SELECT COALESCE(email, 'Email not provided') FROM person;

-- delete primary ket constraints
ALTER TABLE person DROP CONSTRAINT person_pkey;

-- Add primary ket
ALTER TABLE person ADD PRIMARY KEY (id);

-- Create unique constraint
ALTER TABLE person ADD UNIQUE (email);
ALTER TABLE person ADD CONSTRAINT unique_email_address UNIQUE(email);

-- check constraint
ALTER TABLE person ADD CONSTRAINT gender_constraint CHECK (gender = 'Female' OR gender = 'Male');

-- Drop(Delete) table
DROP TABLE person;

-- Delete record from table on condition
DELETE FROM person WHERE gender = 'Female';

-- Update email address based on condition 
UPDATE person SET email = 'contactjittu@gmail.com' WHERE id = 100;

-- Update first_name, last_name, email based on condition
UPDATE person SET first_name = 'Jitendra', last_name = 'Kumar', email = 'contactjittu@gmail.com' 
WHERE id = 100;

-- On Conflict do nothing
INSERT INTO person(id, first_name, last_name, gender, email, date_of_birth, country)
VALUES (1, 'Jittu', 'Kumar', 'Male', 'jittu@gmail.com', DATE '1989-12-31', 'India')
ON CONFLICT (id) DO NOTHING;

-- On Conflict Upsert, update email
INSERT INTO person(id, first_name, last_name, gender, email, date_of_birth, country)
VALUES (1, 'Jittu', 'Kumar', 'Male', 'jittu@gmail.com', DATE '1989-12-31', 'India')
ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email;

-- On Conflict Upsert/update, Multiple colums
INSERT INTO person(id, first_name, last_name, gender, email, date_of_birth, country)
VALUES (1, 'Jittu', 'Kumar', 'Male', 'jittu@gmail.com', DATE '1989-12-31', 'India')
ON CONFLICT (id) DO UPDATE SET email = EXCLUDED.email, last_name = EXCLUDED.last_name,
first_name = EXCLUDED.first_name;

-- Create table called car
CREATE TABLE car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

-- Insert one record in car table
INSERT INTO car (id, make, model, price) VALUES (1, 'Chevrolet', 'Venture', '18307.13');

-- Get maximum price of car
SELECT MAX(price) FROM car;

-- Get minimum price of car
SELECT MIN(price) FROM car;

-- Get average price of car
SELECT AVG(price) FROM car;

-- Round of average price of car
SELECT ROUND(AVG(price)) FROM car;

-- Get car based on max price from different make, model 
SELECT make, model, MAX(price) FROM car GROUP BY make, model;

-- Get car based on min price from different make, model
SELECT make, model, MIN(price) FROM car GROUP BY make, model;

-- Get car based on min price from different make, model
SELECT make, model, AVG(price) FROM car GROUP BY make, model;

-- Get sum of all car price
SELECT SUM(price) FROM car;

-- Get sum of price for each make
SELECT make, SUM(price) FROM car GROUP BY make;

-- Get 10% discount using query
SELECT id, make, model, price, ROUND(price * .10, 2), ROUND(price - (price * .10), 2) FROM car ;
SELECT id, make, model, price AS original_price, ROUND(price * .10, 2) AS ten_percent,
ROUND(price - (price * .10), 2) AS discount_after_ten_percent FROM car;

-- Handle number divisiable by zero(0)
SELECT COALESCE(10 / NULLIF(0, 0), 0);

-- Foreign Keys, Joins, & Relationships
-- Person has car, Person can only have on car, Car can belong to one person only
-- Adding relationship between tables

-- First drop both tables;
DROP TABLE person;
DROP TABLE car;

-- Create person table with reference

CREATE TABLE car (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(15) NOT NULL,
	date_of_birth DATE,
	country VARCHAR(20) NOT NULL,
	car_id BIGINT REFERENCES car (id),
	UNIQUE(car_id)
);

-- Insert into person
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country)
VALUES (1, 'Joelynn', 'Wison', 'jwison0@delicious.com', 'Female', '2023-05-22', 'Russia');
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country)
VALUES (2, 'John', 'Doe', 'john@delicious.com', 'Male', '2023-05-22', 'India');
INSERT INTO person (id, first_name, last_name, email, gender, date_of_birth, country)
VALUES (3, 'Cena', 'John', 'cena@delicious.com', 'Male', '2023-05-22', 'China');

-- Insert into car
INSERT INTO car (id, make, model, price)
VALUES (1, 'Chevrolet', 'Venture', '18307.13');
INSERT INTO car (id, make, model, price)
VALUES (2, 'Ford', 'Thunderbird', '68825.21');

-- Updating foreign keys columns
UPDATE person SET car_id = 1 WHERE id = 2;

-- Inner joins
SELECT * FROM person
JOIN car ON person.car_id = car.id;

\x -- Turn on/off expanded display

-- Left joins
SELECT * FROM person
LEFT JOIN car ON person.car_id = car.id;

-- Select all person which don't have car
SELECT * FROM person
LEFT JOIN car ON car.id = person.car_id
WHERE car.* IS NULL;

-- Deleting records with foreign keys / cascade is bad practice
DELETE FROM person WHERE id = 1;
DELETE FROM car WHERE id = 2;

-- Exporting query results to CSV
\copy (SELECT * FROM person LEFT JOIN car ON person.car_id = car.id) 
TO '/tmp/result.csv' DELIMITER ',' CSV HEADER;

-- Serial & Sequences
SELECT nextval('person_id_seq'::regclass);

ALTER SEQUENCE person_id_seq RESTART WITH 10;

-- Extensions
SELECT * FROM pg_available_extensions;

-- Create extennsion
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\df -- List of functions

-- UUID as Primary keys
CREATE TABLE car (
	car_uid UUID NOT NULL PRIMARY KEY,
	make VARCHAR(100) NOT NULL,
	model VARCHAR(100) NOT NULL,
	price NUMERIC(19, 2) NOT NULL
);

CREATE TABLE person (
	person_uid UUID NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(150),
	gender VARCHAR(15) NOT NULL,
	date_of_birth DATE,
	country VARCHAR(20) NOT NULL,
	car_uid UUID REFERENCES car (car_uid),
	UNIQUE(car_uid)
);

-- Insert into person
INSERT INTO person (person_uid, first_name, last_name, email, gender, date_of_birth, country)
VALUES (uuid_generate_v4(), 'Joelynn', 'Wison', 'jwison0@deli.com', 'Female', '2023-05-22', 'Russia');
INSERT INTO person (person_uid, first_name, last_name, email, gender, date_of_birth, country)
VALUES (uuid_generate_v4(), 'John', 'Doe', 'john@delicious.com', 'Male', '2023-05-22', 'India');
INSERT INTO person (person_uid, first_name, last_name, email, gender, date_of_birth, country)
VALUES (uuid_generate_v4(), 'Cena', 'John', 'cena@delicious.com', 'Male', '2023-05-22', 'China');

-- Insert into car
INSERT INTO car (car_uid, make, model, price)
VALUES (uuid_generate_v4(), 'Chevrolet', 'Venture', '18307.13');
INSERT INTO car (car_uid, make, model, price)
VALUES (uuid_generate_v4(), 'Ford', 'Thunderbird', '68825.21');

UPDATE person SET car_uid = '9c9b73c9-cb85-46e6-9df7-2846054d1728'
WHERE person_uid = 'b08ab587-6857-43cb-8fa1-9771631ef06f';

-- JOINS with USING key, when primary_key and foreign key have the same name
SELECT * FROM person
LEFT JOIN car USING(car_uid)
WHERE car.* IS NULL;
