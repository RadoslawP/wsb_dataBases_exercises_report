-- Zadanie 9.
create table MojaPierwszaTabela(
	kolumna1 varchar(20),
  kolumna2 varchar(20));

-- Zadanie 10.
describe MojaPierwszaTabela;

-- Zadanie 11.
select * from MojaPierwszaTabela;

-- Zadanie 12.
show columns from MojaPierwszaTabela;

-- Zadanie 13.
drop table MojaPierwszaTabela;

-- Zadanie 14.
show tables;

-- Zadanie 15.
create table Meble(
	nazwa varchar(15),
  wysokosc float(4,1),
  szerokosc float(4,1),
  dlugosc float(4,1),
  ilosc int,
  opis varchar(20));

-- Zadanie 16.
describe Meble;

-- Zadanie 17.
select * from Meble;

-- Zadanie 18.
show columns from Meble;

-- Zadanie 19.
describe Meble;

-- Zadanie 20.
insert into Meble values('Szafa', 180, 80, 50, 4, 'Szafa dwudrzwiowa');

-- Zadanie 21.
select * from Meble;

-- Zadanie 22.
select count(*) from Meble;

-- Zadanie 23.
insert into Meble values('Komoda', 120, 80, 50, 12, 'Komoda sosnowa');
insert into Meble values('Biurko', 75, 60, 120, 2, 'Pracuj pracuj');
insert into Meble values('Krzesło', 46, 45, 45, 4, 'Śniadanie z rodziną');
insert into Meble values('Stół', 80, 80, 80, 1, 'Do kompletu krzeseł');
insert into Meble values('Kanapa', 40, 50, 170, 1, 'posiedzisz');
insert into Meble values('Szafka', 60, 40, 80, 6, 'Szpargały');
insert into Meble values('Regał', 180, 45, 100, 3, 'Wielofunkcyjny');
insert into Meble values('Wieszak', 170, 35, 35, 1, 'Czy sznur wytrzyma');
insert into Meble values('Szafka nocna', 65, 40, 55, 2, 'Śpij spokojnie');
insert into Meble values('Meblościanka', 180, 200, 40, 1, 'Landara w mieszkaniu');
insert into Meble values('Krzesło biurowe', 43, 40, 40, 3, 'Kółeczka w ruch');
insert into Meble values('Stolik kawowy', 48, 68, 110, 1, 'używaj podkładek');
insert into Meble values('Łóżko', 39, 120, 200, 1, 'Twarde i wygodne');
insert into Meble values('Fotel', 55, 50, 50, 2, 'Można odpłynąć');
insert into Meble values('Barek', 140, 42, 63, 2, 'Wino piwo i slodycze');
insert into Meble values('Leżanka', 38, 62, 150, 1, 'Pocotokomu');

-- Zadanie 24.
select count(*) from Meble;

-- Zadanie 25.
select * from Meble;

-- Zadanie 26.
select nazwa, opis, ilosc from Meble order by nazwa desc;

-- Zadanie 27.
select nazwa, opis from Meble order by nazwa asc;

-- Zadanie 28.
select nazwa, opis, wysokosc from Meble where wysokosc between 180 and 210;

-- Zadanie 29.
select nazwa, opis, wysokosc from Meble where wysokosc > 180 or dlugosc < 100;

-- Zadanie 30.
select distinct nazwa, opis, wysokosc, szerokosc, dlugosc, ilosc from Meble
order by nazwa;

-- Zadanie 31.
select * from Meble where dlugosc * 2 >= 100;

-- Zadanie 32.
select nazwa, opis, wysokosc from Meble having nazwa="Szafa";

-- Zadanie 33.
show tables;

-- Zadanie 34.
select * from Meble;

-- Zadanie 35.
select * from Meble where
dlugosc < 60 and wysokosc < 190 and szerokosc > 70 and ilosc > 5
order by nazwa desc;
