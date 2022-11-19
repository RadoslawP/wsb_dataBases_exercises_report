Sprawozdanie_cwl_6_Radosław_Pietraszek

-- zad. 8.

create user Uzytkownik identified by 'haslo';

-- ------------------------------------------

-- zad. 9.

rename user Uzytkownik to User1;

-- ------------------------------------------

-- zad. 10.

select
user, password, select_priv, create_priv, insert_priv, update_priv, delete_priv
from mysql.user;

-- ------------------------------------------

-- zad. 11.

drop user User1;

-- ------------------------------------------

-- zad. 12.

grant all privileges on XY.* to user2@localhost identified by 'haslo';

-- ------------------------------------------

-- zad. 13.

revoke all privileges on XY.* from user2@localhost;

-- ------------------------------------------

-- zad. 14.

drop user 'user2'@'localhost';

-- ------------------------------------------

-- zad. 15.

create table Wypozyczalnie(
	id_wypoz int not null primary key,
    nazwa varchar(30) not null,
    adres varchar(40) null,
    telefon varchar(15) null,
    godz_otwarcia time null,
    godz_zamkniecia time null,
    opis varchar(50) null,
    constraint id_wypoz_spr check (id_wypoz between 0 and 9999),
    constraint godz_otwarcia_spr check (godz_otwarcia between '06:00:00'
    and '12:00:00')
    );

-- ------------------------------------------

-- zad. 16.

describe Wypozyczalnie;

-- ------------------------------------------

-- zad. 17.

alter table Wypozyczalnie add constraint godz_zamkniecia_spr check
(godz_zamkniecia between '13:00:00' and '24:00:00');

-- ------------------------------------------

-- zad. 18.

select count(*) from Wypozyczalnie;

-- ------------------------------------------

-- zad. 19.

create table Filmy(
	id_filmu decimal(4) not null primary key,
    nazwa varchar(30) not null,
    cena decimal(6,2) not null,
    ilosc int not null,
    data_produkcji date null,
    gatunek varchar(25) null,
    opis varchar(80) null,
    fk_wypoz int null,
    constraint fk_Filmy_Wypoz foreign key (fk_wypoz) references Wypozyczalnie(id_wypoz),
    constraint id_filmu_spr check (id_filmu between 0 and 9999),
    constraint data_produkcji_spr check (data_produkcji >= '1980-01-01'),
    constraint gatunek_spr check (gatunek in ('obyczajowy', 'komedia',
    'kostiumowy', 'erotyczny', 'dramat', 'historyczny', 'horror', 'basn',
    'musical', 'western', 'wojenny', 'animowany'))
    );

-- ------------------------------------------

-- zad. 20.

describe Filmy;

-- ------------------------------------------

-- zad. 21.

lock tables Filmy write;
lock tables Wypozyczalnie write;

-- ------------------------------------------

-- zad. 22.

select * from Filmy;

-- ------------------------------------------

-- zad. 23.

insert into Wypozyczalnie(
	id_wypoz, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
	values(
	1, 'Kasety Sp z o.o.', 'Bydgoszcz Kasetowa 3/1', '52 32-73-821',
	'10:00:00', '18:00:00', 'Wypozyczalnia kaset i plyt DVD');

insert into Wypozyczalnie(
	id_wypoz, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
	values(
	2, 'Filmoteka Sp z o.o.', 'Leszno 3/1', '529-11-83',
	'07:30:00', '21:30:00', 'Oddział Leszczynski');

insert into Wypozyczalnie(
	id_wypoz, nazwa, adres, telefon, godz_otwarcia, godz_zamkniecia, opis)
	values(
	3, 'Filmoznawstwo Sp z o.o.', 'Krosno 6', '0-700-12-83',
	'06:00:00', '23:30:00', 'Kino uniwersyteckie');

-- ------------------------------------------

-- zad. 24.

select count(*) from Wypozyczalnie;

-- ------------------------------------------

-- zad. 25.

select * from Wypozyczalnie order by nazwa;

-- ------------------------------------------

-- zad. 26.

insert into Filmy(
id_filmu, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_wypoz)
values(
1, 'Tytanik', 11.99, 15, '1997-01-20', 'komedia', 'Przygody w oceanach', 3);

insert into Filmy(
id_filmu, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_wypoz)
values(
2, 'Wladca pierscieni', 4.50, 20, '2011-01-17', 'western', 'Zwiedzanie Nowej Zelandii', NULL);

insert into Filmy(
id_filmu, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_wypoz)
values(
3, 'The Batman', 24.50, 3, '2022-03-27', 'obyczajowy', 'Prawdziwy czlowiek nietoperz', NULL);

insert into Filmy(
id_filmu, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_wypoz)
values(
4, 'Harry Potter i kamień filozoficzny', 16.50, 9, '2001-01-17', 'musical', 'Szczypta magii', 3);

insert into Filmy(
id_filmu, nazwa, cena, ilosc, data_produkcji, gatunek, opis, fk_wypoz)
values(
5, 'Tron', 42.50, 2, '2016-04-07', 'animowany', 'Siec', 1);

-- ------------------------------------------

-- zad. 27.

select count(*) from Filmy;

-- ------------------------------------------

-- zad. 28.

select * from Filmy order by nazwa;

-- ------------------------------------------

-- zad. 29.

create view Filmy_widok as select * from Filmy where id_filmu > 3;

-- ------------------------------------------

-- zad. 30.

select * from Filmy_widok order by nazwa;

-- ------------------------------------------

-- zad. 31.

drop view Filmy_widok;

-- ------------------------------------------

-- zad. 32.

show tables;

-- ------------------------------------------

-- zad. 33.

create view Filmy_widok_1 as
	select nazwa, cena, ilosc, data_produkcji, gatunek from Filmy
    where cena > 5 and ilosc > 1 order by nazwa;

-- ------------------------------------------

-- zad. 34.

select * from Filmy_widok_1;

-- ------------------------------------------

-- zad. 35.

create view Filmy_widok_2 as
	select Filmy.nazwa as tytul_filmu, cena, ilosc, Wypozyczalnie.nazwa
	from Wypozyczalnie, Filmy
  where Wypozyczalnie.id_wypoz=Filmy.fk_wypoz order by Filmy.nazwa;

-- ------------------------------------------

-- zad. 36.

select * from Filmy_widok_2;

-- ------------------------------------------

-- zad. 37.

create view Filmy_widok_3 as
	select Filmy.nazwa as tytul_filmu, cena, ilosc, Wypozyczalnie.nazwa, adres
    from Wypozyczalnie right outer join Filmy
    on Wypozyczalnie.id_wypoz=Filmy.fk_wypoz
    where cena > 0 and ilosc > 0 order by Filmy.nazwa;

-- ------------------------------------------

-- zad. 38.

select * from Filmy_widok_3;

-- ------------------------------------------

-- zad. 39.

unlock tables;

-- ------------------------------------------

-- zad. 40.

grant all privileges on XY.* to user3 identified by 'haslo3';

-- ------------------------------------------

-- zad. 41.

revoke all privileges on XY.* from user3;

-- ------------------------------------------

-- zad. 42.

grant select on XY.* to user4 identified by 'haslo4';

-- ------------------------------------------

-- zad. 43.

create view Filmy_widok_4 as
	select Filmy.nazwa as tytul_filmu, cena, ilosc, Wypozyczalnie.nazwa, adres
    from Wypozyczalnie left outer join Filmy
    on Wypozyczalnie.id_wypoz=Filmy.fk_wypoz
    where cena > 0 and ilosc > 0 order by Filmy.nazwa;

-- ------------------------------------------

-- zad. 44.

create view Wypozycz_widok_1 as
	select Wypozyczalnie.nazwa, adres, telefon
    from Wypozyczalnie left outer join Filmy
    on Wypozyczalnie.id_wypoz=Filmy.fk_wypoz
    where Filmy.nazwa='Tytanik' and  Wypozyczalnie.godz_otwarcia < '09:00:00';

-- ------------------------------------------

-- zad. 45.

update Filmy_widok_3
	set ilosc = 2, adres = 'Wyszkow 7'
    where cena = 11.99;
