-- Sprawozdanie_cwl_5_Radosław_Pietraszek

-- zad. 8.

create table Sklepy(
id_sklepu int not null primary key,
nazwa varchar(30) not null,
adres varchar(40) null,
telefon varchar(15) null,
godz_otwarcia time null,
godz_zamkniecia time null);

-- ----------------------------------------

-- zad. 9.

describe Sklepy;

-- ----------------------------------------

-- zad. 10.

alter table Sklepy add column opis varchar(50) null;

-- ----------------------------------------

-- zad. 11.

desc Sklepy;

-- ----------------------------------------

-- zad. 12.

alter table Sklepy add constraint id_sklepu_spr
check (id_sklepu between 0 and 9999);

-- ----------------------------------------

-- zad. 13.

alter table Sklepy add constraint godz_otwarcia_spr
check (godz_otwarcia between '06:00:00' and '12:00:00');

-- ----------------------------------------

-- zad. 14.

alter table Sklepy add constraint godz_zamkniecia_spr
check (godz_zamkniecia between '13:00:00' and '24:00:00');

-- ----------------------------------------

-- zad. 15.

select count(*) from Sklepy;

-- ----------------------------------------

-- zad. 16.

create table Produkty(
id_prod int not null primary key,
nazwa varchar(30) not null,
cena decimal(6,2) not null,
ilosc int not null,
data_produkcji date null,
gatunek varchar(25) null,
opis varchar(80) null,
fk_sklepu int null,
foreign key (fk_sklepu) references Sklepy(id_sklepu),
constraint nazwa_spr check (nazwa <> ''),
constraint id_prod_spr check (id_prod between 0 and 9999),
constraint cena_spr check (cena >= 0.00 and cena < 1000.00),
constraint ilosc_spr check (ilosc >= 0),
constraint data_produkcji_spr check (data_produkcji >= '1980-01-01'),
constraint gatuenk_spr check (gatunek in ('I klasa', 'II klasa', 'III klasa', '0 klasa'))
);

-- ----------------------------------------

-- zad. 17.

describe Produkty;

-- ----------------------------------------

-- zad. 18.

select * from Produkty;

-- ----------------------------------------

-- zad. 19.

alter table Produkty add constraint nazwa_spr2 unique(nazwa);

-- ----------------------------------------

-- zad. 20.

insert into Sklepy(
  id_sklepu, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
  values(
  1, 'Warzywniak Sp z o.o.', 'Bydgoszcz Grochowskiego 3/1',
  '52 32-73-821', '10:00:00', '18:00:00', 'Sprzedaż warzyw i owoców');
insert into Sklepy(
  id_sklepu, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
  values(
  2, 'AniMruMru', 'Borek 18',
  '0 700-880-997', '06:00:00', '24:00:00', 'Czego dusza zapragnie');
insert into Sklepy(
  id_sklepu, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
  values(
  3, 'U Olivandera', 'Pokątna 3',
  '77 33-44-555', '09:00:00', '17:00:00', 'Magia w każdym calu');
insert into Sklepy(
  id_sklepu, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
  values(
  4, 'Nightcity tech', 'Conpeci Plaza',
  '2077-2077', '07:07:07', '20:20:20', 'Obudz w sobie Edgerunnera');
insert into Sklepy(
  id_sklepu, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
  values(
  5, 'DucatiRiders', 'Jagielońska 31',
  '03-238-93-45', '09:30:00', '17:40:00', 'LewaWgore');

-- ----------------------------------------

-- zad. 21.

select count(*) from Sklepy;

-- ----------------------------------------

-- zad. 22.

select * from Sklepy order by nazwa;

-- ----------------------------------------

-- zad. 23.

insert into Produkty(
	id_prod, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_sklepu)
	values(
	1, 'pomidory', 5.99, 15, '2011-01-20', 'I klasa', 'pomidory krajowe', 3);
insert into Produkty(
	id_prod, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_sklepu)
	values(
	2, 'jabłka', 4.50, 20, '2011-01-17', 'I klasa', 'goldeny', null);
insert into Produkty(
	id_prod, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_sklepu)
	values(
	3, 'mantis blades', 999.99, 4, '2020-01-26', 'II klasa', 'ostrza przedramienia', 4);
insert into Produkty(
	id_prod, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_sklepu)
	values(
	4, 'przypinka', 49.99, 5, '2019-05-27', '0 klasa', 'znaczek marki premium', 5);
insert into Produkty(
	id_prod, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_sklepu)
	values(
	5, 'śliwki', 3.50, 40, '2022-06-30', 'III klasa', 'robaczywki', 1);

-- ----------------------------------------

-- zad. 24.

insert into Produkty(
	id_prod, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_sklepu)
	values(
	15, 'jabłka', 3.20, 10, '2011-01-15', 'II klasa', 'robaczywe', 2);

-- ----------------------------------------

-- zad. 25.

select count(*) from Produkty;

-- ----------------------------------------

-- zad. 26.

select * from Produkty order by nazwa;

-- ----------------------------------------

-- zad. 27.

select sum(ilosc) from Produkty;

-- ----------------------------------------

-- zad. 28.

select sum(ilosc) from Sklepy, Produkty
	where Sklepy.id_sklepu = Produkty.fk_sklepu and Sklepy.nazwa = 'Warzywniak Sp z o.o.';

select sum(ilosc) from Sklepy, Produkty
	where Sklepy.nazwa = 'Warzywniak Sp z o.o.';

-- ----------------------------------------

-- zad. 29.

select Produkty.nazwa, cena, ilosc, Sklepy.nazwa, adres
	from Sklepy, Produkty
  where Sklepy.id_sklepu=Produkty.fk_sklepu
  order by Produkty.nazwa;

-- ----------------------------------------

-- zad. 30.

select Produkty.nazwa, cena, ilosc, Sklepy.nazwa, adres
	from Sklepy right outer join Produkty
  on Sklepy.id_sklepu=Produkty.fk_sklepu
  where cena > 0 and ilosc > 0
  order by Produkty.nazwa;

-- ----------------------------------------

-- zad. 31.

select Produkty.nazwa, cena, ilosc, Sklepy.nazwa, adres
	from Sklepy left outer join Produkty
	on Sklepy.id_sklepu=Produkty.fk_sklepu
	where cena > 0 and ilosc > 0
	order by Produkty.nazwa;

-- ----------------------------------------

-- zad. 32.

select sum(ilosc), cena, Sklepy.nazwa, adres
	from Sklepy left outer join Produkty
	on Sklepy.id_sklepu=Produkty.fk_sklepu
	order by Sklepy.nazwa;


-- ----------------------------------------

-- zad. 33.

select Sklepy.nazwa, adres, telefon from Sklepy, Produkty
	where Sklepy.id_sklepu=Produkty.fk_sklepu
    and godz_otwarcia <= '09:00:00' and Produkty.nazwa = 'jabłka';
