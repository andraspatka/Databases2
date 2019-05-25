----------------------------------------------------------------------------
-- Implementacio
----------------------------------------------------------------------------
create or replace package body kritikaPackage as
    -- Fo procedura, ez lesz meghivva kintrol.
    -- Visszateritesi ertek: 1, ha sikerult a beszuras.
    -- Visszateritesi ertek: 0, ha nem sikerult.
    function kritika(
        pNev Kolcsonzo.Nev%TYPE,
        pTelefon Kolcsonzo.Telefon%TYPE,
        pFilmId Filmek.FilmId%TYPE,
        pKritika Kritikak.Kritika%TYPE,
        pErtekeles Filmek.Ertekeles%TYPE
    ) return number
    is
        lKritikusId Kritikusok.KritikusId%TYPE;
    begin
        savepoint kritikaSavepoint;
        lKritikusId := ellenorizKritikusLetezik(pTelefon);
        if  lKritikusId = -1 then
            lKritikusId := generalKritikusId;
            beszurKritikus(lKritikusId, pNev, pTelefon);
        else 
            if ellenorizVanEKritika(lKritikusId, pFilmId) = 1 then
                dbms_output.put_line('Mar van ilyen Kritika');
                return 0;
            end if;
        end if;
        beszurKritika(lKritikusId, pKritika, pFilmId, pErtekeles);
        
        commit;
        return 1;
        exception when others then
            rollback to kritikaSavepoint;
            dbms_output.put_line('Exception');
            return 0;
    end kritika;
    
    -- Ellenorzi, hogy letezik-e mar a Kritikus.
    -- Ha nem letezik akkor: -1-et terit vissza
    -- Ha letezik akkor a KritikusId-t
    function ellenorizKritikusLetezik(pTelefon Kritikusok.KTelefon%TYPE) return number
    is
        lKritikusLetezik number;
        lKritikusId Kritikusok.KritikusId%TYPE;
    begin
        dbms_output.put_line('TODO');
        select count(*) into lKritikusLetezik from Kritikusok where KTelefon = pTelefon;
        if lKritikusLetezik > 0 then
            select KritikusId into lKritikusId from Kritikusok where KTelefon = pTelefon;
            return lKritikusId;
        end if;

        return -1;
    end ellenorizKritikusLetezik;

    -- General egy Id-t a Kritikusnak.
    function generalKritikusId return number
    is
        lKritikusId Kritikusok.KritikusId%TYPE;
        lCount number;
    begin
        select count(*) into lCount FROM Kritikusok;
        if lCount = 0 then
            return 1;
        else
            select max(KritikusId) + 1 into lKritikusId from Kritikusok;
        end if;
        return lKritikusId;
    end generalKritikusId;

    -- Ellenorzi, hogy van-e mar kritika arra a filmre.
    -- 1 - ha van
    -- 0 - ha nincs
    function ellenorizVanEKritika(
        pKId Kritikusok.KritikusId%TYPE,
        pFilmId Filmek.FilmId%TYPE
    ) return number
    is
        lVanKritika number;
    begin
        select count(*) into lVanKritika From Kritikak Where FilmId = pFilmId AND KritikusId = pKId;
        if lVanKritika > 0 then
            return 1;
        else
            return 0;
        end if;
    end ellenorizVanEKritika;
    
    -- Beszur egy Kritikust a Kritikusok tablaba.
    procedure beszurKritikus(
        pKId Kritikusok.KritikusId%TYPE,
        pNev Kritikusok.KNev%TYPE,
        pTelefon Kritikusok.KTelefon%TYPE
    )
    is
    begin
        insert into Kritikusok values(pKId, pNev, pTelefon);
        dbms_output.put_line('Beszurt kritikust: ' || pkId || ' ' || pNev || ' ' || pTelefon);
    end beszurKritikus;

    -- Beszur egy Kritikat a Kritikak tablaba.
    procedure beszurKritika(
        pKritikusId Kritikusok.KritikusId%TYPE,
        pKritika Kritikak.Kritika%TYPE,
        pFilmId Filmek.FilmId%TYPE,
        pErtekeles Kritikak.Ertekeles%TYPE
    )
    is
        lKritikaId number;
    begin
        select count(*) into lKritikaId from Kritikak;
        if lKritikaId = 0 then
            lKritikaId := 1;
        else
            select max(KritikaId) + 1 into lKritikaId from Kritikak;
        end if;
        insert into Kritikak values(lKritikaId, pKritikusId, pKritika, pFilmId, pErtekeles);
        dbms_output.put_line('Beszurt kritikat: ' || lKritikaId || ' ' || pFilmId);
    end beszurKritika;
end kritikaPackage;;

