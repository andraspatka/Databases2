----------------------------------------------------------------------------
-- Amikor bejon egy uj kritika, akkor frissiti az adott filmnek az ossz 
-- ertekeleset.
----------------------------------------------------------------------------
create or replace trigger kritika_utan_ertekeles
after insert
    on Kritikak
    for each row
declare
    pragma autonomous_transaction;
    lAvg number;
begin
    select round(avg(Ertekeles),1) into lAvg from Kritikak where FilmId = :new.FilmId;
    update filmek Set(Ertekeles) = lAvg Where FilmId = :new.FilmId;
    commit;
end kritika_utan_ertekeles;