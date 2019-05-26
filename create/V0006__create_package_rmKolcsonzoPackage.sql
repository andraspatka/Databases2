----------------------------------------------------------------------------
-- Specifikacio
-- Archivalja az adott Kolcsonzohoz tartozo kolcsonzeseket es magat a
-- a kolcsonzot. Majd kitorli ezeket az adatbazisbol.
----------------------------------------------------------------------------
create or replace package rmKolcsonzoPackage as
    -- Fo procedura, ez lesz meghivva kintrol.
    -- Visszateritesi ertekek: 1 ha sikerult a torles, 0 ha nem.
    function remove(pKId Kolcsonzo.KId%TYPE) return number;
    
    -- Ellenorzi, hogy leteznek-e az archivalo tablak.
    function ellenorizArchivaloTablak return number;
    
    -- Ellenorzi, hogy letezik-e a rekord.
    function ellenorizKolcsonzo(pKId Kolcsonzo.KId%TYPE) return number;
    
    -- Archivalja az adott Kolcsonzohoz tartozo Kolcsonzeseket.
    procedure archivalKolcsonzesek(pKId Kolcsonzo.KId%TYPE);
    
    -- Letorli a Kolcsonzo Kolcsonzeseit az adatbazisbol.
    procedure rmKolcsonzesek(pKId Kolcsonzo.KId%TYPE);
    
    -- Archivalja a kolcsonzot.
    procedure archivalKolcsonzo(pKId Kolcsonzo.Kid%TYPE);
    
    -- Letorli a Kolcsonzot.
    procedure rmKolcsonzo(pKId Kolcsonzo.KId%TYPE);
end rmKolcsonzoPackage;