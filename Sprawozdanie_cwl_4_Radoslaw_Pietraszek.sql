-- Zadanie 8.
create table Ksiazki(
	tytul varchar(45) not null,
	autor_imie varchar(20) not null,
  autor_nazw varchar(20) not null,
  cena float(4,2) not null,
  ilosc int not null,
  data_wydania date null,
  gatunek varchar(45) null,
  opis varchar(60) null);

-- Zadanie 9.
describe Ksiazki;

-- Zadanie 10.
show columns from Ksiazki;

-- Zadanie 11.
select * from Ksiazki;

-- Zadanie 12.
insert into Ksiazki values('Potop', 'Henryk', 'Sienkiewicz', 39.99, 10, '2001-02-11', 'przygodowa', 'lektura szkolna');
insert into Ksiazki values('Ogniem i Mieczem', 'Henryk', 'Sienkiewicz', 39.99, 2, '1884-01-01', 'przygodowo historyczna', 'lektura szkolna');
insert into Ksiazki values('Pan Wołodyjowski', 'Henryk', 'Sienkiewicz', 39.99, 3, '1888-01-01', 'przygodowo historyczna', 'lektura');
insert into Ksiazki values('Ostatnie życzenie', 'Andrzej', 'Sapkowski', 39.06, 1, '1993-01-01', 'przygodowa fantasy', 'zbiór opowiadań');
insert into Ksiazki values('Hobbit', 'J. R. R.', 'Tolkien', 21.59, 4, '1937-01-01', 'przygodowa fantasy', 'tam i z powrotem');
insert into Ksiazki values('Władca Pierścieni', 'J. R. R.', 'Tolkien', 75.17, 3, '1954-01-01', 'przygodowa fantasy', 'trylogia');
insert into Ksiazki values('Silmarillion', 'J. R. R.', 'Tolkien', 59.93, 1, '1977-01-01', 'fantasy', 'Przed trzecią erą');
insert into Ksiazki values('Gamedec', 'Marcin', 'Przybyłek', 26.23, 8, ' 2021-09-07 ', 'sci-fi', 'granica rzeczywistości');
insert into Ksiazki values('Neuromancer', 'William', 'Gibson', 36.60, 5, '1984-07-01', 'cyberpunk', 'trylogia ciągu');
insert into Ksiazki values('Motocyklista doskonały', 'David', 'Hugh', 56.50, 6, '2000-01-01', 'hobby i rozwój', 'poradnik dla motocyklistów');
insert into Ksiazki values('Nauka programowania', 'Eric', 'Freeman', 59.40, 10, '2019-03-19', 'informatyka', 'wprowadzenie do kodowania');
insert into Ksiazki values('Black Hat Python', 'Justin', 'Seitz', 38.19, 2, ' 2022-03-01', 'informatyka', 'Python dla pentesterów');
insert into Ksiazki values('Mitologia Nordycka', 'Neil', 'Gaiman', 26.25, 7, '2017-03-01', 'fantasy', 'zbiór opowiadań');
insert into Ksiazki values('Baśnie barda Beedlea', 'J. K.', 'Rowling', 46.00, 5, '2008-12-04', 'fantasy', 'zbiór baśni');
insert into Ksiazki values('Baśnie braci Grimm', 'Wilhelm, Jacob', 'Grimm', 59.25, 4, '1812-01-01', 'fantasy dziecięce', 'zbiór baśni');
insert into Ksiazki values('Harry Potter', 'J. K.', 'Rowling', 12.80, 7, '2000-01-01', 'przygodowe fantasy', 'magiczna historia');
insert into Ksiazki values('Podróże Guliwera', 'Jonathan', 'Swift', 27.67, 1, '1726-01-01', 'przygodowo podróżnicza', 'ciekawość świata');
insert into Ksiazki values('Pingwiny wódki nie piją', 'Dawid', 'Fazowski', 49.99, 10, '2021-01-01', 'podróżnicza', 'przez świat na fazie');
insert into Ksiazki values('Czysty kod w Pythonie', 'Sunil', 'Kapil', 33.99, 2, '2020-01-01', 'informatyka', 'czas na porządki');
insert into Ksiazki values('Kali linux', 'Ric', 'Messier', 63.39, 2, '2019-06-25', 'informatyka', 'testy bezpieczeństwa');
insert into Ksiazki values('Bezpieczeństwo aplikacji webowych', 'sekurak', 'securitum', 124.95, 1, '2020-01-01', 'informatyka', 'cyberbezpieczeństwo');

-- Zadanie 13.
select count(*) from Ksiazki;

-- Zadanie 14.
select * from Ksiazki;

-- Zadanie 15.
select tytul, autor_imie, autor_nazw, opis from Ksiazki
	where autor_imie in ('Henryk', 'Jan', 'Adam')
	order by autor_nazw;

-- Zadanie 16.
select sum(ilosc) from Ksiazki;

-- Zadanie 17.
select min(ilosc), tytul, autor_imie, autor_nazw from Ksiazki;

-- Zadanie 18.
select max(ilosc), tytul, autor_imie, autor_nazw from Ksiazki;

-- Zadanie 19.
select tytul, autor_imie, autor_nazw, opis, length(opis) from Ksiazki order by autor_nazw;

-- Zadanie 20.
select tytul, autor_imie, autor_nazw, right(opis,5) from Ksiazki order by autor_nazw;

-- Zadanie 21.
select tytul, autor_imie, autor_nazw, lower(opis) from Ksiazki order by autor_nazw;

-- Zadanie 22.
select tytul, autor_imie, upper(autor_nazw), opis from Ksiazki order by autor_nazw;

-- Zadanie 23.
select tytul, autor_imie, autor_nazw, opis from Ksiazki where soundex(autor_imie) =
soundex('Henric') order by autor_nazw;

-- Zadanie 24.
delete from Ksiazki where autor_imie='Adolf' or cena < 2;

-- Zadanie 25.
select * from Ksiazki where cena < (select cena from Ksiazki where tytul like 'Potop');

-- Zadanie 26.
select * from Ksiazki as k where k.ilosc > 3 and k.cena < 50;

-- Zadanie 27.
select * from Ksiazki where ilosc = (select ilosc from Ksiazki where data_wydania = '2001-02-11');

-- Zadanie 28.
select * from Ksiazki where autor_nazw = 'Sienkiewicz'
union
select * from Ksiazki where autor_nazw = 'Tolkien';

-- Zadanie 29.
select * from Ksiazki where autor_nazw = 'Sienkiewicz' and data_wydania > '2001-12-31';

-- Zadanie 30.
select tytul, autor_imie, autor_nazw, left(opis,5) from Ksiazki;

-- Zadanie 31.
delete from Ksiazki where autor_nazw like 'S%' and cena > 4 and cena < 40 and ilosc > 5 and ilosc < 15;

-- Zadanie 32.
delete from Ksiazki where autor_nazw != 'Mickiewicz' and cena < 1.5;
