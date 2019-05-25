--Specifikacio
create or replace package kolcsonzesekPackage as
  --Elvegez egy kolcsonzest az elejetol a vegeig
  function kolcsonoz(
    pFilmID Filmek.FilmId%TYPE,
    pKolcsonzoNev Kolcsonzo.Nev%TYPE,
    pKCim Kolcsonzo.Cim%TYPE,
    pKTel Kolcsonzo.Telefon%TYPE,
    pDatumKi Kolcsonzesek.DatumKi%TYPE,
    pDatumVissza Kolcsonzesek.DatumVissza%TYPE,
    outLehetsegesDVD out Dvdk.DvdId%TYPE 
  ) return number;
  --Megnezi, hogy ket datumintervallum metszi-e egymast. 1 ha igen, 0 ha nem.
	function datumMetszet(
	  pElsoKezd Kolcsonzesek.DatumKi%TYPE,
	  pElsoVeg Kolcsonzesek.DatumVissza%TYPE,
	  pMasodikKezd Kolcsonzesek.DatumKi%TYPE,
	  pMasodikVeg Kolcsonzesek.DatumVissza%TYPE
	) return number;
  --Visszaterit egy szabad DVD-t, amin rajta van az adott film es nincs kikolcsonozve az adott periodusban
  function szabadDvd(
    pFilmId Filmek.FilmId%TYPE,
    pDatumKi Kolcsonzesek.DatumKi%TYPE,
    pDatumVissza Kolcsonzesek.DatumVissza%TYPE
  ) return number;
  --Beszur egy Kolcsonzot a Kolcsonzo tablaba
  procedure beszurKolcsonzo(
    pNev Kolcsonzo.Nev%TYPE,
    pCim Kolcsonzo.Cim%TYPE,
    pTelefon Kolcsonzo.Telefon%TYPE,
    outKId out Kolcsonzo.Kid%TYPE
  );
  --Beszur egy kolcsonzest
  procedure beszurKolcsonzes(
    pKId Kolcsonzo.Kid%TYPE,
    pDvdId Dvdk.DvdId%TYPE,
    pDatumKi Kolcsonzesek.DatumKi%TYPE,
    pDatumVissza Kolcsonzesek.DatumVissza%TYPE
  );
end kolcsonzesekPackage;