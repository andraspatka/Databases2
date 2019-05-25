----------------------------------------------------------------------------
-- Mufajok
----------------------------------------------------------------------------
INSERT INTO Mufajok VALUES (1,'romantikus');
INSERT INTO Mufajok VALUES (2,'akcio');
INSERT INTO Mufajok VALUES (3,'csaladi');
INSERT INTO Mufajok VALUES (4,'kaland');
INSERT INTO Mufajok VALUES (5,'thriller');
INSERT INTO Mufajok VALUES (6,'drama');

----------------------------------------------------------------------------
-- Filmek
----------------------------------------------------------------------------
INSERT INTO Filmek VALUES (1,'Nemo nyomaban','Walt Disney Pictures',3,0);
INSERT INTO Filmek VALUES (2,'Transformers','DreamWorks SKG',2,0);
INSERT INTO Filmek VALUES (3,'White noise','Brightlight Pictures',5,0);
INSERT INTO Filmek VALUES (4,'Finding Neverland','Miramax Films',1,0);
INSERT INTO Filmek VALUES (5,'Ket het mulva orokke','Castle Rock Entertainment',1,0);
INSERT INTO Filmek VALUES (6,'A remeny rabjai','Castle Rock Entertainment',6,0);
INSERT INTO Filmek VALUES (7,'Pillango hatas','BenderSpink',5,0);

----------------------------------------------------------------------------
-- DVDk
----------------------------------------------------------------------------
INSERT INTO DVDk VALUES (1,5);
INSERT INTO DVDk VALUES (2,5);
INSERT INTO DVDk VALUES (3,4);
INSERT INTO DVDk VALUES (4,6);
INSERT INTO DVDk VALUES (5,4);
INSERT INTO DVDk VALUES (6,7);
INSERT INTO DVDk VALUES (7,5);
INSERT INTO DVDk VALUES (8,2);

----------------------------------------------------------------------------
-- FilmekDVDn
----------------------------------------------------------------------------
INSERT INTO FilmekDVDn VALUES (1,4);
INSERT INTO FilmekDVDn VALUES (1,1);
INSERT INTO FilmekDVDn VALUES (1,2);
INSERT INTO FilmekDVDn VALUES (1,3);
INSERT INTO FilmekDVDn VALUES (1,5);
INSERT INTO FilmekDVDn VALUES (2,2);
INSERT INTO FilmekDVDn VALUES (2,3);
INSERT INTO FilmekDVDn VALUES (2,4);
INSERT INTO FilmekDVDn VALUES (2,5);
INSERT INTO FilmekDVDn VALUES (2,6);
INSERT INTO FilmekDVDn VALUES (3,1);
INSERT INTO FilmekDVDn VALUES (3,4);
INSERT INTO FilmekDVDn VALUES (3,6);
INSERT INTO FilmekDVDn VALUES (3,7);
INSERT INTO FilmekDVDn VALUES (4,1);
INSERT INTO FilmekDVDn VALUES (4,2);
INSERT INTO FilmekDVDn VALUES (4,5);
INSERT INTO FilmekDVDn VALUES (4,6);
INSERT INTO FilmekDVDn VALUES (5,3);
INSERT INTO FilmekDVDn VALUES (5,5);
INSERT INTO FilmekDVDn VALUES (6,1);
INSERT INTO FilmekDVDn VALUES (7,7);
INSERT INTO FilmekDVDn VALUES (8,2);
INSERT INTO FilmekDVDn VALUES (8,3);

----------------------------------------------------------------------------
-- Kolcsonzo
----------------------------------------------------------------------------
INSERT INTO Kolcsonzo VALUES(1,'Szilagyi Jeno','Kolozsvar, Scortarilor 79','0732067895');
INSERT INTO Kolcsonzo VALUES (2,'Andras Mihaly','Kolozsvar, Gr. Alexandrescu 5','0264435672');
INSERT INTO Kolcsonzo VALUES (3,'Kiraly Lorand','Kolozsvar, Unirii 1','0264789678');
INSERT INTO Kolcsonzo VALUES (4,'Csizmar Karoly','Nagyvarad, Closca 90','0260361739');
INSERT INTO Kolcsonzo VALUES (5,'Balogh Imre','Kolozsvar, Paris 3','0728345678');
INSERT INTO Kolcsonzo VALUES (6,'Andras Hannah','Kolozsvar, Gr. Alexandrescu 5','0264435672');
INSERT INTO Kolcsonzo VALUES (7,'Andor Zoltan','Kolozsvar, Fantanele 34','0780345678');
INSERT INTO Kolcsonzo VALUES (8,'Nagy Ildiko','Kolozsvar, Motilor 2','0751234786');
INSERT INTO Kolcsonzo VALUES (9,'Kollo Ingrid','Szatmarnemeti, Somesul 67','0261868685');
INSERT INTO Kolcsonzo VALUES (10,'Petok Ilona','Nagykaroly, Agoston 52','0728798789');

----------------------------------------------------------------------------
-- Kolcsonzesek
----------------------------------------------------------------------------
INSERT INTO Kolcsonzesek VALUES (2, 1, to_date('2011-06-15','YYYY-MM-DD'), to_date('2011-06-20','YYYY-MM-DD'), 250)  ; 
INSERT INTO Kolcsonzesek VALUES (1, 1, to_date('2011-06-20','YYYY-MM-DD'), to_date( '2011-06-25','YYYY-MM-DD'), 250);
INSERT INTO Kolcsonzesek VALUES (1, 1, to_date('2011-06-30','YYYY-MM-DD'), to_date( '2011-07-02','YYYY-MM-DD'), 10);
INSERT INTO Kolcsonzesek VALUES (3, 1, to_date('2011-07-02', 'YYYY-MM-DD'), to_date('2011-07-12','YYYY-MM-DD'), 100);
INSERT INTO Kolcsonzesek VALUES (3, 1, to_date('2011-07-12', 'YYYY-MM-DD'), to_date('2011-07-15','YYYY-MM-DD'), 15);
INSERT INTO Kolcsonzesek VALUES (4, 1, to_date('2011-07-20', 'YYYY-MM-DD'), to_date('2011-07-22', 'YYYY-MM-DD'),10);
INSERT INTO Kolcsonzesek VALUES (10, 1, to_date('2011-07-27','YYYY-MM-DD'), to_date( '2011-07-30', 'YYYY-MM-DD'),15);
INSERT INTO Kolcsonzesek VALUES (5, 1, to_date('2011-08-05', 'YYYY-MM-DD'), to_date('2011-08-15', 'YYYY-MM-DD'),100);
INSERT INTO Kolcsonzesek VALUES (3, 1, to_date('2011-09-01', 'YYYY-MM-DD'), to_date('2011-09-12','YYYY-MM-DD'), 20);
INSERT INTO Kolcsonzesek VALUES (2, 2,to_date( '2011-06-15','YYYY-MM-DD'), to_date( '2011-06-20','YYYY-MM-DD'), 250) ;  
INSERT INTO Kolcsonzesek VALUES (1, 2, to_date('2011-06-20', 'YYYY-MM-DD'), to_date('2011-06-25', 'YYYY-MM-DD'),250);
INSERT INTO Kolcsonzesek VALUES (1, 2, to_date('2011-06-30','YYYY-MM-DD'), to_date( '2011-07-02', 'YYYY-MM-DD'),10);
INSERT INTO Kolcsonzesek VALUES (3, 2, to_date( '2011-07-02', 'YYYY-MM-DD'), to_date('2011-07-12', 'YYYY-MM-DD'),100);
INSERT INTO Kolcsonzesek VALUES (3, 2, to_date('2011-07-12', 'YYYY-MM-DD'), to_date('2011-07-15','YYYY-MM-DD'), 15);
INSERT INTO Kolcsonzesek VALUES (4, 2, to_date('2011-07-20','YYYY-MM-DD'), to_date( '2011-07-22', 'YYYY-MM-DD'),10);
INSERT INTO Kolcsonzesek VALUES (10, 2, to_date('2011-07-27', 'YYYY-MM-DD'), to_date('2011-07-30','YYYY-MM-DD'), 15);
INSERT INTO Kolcsonzesek VALUES (5, 2, to_date( '2011-08-05', 'YYYY-MM-DD'), to_date('2011-08-15', 'YYYY-MM-DD'),100);
INSERT INTO Kolcsonzesek VALUES (3, 2, to_date('2011-09-01', 'YYYY-MM-DD'), to_date('2011-09-12','YYYY-MM-DD'), 20);
INSERT INTO Kolcsonzesek VALUES (2, 3,to_date( '2011-06-15','YYYY-MM-DD'), to_date( '2011-06-20', 'YYYY-MM-DD'),250)  ; 
INSERT INTO Kolcsonzesek VALUES (1, 3, to_date('2011-06-20', 'YYYY-MM-DD'), to_date('2011-06-25','YYYY-MM-DD'), 250);
INSERT INTO Kolcsonzesek VALUES (1, 3, to_date('2011-06-30', 'YYYY-MM-DD'), to_date('2011-07-02','YYYY-MM-DD'), 10);
INSERT INTO Kolcsonzesek VALUES (3, 3,to_date( '2011-07-02','YYYY-MM-DD'), to_date( '2011-07-12', 'YYYY-MM-DD'),100);
INSERT INTO Kolcsonzesek VALUES (3, 3, to_date('2011-09-01', 'YYYY-MM-DD'), to_date('2011-09-15','YYYY-MM-DD'), 20);
INSERT INTO Kolcsonzesek VALUES (2, 4, to_date('2011-06-15', 'YYYY-MM-DD'), to_date('2011-06-20','YYYY-MM-DD'), 250) ;  
INSERT INTO Kolcsonzesek VALUES (1, 4, to_date('2011-06-20','YYYY-MM-DD'), to_date( '2011-06-25','YYYY-MM-DD'), 250);
INSERT INTO Kolcsonzesek VALUES (3, 4, to_date('2011-09-01', 'YYYY-MM-DD'), to_date('2011-09-09','YYYY-MM-DD'), 20);
INSERT INTO Kolcsonzesek VALUES (5, 5,to_date( '2011-06-30','YYYY-MM-DD'), to_date( '2011-07-01','YYYY-MM-DD'), 4);
INSERT INTO Kolcsonzesek VALUES (9, 5, to_date('2011-07-12','YYYY-MM-DD'), to_date( '2011-07-15', 'YYYY-MM-DD'),12);
INSERT INTO Kolcsonzesek VALUES (10, 5, to_date('2011-07-20','YYYY-MM-DD'), to_date( '2011-07-22','YYYY-MM-DD'),8);
INSERT INTO Kolcsonzesek VALUES (5, 5, to_date('2011-07-25','YYYY-MM-DD'), to_date( '2011-07-31','YYYY-MM-DD'), 24);
INSERT INTO Kolcsonzesek VALUES (8, 5, to_date('2011-07-31','YYYY-MM-DD'), to_date( '2011-08-05', 'YYYY-MM-DD'),20);
INSERT INTO Kolcsonzesek VALUES (4, 5, to_date('2011-08-05','YYYY-MM-DD'), to_date( '2011-08-15','YYYY-MM-DD'), 40);
INSERT INTO Kolcsonzesek VALUES (3, 5, to_date('2011-09-01', 'YYYY-MM-DD'), to_date('2011-09-10','YYYY-MM-DD'), 20);
INSERT INTO Kolcsonzesek VALUES (4, 5, to_date('2011-09-10', 'YYYY-MM-DD'), to_date('2011-09-15', 'YYYY-MM-DD'),40);
INSERT INTO Kolcsonzesek VALUES (5, 6, to_date('2011-06-30','YYYY-MM-DD'), to_date( '2011-07-01','YYYY-MM-DD'), 4);
INSERT INTO Kolcsonzesek VALUES (9, 6,to_date( '2011-07-12','YYYY-MM-DD'), to_date( '2011-07-15','YYYY-MM-DD'), 12);
INSERT INTO Kolcsonzesek VALUES (10, 6, to_date('2011-07-20', 'YYYY-MM-DD'), to_date('2011-07-22','YYYY-MM-DD'), 8);
INSERT INTO Kolcsonzesek VALUES (8, 6, to_date('2011-07-31','YYYY-MM-DD'), to_date( '2011-08-05', 'YYYY-MM-DD'),20);
INSERT INTO Kolcsonzesek VALUES (4, 6,to_date('2011-08-05','YYYY-MM-DD'), to_date( '2011-08-15', 'YYYY-MM-DD'),40);
INSERT INTO Kolcsonzesek VALUES (3, 6, to_date('2011-09-01','YYYY-MM-DD'), to_date( '2011-09-10','YYYY-MM-DD'), 20);
INSERT INTO Kolcsonzesek VALUES (4, 6,to_date( '2011-09-10', 'YYYY-MM-DD'), to_date('2011-09-15', 'YYYY-MM-DD'),40);
INSERT INTO Kolcsonzesek VALUES (1, 8,to_date( '2011-06-20','YYYY-MM-DD'), to_date( '2011-06-25', 'YYYY-MM-DD'),250);
INSERT INTO Kolcsonzesek VALUES (1, 8, to_date('2011-06-30','YYYY-MM-DD'), to_date( '2011-07-02', 'YYYY-MM-DD'),10);
INSERT INTO Kolcsonzesek VALUES (3, 8, to_date('2011-07-02','YYYY-MM-DD'), to_date( '2011-07-12', 'YYYY-MM-DD'),100);
INSERT INTO Kolcsonzesek VALUES (3, 8, to_date('2011-09-01','YYYY-MM-DD'), to_date( '2011-09-15','YYYY-MM-DD'), 20);