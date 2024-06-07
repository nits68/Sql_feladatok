-- A feladatok megoldása elkészített SQL parancsokat illessze be a feladatok után

-- 2. feladat:
    INSERT INTO allomasok(id, nev, tipus, orszag, mukodo) VALUES
    (5000, "Moszkva", "állomás", "RUS",0);

-- 3. feladat:
    UPDATE allomasok SET mukodo = 1
    WHERE id = 5000;

-- 4. feladat:
    DELETE FROM allomasok 
    WHERE id = 5000;

-- 5. feladat:
  DELETE FROM helyek
  WHERE allomasId = (SELECT
    allomasok.id
  FROM allomasok
  WHERE allomasok.nev = 'Szeged-Feketehalom');

  DELETE FROM allomasok
  WHERE id = (SELECT
    allomasok.id
  FROM allomasok
  WHERE allomasok.nev = 'Szeged-Feketehalom');
-- 6. feladat:
    SELECT
      allomasok.orszag,
      allomasok.nev
    FROM allomasok
    WHERE allomasok.orszag IS NOT NULL
    ORDER BY allomasok.nev;


-- 7. feladat:
    SELECT
      allomasok.tipus,
      allomasok.nev,
      helyek.tav
    FROM helyek
      INNER JOIN allomasok
        ON helyek.allomasId = allomasok.id
    WHERE allomasok.mukodo = 1
    ORDER BY helyek.tav;


-- 8. feladat:
    SELECT
      MAX(helyek.tav) AS hossz,
      helyek.vonalId
    FROM helyek
      INNER JOIN vonalak
        ON helyek.vonalId = vonalak.id
    GROUP BY helyek.vonalId
    ORDER BY helyek.tav;

﻿-- 9. feladat:

SELECT
  v1.id, (SELECT
  allomasok.nev
FROM helyek
  INNER JOIN allomasok
    ON helyek.allomasId = allomasok.id
  INNER JOIN vonalak
    ON helyek.vonalId = vonalak.id
WHERE vonalak.id = v1.id AND helyek.tav = 0) AS `Induló állomás`, (SELECT
  allomasok.nev
FROM helyek
  INNER JOIN allomasok
    ON helyek.allomasId = allomasok.id
  INNER JOIN vonalak
    ON helyek.vonalId = vonalak.id
WHERE vonalak.id = v1.id
ORDER BY helyek.tav DESC
LIMIT 1) AS `Végállomás`
FROM vonalak AS v1;

-- 10. feladat:
SELECT
  allomasok.nev,
  helyek.vonalId
FROM helyek
  INNER JOIN allomasok
    ON helyek.allomasId = allomasok.id
WHERE helyek.vonalId IN (SELECT
  helyek.vonalId
FROM helyek
  INNER JOIN allomasok
    ON helyek.allomasId = allomasok.id
WHERE allomasok.nev = "Hatvan") AND allomasok.nev <> "Hatvan";

-- 11. feladat:
SELECT
  allomasok.nev,
  COUNT(helyek.vonalId) AS db
FROM helyek
  INNER JOIN allomasok
    ON helyek.allomasId = allomasok.id
GROUP BY allomasok.nev
HAVING db >= 5
ORDER BY db DESC;

-- 12. feladat:
    SELECT
      helyek.tav,
      allomasok.nev
    FROM helyek
      INNER JOIN allomasok
        ON helyek.allomasId = allomasok.id
      INNER JOIN vonalak
        ON helyek.vonalId = vonalak.id
    WHERE helyek.vonalId = 140
    AND helyek.tav > 90
    AND helyek.tav <= 100;


