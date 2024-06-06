USE mellszobrok;

-- 2. feladat
INSERT INTO alkotok (id, nev, nem, szulEv, szulHely) VALUES (9999,'Nagy Ferec','F', 1945, 'Tatabánya');

-- 3. feladat
UPDATE alkotok SET nev = 'Nagy Ferenc' WHERE id = 9999;

-- 4. feladat
DELETE FROM alkotok WHERE id = 9999;

-- 5. feladat
INSERT INTO kapcsolatok (szoborId, alkotoId)
VALUES(
  (SELECT ID FROM szobrok WHERE szemely = 'Csajkovszkij'),
  (SELECT ID FROM alkotok WHERE nev = 'Kisfaludi Strobl Zsigmond')
);

-- 6. feladat
SELECT szemely, COUNT(*) AS darabszam FROM szobrok
GROUP BY szemely
ORDER BY darabszam DESC
LIMIT 5;

-- 7. feladat
SELECT szobrok.hely, szobrok.szemely, EXTRACT(YEAR FROM CURRENT_DATE) - szobrok.avatas FROM szobrok
INNER JOIN kapcsolatok ON szobrok.id = kapcsolatok.szoborId
INNER JOIN alkotok ON kapcsolatok.alkotoId = alkotok.id
WHERE nev LIKE 'Medgyessy Ferenc';

-- 8. feladat
SELECT alkotok.nev FROM alkotok
WHERE (alkotok.szulEv IS NULL AND alkotok.szulHely IS NOT NULL) OR (alkotok.szulEv IS NOT NULL AND alkotok.szulHely IS NULL);

-- 9. feladat
SELECT szobrok.szemely, szobrok.avatas FROM szobrok
WHERE hely LIKE 'Budapest'
AND avatas = YEAR(rogzites);

-- 10. feladat
SELECT DISTINCT alkotok.nev, alkotok.szulhely 
FROM alkotok
INNER JOIN szobrok ON alkotok.szulhely = szobrok.hely
WHERE alkotok.szulev BETWEEN 1901 AND 1950
AND szobrok.hely IS NOT NULL
AND szobrok.hely != 'Budapest';

-- 11. feladat
SELECT DISTINCT hely
FROM szobrok
WHERE szemely IN ('Erkel Ferenc', 'Liszt Ferenc');

-- 12. feladat
SELECT alkotok.nev, szobrok.avatas, szobrok.szemely
FROM szobrok
INNER JOIN kapcsolatok ON szoborId = kapcsolatok.alkotoId
INNER JOIN alkotok ON alkotoId = alkotok.id
GROUP BY nev
ORDER BY avatas ASC;
