-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!

-- 2. feladat:
INSERT INTO merkozesek VALUE
(910, "2016.09.06", null,"Tórshavn", "Tórsvøllur", 15000, "Feröer", 0, 0, "VB-sel-2016");

-- 3. feladat:
UPDATE merkozesek SET lott = 1
WHERE id = 910;

-- 4. feladat:
DELETE FROM merkozesek WHERE
WHERE id = 910;

-- 5. feladat:
SELECT id, datum, varos, stadion, nezoszam, ellenfel, lott, kapott, tetmeccs
FROM  merkozesek
WHERE tetmeccs LIKE '%vb%';

-- 6. feladat:
SELECT nev
FROM kapitanyok
  INNER JOIN  megbizasok
    ON kapitanyok.id = megbizasok.kapitanyid
WHERE megbizasok.elso<=500 AND megbizasok.utolso>=500;

-- 7. feladat:
SELECT datum, ellenfel, nezoszam
FROM merkozesek
WHERE datum > '2001-01-01' AND tetmeccs IS NOT NULL
ORDER BY nezoszam DESC
Limit 1;

SELECT datum, ellenfel, nezoszam 
FROM merkozesek
WHERE Year(datum)>=2001 AND tetmeccs Is NOT NULL  AND nezoszam = 
  (SELECT MAX(nezoszam)  FROM merkozesek 
 WHERE Year(datum)>=2001 AND tetmeccs Is NOT NULL);

-- 8. feladat:
SELECT datum, varos, lott, kapott
FROM merkozesek
WHERE ellenfel LIKE 'Ausztria' AND ABS(lott-kapott)>=5;

-- 9. feladat:
SELECT DISTINCT
  ellenfel
FROM merkozesek
WHERE ellenfel NOT IN (SELECT
    ellenfel
  FROM merkozesek
  WHERE lott <= kapott);

-- 10. feladat:
SELECT
  merkozesek.id,
  merkozesek.datum,
  merkozesek.ellenfel,
  merkozesek.lott,
  merkozesek.kapott
FROM kapitanyok
  INNER JOIN  megbizasok
    ON kapitanyok.id = megbizasok.kapitanyid, merkozesek
WHERE merkozesek.id BETWEEN megbizasok.elso AND megbizasok.utolso
    AND megbizasok.kapitanyid = kapitanyok.id
    AND kapitanyok.nev = "Bicskei Bertalan";

