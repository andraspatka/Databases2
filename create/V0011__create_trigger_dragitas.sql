----------------------------------------------------------------------------
-- Kritika beszurasa utan es amiutan kiszamolodott az atlag ertekeles
-- megdragitja azoknak a dvdk-nek az arat amelyeken a film atlag ertekelese
-- nagyobb, mint 4
----------------------------------------------------------------------------
create or replace trigger kritika_utan_dragitas
after insert on Kritikak
    for each row
    follows kritika_utan_ertekeles
declare
    lErtekeles number;
    type tDvdId is table of Dvdk.DvdId%TYPE;
    lDragitandoDvdk tDvdId;
begin
    select Ertekeles into lErtekeles from Filmek where filmId = :new.FilmId;
    if lErtekeles >= 4 then
        SELECT d.dvdId BULK COLLECT INTO lDragitandoDvdk
            FROM FilmekDvDn f 
            JOIN Dvdk d 
            ON d.DVDID = f.DVDID 
            WHERE f.FilmId = :new.FilmId;
        if lDragitandoDvdk.count > 0 then
            for i in 1 .. lDragitandoDvdk.count
            loop
                update dvdk set(napiar) = (select napiAr + 1 from dvdk where dvdId = lDragitandoDvdk(i))
                where dvdId = lDragitandoDvdk(i);
            end loop;
        end if;
    end if;

end kritika_utan_dragitas;;

