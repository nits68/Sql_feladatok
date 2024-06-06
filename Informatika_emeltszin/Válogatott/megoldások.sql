-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!

-- 2. feladat:
INSERT INTO merkozesek VALUE
(910, "2016.09.06", null,"Tórshavn", "Tórsvøllur", 15000, "Feröer", 0, 0, "VB-sel-2016");

-- 3. feladat:
UPDATE merkozesek SET lott = 1
WHERE id = 909;

-- 4. feladat:
DELETE FROM merkozesek WHERE
lott=kapott;

-- 5. feladat:
SELECT id, datum, varos, stadion, nezoszam, ellenfel, lott, kapott, tetmeccs
FROM  merkozesek
WHERE tetmeccs LIKE '%vb%';

-- 6. feladat:
SELECT nev
FROM kapitanyok
  INNER JOIN  megbizasok
    ON kapitanyok.id = megbizasok.kapitanyid
WHERE megbizasok.elso<500 AND megbizasok.utolso>500;

-- 7. feladat:
SELECT datum, ellenfel, MAX(nezoszam)
FROM merkozesek
WHERE datum>'2001-01-01';

-- 8. feladat:
SELECT datum, varos, lott, kapott
FROM merkozesek
WHERE ellenfel LIKE 'Ausztria' AND (lott-kapott)>=5 OR (kapott-lott)>=5;

-- 9. feladat:
SELECT ellenfel
FROM merkozesek
WHERE lott>kapott;

-- 10. feladat:
SELECT datum, ellenfel, lott, kapott, kapitanyid
FROM merkozesek
  INNER JOIN megbizasok
  ON kapitanyid=3
WHERE datum <= elso AND datum >= utolso;
