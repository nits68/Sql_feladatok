/*Megold�sok*/

-- 2. feladat: insert into
INSERT INTO filmek(id, ev, nyert, magyar, cim, bemutato) VALUES
( 900,2020,1,"Még egy kört mindenkinek","Druk",null);

-- 3. feladat: update
UPDATE filmek SET id = 1234
WHERE id = 900; 

-- 4. feladat: 
DELETE FROM filmek
WHERE magyar = 'Még egy kört mindenkinek';

-- 5. feladat:
SELECT ev, cim
FROM filmek
WHERE nyert IS TRUE
ORDER BY ev;

-- 6.feladat:
SELECT ev
FROM filmek
GROUP BY ev
HAVING COUNT(ev) >= 10;

-- 7.feladat
SELECT cim
FROM filmek
WHERE ev >= 1939 AND ev <= 1945
AND bemutato IS NOT NULL;

-- 8.feladat
SELECT cim 
FROM filmek
WHERE YEAR(bemutato) - ev >= 10;

-- 9.feladat
SELECT nev, MAX(ev)-MIN(ev) AS eltelt_ido, COUNT(filmek.id) AS db
FROM kapcsolatok
  INNER JOIN filmek
    ON kapcsolatok.filmId = filmek.id
  INNER JOIN keszitok
    ON kapcsolatok.keszitoId = keszitok.id
WHERE nyert = TRUE
GROUP BY nev
HAVING db>1;

-- 10.feladat
SELECT DISTINCT
  keszitok.nev
FROM kapcsolatok
  INNER JOIN filmek
    ON kapcsolatok.filmId = filmek.id
  INNER JOIN keszitok
    ON kapcsolatok.keszitoId = keszitok.id
WHERE producer = TRUE
AND nev != "Clint Eastwood"
AND filmek.id IN (SELECT
    filmek.id
  FROM kapcsolatok
    INNER JOIN filmek
      ON kapcsolatok.filmId = filmek.id
    INNER JOIN keszitok
      ON kapcsolatok.keszitoId = keszitok.id
  WHERE producer = TRUE
  AND nev = "Clint Eastwood");

-- 11.feladat
SELECT
  nev
FROM keszitok
WHERE producer = TRUE
AND id NOT IN (SELECT DISTINCT
    keszitok.id
  FROM kapcsolatok
    INNER JOIN filmek
      ON kapcsolatok.filmId = filmek.id
    INNER JOIN keszitok
      ON kapcsolatok.keszitoId = keszitok.id
  WHERE producer = TRUE
  AND bemutato IS NOT NULL)