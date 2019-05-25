----------------------------------------------------------------------------
-- Specifikacio
-- Archivalja az adott Kolcsonzohoz tartozo kolcsonzeseket es magat a
-- a kolcsonzot. Majd kitorli ezeket az adatbazisbol.
----------------------------------------------------------------------------
create or replace package body rmKolcsonzoPackage as
    -- Fo procedura, ez lesz meghivva kintrol.
    -- Visszateritesi ertekek: 1 ha sikerult a torles, 0 ha nem.
    function remove(pKId Kolcsonzo.KId%TYPE) return number
    is
    begin
        savepoint removeSavePoint;
        if (ellenorizArchivaloTablak = 0) then
            return 0;
        end if;
        if (ellenorizKolcsonzo(pKId) = 0) then
            return 0;
        end if;
        archivalKolcsonzo(pKId);
        archivalKolcsonzesek(pKId);
        rmKolcsonzesek(pKId);
        rmKolcsonzo(pKId);

        -- Valtoztatasok elmentese
        commit;
        return 1;
        exception when others then
            -- Rollback a savepointra
            rollback to removeSavePoint;
            return 0;
    end remove;

    -- Ellenorzi, hogy leteznek-e az archivalo tablak.
    function ellenorizArchivaloTablak return number
    is
        lKolcsonzesekArchiveLetezik number;
        lKolcsonzokArchiveLetezik number;
    begin
        select count(*) into lKolcsonzesekArchiveLetezik from TAB where TNAME = 'KOLCSONZESEK_ARCHIVE';
        select count(*) into lKolcsonzokArchiveLetezik from TAB where TNAME = 'KOLCSONZOK_ARCHIVE';

        if lKolcsonzesekArchiveLetezik = 1 AND lKolcsonzokArchiveLetezik = 1 then
            return 1;
        else 
            return 0;
        end if;
    end ellenorizArchivaloTablak;

    -- Ellenorzi, hogy letezik-e a torlendo rekord.
    function ellenorizKolcsonzo(pKId Kolcsonzo.KId%TYPE) return number
    is
        lLetezikKolcsonzo number;
    begin
        select count(*) into lLetezikKolcsonzo from Kolcsonzo where KId = pKId;
        if lLetezikKolcsonzo > 0 then
            return 1;
        else
            return 0;
        end if;
    end ellenorizKolcsonzo;

    -- Archivalja az adott Kolcsonzohoz tartozo Kolcsonzeseket.
    procedure archivalKolcsonzesek(pKId Kolcsonzo.KId%TYPE)
    is
    begin
        INSERT INTO Kolcsonzesek_archive(
            SELECT k.KId,
                (SELECT d.DVDID FROM Kolcsonzesek kb, Dvdk d 
                    WHERE kb.dvdId = k.dvdId 
                        AND kb.Kid = k.KId 
                        AND kb.DatumKi = k.DATUMKI 
                        AND d.DVDID = kb.DVDID),
                k.DATUMKI,
                k.DATUMVISSZA
            FROM KOLCSONZESEK k
            WHERE k.KId = pKId);
        dbms_output.put_line('Arhivalta a Kolcsonzeseket: ' || pKId);
    end archivalKolcsonzesek;
    
    -- Letorli a Kolcsonzo Kolcsonzeseit az adatbazisbol.
    procedure rmKolcsonzesek(pKId Kolcsonzo.KId%TYPE)
    is
    begin
        DELETE FROM KOLCSONZESEK WHERE KId = pKId;
        dbms_output.put_line('Letorolte a kolcsonzeseket: ' || pKId);
    end rmKolcsonzesek;

    -- Archivalja a kolcsonzot.
    procedure archivalKolcsonzo(pKId Kolcsonzo.Kid%TYPE)
    is
    begin
        INSERT INTO KOLCSONZOK_ARCHIVE(SELECT * FROM Kolcsonzo WHERE KId = pKId);
        dbms_output.put_line('Arhivalta a Kolcsonzot: ' || pKId);
    end archivalKolcsonzo;
    
    -- Letorli a Kolcsonzot.
    procedure rmKolcsonzo(pKId Kolcsonzo.KId%TYPE)
    is
    begin
        DELETE FROM KOLCSONZO WHERE KId = pKId;
        dbms_output.put_line('Letorolte a kolcsonzot: ' || pKId);
    end;
end rmKolcsonzoPackage;;

