CREATE TABLE Mufajok(
 MufajID number(3)  primary key,
 MufajNev varchar2(30)
);

CREATE TABLE Filmek(
 FilmID number(3)  primary key,
 FCim varchar2(30),
 Studio varchar2(30),
 MufajID number(3) references Mufajok(MufajID),
 Ertekeles number(3)
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

CREATE TABLE Kolcsonzok_archive(
    KArchiveID number(3),
    Nev varchar2(30),
    Cim varchar2(30),
    Telefon varchar2(10),
    Primary key(KArchiveID)
);

CREATE TABLE Kolcsonzesek_archive(
    KArchiveID number(3) references Kolcsonzok_archive(KArchiveID),
    FCim varchar2(30),
    Studio varchar2(30),
    MufajNev varchar2(30),
    DatumKi date,
    DatumVissza date
);

CREATE TABLE Kritikusok(
    KritikusId number(3) primary key,
    Knev varchar2(20),
    KTelefon varchar2(10)
);

CREATE TABLE Kritikak(
    KritikaId number(3) primary key,
    KritikusId number(3) references Kritikusok(KritikusId),
    Kritika varchar2(500),
    FilmId number(3) references Filmek(FilmId),
    Ertekeles number(3)
);
