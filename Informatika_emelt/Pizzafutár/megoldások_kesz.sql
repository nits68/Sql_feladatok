-- A feladatok megold�s�ra elk�sz�tett SQL parancsokat illessze be a feladat sorsz�ma ut�n!

-- 2. feladat:
INSERT INTO pizzak VALUES
( 118,"5 sajtos",22,1200);


-- 3. feladat:
UPDATE pizzak
SET ar = ar + 500
WHERE nev LIKE "%5%";

-- 4. feladat:
DELETE FROM pizzak
WHERE ar > 5000;


-- 5. feladat:
ALTER TABLE pizzak MODIFY ar varchar(100);
UPDATE pizzak
SET ar = CONCAT(ar, ' Ft');
SELECT * FROM pizzak;


-- 6. feladat:
SELECT nev, meret, ar FROM pizzak
WHERE ar < 1500
ORDER BY meret DESC, nev;

-- 7. feladat:
SELECT
  pizzak.nev,
  pizzak.meret,
  SUM(darab) AS darabszam
FROM rendelesek
  INNER JOIN pizzak
    ON rendelesek.pizzaid = pizzak.id
    GROUP BY nev,meret
ORDER BY darabszam DESC
LIMIT 1;

-- 8. feladat:
SELECT pizzak.nev,
  pizzak.meret,
  SUM(rendelesek.darab)
FROM rendelesek
  INNER JOIN pizzak
    ON rendelesek.pizzaid = pizzak.id
    WHERE szallitas <= '19:00:00' AND szallitas >= '18:00:00'
    GROUP BY nev, meret;

-- 9. feladat:
SELECT
  pizzak.nev
FROM pizzak
WHERE pizzak.id IN (SELECT DISTINCT
  rendelesek.pizzaid
FROM rendelesek)
GROUP BY nev
HAVING COUNT(pizzak.meret) = 3;

-- 10. feladat:
SELECT
  rendelesek.szallitas,
  cimek.nev,
  cimek.utca,
  cimek.hsz
FROM rendelesek
  INNER JOIN cimek
    ON rendelesek.cimid = cimek.id
    WHERE darab > 3;

-- 11. feladat:
SELECT
  rendelesek.szallitas,
  cimek.utca,
  cimek.hsz,
  SUM(pizzak.ar * darab) AS fizetendo
FROM rendelesek
  INNER JOIN cimek
    ON rendelesek.cimid = cimek.id
  INNER JOIN pizzak
    ON rendelesek.pizzaid = pizzak.id
    GROUP BY szallitas, utca, hsz;
