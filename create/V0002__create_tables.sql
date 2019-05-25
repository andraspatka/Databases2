CREATE TABLE Mufajok(
 MufajID number(3)  primary key,
 MufajNev varchar2(30)
);

CREATE TABLE Filmek(
 FilmID number(3)  primary key,
 FCim varchar2(30),
 Studio varchar2(30),
 MufajID number(3) references Mufajok(MufajID)
);

CREATE TABLE DVDk(
 DVDID number(3)  primary key,
 NapiAr number(3)
);

CREATE TABLE FilmekDVDn(
 DVDID number(3) references DVDk(DVDID),
 FilmID number(3) references Filmek(FilmID),
 primary key(DVDID, FilmID)
);

CREATE TABLE Kolcsonzo(
 KID number(3)  primary key,
 Nev varchar2(30),
 Cim varchar2(30),
 Telefon varchar2(10)	
);

CREATE TABLE Kolcsonzesek(
 KID number(3) references Kolcsonzo(KID),
 DVDID number(3) references DVDk(DVDID),
 DatumKi date, 
 DatumVissza date, 
 Ertek int,
 Primary key(KID, DVDID, DatumKi)
);