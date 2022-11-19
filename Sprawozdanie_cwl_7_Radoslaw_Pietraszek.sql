Sprawozdanie_cwl_7_Radosław_Pietraszek

-- zad. 11.

desc city;

-- ------------------------------------

-- zad. 12.

show create table city;

-- ------------------------------------

-- zad. 13.

desc country;

-- ------------------------------------

-- zad. 14.

show create table country;

-- ------------------------------------

-- zad. 15.

desc countrylanguage;

-- ------------------------------------

-- zad. 16.

show create table countrylanguage;

-- ------------------------------------

-- zad. 17.

select count(id) from city;
select count(code) from country;
select count(countrycode) from countrylanguage;

-- ------------------------------------

-- zad. 18.

select id, name, population from city limit 20;

-- ------------------------------------

-- zad. 19.

select id, name, population from city limit 15,5;

-- ------------------------------------

-- zad. 20.

select * from city order by population desc limit 20;

-- ------------------------------------

-- zad. 21.

select countrycode, district, sum(population) from city
  where district = 'Texas' group by district;

-- ------------------------------------

-- zad. 22.

select name, population from city
  where population = (select max(population) from city);

-- ------------------------------------

-- zad. 23.

select name, population from city
  where population = (select min(population) from city);

-- ------------------------------------

-- zad. 24.

select * from city where name in ('Warszawa', 'Wroclaw');

-- ------------------------------------

-- zad. 25.

select name, countrycode, population from city
  where population between 630000 and 650000 order by population desc;

-- ------------------------------------

-- zad. 26.

select name, population from city
  where population > 1000000 and name like 'N%';

-- ------------------------------------

-- zad. 27.

select name, population from city
  where population > 1000000 and name like 'N%' and countrycode in ('USA', 'Rus');

-- ------------------------------------

-- zad. 28.

create view polishcity as
  select name, district, population from city
  where population > 10000 and countrycode = 'Pol';

-- ------------------------------------

-- zad. 29.

desc polishcity;
select * from polishcity;

-- ------------------------------------

-- zad. 30.

select sum(population) from country;

-- ------------------------------------

-- zad. 31.

select sum(population) from country inner join countrylanguage
  on country.code=countrylanguage.countrycode
  where language='spanish' and isofficial='T';

-- ------------------------------------

-- zad. 32.

select * into outfile 'C:/Users/R4um/Desktop/country.txt' from country;

-- ------------------------------------

-- zad. 33.

create table newcountry like country;

-- ------------------------------------

-- zad. 34.

desc newcountry;
select count(*) from newcountry;

-- ------------------------------------

-- zad. 35.

load data infile 'C:/Users/R4um/Desktop/country.txt' into table newcountry;

-- ------------------------------------

-- zad. 36.

select count(*) from newcountry;

-- ------------------------------------

-- zad. 38.

select * into outfile 'C:/Users/R4um/Desktop/city.txt' from city;
create table newcity like city;
load data infile 'C:/Users/R4um/Desktop/city.txt' into table newcity;

-- ------------------------------------

-- zad. 39.

create view usacity as
  select name, district, population from city
  where population > 500000
  and district in (
  'New York', 'Texas', 'California', 'Illinois', 'Colorado', 'Michigan', 'Arizona', 'Oregon');

-- ------------------------------------

-- zad. 40.

create view bigcountry as
  select name, continent, surfacearea, population from country
  where surfacearea > 1000000 and population > 50000000;

-- ------------------------------------

-- zad. 41.

create view newrichcountry as
  select name, continent, GNP, population, indepyear, lifeexpectancy from country
  where GNP > 2000 and indepyear > '1917' and lifeexpectancy > 65;

-- ------------------------------------

-- zad. 42.

create view bigcapitalrepublic as
  select country.name, country.population, city.name, city.population, governmentform
  from country inner join city on country.capital=city.id
  where city.population > 1000000
  and governmentform in ('republic', 'federal republic', 'socialistic republic');

-- ------------------------------------

-- zad. 43.

select sum(population) from country where continent = 'Europe';
select sum(population) from country where continent = 'Asia';

-- ------------------------------------

-- zad. 44.

update country set headofstate = 'Dudus' where name = 'Poland';

-- ------------------------------------

-- zad. 45.

select city.name, city.population
  from city inner join country
  on city.countrycode=country.code
  where country.continent = 'Asia'
  order by city.population desc limit 3;

-- ------------------------------------

-- zad. 46.

select sum(population)
  from country inner join countrylanguage
  on country.code=countrylanguage.countrycode
  where language = 'english';

-- ------------------------------------

-- zad. 47.

select count(distinct(country.name))
  from country inner join city
  on country.code=city.countrycode
  where city.population > 1000000;
