--Implementacio
create or replace package body kolcsonzesekPackage as
  --Elvegez egy kolcsonzest az elejetol a vegeig
  function kolcsonoz(
    pFilmID Filmek.FilmId%TYPE,
    pKolcsonzoNev Kolcsonzo.Nev%TYPE,
    pKCim Kolcsonzo.Cim%TYPE,
    pKTel Kolcsonzo.Telefon%TYPE,
    pDatumKi Kolcsonzesek.DatumKi%TYPE,
    pDatumVissza Kolcsonzesek.DatumVissza%TYPE,
    outLehetsegesDVD out Dvdk.DvdId%TYPE 
  ) return number
  is
    lKolcsonzoCount number;
    lKolcsonzoId kolcsonzo.KId%TYPE;
    lSzabadDvd dvdk.dvdId%TYPE;
    type tFilmIdk is table of Filmek.FilmId%TYPE;
    lFilmIdk tFilmIdk;
  begin
    select count(*) into lKolcsonzoCount from kolcsonzo where nev = pKolcsonzoNev;
    if (lKolcsonzoCount = 0) then --Ha nincs mar ilyen kliens, beszurja
      beszurKolcsonzo(pKolcsonzoNev, pKCim, pKTel, lKolcsonzoId);
    else --Ha mar van, akkor lekeri az ID-jat
      select kid into lKolcsonzoId from kolcsonzo where nev = pKolcsonzoNev;
    end if;
    --Kivalaszt egy szabad DVD-t
    select szabadDvd(pFilmId, pDatumKi, pDatumVissza) into lSzabadDvd from dual;
    if (lSzabadDvd = -1) then --Nincs szabad DVD
      --Keres hasonlo filmet
      select filmId bulk collect into lFilmIdk
      from filmek where mufajId = (select mufajId from filmek where filmId = pFilmId) AND filmId != pFilmId;
      if (lFilmIdk.count = 0) then
        dbms_output.put_line('Nincs hasonlo mufaju film.');
        return 2;
      end if;
      for i in 1 .. lFilmIdk.count
      loop
        lSzabadDvd := szabadDvd(lFilmIdk(i), pDatumKi, pDatumVissza);
        if (lSzabadDvd != -1) then
          dbms_output.put_line('Kapott hasonlo mufaju filmet.');
          outLehetsegesDvd := lSzabadDvd;
          return -1;
        end if;
      end loop;
    else
      beszurKolcsonzes(lKolcsonzoId, lSzabadDvd, pDatumKi, pDatumVissza);
      return 0;
    end if;
  end kolcsonoz;

  --Megnezi, hogy ket datumintervallum metszi-e egymast. 1 ha igen, 0 ha nem.
	function datumMetszet(
	  pElsoKezd Kolcsonzesek.DatumKi%TYPE,
	  pElsoVeg Kolcsonzesek.DatumVissza%TYPE,
	  pMasodikKezd Kolcsonzesek.DatumKi%TYPE,
	  pMasodikVeg Kolcsonzesek.DatumVissza%TYPE
	) return number
  is
  begin
    if pElsoKezd <= pMasodikVeg AND pMasodikKezd <= pElsoVeg then 
				return 1; --metszi
		else return 0; --nem metszi
		end if;
  end datumMetszet;

  --Visszaterit egy szabad DVD-t, amin rajta van az adott film és nincs kikolcsonozve az adott periodusban
  function szabadDvd(
    pFilmId Filmek.FilmId%TYPE,
    pDatumKi Kolcsonzesek.DatumKi%TYPE,
    pDatumVissza Kolcsonzesek.DatumVissza%TYPE
  ) return number
  is
    type tDvdId is table of Dvdk.DvdId%TYPE;
    lSzabadDvdk tDvdId;
  begin
    --Kivalasztja az olyan dvd-ket amiken rajta van a film ES nincsenek kikolcsonozve
    select dvdid bulk collect into lSzabadDvdk 
    from(
      select dvdid from filmekdvdn where filmid = pFilmId
      minus
      select dvdid from kolcsonzesek k 
      where kolcsonzesekPackage.datumMetszet(k.datumki, k.datumvissza, pDatumKi, pDatumVissza)=1 and dvdId in (select dvdid from filmekdvdn where filmid = pFilmId)
    );
    if (lSzabadDvdk.count = 0) then
      return -1;
    else
      return lSzabadDvdk(1);
    end if;
  end szabadDvd;

  --Beszur egy Kolcsonzot a Kolcsonzo tablaba
  procedure beszurKolcsonzo(
    pNev Kolcsonzo.Nev%TYPE,
    pCim Kolcsonzo.Cim%TYPE,
    pTelefon Kolcsonzo.Telefon%TYPE,
    outKId out Kolcsonzo.Kid%TYPE
  )
  is
  begin
    insert into kolcsonzo values((select max(KId)+1 from kolcsonzo), pNev, pCim, pTelefon) returning Kid into outKId;
  end;

  --Beszur egy kolcsonzest
  procedure beszurKolcsonzes(
    pKId Kolcsonzo.Kid%TYPE,
    pDvdId Dvdk.DvdId%TYPE,
    pDatumKi Kolcsonzesek.DatumKi%TYPE,
    pDatumVissza Kolcsonzesek.DatumVissza%TYPE
  )
  is
    lErtek Kolcsonzesek.Ertek%TYPE;
  begin
    select (pDatumVissza - pDatumKi) * napiar into lErtek from dvdk where dvdid = pDvdId;
    insert into kolcsonzesek values(pKId, pDvdId, pDatumKi, pDatumVissza, lErtek);
    dbms_output.put_line('Sikeresen beszurt a kolcsonzes tablaba');
  end beszurKolcsonzes;
end kolcsonzesekPackage;