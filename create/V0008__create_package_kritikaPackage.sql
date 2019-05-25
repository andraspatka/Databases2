----------------------------------------------------------------------------
-- Specifikacio
-- Hozzaad egy kritikat az adatbazishoz.
-- Hogyha az adott kritikus, aki a kritikat irta, nincs benne az adatbazisban, akkor
-- adjuk hozza ot is.
-- Hogyha az adott kritikus mar irt kritikat arra a filmre, akkor 0-at teritunk vissza.
----------------------------------------------------------------------------
create or replace package kritikaPackage as
    -- Fo procedura, ez lesz meghivva kintrol.
    -- Visszateritesi ertek: 1, ha sikerult a beszuras.
    -- Visszateritesi ertek: 0, ha nem sikerult.
    function kritika(
        pNev Kolcsonzo.Nev%TYPE,
        pTelefon Kolcsonzo.Telefon%TYPE,
        pFilmId Filmek.FilmId%TYPE,
        pKritika Kritikak.Kritika%TYPE,
        pErtekeles Filmek.Ertekeles%TYPE
    ) return number;
    
    -- Ellenorzi, hogy letezik-e mar a Kritikus.
    -- Ha nem letezik akkor: -1-et terit vissza
    -- Ha letezik akkor a KritikusId-t
    function ellenorizKritikusLetezik(pTelefon Kritikusok.KTelefon%TYPE) return number;

    -- Ellenorzi, hogy van-e mar kritika arra a filmre.
    -- 1 - ha van
    -- 0 - ha nincs
    function ellenorizVanEKritika(
        pKId Kritikusok.KritikusId%TYPE,
        pFilmId Filmek.FilmId%TYPE
    ) return number;

    -- General ID-t a Kritikusnak
    function generalKritikusId return number;
    
    -- Beszur egy Kritikust a Kritikusok tablaba.
    procedure beszurKritikus(
        pKId Kritikusok.KritikusId%TYPE,
        pNev Kritikusok.KNev%TYPE,
        pTelefon Kritikusok.KTelefon%TYPE
    );

    -- Beszur egy Kritikat a Kritikak tablaba.
    procedure beszurKritika(
        pKritikusId Kritikusok.KritikusId%TYPE,
        pKritika Kritikak.Kritika%TYPE,
        pFilmId Filmek.FilmId%TYPE,
        pErtekeles Kritikak.Ertekeles%TYPE
    );
end kritikaPackage;