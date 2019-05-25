-- create the tablespace
CREATE TABLESPACE tbs_rent_dvd DATAFILE 'tbs_rent_dvd.dat' SIZE 10M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE 200M;
-- create the user
CREATE USER rent IDENTIFIED BY rent DEFAULT TABLESPACE tbs_rent_dvd QUOTA 20M on tbs_rent_dvd;
-- grant privileges
GRANT ALL PRIVILEGES TO rent;