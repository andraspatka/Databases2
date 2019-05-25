# Databases2
Adatbázis II projekt

## Package 1 - Kölcsönzés elvégzése

 - Package neve: kolcsonozPackage
 - Leírás: Egy DVD kikölcsönzése.
 - Paraméterek: pFilmId, pKolcsonzoNev, pKCim, pKTel, pDatumKi, pDatumVissza, outLehetsegesDVD.
 - Visszatérítési érték: 
    - 0, ha ki lehet kölcsönözni azt amit akart.
    - -1, ha nem lehet kikölcsönözni azt amit akart. Ekkor:
        - outLehetsegesDVD paraméterben visszatérítjük a lehetséges DVD ID-ját
    - 2, ha nincs lehetséges DVD sem.

## Package 2 - Kölcsönző eltávolítása

 - Package neve: rmKolcsonzoPackage
 - Leírás: Kölcsönző archiválása és kitörlélse az adatbázisból. Megnézi, hogy léteznek-e az archiváló táblák, hogyha igen:
   - beszúrja ide a kitörlendő kölcsönzőhöz tartozó kölcsönzéseket
   - kitörli a kölcsönzéseket az adatbázisból
   - beszúrja ide a kölcsönző adatait
   - kitörli az adatbázisból a kölcsönzőt.
 - Paraméterek: pKId
select * from tab where tname = 'KOLCSONZO';

## Package 3 

 - package neve: kritikaPackage
 - Leírás: Hozzáad egy kritikát az adatbázishoz. Ha a kritikus még nem létezik, akkor hozzáadja őt is az adatbázishoz. Ellenőrzi, hogyha a kritikus már létezik, akkor van-e már kritikája az adott filmre, mivel egy adott filmre egy kritikus csakis egy kritikát tehet.
 - Paraméterek: pNev, pCim, pTelefon, pFilmId, pKritika, pErtekeles

## Trigger 1

Amikor egy kritikus bevezet egy kritikát, akkor frissítsük a film össz értékelését.

## Trigger 2

Ha egy filmnek jobb, mint 4.5-ös kritikája van, akkor minden DVD-nek felvisszük az árát 10%-al, amelyen az adott film van.