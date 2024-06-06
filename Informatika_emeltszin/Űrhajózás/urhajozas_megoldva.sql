-- 2. feladat:
INSERT INTO kuldetesek (id, megnevezes, kezdet, veg)
VALUES (323, 'SpaceX Crew-5', '2022-10-06', '2023-03-11');

-- 3. feladat:
UPDATE urhajosok SET nev = 'Charles Simonyi'
WHERE nev = 'Simonyi Károly';

-- 4. feladat:
DELETE FROM urhajosok
WHERE nev = 'Nits László';

-- 5. feladat:
SELECT nev, urido
FROM urhajosok
WHERE nem = 'N'
ORDER BY urido DESC
LIMIT 1;

-- 6. feladat:
SELECT megnevezes, DATEDIFF(veg, kezdet) AS hossz
FROM kuldetesek
WHERE YEAR(kezdet) != YEAR(veg);

-- 7. feladat: 
SELECT 
    urhajosok.nev AS urhajos_neve,
    MIN(YEAR(kuldetesek.kezdet)) - urhajosok.szulev AS kezdet_kor,
    MAX(YEAR(kuldetesek.veg)) - urhajosok.szulev AS veg_kor
FROM 
    urhajosok
JOIN 
    repulesek ON urhajosok.id = repulesek.urhajosId
JOIN 
    kuldetesek ON repulesek.kuldetesId = kuldetesek.id
GROUP BY urhajosok.id
HAVING COUNT(repulesek.kuldetesId) > 1


-- 8. feladat:
SELECT orszag, COUNT(id) AS urhajosok_szama
FROM urhajosok
GROUP BY orszag
ORDER BY urhajosok_szama DESC;

-- 9. feladat:
SELECT COUNT(DISTINCT orszag) AS orszagszam
FROM urhajosok;

-- 10. feladat:
SELECT DISTINCT k.megnevezes AS kuldetes_neve
FROM kuldetesek k
JOIN repulesek r ON k.id = r.kuldetesId
JOIN urhajosok u ON r.urhajosId = u.id
WHERE u.nem = 'F' AND EXISTS (
    SELECT 1
    FROM repulesek r2
    JOIN urhajosok u2 ON r2.urhajosId = u2.id
    WHERE r2.kuldetesId = k.id AND u2.nem = 'N'
)
ORDER BY kuldetes_neve ASC;
-- Alternatív megoldás:
SELECT DISTINCT 
  megnevezes
FROM repulesek
  INNER JOIN kuldetesek
    ON repulesek.kuldetesId = kuldetesek.id
  INNER JOIN urhajosok
    ON repulesek.urhajosId = urhajosok.id
WHERE nem = 'F' AND megnevezes IN 
(SELECT DISTINCT
  kuldetesek.megnevezes
FROM repulesek
  INNER JOIN kuldetesek
    ON repulesek.kuldetesId = kuldetesek.id
  INNER JOIN urhajosok
    ON repulesek.urhajosId = urhajosok.id
WHERE nem = 'N')
ORDER BY megnevezes;


-- 11. feladat:
SELECT
  kuldetesek.megnevezes,
  kuldetesek.kezdet
FROM kuldetesek
WHERE YEAR(kezdet) BETWEEN 1991 AND 2000
ORDER BY kezdet, megnevezes;
